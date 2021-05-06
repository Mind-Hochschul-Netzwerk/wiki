<?php

session_name("mhnAuth");
session_start();

// check and renew session (expires after 1 day)
if (!empty($_SESSION['ldap_auth']) && !empty($_SESSION['time']) && time() - $_SESSION['time'] < 60*60*24) {
    // unset session_id so mediawiki can use its own
    session_abort();
    session_id("");
    return;
}

if (!empty($_REQUEST['username']) && !empty($_REQUEST['password'])) {
    $ldap = ldap_connect("ldap://" . getenv("LDAP_HOST"));

    if (!$ldap) {
       die("could not connect to LDAP server.");
    }

    ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);

    $bind = ldap_bind($ldap, "cn=" . ldap_escape((string) $_REQUEST['username']) . ",ou=people,dc=mind-hochschul-netzwerk,dc=de", (string) $_REQUEST['password']);
    if ($bind) {
        $_SESSION['ldap_auth'] = true;
	    $_SESSION["time"] = time();
	    session_write_close();
	    session_id("");
        return;
    } else {
        echo "<p>Die Zugangsdaten sind falsch.</p>";
    }
}

session_destroy();
session_id("");

?>
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="utf-8">
<title>Das MHN-Wiki</title>
<style>
body {font: 11pt sans-serif; padding: 1em; color: #333;}
label {width: 150px; display: inline-block;}
form div {margin-bottom: 0.2em; }
button {margin-top: 0.5em; padding: 0.5em;}
input {padding:0.5em; }
</style>
</html>
<body>
<img src="/logo.png" width="100">
<p><a href="https://www.<?=getenv('DOMAINNAME')?>">zur Homepage des MHN</a> (mit Impressum und Datenschutzerklärung)</p>
<h1>Das alte MHN-Wiki</h1>
<p>Die Texte im alten Wiki bleiben als Archiv erhalten, aber können nicht mehr verändert werden.</p>
<p>Ausnahme: Personenbezogene Daten im alten Wiki können korrigiert oder gelöscht werden, wenn die betroffene Person dies verlangt.</p>
<p>Zugriff nur für Mitglieder. Bitte melde dich mit deinen MHN-Zugangsdaten an:</p>
<form method="post">
<div><label for="username">Benutzername:</label><input name="username" id="username"></div>
<div><label for="password">Passwort:</label><input name="password" id="password" type="password"></div>
<button>Anmelden</button>
</form>
</body>
</html>


<?php
exit;
?>
