<?php

class Db
{
    private $dbh = null;

    private $app;

    /**
     * Initialisierung
     *
     * @throws \RuntimeException wenn die Verbindung fehlschlägt
     * @return void
     */
    public function __construct(array $configuration)
    {
        $this->dbh = new \PDO('mysql:host=' . $configuration['host'] . ';port=' . $configuration['port'] . ';dbname=' . $configuration['database'], $configuration['user'], $configuration['password']);
        $this->dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        $this->dbh->query('SET NAMES "utf8" COLLATE "utf8_general_ci"');
    }

    public function query(string $query, array $values = []): DbStatement
    {
        return $this->prepare($query)->bind($values)->execute();
    }

    public function prepare(string $query): DbStatement
    {
        return new DbStatement($this, $this->dbh->prepare($query), $query);
    }

    public function getLastInsertId()
    {
        return $this->dbh->lastInsertId();
    }

    public function beginTransaction()
    {
        $this->dbh->beginTransaction();
    }

    public function commit()
    {
        $this->dbh->commit();
    }

    public function rollback()
    {
        $this->dbh->rollback();
    }
}

class DbStatement
{
    private $db = null;
    private $statement = null;
    private $allRows = null;
    private $queryString = '';

    public function __construct(Db $db, \PDOStatement $statement, $queryString)
    {
        $this->db = $db;
        $this->statement = $statement;
        $this->queryString = $queryString;
    }

    public function bind($values): DbStatement
    {
        foreach ($values as $name => $value) {
            $type = null;
            if (is_bool($value)) {
                $type = \PDO::PARAM_BOOL;
            } elseif (is_null($value)) {
                $type = \PDO::PARAM_NULL;
            } elseif (is_int($value)) {
                $type = \PDO::PARAM_INT;
            } elseif (is_string($value)) {
                $type = \PDO::PARAM_STR;
            } elseif (is_array($value)) {
                $value = json_encode($value);
                $type = \PDO::PARAM_STR;
            } elseif (is_object($value) && get_class($value) === 'DateTime') {
                $value = $value->format('Y-m-d H:i:s');
                $type = \PDO::PARAM_STR;
            }
            $this->statement->bindValue($name, $value, $type);
        }
        return $this;
    }

    public function execute(): DbStatement
    {
        try {
            $this->statement->execute();
        } catch (\Exception $e) {
            throw new \Exception(get_class($e) . ': ' . $e->getMessage() . '; Query String was: ' . $this->queryString);
        }
        return $this;
    }

    public function getAllRows(): array
    {
        if ($this->allRows === null) {
            $this->allRows = $this->statement->fetchAll(\PDO::FETCH_ASSOC);
        }
        return $this->allRows;
    }

    public function getRow(): array
    {
        return $this->getAllRows()[0];
    }

    public function getColumn(string $key = ''): array
    {
        $allRows = $this->getAllRows();
        $column = [];
        foreach ($allRows as $row) {
            if ($key === '' && count($row)) {
                list(, $value) = each($row);
                $column[] = $value;
                continue;
            }
            if (!isset($row[$key])) {
                throw new \UnexpectedValueException('key not found: ' . $key, 1535331890);
            }
            $column[] = $row[$key];
        }
        return $column;
    }

    public function get(string $key = '')
    {
        $column = $this->getColumn($key);
        return count($column) ? $column[0] : null;
    }

    public function getRowCount()
    {
        return $this->statement->rowCount();
    }
}

$db = new Db ([
    'host' => getenv('MYSQL_HOST'),
    'port' => 3306,
    'database' => getenv('MYSQL_DATABASE'),
    'user' => getenv('MYSQL_USER'),
    'password' => getenv('MYSQL_PASSWORD'),
]);

echo "FIX comments\n";

$db->query("INSERT INTO revision_comment_temp (SELECT rev_id AS revcomment_rev, 1 AS revcomment_comment_id FROM revision WHERE NOT EXISTS (SELECT * FROM revision_comment_temp WHERE revcomment_rev = rev_id))");

echo "CLEAR objectcache\n";

$db->query("TRUNCATE TABLE `objectcache`");

$tables = $db->query("SELECT TABLE_NAME as name, TABLE_COLLATION as coll from information_schema.tables where TABLE_SCHEMA = :db", ['db' => getenv('DB_NAME')])->getAllRows();

try {
foreach ($tables as $tinfo) {
    $table = $tinfo['name'];
    $tableCollation = $tinfo['coll'];

    switch ($table) {
        case 'text_backup':
        case 'mhn_newuser':
        case 'user_20161116':
            continue 2;
    }

    echo "TABLE $table\n";
    if ($tableCollation === 'latin1_swedish_ci') {
        echo "    COLLATION: $tableCollation -> utf8mb4_general_ci\n";
        $db->query("ALTER TABLE `$table` COLLATE 'utf8mb4_general_ci'");
    }
    $columns = $db->query("SHOW FULL COLUMNS FROM `$table`")->getAllRows();
    foreach ($columns as $column) {
        $name = $column['Field'];
        $type = $column['Type'];
        $collation = $column['Collation'];
        $null = ($column['Null'] === 'YES');
        $default = $column['Default'];

        $setNull = $null ? '' : 'NOT NULL';

        $setDefault = "";
        if ($default) {
            if ($default === '0' || (int) $default !== 0) {
                $setDefault = 'DEFAULT ' . ((int)$default);
            } else {
                $setDefault = "DEFAULT '" . addslashes($default) . "'";
            }
        }

        $newCollation = null;
        switch ($collation) {
            case 'latin1_bin':
                $newCollation = 'utf8mb4_bin';
            break;
            case 'latin1_swedish_ci':
                $newCollation = 'utf8mb4_general_ci';
            break;
            default:
                continue 2;
        }

        echo "    COLUMN $name: $collation -> $newCollation";

        $newType = $type;
        $size = 1;
        if (preg_match('/^varchar\(([0-9]+)\)$/', $type, $matches)) {
            $size = $matches[1];
            $newType = "varchar($size)";
        }

        if (!$size) {
            die("\$size = $size;");
        }

        while ($size > 0) {
            try {
                $db->query("ALTER TABLE `$table` MODIFY COLUMN `$name` $newType COLLATE '$newCollation' $setNull $setDefault");
                break;
            } catch (\Exception $e) {
                $size--;
                $newType = "varchar($size)";
            }
        }

        echo "... modified";

        for ($tries = 10; $tries > 0; $tries--) {
            try {
                $db->query("UPDATE `$table` SET `$name` = CONVERT(CAST(CONVERT(`$name` USING latin1) as BINARY) USING utf8) WHERE `$name` IS NOT NULL AND CONVERT(CAST(CONVERT(`$name` USING latin1) as BINARY) USING utf8) IS NOT NULL");
                break;
            } catch (\Exception $e) {
                // empty
            }
        }

        echo "... updated\n";
    }
}
} catch (\Exception $e) {
    echo "\n\nError:\n\n" . $e->getMessage();
}
