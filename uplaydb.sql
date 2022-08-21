--
-- All this thing is will be changing over time!
--
CREATE DATABASE IF NOT EXISTS `uplaydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `uplaydb`;

CREATE TABLE IF NOT EXISTS `apikeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `API_KEY` text COLLATE utf8mb4_bin NOT NULL,
  `host` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` text COLLATE utf8mb4_bin NOT NULL,
  `app_name` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Name on API',
  `app_displayName` text COLLATE utf8mb4_bin NOT NULL COMMENT 'DisplayName on site',
  `app_platform` text COLLATE utf8mb4_bin NOT NULL,
  `app_genre` text COLLATE utf8mb4_bin DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `coverUrl` text COLLATE utf8mb4_bin NOT NULL COMMENT 'LowBoxArt',
  `bannerUrl` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Background',
  `db_internal_name` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Internal name for DB, nothing else',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `app_hub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` text COLLATE utf8mb4_bin NOT NULL,
  `db_parent_name` text COLLATE utf8mb4_bin NOT NULL,
  `db_child_name` text COLLATE utf8mb4_bin NOT NULL,
  `platform_id` int(11) NOT NULL,
  `release_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` text COLLATE utf8mb4_bin NOT NULL,
  `brand_space` text COLLATE utf8mb4_bin NOT NULL,
  `db_internal_name` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `space_id` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `app_id` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `config_name` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `config_displayname` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `config_genre` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `config_platform` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `db_internal_name` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT 'Internal name for DB, nothing else',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ManifestId` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `FileName` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `FileSize` bigint(255) NOT NULL,
  `SliceSize` bigint(255) NOT NULL,
  `DownloadSize` bigint(255) NOT NULL,
  `ChunkId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the Genre',
  `genre_name` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT 'The Name of the Genre',
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Games for everyone'),
(4, 'Party'),
(5, 'RPG'),
(6, 'Shooter'),
(7, 'Simulation'),
(8, 'Sports'),
(9, 'Strategy'),
(10, 'Survival horror'),
(11, 'WEB'),
(12, 'UNKNOWN');

CREATE TABLE IF NOT EXISTS `manifests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `ManifestId` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `Date` date NOT NULL,
  `TotalFiles` int(11) NOT NULL,
  `TotalFileSize` bigint(255) NOT NULL,
  `SizeDisk` bigint(255) NOT NULL,
  `SizeCompressed` bigint(255) NOT NULL,
  `TotalChunks` int(11) NOT NULL,
  `Compression` int(11) NOT NULL COMMENT 'Deflate,Lzham,Zstd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `manifest_compression` (
  `compression_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the Compression',
  `compression_name` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT 'The Name of the Compression',
  PRIMARY KEY (`compression_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `manifest_compression` (`compression_id`, `compression_name`) VALUES
(1, 'Deflate'),
(2, 'Lzham'),
(3, 'Zstd');

CREATE TABLE IF NOT EXISTS `platform` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the platform',
  `platform_name` mediumtext COLLATE utf8mb4_bin NOT NULL COMMENT 'The Name of the platform',
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `platform` (`platform_id`, `platform_name`) VALUES
(0, 'Example'),
(2, 'Android'),
(3, 'Crossplay'),
(4, 'IOS'),
(5, 'Luna'),
(6, 'Mac'),
(7, 'PC'),
(8, 'PC (China)'),
(9, 'PS3'),
(10, 'PS4'),
(11, 'PS5'),
(12, 'Server'),
(13, 'Stadia'),
(14, 'Switch'),
(15, 'Tool'),
(16, 'Web'),
(17, 'WebGame'),
(18, 'WebMarket'),
(19, 'Windows Phone'),
(20, 'Windows Store'),
(21, 'Xbox 360'),
(22, 'Xbox ONE'),
(23, 'Xbox Series X'),
(24, 'WII U'),
(25, 'Geforce Now'),
(26, 'iPad'),
(27, 'iPhone'),
(28, 'OnLive'),
(29, 'Flash'),
(30, 'PSVITA'),
(31, 'PSP'),
(32, 'Facebook'),
(33, 'WII'),
(34, 'XBOX'),
(50, 'Installment'),
(51, 'Brand');

CREATE TABLE IF NOT EXISTS `releases` (
  `release_id` int(11) NOT NULL AUTO_INCREMENT,
  `release_type` text COLLATE utf8mb4_bin NOT NULL,
  `release_description` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`release_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `releases` (`release_id`, `release_type`, `release_description`) VALUES
(1, 'EXAMPLE', 'This Release is an Example, this just an Example'),
(2, 'BETA', 'BETA Version of the game'),
(3, 'DEMO', 'Usually Free \"DEMO\" version for the game'),
(4, 'RETAIL', 'Full, released version of the game'),
(5, 'STAGING', 'Testing Build of the game'),
(10, 'Installment', 'Installing the game (NOT A VALID TYPE)'),
(11, 'Brand', 'Brand of the game (NOT A VALID TYPE)');

CREATE TABLE IF NOT EXISTS `spaces` (
  `id` int(255) NOT NULL,
  `spaceId` text COLLATE utf8mb4_bin NOT NULL,
  `spaceType` text COLLATE utf8mb4_bin NOT NULL,
  `spaceName` text COLLATE utf8mb4_bin NOT NULL,
  `releaseType` int(2) NOT NULL,
  `platformType` int(2) NOT NULL,
  `dateCreated` date NOT NULL,
  `dateLastModified` date NOT NULL,
  `db_internal_name` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `secret` text COLLATE utf8mb4_bin NOT NULL,
  `contained_key` text COLLATE utf8mb4_bin NOT NULL,
  `api_key` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
