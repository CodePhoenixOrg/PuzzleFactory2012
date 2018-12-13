-- MySQL dump 10.2
--
-- Host: localhost    Database: puzzle
-- ------------------------------------------------------
-- Server version	4.1.0-alpha-Max

/*!40101 SET NAMES latin1*/;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=NO_AUTO_VALUE_ON_ZERO */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS applications;
CREATE TABLE applications (
  app_index int(11) NOT NULL default '0',
  app_link varchar(255) NOT NULL default '',
  di_index varchar(8) NOT NULL default '',
  PRIMARY KEY  (app_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS blocks;
CREATE TABLE blocks (
  bl_index int(11) NOT NULL default '1',
  bl_column char(1) NOT NULL default '1',
  bl_type varchar(25) NOT NULL default 'menu',
  di_index varchar(8) NOT NULL default 'nts',
  PRIMARY KEY  (bl_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS books;
CREATE TABLE books (
  bo_index int(11) NOT NULL default '1',
  bo_title varchar(255) NOT NULL default 'none',
  bo_author varchar(255) NOT NULL default 'none',
  bo_publisher varchar(25) NOT NULL default 'none',
  bo_description text NOT NULL,
  bo_isbn varchar(15) NOT NULL default 'unknown',
  bo_coverpath varchar(255) NOT NULL default 'none',
  la_country char(2) NOT NULL default 'fr',
  PRIMARY KEY  (bo_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `calendrier`
--

DROP TABLE IF EXISTS calendrier;
CREATE TABLE calendrier (
  id int(11) NOT NULL auto_increment,
  jour date default NULL,
  heure time default NULL,
  sujet varchar(100) default NULL,
  commentaire text,
  lieu varchar(100) default NULL,
  eve_index int(11) NOT NULL default '0',
  cli_index int(11) NOT NULL default '0',
  eve_document varchar(250) NOT NULL default '',
  eve_synthese varchar(250) NOT NULL default '',
  ste_index int(11) NOT NULL default '0',
  tra_index int(11) NOT NULL default '0',
  eve_extrait varchar(250) NOT NULL default '',
  ste_duree time default '00:00:00',
  tra_duree time default '00:00:00',
  PRIMARY KEY  (id),
  KEY cli_index (cli_index),
  KEY eve_index (eve_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `code_postal`
--

DROP TABLE IF EXISTS code_postal;
CREATE TABLE code_postal (
  cp_index int(11) NOT NULL auto_increment,
  cp_code varchar(5) NOT NULL default '',
  cp_ville varchar(50) NOT NULL default '',
  PRIMARY KEY  (cp_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS dictionary;
CREATE TABLE dictionary (
  di_index varchar(8) NOT NULL default '',
  di_fr_short varchar(255) NOT NULL default '',
  di_fr_long text NOT NULL,
  di_en_short varchar(255) NOT NULL default '',
  di_en_long text NOT NULL,
  di_ru_short varchar(255) NOT NULL default '',
  di_ru_long text NOT NULL,
  PRIMARY KEY  (di_index),
  UNIQUE KEY di_index (di_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  grp_group char(15) NOT NULL default '',
  grp_members_priv enum('N','Y') NOT NULL default 'N',
  grp_menu_priv enum('N','Y') NOT NULL default 'N',
  grp_page_priv enum('N','Y') NOT NULL default 'N',
  grp_news_priv enum('N','Y') NOT NULL default 'N',
  grp_items_priv enum('N','Y') NOT NULL default 'N',
  grp_customers_priv enum('N','Y') NOT NULL default 'N',
  grp_products_priv enum('N','Y') NOT NULL default 'N',
  grp_calendar_priv enum('N','Y') NOT NULL default 'N',
  grp_newsletter_priv enum('N','Y') NOT NULL default 'N',
  grp_forum_priv enum('N','Y') NOT NULL default 'N',
  KEY grp_index (grp_group)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS guestbook;
CREATE TABLE guestbook (
  nickname varchar(50) NOT NULL default '',
  city varchar(50) NOT NULL default '',
  email varchar(50) NOT NULL default '',
  msg varchar(255) NOT NULL default '',
  dday date NOT NULL default '0000-00-00',
  link varchar(50) NOT NULL default '',
  hhour time NOT NULL default '00:00:00'
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS languages;
CREATE TABLE languages (
  lg_index char(2) NOT NULL default '',
  lg_translator varchar(255) NOT NULL default '',
  lg_email varchar(255) NOT NULL default ''
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS members;
CREATE TABLE members (
  mbr_index int(11) NOT NULL auto_increment,
  mbr_nom varchar(50) NOT NULL default 'Sans nom',
  mbr_adr1 varchar(50) NOT NULL default 'Pas d''adresse',
  mbr_adr2 varchar(50) NOT NULL default '',
  cp_index int(11) NOT NULL default '75001',
  mbr_email varchar(50) NOT NULL default '',
  mbr_ident varchar(50) NOT NULL default '',
  mbr_mpasse varchar(50) NOT NULL default '',
  PRIMARY KEY  (mbr_index),
  UNIQUE KEY mbr_nom (mbr_nom)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS menus;
CREATE TABLE menus (
  me_index int(11) NOT NULL default '1',
  me_level char(1) NOT NULL default '1',
  me_target varchar(7) NOT NULL default 'page',
  pa_index int(11) NOT NULL default '1',
  bl_index int(11) NOT NULL default '1',
  di_index varchar(8) NOT NULL default 'nisc',
  grp_group enum('administrator','manager','operator','moderator','user') NOT NULL default 'user',
  PRIMARY KEY  (me_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS news;
CREATE TABLE news (
  nw_index int(11) NOT NULL default '1',
  nw_title varchar(255) NOT NULL default 'none',
  nw_author varchar(255) NOT NULL default 'none',
  nw_description text NOT NULL,
  nw_picture varchar(255) NOT NULL default 'none',
  nw_date date NOT NULL default '2003-12-08',
  nw_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nw_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS newsletter;
CREATE TABLE newsletter (
  nl_index int(11) NOT NULL default '1',
  nl_title varchar(255) NOT NULL default 'none',
  nl_author varchar(255) NOT NULL default 'none',
  nl_header text NOT NULL,
  nl_body text NOT NULL,
  nl_links text NOT NULL,
  nl_footer text NOT NULL,
  nl_file varchar(255) NOT NULL default 'none',
  nl_date date NOT NULL default '2003-12-08',
  nl_time time NOT NULL default '12:00:00',
  PRIMARY KEY  (nl_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS pages;
CREATE TABLE pages (
  pa_index int(11) NOT NULL default '0',
  di_index varchar(8) NOT NULL default '0',
  pa_filename varchar(255) NOT NULL default '',
  PRIMARY KEY  (pa_index,di_index),
  KEY pa_index (pa_index,di_index)
) TYPE=MyISAM CHARSET=latin1;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS subscribers;
CREATE TABLE subscribers (
  sub_index int(11) NOT NULL auto_increment,
  sub_email varchar(255) default NULL,
  PRIMARY KEY  (sub_index),
  UNIQUE KEY nlr_email (sub_email)
) TYPE=MyISAM CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

