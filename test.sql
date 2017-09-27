create database if not exists landing;
  USE landing;
  DROP TABLE IF EXISTS test;
  CREATE TABLE test (
    system_id int(11) unsigned NOT NULL AUTO_INCREMENT,
    docid varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    Created varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
    activation_date varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
    expiration_date varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
    username varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
    Title varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
    RFPCategory varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    RFPDescription text COLLATE utf8_unicode_ci,
    ZipCode varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
    City varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    State varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    sourceurl varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
    Country varchar(7) COLLATE utf8_unicode_ci,
    orgname varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
    commodity varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
    datekey varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
    ItemID varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
    ItemSourceName varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
    system_creator varchar(45) COLLATE utf8_unicode_ci NOT NULL,
    system_load_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    system_extract_date date DEFAULT NULL,
    system_file_name varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    system_process_stage varchar(6) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (system_id)) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
LOCK TABLES test WRITE;
UNLOCK TABLES;

