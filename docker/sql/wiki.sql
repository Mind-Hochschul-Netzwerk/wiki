-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 12, 2017 at 10:30 PM
-- Server version: 5.7.18-0ubuntu0.17.04.1
-- PHP Version: 7.0.18-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `henrik_wiki`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `ar_id` int(10) UNSIGNED NOT NULL,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ar_text` mediumtext NOT NULL,
  `ar_comment` varbinary(767) NOT NULL,
  `ar_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `ar_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ar_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ar_minor_edit` tinyint(1) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(8) UNSIGNED DEFAULT NULL,
  `ar_text_id` int(8) UNSIGNED DEFAULT NULL,
  `ar_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ar_len` int(10) UNSIGNED DEFAULT NULL,
  `ar_page_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_format` varbinary(64) DEFAULT NULL,
  `ar_content_model` varbinary(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blobs`
--

CREATE TABLE `blobs` (
  `blob_index` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `blob_data` longblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bot_passwords`
--

CREATE TABLE `bot_passwords` (
  `bp_user` int(11) NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `brokenlinks`
--

CREATE TABLE `brokenlinks` (
  `bl_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `bl_to` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `categorylinks`
--

CREATE TABLE `categorylinks` (
  `cl_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `cl_to` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_sortkey_prefix` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `change_tag`
--

CREATE TABLE `change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL,
  `ct_params` blob
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `cur`
--

CREATE TABLE `cur` (
  `cur_id` int(8) UNSIGNED NOT NULL,
  `cur_namespace` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `cur_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cur_text` mediumtext NOT NULL,
  `cur_comment` tinyblob NOT NULL,
  `cur_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `cur_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cur_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cur_restrictions` tinyblob NOT NULL,
  `cur_counter` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `cur_is_redirect` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `cur_minor_edit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `cur_is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `cur_random` double UNSIGNED NOT NULL DEFAULT '0',
  `cur_touched` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `inverse_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `externallinks`
--

CREATE TABLE `externallinks` (
  `el_id` int(10) UNSIGNED NOT NULL,
  `el_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `external_user`
--

CREATE TABLE `external_user` (
  `eu_local_id` int(10) UNSIGNED NOT NULL,
  `eu_external_id` varbinary(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `filearchive`
--

CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL,
  `fa_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `fa_archive_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `fa_storage_group` varchar(16) DEFAULT NULL,
  `fa_storage_key` varchar(64) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_size` int(8) UNSIGNED DEFAULT '0',
  `fa_width` int(5) DEFAULT '0',
  `fa_height` int(5) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(3) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT NULL,
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT NULL,
  `fa_user` int(5) UNSIGNED DEFAULT '0',
  `fa_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `fa_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `fa_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `img_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `img_size` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `img_description` varbinary(767) NOT NULL,
  `img_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `img_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `img_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `img_width` int(5) NOT NULL DEFAULT '0',
  `img_height` int(5) NOT NULL DEFAULT '0',
  `img_bits` int(5) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT NULL,
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `imagelinks`
--

CREATE TABLE `imagelinks` (
  `il_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `il_to` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `interwiki`
--

CREATE TABLE `interwiki` (
  `iw_prefix` char(32) NOT NULL DEFAULT '',
  `iw_url` char(127) NOT NULL DEFAULT '',
  `iw_local` tinyint(1) NOT NULL DEFAULT '0',
  `iw_trans` tinyint(1) NOT NULL DEFAULT '0',
  `iw_api` blob NOT NULL,
  `iw_wikiid` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ipblocks`
--

CREATE TABLE `ipblocks` (
  `ipb_id` int(8) NOT NULL,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `ipb_by` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `ipb_reason` varbinary(767) NOT NULL,
  `ipb_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(4) NOT NULL DEFAULT '0',
  `ipb_by_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_parent_block_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ipblocks_old`
--

CREATE TABLE `ipblocks_old` (
  `ipb_id` int(8) NOT NULL,
  `ipb_address` varchar(40) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_user` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `ipb_by` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_expiry` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_range_start` varchar(32) NOT NULL DEFAULT '',
  `ipb_range_end` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `iwlinks`
--

CREATE TABLE `iwlinks` (
  `iwl_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `job_id` int(9) UNSIGNED NOT NULL,
  `job_cmd` varchar(255) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL DEFAULT '0',
  `job_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `job_params` blob NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_random` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  `job_attempts` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_cache`
--

CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `langlinks`
--

CREATE TABLE `langlinks` (
  `ll_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `ll_lang` varchar(10) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ll_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `l_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `l_to` int(8) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `linkscc`
--

CREATE TABLE `linkscc` (
  `lcc_pageid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lcc_cacheobj` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logging`
--

CREATE TABLE `logging` (
  `log_type` varbinary(32) NOT NULL,
  `log_action` varbinary(32) NOT NULL,
  `log_timestamp` varchar(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_id` int(10) UNSIGNED NOT NULL,
  `log_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `log_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `log_page` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logging`
--

--
-- Table structure for table `log_search`
--

CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `math`
--

CREATE TABLE `math` (
  `math_inputhash` varchar(16) NOT NULL DEFAULT '',
  `math_outputhash` varchar(16) NOT NULL DEFAULT '',
  `math_html_conservativeness` tinyint(1) NOT NULL DEFAULT '0',
  `math_html` text,
  `math_mathml` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `module_deps`
--

CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

--
-- Table structure for table `objectcache`
--

CREATE TABLE `objectcache` (
  `keyname` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oldimage`
--

CREATE TABLE `oldimage` (
  `oi_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `oi_archive_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `oi_size` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL,
  `oi_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `oi_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `oi_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `oi_width` int(5) NOT NULL DEFAULT '0',
  `oi_height` int(5) NOT NULL DEFAULT '0',
  `oi_bits` int(3) NOT NULL DEFAULT '0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT NULL,
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` int(8) UNSIGNED NOT NULL,
  `page_namespace` int(11) NOT NULL DEFAULT '0',
  `page_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `page_is_new` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `page_random` double UNSIGNED NOT NULL DEFAULT '0',
  `page_touched` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `page_latest` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `page_len` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagelinks`
--

CREATE TABLE `pagelinks` (
  `pl_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `page_props`
--

CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `page_restrictions`
--

CREATE TABLE `page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  `pr_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `protected_titles`
--

CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) UNSIGNED NOT NULL,
  `pt_reason` varbinary(767) DEFAULT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `querycache`
--

CREATE TABLE `querycache` (
  `qc_type` char(32) NOT NULL DEFAULT '',
  `qc_value` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` char(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `querycachetwo`
--

CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `querycache_info`
--

CREATE TABLE `querycache_info` (
  `qci_type` varchar(32) NOT NULL DEFAULT '',
  `qci_timestamp` varchar(14) NOT NULL DEFAULT '19700101000000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recentchanges`
--

CREATE TABLE `recentchanges` (
  `rc_id` int(8) NOT NULL,
  `rc_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rc_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_patrolled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_ip` varchar(15) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_logid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  `rc_source` varbinary(16) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `redirect`
--

CREATE TABLE `redirect` (
  `rd_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `revision`
--

CREATE TABLE `revision` (
  `rev_id` int(8) UNSIGNED NOT NULL,
  `rev_page` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `rev_comment` varbinary(767) NOT NULL,
  `rev_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `rev_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rev_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rev_minor_edit` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `rev_text_id` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `rev_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `rev_len` int(10) UNSIGNED DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_format` varbinary(64) DEFAULT NULL,
  `rev_content_model` varbinary(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `si_page` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `site_id` int(10) UNSIGNED NOT NULL,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `site_identifiers`
--

CREATE TABLE `site_identifiers` (
  `si_site` int(10) UNSIGNED NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `site_stats`
--

CREATE TABLE `site_stats` (
  `ss_row_id` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `ss_total_edits` bigint(20) UNSIGNED DEFAULT '0',
  `ss_good_articles` bigint(20) UNSIGNED DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_images` int(10) DEFAULT '0',
  `ss_active_users` bigint(20) DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `smw_atts2`
--

CREATE TABLE `smw_atts2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `value_xsd` varbinary(255) DEFAULT NULL,
  `value_num` double DEFAULT NULL,
  `value_unit` varbinary(63) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_conc2`
--

CREATE TABLE `smw_conc2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `concept_txt` mediumblob,
  `concept_docu` mediumblob,
  `concept_features` int(8) DEFAULT NULL,
  `concept_size` int(8) DEFAULT NULL,
  `concept_depth` int(8) DEFAULT NULL,
  `cache_date` int(8) UNSIGNED DEFAULT NULL,
  `cache_count` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_conccache`
--

CREATE TABLE `smw_conccache` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_concept_cache`
--

CREATE TABLE `smw_concept_cache` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_blob`
--

CREATE TABLE `smw_di_blob` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_bool`
--

CREATE TABLE `smw_di_bool` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_value` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_coords`
--

CREATE TABLE `smw_di_coords` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_lat` double DEFAULT NULL,
  `o_lon` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_number`
--

CREATE TABLE `smw_di_number` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_time`
--

CREATE TABLE `smw_di_time` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_uri`
--

CREATE TABLE `smw_di_uri` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_di_wikipage`
--

CREATE TABLE `smw_di_wikipage` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_ask`
--

CREATE TABLE `smw_fpt_ask` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_askde`
--

CREATE TABLE `smw_fpt_askde` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_askdu`
--

CREATE TABLE `smw_fpt_askdu` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_askfo`
--

CREATE TABLE `smw_fpt_askfo` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_asksi`
--

CREATE TABLE `smw_fpt_asksi` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_askst`
--

CREATE TABLE `smw_fpt_askst` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;


-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_conc`
--

CREATE TABLE `smw_fpt_conc` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `concept_txt` mediumblob,
  `concept_docu` mediumblob,
  `concept_features` int(11) DEFAULT NULL,
  `concept_size` int(11) DEFAULT NULL,
  `concept_depth` int(11) DEFAULT NULL,
  `cache_date` int(8) UNSIGNED DEFAULT NULL,
  `cache_count` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_conv`
--

CREATE TABLE `smw_fpt_conv` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_dtitle`
--

CREATE TABLE `smw_fpt_dtitle` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_impo`
--

CREATE TABLE `smw_fpt_impo` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_inst`
--

CREATE TABLE `smw_fpt_inst` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_lcode`
--

CREATE TABLE `smw_fpt_lcode` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_list`
--

CREATE TABLE `smw_fpt_list` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_mdat`
--

CREATE TABLE `smw_fpt_mdat` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_prec`
--

CREATE TABLE `smw_fpt_prec` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_pval`
--

CREATE TABLE `smw_fpt_pval` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_redi`
--

CREATE TABLE `smw_fpt_redi` (
  `s_title` varbinary(255) NOT NULL,
  `s_namespace` int(11) NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;


-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_serv`
--

CREATE TABLE `smw_fpt_serv` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_sf_af`
--

CREATE TABLE `smw_fpt_sf_af` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_sf_df`
--

CREATE TABLE `smw_fpt_sf_df` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_sobj`
--

CREATE TABLE `smw_fpt_sobj` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_subc`
--

CREATE TABLE `smw_fpt_subc` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_subp`
--

CREATE TABLE `smw_fpt_subp` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_text`
--

CREATE TABLE `smw_fpt_text` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_type`
--

CREATE TABLE `smw_fpt_type` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_unit`
--

CREATE TABLE `smw_fpt_unit` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_fpt_uri`
--

CREATE TABLE `smw_fpt_uri` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_ids`
--

CREATE TABLE `smw_ids` (
  `smw_id` int(8) UNSIGNED NOT NULL,
  `smw_namespace` int(11) NOT NULL,
  `smw_title` varbinary(255) NOT NULL,
  `smw_iw` varbinary(32) DEFAULT NULL,
  `smw_sortkey` varbinary(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_inst2`
--

CREATE TABLE `smw_inst2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_object_ids`
--

CREATE TABLE `smw_object_ids` (
  `smw_id` int(8) UNSIGNED NOT NULL,
  `smw_namespace` int(11) NOT NULL,
  `smw_title` varbinary(255) NOT NULL,
  `smw_iw` varbinary(32) NOT NULL,
  `smw_subobject` varbinary(255) NOT NULL,
  `smw_sortkey` varbinary(255) NOT NULL,
  `smw_proptable_hash` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=binary;


--
-- Table structure for table `smw_prop_stats`
--

CREATE TABLE `smw_prop_stats` (
  `p_id` int(8) UNSIGNED DEFAULT NULL,
  `usage_count` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_query_links`
--

CREATE TABLE `smw_query_links` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_redi2`
--

CREATE TABLE `smw_redi2` (
  `s_title` varbinary(255) NOT NULL,
  `s_namespace` int(11) NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_rels2`
--

CREATE TABLE `smw_rels2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_spec2`
--

CREATE TABLE `smw_spec2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `value_string` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_subp2`
--

CREATE TABLE `smw_subp2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_subs2`
--

CREATE TABLE `smw_subs2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `o_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `smw_text2`
--

CREATE TABLE `smw_text2` (
  `s_id` int(8) UNSIGNED NOT NULL,
  `p_id` int(8) UNSIGNED NOT NULL,
  `value_blob` mediumblob
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `tag_summary`
--

CREATE TABLE `tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `templatelinks`
--

CREATE TABLE `templatelinks` (
  `tl_from` int(8) UNSIGNED NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `text`
--

CREATE TABLE `text` (
  `old_id` int(8) UNSIGNED NOT NULL,
  `old_namespace` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `old_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `old_text` mediumtext NOT NULL,
  `old_comment` tinyblob NOT NULL,
  `old_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `old_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `old_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `old_minor_edit` tinyint(1) NOT NULL DEFAULT '0',
  `old_flags` tinyblob NOT NULL,
  `inverse_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trackbacks`
--

CREATE TABLE `trackbacks` (
  `tb_id` int(11) NOT NULL,
  `tb_page` int(11) DEFAULT NULL,
  `tb_title` varchar(255) NOT NULL DEFAULT '',
  `tb_url` varchar(255) NOT NULL DEFAULT '',
  `tb_ex` text,
  `tb_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transcache`
--

CREATE TABLE `transcache` (
  `tc_url` varchar(255) NOT NULL DEFAULT '',
  `tc_contents` text,
  `tc_time` binary(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updatelog`
--

CREATE TABLE `updatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `uploadstash`
--

CREATE TABLE `uploadstash` (
  `us_id` int(10) UNSIGNED NOT NULL,
  `us_user` int(10) UNSIGNED NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_size` int(10) UNSIGNED NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) UNSIGNED DEFAULT NULL,
  `us_image_height` int(10) UNSIGNED DEFAULT NULL,
  `us_image_bits` smallint(5) UNSIGNED DEFAULT NULL,
  `us_chunk_inx` int(10) UNSIGNED DEFAULT NULL,
  `us_props` blob
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(5) UNSIGNED NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_email` tinytext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_touched` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_token` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_email_authenticated` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_email_token` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_email_token_expires` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_registration` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  `subject` tinyblob,
  `issuer` tinyblob
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `user_20161116`
--

CREATE TABLE `user_20161116` (
  `user_id` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_email` tinytext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_touched` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_token` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_email_authenticated` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_email_token` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_email_token_expires` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_registration` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_former_groups`
--

CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `ug_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_newtalk`
--

CREATE TABLE `user_newtalk` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varchar(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_properties`
--

CREATE TABLE `user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) DEFAULT NULL,
  `up_value` blob
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `user_rights`
--

CREATE TABLE `user_rights` (
  `ur_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `ur_rights` tinyblob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `validate`
--

CREATE TABLE `validate` (
  `val_user` int(11) NOT NULL DEFAULT '0',
  `val_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `val_timestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `val_type` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `val_value` int(11) DEFAULT '0',
  `val_comment` varchar(255) NOT NULL DEFAULT '',
  `val_ip` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `valid_tag`
--

CREATE TABLE `valid_tag` (
  `vt_tag` varbinary(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=binary;

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `wl_id` int(10) UNSIGNED NOT NULL,
  `wl_user` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varchar(14) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`ar_id`),
  ADD KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  ADD KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  ADD KEY `ar_revid` (`ar_rev_id`);

--
-- Indexes for table `blobs`
--
ALTER TABLE `blobs`
  ADD UNIQUE KEY `blob_index` (`blob_index`);

--
-- Indexes for table `bot_passwords`
--
ALTER TABLE `bot_passwords`
  ADD PRIMARY KEY (`bp_user`,`bp_app_id`);

--
-- Indexes for table `brokenlinks`
--
ALTER TABLE `brokenlinks`
  ADD UNIQUE KEY `bl_from` (`bl_from`,`bl_to`),
  ADD KEY `bl_to` (`bl_to`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_title` (`cat_title`),
  ADD KEY `cat_pages` (`cat_pages`);

--
-- Indexes for table `categorylinks`
--
ALTER TABLE `categorylinks`
  ADD UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  ADD KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  ADD KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  ADD KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`);

--
-- Indexes for table `change_tag`
--
ALTER TABLE `change_tag`
  ADD UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  ADD UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  ADD UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  ADD KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`);

--
-- Indexes for table `cur`
--
ALTER TABLE `cur`
  ADD PRIMARY KEY (`cur_id`),
  ADD UNIQUE KEY `name_title` (`cur_namespace`,`cur_title`),
  ADD KEY `cur_title` (`cur_title`(20)),
  ADD KEY `cur_timestamp` (`cur_timestamp`),
  ADD KEY `cur_random` (`cur_random`),
  ADD KEY `name_title_timestamp` (`cur_namespace`,`cur_title`,`inverse_timestamp`),
  ADD KEY `user_timestamp` (`cur_user`,`inverse_timestamp`),
  ADD KEY `usertext_timestamp` (`cur_user_text`,`inverse_timestamp`),
  ADD KEY `namespace_redirect_timestamp` (`cur_namespace`,`cur_is_redirect`,`cur_timestamp`);

--
-- Indexes for table `externallinks`
--
ALTER TABLE `externallinks`
  ADD PRIMARY KEY (`el_id`),
  ADD KEY `el_from` (`el_from`,`el_to`(40)),
  ADD KEY `el_to` (`el_to`(60),`el_from`),
  ADD KEY `el_index` (`el_index`(60));

--
-- Indexes for table `external_user`
--
ALTER TABLE `external_user`
  ADD PRIMARY KEY (`eu_local_id`),
  ADD UNIQUE KEY `eu_external_id` (`eu_external_id`);

--
-- Indexes for table `filearchive`
--
ALTER TABLE `filearchive`
  ADD PRIMARY KEY (`fa_id`),
  ADD KEY `fa_name` (`fa_name`,`fa_timestamp`),
  ADD KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  ADD KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  ADD KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  ADD KEY `fa_sha1` (`fa_sha1`(10));

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`img_name`),
  ADD KEY `img_size` (`img_size`),
  ADD KEY `img_timestamp` (`img_timestamp`),
  ADD KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  ADD KEY `img_sha1` (`img_sha1`),
  ADD KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`);

--
-- Indexes for table `imagelinks`
--
ALTER TABLE `imagelinks`
  ADD UNIQUE KEY `il_from` (`il_from`,`il_to`),
  ADD UNIQUE KEY `il_to` (`il_to`,`il_from`),
  ADD KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`);

--
-- Indexes for table `interwiki`
--
ALTER TABLE `interwiki`
  ADD UNIQUE KEY `iw_prefix` (`iw_prefix`);

--
-- Indexes for table `ipblocks`
--
ALTER TABLE `ipblocks`
  ADD PRIMARY KEY (`ipb_id`),
  ADD UNIQUE KEY `ipb_address_unique` (`ipb_address`(255),`ipb_user`,`ipb_auto`),
  ADD KEY `ipb_user` (`ipb_user`),
  ADD KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  ADD KEY `ipb_timestamp` (`ipb_timestamp`),
  ADD KEY `ipb_expiry` (`ipb_expiry`),
  ADD KEY `ipb_parent_block_id` (`ipb_parent_block_id`);

--
-- Indexes for table `ipblocks_old`
--
ALTER TABLE `ipblocks_old`
  ADD PRIMARY KEY (`ipb_id`),
  ADD KEY `ipb_address` (`ipb_address`),
  ADD KEY `ipb_user` (`ipb_user`),
  ADD KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8));

--
-- Indexes for table `iwlinks`
--
ALTER TABLE `iwlinks`
  ADD UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  ADD KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  ADD KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`),
  ADD KEY `job_timestamp` (`job_timestamp`),
  ADD KEY `job_sha1` (`job_sha1`),
  ADD KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  ADD KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`);

--
-- Indexes for table `l10n_cache`
--
ALTER TABLE `l10n_cache`
  ADD KEY `lc_lang_key` (`lc_lang`,`lc_key`);

--
-- Indexes for table `langlinks`
--
ALTER TABLE `langlinks`
  ADD UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  ADD KEY `ll_lang` (`ll_lang`,`ll_title`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD UNIQUE KEY `l_from` (`l_from`,`l_to`),
  ADD KEY `l_to` (`l_to`);

--
-- Indexes for table `linkscc`
--
ALTER TABLE `linkscc`
  ADD UNIQUE KEY `lcc_pageid` (`lcc_pageid`);

--
-- Indexes for table `logging`
--
ALTER TABLE `logging`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `type_time` (`log_type`,`log_timestamp`),
  ADD KEY `user_time` (`log_user`,`log_timestamp`),
  ADD KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  ADD KEY `times` (`log_timestamp`),
  ADD KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  ADD KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  ADD KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  ADD KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  ADD KEY `log_user_text_time` (`log_user_text`,`log_timestamp`);

--
-- Indexes for table `log_search`
--
ALTER TABLE `log_search`
  ADD UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  ADD KEY `ls_log_id` (`ls_log_id`);

--
-- Indexes for table `math`
--
ALTER TABLE `math`
  ADD UNIQUE KEY `math_inputhash` (`math_inputhash`);

--
-- Indexes for table `module_deps`
--
ALTER TABLE `module_deps`
  ADD UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`);

--
-- Indexes for table `objectcache`
--
ALTER TABLE `objectcache`
  ADD UNIQUE KEY `keyname` (`keyname`),
  ADD KEY `exptime` (`exptime`);

--
-- Indexes for table `oldimage`
--
ALTER TABLE `oldimage`
  ADD KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  ADD KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  ADD KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  ADD KEY `oi_sha1` (`oi_sha1`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  ADD KEY `page_random` (`page_random`),
  ADD KEY `page_len` (`page_len`),
  ADD KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`);

--
-- Indexes for table `pagelinks`
--
ALTER TABLE `pagelinks`
  ADD UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  ADD UNIQUE KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  ADD KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`);

--
-- Indexes for table `page_props`
--
ALTER TABLE `page_props`
  ADD PRIMARY KEY (`pp_page`,`pp_propname`),
  ADD UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  ADD UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`);

--
-- Indexes for table `page_restrictions`
--
ALTER TABLE `page_restrictions`
  ADD PRIMARY KEY (`pr_page`,`pr_type`),
  ADD UNIQUE KEY `pr_id` (`pr_id`),
  ADD KEY `pr_typelevel` (`pr_type`,`pr_level`),
  ADD KEY `pr_level` (`pr_level`),
  ADD KEY `pr_cascade` (`pr_cascade`);

--
-- Indexes for table `protected_titles`
--
ALTER TABLE `protected_titles`
  ADD PRIMARY KEY (`pt_namespace`,`pt_title`),
  ADD KEY `pt_timestamp` (`pt_timestamp`);

--
-- Indexes for table `querycache`
--
ALTER TABLE `querycache`
  ADD KEY `qc_type` (`qc_type`,`qc_value`);

--
-- Indexes for table `querycachetwo`
--
ALTER TABLE `querycachetwo`
  ADD KEY `qcc_type` (`qcc_type`,`qcc_value`),
  ADD KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  ADD KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`);

--
-- Indexes for table `querycache_info`
--
ALTER TABLE `querycache_info`
  ADD UNIQUE KEY `qci_type` (`qci_type`);

--
-- Indexes for table `recentchanges`
--
ALTER TABLE `recentchanges`
  ADD PRIMARY KEY (`rc_id`),
  ADD KEY `rc_timestamp` (`rc_timestamp`),
  ADD KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  ADD KEY `rc_cur_id` (`rc_cur_id`),
  ADD KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  ADD KEY `rc_ip` (`rc_ip`),
  ADD KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  ADD KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`);

--
-- Indexes for table `redirect`
--
ALTER TABLE `redirect`
  ADD PRIMARY KEY (`rd_from`),
  ADD KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`);

--
-- Indexes for table `revision`
--
ALTER TABLE `revision`
  ADD PRIMARY KEY (`rev_page`,`rev_id`),
  ADD UNIQUE KEY `rev_id` (`rev_id`),
  ADD KEY `rev_timestamp` (`rev_timestamp`),
  ADD KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  ADD KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  ADD KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  ADD KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD UNIQUE KEY `si_page` (`si_page`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `si_title` (`si_title`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `si_text` (`si_text`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`site_id`),
  ADD UNIQUE KEY `sites_global_key` (`site_global_key`),
  ADD KEY `sites_type` (`site_type`),
  ADD KEY `sites_group` (`site_group`),
  ADD KEY `sites_source` (`site_source`),
  ADD KEY `sites_language` (`site_language`),
  ADD KEY `sites_protocol` (`site_protocol`),
  ADD KEY `sites_domain` (`site_domain`),
  ADD KEY `sites_forward` (`site_forward`);

--
-- Indexes for table `site_identifiers`
--
ALTER TABLE `site_identifiers`
  ADD UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  ADD KEY `site_ids_site` (`si_site`),
  ADD KEY `site_ids_key` (`si_key`);

--
-- Indexes for table `site_stats`
--
ALTER TABLE `site_stats`
  ADD UNIQUE KEY `ss_row_id` (`ss_row_id`);

--
-- Indexes for table `smw_atts2`
--
ALTER TABLE `smw_atts2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `value_num` (`value_num`),
  ADD KEY `value_xsd` (`value_xsd`);

--
-- Indexes for table `smw_conc2`
--
ALTER TABLE `smw_conc2`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `smw_conccache`
--
ALTER TABLE `smw_conccache`
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_concept_cache`
--
ALTER TABLE `smw_concept_cache`
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_di_blob`
--
ALTER TABLE `smw_di_blob`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_di_bool`
--
ALTER TABLE `smw_di_bool`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_value`);

--
-- Indexes for table `smw_di_coords`
--
ALTER TABLE `smw_di_coords`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_serialized`),
  ADD KEY `o_lat` (`o_lat`,`o_lon`);

--
-- Indexes for table `smw_di_number`
--
ALTER TABLE `smw_di_number`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_sortkey`);

--
-- Indexes for table `smw_di_time`
--
ALTER TABLE `smw_di_time`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_sortkey`);

--
-- Indexes for table `smw_di_uri`
--
ALTER TABLE `smw_di_uri`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_serialized`);

--
-- Indexes for table `smw_di_wikipage`
--
ALTER TABLE `smw_di_wikipage`
  ADD KEY `s_id` (`s_id`,`p_id`),
  ADD KEY `p_id` (`p_id`,`o_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_ask`
--
ALTER TABLE `smw_fpt_ask`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_askde`
--
ALTER TABLE `smw_fpt_askde`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_sortkey` (`o_sortkey`);

--
-- Indexes for table `smw_fpt_askdu`
--
ALTER TABLE `smw_fpt_askdu`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_sortkey` (`o_sortkey`);

--
-- Indexes for table `smw_fpt_askfo`
--
ALTER TABLE `smw_fpt_askfo`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_asksi`
--
ALTER TABLE `smw_fpt_asksi`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_sortkey` (`o_sortkey`);

--
-- Indexes for table `smw_fpt_askst`
--
ALTER TABLE `smw_fpt_askst`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_conc`
--
ALTER TABLE `smw_fpt_conc`
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `smw_fpt_conv`
--
ALTER TABLE `smw_fpt_conv`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_dtitle`
--
ALTER TABLE `smw_fpt_dtitle`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_impo`
--
ALTER TABLE `smw_fpt_impo`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_inst`
--
ALTER TABLE `smw_fpt_inst`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_lcode`
--
ALTER TABLE `smw_fpt_lcode`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_list`
--
ALTER TABLE `smw_fpt_list`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_mdat`
--
ALTER TABLE `smw_fpt_mdat`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_sortkey` (`o_sortkey`);

--
-- Indexes for table `smw_fpt_prec`
--
ALTER TABLE `smw_fpt_prec`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_sortkey` (`o_sortkey`);

--
-- Indexes for table `smw_fpt_pval`
--
ALTER TABLE `smw_fpt_pval`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_redi`
--
ALTER TABLE `smw_fpt_redi`
  ADD KEY `s_title` (`s_title`,`s_namespace`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_serv`
--
ALTER TABLE `smw_fpt_serv`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_sf_af`
--
ALTER TABLE `smw_fpt_sf_af`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_sf_df`
--
ALTER TABLE `smw_fpt_sf_df`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_sobj`
--
ALTER TABLE `smw_fpt_sobj`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_subc`
--
ALTER TABLE `smw_fpt_subc`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_subp`
--
ALTER TABLE `smw_fpt_subp`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_fpt_text`
--
ALTER TABLE `smw_fpt_text`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_type`
--
ALTER TABLE `smw_fpt_type`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_serialized` (`o_serialized`);

--
-- Indexes for table `smw_fpt_unit`
--
ALTER TABLE `smw_fpt_unit`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_hash` (`o_hash`),
  ADD KEY `s_id_2` (`s_id`,`o_hash`);

--
-- Indexes for table `smw_fpt_uri`
--
ALTER TABLE `smw_fpt_uri`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_serialized` (`o_serialized`);

--
-- Indexes for table `smw_ids`
--
ALTER TABLE `smw_ids`
  ADD PRIMARY KEY (`smw_id`),
  ADD KEY `smw_title` (`smw_title`,`smw_namespace`,`smw_iw`),
  ADD KEY `smw_sortkey` (`smw_sortkey`);

--
-- Indexes for table `smw_inst2`
--
ALTER TABLE `smw_inst2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_object_ids`
--
ALTER TABLE `smw_object_ids`
  ADD PRIMARY KEY (`smw_id`),
  ADD KEY `smw_id` (`smw_id`,`smw_sortkey`),
  ADD KEY `smw_title` (`smw_title`,`smw_namespace`,`smw_iw`,`smw_subobject`),
  ADD KEY `smw_sortkey` (`smw_sortkey`),
  ADD KEY `smw_iw` (`smw_iw`);

--
-- Indexes for table `smw_prop_stats`
--
ALTER TABLE `smw_prop_stats`
  ADD UNIQUE KEY `p_id` (`p_id`),
  ADD KEY `usage_count` (`usage_count`);

--
-- Indexes for table `smw_query_links`
--
ALTER TABLE `smw_query_links`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `s_id_2` (`s_id`,`o_id`);

--
-- Indexes for table `smw_redi2`
--
ALTER TABLE `smw_redi2`
  ADD KEY `s_title` (`s_title`,`s_namespace`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_rels2`
--
ALTER TABLE `smw_rels2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_spec2`
--
ALTER TABLE `smw_spec2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `s_id_2` (`s_id`,`p_id`);

--
-- Indexes for table `smw_subp2`
--
ALTER TABLE `smw_subp2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_subs2`
--
ALTER TABLE `smw_subs2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `o_id` (`o_id`);

--
-- Indexes for table `smw_text2`
--
ALTER TABLE `smw_text2`
  ADD KEY `s_id` (`s_id`),
  ADD KEY `p_id` (`p_id`);

--
-- Indexes for table `tag_summary`
--
ALTER TABLE `tag_summary`
  ADD UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  ADD UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  ADD UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`);

--
-- Indexes for table `templatelinks`
--
ALTER TABLE `templatelinks`
  ADD UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  ADD UNIQUE KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  ADD KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`);

--
-- Indexes for table `text`
--
ALTER TABLE `text`
  ADD PRIMARY KEY (`old_id`),
  ADD KEY `old_timestamp` (`old_timestamp`),
  ADD KEY `name_title_timestamp` (`old_namespace`,`old_title`,`inverse_timestamp`),
  ADD KEY `user_timestamp` (`old_user`,`inverse_timestamp`),
  ADD KEY `usertext_timestamp` (`old_user_text`,`inverse_timestamp`);

--
-- Indexes for table `trackbacks`
--
ALTER TABLE `trackbacks`
  ADD PRIMARY KEY (`tb_id`),
  ADD KEY `tb_page` (`tb_page`);

--
-- Indexes for table `transcache`
--
ALTER TABLE `transcache`
  ADD UNIQUE KEY `tc_url_idx` (`tc_url`);

--
-- Indexes for table `updatelog`
--
ALTER TABLE `updatelog`
  ADD PRIMARY KEY (`ul_key`);

--
-- Indexes for table `uploadstash`
--
ALTER TABLE `uploadstash`
  ADD PRIMARY KEY (`us_id`),
  ADD UNIQUE KEY `us_key` (`us_key`),
  ADD KEY `us_user` (`us_user`),
  ADD KEY `us_timestamp` (`us_timestamp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_email_token` (`user_email_token`);
ALTER TABLE `user` ADD FULLTEXT KEY `user_email` (`user_email`);

--
-- Indexes for table `user_former_groups`
--
ALTER TABLE `user_former_groups`
  ADD UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`ug_user`,`ug_group`),
  ADD KEY `ug_group` (`ug_group`);

--
-- Indexes for table `user_newtalk`
--
ALTER TABLE `user_newtalk`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_ip` (`user_ip`);

--
-- Indexes for table `user_properties`
--
ALTER TABLE `user_properties`
  ADD UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  ADD KEY `user_properties_property` (`up_property`);

--
-- Indexes for table `user_rights`
--
ALTER TABLE `user_rights`
  ADD UNIQUE KEY `ur_user` (`ur_user`);

--
-- Indexes for table `validate`
--
ALTER TABLE `validate`
  ADD KEY `val_user` (`val_user`,`val_title`,`val_timestamp`);

--
-- Indexes for table `valid_tag`
--
ALTER TABLE `valid_tag`
  ADD PRIMARY KEY (`vt_tag`);

--
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`wl_id`),
  ADD UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  ADD KEY `namespace_title` (`wl_namespace`,`wl_title`),
  ADD KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `ar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `cur`
--
ALTER TABLE `cur`
  MODIFY `cur_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `externallinks`
--
ALTER TABLE `externallinks`
  MODIFY `el_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `filearchive`
--
ALTER TABLE `filearchive`
  MODIFY `fa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `ipblocks`
--
ALTER TABLE `ipblocks`
  MODIFY `ipb_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ipblocks_old`
--
ALTER TABLE `ipblocks_old`
  MODIFY `ipb_id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `job_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `logging`
--
ALTER TABLE `logging`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `page_restrictions`
--
ALTER TABLE `page_restrictions`
  MODIFY `pr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `recentchanges`
--
ALTER TABLE `recentchanges`
  MODIFY `rc_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `revision`
--
ALTER TABLE `revision`
  MODIFY `rev_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `site_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `smw_ids`
--
ALTER TABLE `smw_ids`
  MODIFY `smw_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `smw_object_ids`
--
ALTER TABLE `smw_object_ids`
  MODIFY `smw_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `text`
--
ALTER TABLE `text`
  MODIFY `old_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `trackbacks`
--
ALTER TABLE `trackbacks`
  MODIFY `tb_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uploadstash`
--
ALTER TABLE `uploadstash`
  MODIFY `us_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `wl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
