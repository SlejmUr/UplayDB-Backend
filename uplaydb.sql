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

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `space_id` text COLLATE utf8_bin NOT NULL,
  `app_id` text COLLATE utf8_bin NOT NULL,
  `config_name` text COLLATE utf8_bin NOT NULL,
  `config_displayname` text COLLATE utf8_bin NOT NULL,
  `config_genre` text COLLATE utf8_bin NOT NULL,
  `config_platform` text COLLATE utf8_bin NOT NULL,
  `db_internal_name` text COLLATE utf8_bin NOT NULL COMMENT 'Internal name for DB, nothing else',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ManifestId` text COLLATE utf8_bin NOT NULL,
  `FileName` text COLLATE utf8_bin NOT NULL,
  `FileSize` text COLLATE utf8_bin NOT NULL,
  `SliceSize` int(11) NOT NULL,
  `DownloadSize` int(11) NOT NULL,
  `ChunkId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(11) NOT NULL COMMENT 'The ID of the Genre',
  `genre_name` text NOT NULL COMMENT 'The Name of the Genre'
) ENGINE=InnoDB DEFAULT CHARSET=utf8_bin;

CREATE TABLE IF NOT EXISTS `manifests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `ManifestId` text COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL,
  `TotalFiles` int(11) NOT NULL,
  `TotalFileSize` int(11) NOT NULL,
  `SizeDisk` int(11) NOT NULL,
  `SizeCompressed` int(11) NOT NULL,
  `TotalChunks` int(11) NOT NULL,
  `Compression` int(11) NOT NULL COMMENT 'Deflate,Lzham,Zstd',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `manifest_compression` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the Compression',
  `mc_name` text NOT NULL COMMENT 'The Name of the Compression',
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8_bin;

INSERT INTO `manifest_compression` (`mc_id`, `mc_name`) VALUES
(1, 'Deflate'),
(2, 'Lzham'),
(3, 'Zstd');

CREATE TABLE IF NOT EXISTS `platform` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The ID of the platform',
  `platfrom_name` text NOT NULL COMMENT 'The Name of the platform',
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8_bin;

INSERT INTO `platform` (`platform_id`, `platfrom_name`) VALUES
(0, 'Example'),
(1, '360'),
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
(23, 'Xbox Series X');

CREATE TABLE IF NOT EXISTS `spaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spaceId` text COLLATE utf8mb4_bin NOT NULL,
  `spaceType` text COLLATE utf8mb4_bin NOT NULL,
  `spaceName` text COLLATE utf8mb4_bin NOT NULL,
  `releaseType` text COLLATE utf8mb4_bin NOT NULL,
  `platformType` text COLLATE utf8mb4_bin NOT NULL,
  `dateCreated` date NOT NULL,
  `dateLastModified` date NOT NULL,
  `db_internal_name` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Internal name for DB, nothing else',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
