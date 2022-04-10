--
-- All this thing is will be changing over time!
--


CREATE TABLE IF NOT EXISTS `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicationId` text COLLATE utf8mb4_bin NOT NULL,
  `name` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Name on API',
  `displayName` text COLLATE utf8mb4_bin NOT NULL COMMENT 'DisplayName on site',
  `platform` text COLLATE utf8mb4_bin NOT NULL,
  `releaseDate` date DEFAULT NULL,
  `coverUrl` text COLLATE utf8mb4_bin NOT NULL COMMENT 'LowBoxArt',
  `bannerUrl` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Background',
  `db_internal_name` text COLLATE utf8mb4_bin NOT NULL COMMENT 'Internal name for DB, nothing else',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `space_id` text COLLATE utf8_bin NOT NULL,
  `app_id` text COLLATE utf8_bin NOT NULL,
  `name` text COLLATE utf8_bin NOT NULL,
  `displayname` text COLLATE utf8_bin NOT NULL,
  `genre` text COLLATE utf8_bin NOT NULL,
  `platform` text COLLATE utf8_bin NOT NULL,
  `db_internal_name` text COLLATE utf8_bin NOT NULL COMMENT 'Internal name for DB, nothing else',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ManifestId` text COLLATE utf8_bin NOT NULL,
  `FileName` text COLLATE utf8_bin NOT NULL,
  `FileSize` text COLLATE utf8_bin NOT NULL,
  `ChunkId` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `manifests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `ManifestId` text COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL,
  `TotalFiles` int(11) NOT NULL,
  `TotalFileSize` int(11) NOT NULL,
  `SizeDisk` int(11) NOT NULL,
  `SizeCompressed` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
