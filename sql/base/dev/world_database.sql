/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.22 : Database - world
*********************************************************************
*/

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`world` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `world`;

/*Table structure for table `access_requirement` */

DROP TABLE IF EXISTS `access_requirement`;

CREATE TABLE `access_requirement` (
  `mapId` mediumint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `level_min` tinyint unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint unsigned NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `item2` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_done_A` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_done_H` mediumint unsigned NOT NULL DEFAULT '0',
  `completed_achievement` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `comment` text,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';

/*Table structure for table `achievement_dbc` */

DROP TABLE IF EXISTS `achievement_dbc`;

CREATE TABLE `achievement_dbc` (
  `ID` int unsigned NOT NULL,
  `requiredFaction` int NOT NULL DEFAULT '-1',
  `mapID` int NOT NULL DEFAULT '-1',
  `points` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '0',
  `refAchievement` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `achievement_reward` */

DROP TABLE IF EXISTS `achievement_reward`;

CREATE TABLE `achievement_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TitleA` int unsigned NOT NULL DEFAULT '0',
  `TitleH` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `Sender` int unsigned NOT NULL DEFAULT '0',
  `Subject` varchar(255) DEFAULT NULL,
  `Body` text,
  `MailTemplateID` int unsigned DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `achievement_reward_locale` */

DROP TABLE IF EXISTS `achievement_reward_locale`;

CREATE TABLE `achievement_reward_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `Subject` text,
  `Body` text,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `adventure_map_ui` */

DROP TABLE IF EXISTS `adventure_map_ui`;

CREATE TABLE `adventure_map_ui` (
  `creatureId` int unsigned NOT NULL,
  `uiMapId` int unsigned NOT NULL,
  PRIMARY KEY (`creatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `archaeology_artifacts` */

DROP TABLE IF EXISTS `archaeology_artifacts`;

CREATE TABLE `archaeology_artifacts` (
  `spellId` int unsigned NOT NULL DEFAULT '0',
  `minSkillValue` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `archaeology_digsites` */

DROP TABLE IF EXISTS `archaeology_digsites`;

CREATE TABLE `archaeology_digsites` (
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `minSkillLevel` smallint unsigned NOT NULL DEFAULT '0',
  `currencyId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `areatrigger` */

DROP TABLE IF EXISTS `areatrigger`;

CREATE TABLE `areatrigger` (
  `guid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id` int unsigned NOT NULL,
  `map_id` int unsigned NOT NULL,
  `spawn_mask` bigint unsigned NOT NULL DEFAULT '1',
  `position_x` float NOT NULL,
  `position_y` float NOT NULL,
  `position_z` float NOT NULL,
  `ScriptName` char(64) DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `areatrigger_involvedrelation` */

DROP TABLE IF EXISTS `areatrigger_involvedrelation`;

CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

/*Table structure for table `areatrigger_scripts` */

DROP TABLE IF EXISTS `areatrigger_scripts`;

CREATE TABLE `areatrigger_scripts` (
  `entry` mediumint NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `areatrigger_tavern` */

DROP TABLE IF EXISTS `areatrigger_tavern`;

CREATE TABLE `areatrigger_tavern` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

/*Table structure for table `areatrigger_teleport` */

DROP TABLE IF EXISTS `areatrigger_teleport`;

CREATE TABLE `areatrigger_teleport` (
  `ID` bigint NOT NULL DEFAULT '0',
  `PortLocID` mediumint unsigned NOT NULL DEFAULT '0',
  `Name` text,
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `name` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

/*Table structure for table `areatrigger_template` */

DROP TABLE IF EXISTS `areatrigger_template`;

CREATE TABLE `areatrigger_template` (
  `Id` int unsigned NOT NULL,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Data0` float NOT NULL DEFAULT '0',
  `Data1` float NOT NULL DEFAULT '0',
  `Data2` float NOT NULL DEFAULT '0',
  `Data3` float NOT NULL DEFAULT '0',
  `Data4` float NOT NULL DEFAULT '0',
  `Data5` float NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `areatrigger_template_actions` */

DROP TABLE IF EXISTS `areatrigger_template_actions`;

CREATE TABLE `areatrigger_template_actions` (
  `AreaTriggerId` int unsigned NOT NULL,
  `ActionType` int unsigned NOT NULL,
  `ActionParam` int unsigned NOT NULL,
  `TargetType` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AreaTriggerId`,`ActionType`,`ActionParam`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `areatrigger_template_auras` */

DROP TABLE IF EXISTS `areatrigger_template_auras`;

CREATE TABLE `areatrigger_template_auras` (
  `AreaTriggerId` int unsigned NOT NULL,
  `AuraId` int unsigned NOT NULL,
  `TargetType` int unsigned NOT NULL DEFAULT '0',
  `CastType` int unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `areatrigger_template_polygon_vertices` */

DROP TABLE IF EXISTS `areatrigger_template_polygon_vertices`;

CREATE TABLE `areatrigger_template_polygon_vertices` (
  `AreaTriggerId` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `VerticeX` float NOT NULL DEFAULT '0',
  `VerticeY` float NOT NULL DEFAULT '0',
  `VerticeTargetX` float DEFAULT NULL,
  `VerticeTargetY` float DEFAULT NULL,
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AreaTriggerId`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `areatrigger_template_splines` */

DROP TABLE IF EXISTS `areatrigger_template_splines`;

CREATE TABLE `areatrigger_template_splines` (
  `MoveCurveId` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `SplineX` float NOT NULL DEFAULT '0',
  `SplineY` float NOT NULL DEFAULT '0',
  `SplineZ` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MoveCurveId`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `battle_pay_entry` */

DROP TABLE IF EXISTS `battle_pay_entry`;

CREATE TABLE `battle_pay_entry` (
  `id` int unsigned NOT NULL,
  `order` int unsigned NOT NULL,
  `groupId` int unsigned NOT NULL,
  `productId` int unsigned NOT NULL,
  `flags` int unsigned NOT NULL,
  `banner` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `battle_pay_group` */

DROP TABLE IF EXISTS `battle_pay_group`;

CREATE TABLE `battle_pay_group` (
  `id` int unsigned NOT NULL,
  `order` int unsigned NOT NULL,
  `name` text NOT NULL,
  `icon` int unsigned NOT NULL,
  `type` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `battle_pay_product` */

DROP TABLE IF EXISTS `battle_pay_product`;

CREATE TABLE `battle_pay_product` (
  `ID` int unsigned NOT NULL,
  `Name1` text NOT NULL,
  `Name2` text NOT NULL,
  `Name3` text NOT NULL,
  `NormalPrice` int unsigned NOT NULL,
  `CurrentPrice` int unsigned NOT NULL,
  `ItemID` int unsigned NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `DisplayID` int unsigned NOT NULL,
  `Type` tinyint unsigned NOT NULL,
  `Flags` int unsigned NOT NULL,
  `ChoiceType` int unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `battle_pet_breeds` */

DROP TABLE IF EXISTS `battle_pet_breeds`;

CREATE TABLE `battle_pet_breeds` (
  `speciesId` int unsigned NOT NULL DEFAULT '0',
  `breedId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`speciesId`,`breedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `battle_pet_quality` */

DROP TABLE IF EXISTS `battle_pet_quality`;

CREATE TABLE `battle_pet_quality` (
  `speciesId` int unsigned NOT NULL DEFAULT '0',
  `quality` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`speciesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `battleground_template` */

DROP TABLE IF EXISTS `battleground_template`;

CREATE TABLE `battleground_template` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `MinPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint unsigned NOT NULL,
  `HordeStartLoc` mediumint unsigned NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint unsigned NOT NULL DEFAULT '1',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` char(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `battlemaster_entry` */

DROP TABLE IF EXISTS `battlemaster_entry`;

CREATE TABLE `battlemaster_entry` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `battlepay_display_info` */

DROP TABLE IF EXISTS `battlepay_display_info`;

CREATE TABLE `battlepay_display_info` (
  `DisplayInfoId` int unsigned NOT NULL AUTO_INCREMENT,
  `CreatureDisplayInfoID` int unsigned NOT NULL DEFAULT '0',
  `FileDataID` int unsigned DEFAULT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Name1` varchar(1024) NOT NULL,
  `Name2` varchar(1024) NOT NULL,
  `Name3` varchar(1024) NOT NULL,
  `Name4` varchar(1024) NOT NULL,
  `Name5` varchar(50) NOT NULL,
  UNIQUE KEY `DisplayInfoId` (`DisplayInfoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_display_info_locales` */

DROP TABLE IF EXISTS `battlepay_display_info_locales`;

CREATE TABLE `battlepay_display_info_locales` (
  `Id` mediumint unsigned NOT NULL DEFAULT '0',
  `Locale` mediumint unsigned NOT NULL DEFAULT '0',
  `Name1` varchar(1024) DEFAULT '',
  `Name2` varchar(1024) DEFAULT '',
  `Name3` varchar(1024) DEFAULT '',
  `Name4` varchar(1024) DEFAULT '',
  `Name5` int DEFAULT NULL,
  PRIMARY KEY (`Id`,`Locale`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_display_info_visuals` */

DROP TABLE IF EXISTS `battlepay_display_info_visuals`;

CREATE TABLE `battlepay_display_info_visuals` (
  `DisplayInfoId` int unsigned NOT NULL AUTO_INCREMENT,
  `DisplayId` int unsigned NOT NULL DEFAULT '0',
  `VisualId` int unsigned NOT NULL DEFAULT '0',
  `ProductName` varchar(1024) NOT NULL,
  UNIQUE KEY `DisplayInfoId` (`DisplayInfoId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_product_group` */

DROP TABLE IF EXISTS `battlepay_product_group`;

CREATE TABLE `battlepay_product_group` (
  `GroupID` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `IconFileDataID` int NOT NULL,
  `DisplayType` tinyint unsigned NOT NULL,
  `Ordering` int NOT NULL,
  PRIMARY KEY (`GroupID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_product_group_locales` */

DROP TABLE IF EXISTS `battlepay_product_group_locales`;

CREATE TABLE `battlepay_product_group_locales` (
  `GroupID` mediumint unsigned NOT NULL DEFAULT '0',
  `Locale` text,
  `Name` text,
  PRIMARY KEY (`GroupID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_product_items` */

DROP TABLE IF EXISTS `battlepay_product_items`;

CREATE TABLE `battlepay_product_items` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int unsigned NOT NULL,
  `ItemID` int unsigned NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `DisplayID` int DEFAULT NULL,
  `PetResult` tinyint unsigned NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_products` */

DROP TABLE IF EXISTS `battlepay_products`;

CREATE TABLE `battlepay_products` (
  `ProductID` int unsigned NOT NULL AUTO_INCREMENT,
  `NormalPriceFixedPoint` bigint unsigned NOT NULL,
  `CurrentPriceFixedPoint` bigint unsigned NOT NULL,
  `Type` tinyint unsigned NOT NULL,
  `ChoiceType` tinyint unsigned NOT NULL,
  `Flags` int unsigned NOT NULL,
  `DisplayInfoID` int unsigned NOT NULL,
  `ScriptName` text NOT NULL,
  `ClassMask` int unsigned NOT NULL DEFAULT '0',
  `WebsiteType` tinyint DEFAULT NULL,
  PRIMARY KEY (`ProductID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepay_shop_entry` */

DROP TABLE IF EXISTS `battlepay_shop_entry`;

CREATE TABLE `battlepay_shop_entry` (
  `EntryID` int unsigned NOT NULL AUTO_INCREMENT,
  `GroupID` int unsigned NOT NULL,
  `ProductID` int unsigned NOT NULL,
  `Ordering` int NOT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `BannerType` tinyint unsigned NOT NULL,
  `DisplayInfoID` int unsigned NOT NULL,
  PRIMARY KEY (`EntryID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `battlepet_info` */

DROP TABLE IF EXISTS `battlepet_info`;

CREATE TABLE `battlepet_info` (
  `NpcID` int unsigned NOT NULL,
  `Specie` int unsigned NOT NULL DEFAULT '0',
  `maxlevel` int unsigned NOT NULL DEFAULT '0',
  `minlevel` int unsigned NOT NULL DEFAULT '0',
  `minquality` int unsigned NOT NULL DEFAULT '0',
  `breadsMask` int unsigned NOT NULL DEFAULT '0',
  `Ability1` int unsigned NOT NULL DEFAULT '0',
  `Ability2` int unsigned NOT NULL DEFAULT '0',
  `Ability3` int unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NpcID`,`Specie`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Table structure for table `battlepet_npc_team_member` */

DROP TABLE IF EXISTS `battlepet_npc_team_member`;

CREATE TABLE `battlepet_npc_team_member` (
  `NpcID` int unsigned NOT NULL,
  `Specie` int unsigned NOT NULL DEFAULT '0',
  `minlevel` int unsigned NOT NULL DEFAULT '0',
  `maxlevel` int unsigned NOT NULL DEFAULT '0',
  `minquality` int unsigned NOT NULL DEFAULT '0',
  `breadsMask` int unsigned NOT NULL DEFAULT '0',
  `Ability1` int unsigned NOT NULL DEFAULT '0',
  `Ability2` int unsigned NOT NULL DEFAULT '0',
  `Ability3` int unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`NpcID`,`Specie`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `battlepet_spawn_relation` */

DROP TABLE IF EXISTS `battlepet_spawn_relation`;

CREATE TABLE `battlepet_spawn_relation` (
  `Name` varchar(255) NOT NULL,
  `CritterEntry` int NOT NULL,
  `BattlePetEntry` int NOT NULL,
  PRIMARY KEY (`CritterEntry`,`BattlePetEntry`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `battlepet_wild_zone_pool` */

DROP TABLE IF EXISTS `battlepet_wild_zone_pool`;

CREATE TABLE `battlepet_wild_zone_pool` (
  `Zone` int unsigned NOT NULL,
  `Species` int unsigned NOT NULL,
  `BattlePetEntry` int unsigned NOT NULL,
  `Max` int unsigned NOT NULL,
  `RespawnTime` int unsigned NOT NULL DEFAULT '60',
  `MinLevel` int unsigned NOT NULL,
  `MaxLevel` int unsigned NOT NULL,
  `CreatureEntry` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Zone`,`Species`,`BattlePetEntry`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

/*Table structure for table `blackmarket_template` */

DROP TABLE IF EXISTS `blackmarket_template`;

CREATE TABLE `blackmarket_template` (
  `marketId` int NOT NULL DEFAULT '0',
  `sellerNpc` mediumint NOT NULL DEFAULT '0',
  `itemEntry` mediumint unsigned NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1',
  `minBid` bigint unsigned NOT NULL DEFAULT '0',
  `duration` int NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `bonusListIDs` text,
  PRIMARY KEY (`marketId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `character_template` */

DROP TABLE IF EXISTS `character_template`;

CREATE TABLE `character_template` (
  `Id` int unsigned NOT NULL,
  `Name` varchar(70) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Level` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `character_template_class` */

DROP TABLE IF EXISTS `character_template_class`;

CREATE TABLE `character_template_class` (
  `TemplateId` int unsigned NOT NULL,
  `FactionGroup` tinyint unsigned NOT NULL COMMENT '3 - Alliance, 5 - Horde',
  `Class` tinyint unsigned NOT NULL,
  PRIMARY KEY (`TemplateId`,`FactionGroup`,`Class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `class_expansion_requirement` */

DROP TABLE IF EXISTS `class_expansion_requirement`;

CREATE TABLE `class_expansion_requirement` (
  `ClassID` tinyint unsigned NOT NULL,
  `RaceID` tinyint unsigned NOT NULL,
  `ActiveExpansionLevel` tinyint unsigned DEFAULT '0',
  `AccountExpansionLevel` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`ClassID`,`RaceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `command` */

DROP TABLE IF EXISTS `command`;

CREATE TABLE `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `permission` smallint unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';

/*Table structure for table `conditions` */

DROP TABLE IF EXISTS `conditions`;

CREATE TABLE `conditions` (
  `SourceTypeOrReferenceId` mediumint NOT NULL DEFAULT '0',
  `SourceGroup` mediumint unsigned NOT NULL DEFAULT '0',
  `SourceEntry` int NOT NULL DEFAULT '0',
  `SourceId` int NOT NULL DEFAULT '0',
  `ElseGroup` mediumint unsigned NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` mediumint NOT NULL DEFAULT '0',
  `ConditionTarget` tinyint unsigned NOT NULL DEFAULT '0',
  `ConditionValue1` int unsigned NOT NULL DEFAULT '0',
  `ConditionValue2` int unsigned NOT NULL DEFAULT '0',
  `ConditionValue3` int unsigned NOT NULL DEFAULT '0',
  `NegativeCondition` tinyint unsigned NOT NULL DEFAULT '0',
  `ErrorType` mediumint unsigned NOT NULL DEFAULT '0',
  `ErrorTextId` mediumint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Condition System';

/*Table structure for table `conversation_actor_template` */

DROP TABLE IF EXISTS `conversation_actor_template`;

CREATE TABLE `conversation_actor_template` (
  `Id` int unsigned NOT NULL,
  `CreatureId` int unsigned NOT NULL DEFAULT '0',
  `CreatureModelId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `conversation_actors` */

DROP TABLE IF EXISTS `conversation_actors`;

CREATE TABLE `conversation_actors` (
  `ConversationId` int unsigned NOT NULL,
  `ConversationActorId` int unsigned NOT NULL DEFAULT '0',
  `ConversationActorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `ConversationActorNearId` int unsigned NOT NULL DEFAULT '0',
  `Idx` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ConversationId`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `conversation_line_template` */

DROP TABLE IF EXISTS `conversation_line_template`;

CREATE TABLE `conversation_line_template` (
  `Id` int unsigned NOT NULL,
  `StartTime` int unsigned NOT NULL DEFAULT '0',
  `UiCameraID` int unsigned NOT NULL DEFAULT '0',
  `ActorIdx` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  `Unk` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `conversation_template` */

DROP TABLE IF EXISTS `conversation_template`;

CREATE TABLE `conversation_template` (
  `Id` int unsigned NOT NULL,
  `FirstLineId` int unsigned NOT NULL,
  `LastLineEndTime` int unsigned NOT NULL,
  `TextureKitId` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature` */

DROP TABLE IF EXISTS `creature`;

CREATE TABLE `creature` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnDifficulties` varchar(100) NOT NULL DEFAULT '0',
  `phaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int DEFAULT '0',
  `PhaseGroup` int DEFAULT '0',
  `terrainSwapMap` int NOT NULL DEFAULT '-1',
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '0',
  `currentwaypoint` mediumint unsigned NOT NULL DEFAULT '0',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int unsigned NOT NULL DEFAULT '0',
  `unit_flags3` int unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) DEFAULT '',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1022682 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

/*Table structure for table `creature_addon` */

DROP TABLE IF EXISTS `creature_addon`;

CREATE TABLE `creature_addon` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `path_id` int unsigned NOT NULL DEFAULT '0',
  `mount` mediumint unsigned NOT NULL DEFAULT '0',
  `bytes1` int unsigned NOT NULL DEFAULT '0',
  `bytes2` int unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `aiAnimKit` smallint NOT NULL DEFAULT '0',
  `movementAnimKit` smallint NOT NULL DEFAULT '0',
  `meleeAnimKit` smallint NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_classlevelstats` */

DROP TABLE IF EXISTS `creature_classlevelstats`;

CREATE TABLE `creature_classlevelstats` (
  `level` tinyint NOT NULL,
  `class` tinyint NOT NULL,
  `basemana` mediumint unsigned NOT NULL DEFAULT '1',
  `basearmor` mediumint unsigned NOT NULL DEFAULT '1',
  `attackpower` smallint NOT NULL DEFAULT '0',
  `rangedattackpower` smallint NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`level`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_default_trainer` */

DROP TABLE IF EXISTS `creature_default_trainer`;

CREATE TABLE `creature_default_trainer` (
  `CreatureId` int unsigned NOT NULL,
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_equip_template` */

DROP TABLE IF EXISTS `creature_equip_template`;

CREATE TABLE `creature_equip_template` (
  `CreatureID` mediumint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '1',
  `ItemID1` mediumint unsigned NOT NULL DEFAULT '0',
  `AppearanceModID1` smallint unsigned NOT NULL DEFAULT '0',
  `ItemVisual1` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID2` mediumint unsigned NOT NULL DEFAULT '0',
  `AppearanceModID2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemVisual2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID3` mediumint unsigned NOT NULL DEFAULT '0',
  `AppearanceModID3` smallint unsigned NOT NULL DEFAULT '0',
  `ItemVisual3` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_formations` */

DROP TABLE IF EXISTS `creature_formations`;

CREATE TABLE `creature_formations` (
  `leaderGUID` bigint unsigned NOT NULL DEFAULT '0',
  `memberGUID` bigint unsigned NOT NULL DEFAULT '0',
  `dist` float unsigned NOT NULL DEFAULT '0',
  `angle` float unsigned NOT NULL DEFAULT '0',
  `groupAI` int unsigned NOT NULL DEFAULT '0',
  `point_1` smallint unsigned NOT NULL DEFAULT '0',
  `point_2` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_loot_template` */

DROP TABLE IF EXISTS `creature_loot_template`;

CREATE TABLE `creature_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

/*Table structure for table `creature_model_info` */

DROP TABLE IF EXISTS `creature_model_info`;

CREATE TABLE `creature_model_info` (
  `DisplayID` mediumint unsigned NOT NULL DEFAULT '0',
  `BoundingRadius` float NOT NULL DEFAULT '0',
  `CombatReach` float NOT NULL DEFAULT '0',
  `DisplayID_Other_Gender` mediumint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DisplayID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';

/*Table structure for table `creature_onkill_reputation` */

DROP TABLE IF EXISTS `creature_onkill_reputation`;

CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint NOT NULL DEFAULT '0',
  `TeamDependent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

/*Table structure for table `creature_onkill_reward` */

DROP TABLE IF EXISTS `creature_onkill_reward`;

CREATE TABLE `creature_onkill_reward` (
  `creature_id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint NOT NULL DEFAULT '0',
  `TeamDependent` tinyint unsigned NOT NULL DEFAULT '0',
  `CurrencyId1` mediumint DEFAULT '0',
  `CurrencyId2` mediumint DEFAULT '0',
  `CurrencyId3` mediumint DEFAULT '0',
  `CurrencyCount1` mediumint DEFAULT '0',
  `CurrencyCount2` mediumint DEFAULT '0',
  `CurrencyCount3` mediumint DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

/*Table structure for table `creature_questender` */

DROP TABLE IF EXISTS `creature_questender`;

CREATE TABLE `creature_questender` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

/*Table structure for table `creature_questitem` */

DROP TABLE IF EXISTS `creature_questitem`;

CREATE TABLE `creature_questitem` (
  `CreatureEntry` int unsigned NOT NULL DEFAULT '0',
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureEntry`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_queststarter` */

DROP TABLE IF EXISTS `creature_queststarter`;

CREATE TABLE `creature_queststarter` (
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

/*Table structure for table `creature_summon_groups` */

DROP TABLE IF EXISTS `creature_summon_groups`;

CREATE TABLE `creature_summon_groups` (
  `summonerId` mediumint unsigned NOT NULL DEFAULT '0',
  `summonerType` tinyint unsigned NOT NULL DEFAULT '0',
  `groupId` tinyint unsigned NOT NULL DEFAULT '0',
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint unsigned NOT NULL DEFAULT '0',
  `summonTime` int unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_summoner_entry` */

DROP TABLE IF EXISTS `creature_summoner_entry`;

CREATE TABLE `creature_summoner_entry` (
  `CreatureId` int unsigned NOT NULL,
  `SummonerVisibleCreatureId` int unsigned NOT NULL,
  PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `creature_template` */

DROP TABLE IF EXISTS `creature_template`;

CREATE TABLE `creature_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_1` mediumint unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_2` mediumint unsigned NOT NULL DEFAULT '0',
  `difficulty_entry_3` mediumint unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int unsigned NOT NULL DEFAULT '0',
  `name` char(200) NOT NULL DEFAULT '0',
  `femaleName` char(200) DEFAULT NULL,
  `subname` char(200) DEFAULT NULL,
  `TitleAlt` char(200) DEFAULT NULL,
  `IconName` char(100) DEFAULT NULL,
  `gossip_menu_id` mediumint unsigned NOT NULL DEFAULT '0',
  `minlevel` smallint NOT NULL DEFAULT '1',
  `maxlevel` smallint NOT NULL DEFAULT '1',
  `HealthScalingExpansion` mediumint NOT NULL DEFAULT '0',
  `RequiredExpansion` mediumint NOT NULL DEFAULT '0',
  `VignetteID` mediumint NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  `dmgschool` tinyint NOT NULL DEFAULT '0',
  `BaseAttackTime` int unsigned NOT NULL DEFAULT '0',
  `RangeAttackTime` int unsigned NOT NULL DEFAULT '0',
  `BaseVariance` float NOT NULL DEFAULT '1',
  `RangeVariance` float NOT NULL DEFAULT '1',
  `unit_class` tinyint unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int unsigned NOT NULL DEFAULT '0',
  `unit_flags3` int unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int unsigned NOT NULL DEFAULT '0',
  `family` int unsigned NOT NULL DEFAULT '0',
  `trainer_type` tinyint NOT NULL DEFAULT '0',
  `trainer_class` tinyint unsigned NOT NULL DEFAULT '0',
  `trainer_race` tinyint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `type_flags` int unsigned NOT NULL DEFAULT '0',
  `type_flags2` int unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint NOT NULL DEFAULT '0',
  `resistance2` smallint NOT NULL DEFAULT '0',
  `resistance3` smallint NOT NULL DEFAULT '0',
  `resistance4` smallint NOT NULL DEFAULT '0',
  `resistance5` smallint NOT NULL DEFAULT '0',
  `resistance6` smallint NOT NULL DEFAULT '0',
  `spell1` mediumint unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint unsigned NOT NULL DEFAULT '0',
  `spell5` mediumint unsigned NOT NULL DEFAULT '0',
  `spell6` mediumint unsigned NOT NULL DEFAULT '0',
  `spell7` mediumint unsigned NOT NULL DEFAULT '0',
  `spell8` mediumint unsigned NOT NULL DEFAULT '0',
  `VehicleId` mediumint unsigned NOT NULL DEFAULT '0',
  `mingold` int unsigned NOT NULL DEFAULT '0',
  `maxgold` int unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint unsigned NOT NULL DEFAULT '3',
  `HoverHeight` float NOT NULL DEFAULT '1',
  `HealthModifier` float NOT NULL DEFAULT '1',
  `HealthModifierExtra` float NOT NULL DEFAULT '1',
  `ManaModifier` float NOT NULL DEFAULT '1',
  `ManaModifierExtra` float NOT NULL DEFAULT '1',
  `ArmorModifier` float NOT NULL DEFAULT '1',
  `DamageModifier` float NOT NULL DEFAULT '1',
  `ExperienceModifier` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint unsigned NOT NULL DEFAULT '0',
  `movementId` int unsigned NOT NULL DEFAULT '0',
  `WidgetSetID` int NOT NULL DEFAULT '0',
  `WidgetSetUnitConditionID` int NOT NULL DEFAULT '0',
  `RegenHealth` tinyint unsigned NOT NULL DEFAULT '1',
  `mechanic_immune_mask` int unsigned NOT NULL DEFAULT '0',
  `flags_extra` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

/*Table structure for table `creature_template_addon` */

DROP TABLE IF EXISTS `creature_template_addon`;

CREATE TABLE `creature_template_addon` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `path_id` int unsigned NOT NULL DEFAULT '0',
  `mount` mediumint unsigned NOT NULL DEFAULT '0',
  `bytes1` int unsigned NOT NULL DEFAULT '0',
  `bytes2` int unsigned NOT NULL DEFAULT '0',
  `emote` mediumint unsigned NOT NULL DEFAULT '0',
  `aiAnimKit` smallint NOT NULL DEFAULT '0',
  `movementAnimKit` smallint NOT NULL DEFAULT '0',
  `meleeAnimKit` smallint NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_template_journal` */

DROP TABLE IF EXISTS `creature_template_journal`;

CREATE TABLE `creature_template_journal` (
  `entry` int unsigned NOT NULL,
  `JournalEncounterID` int unsigned NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `creature_template_locale` */

DROP TABLE IF EXISTS `creature_template_locale`;

CREATE TABLE `creature_template_locale` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
  `NameAlt` text,
  `Title` text,
  `TitleAlt` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_template_model` */

DROP TABLE IF EXISTS `creature_template_model`;

CREATE TABLE `creature_template_model` (
  `CreatureID` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID` int unsigned NOT NULL,
  `DisplayScale` float NOT NULL DEFAULT '1',
  `Probability` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `creature_template_scaling` */

DROP TABLE IF EXISTS `creature_template_scaling`;

CREATE TABLE `creature_template_scaling` (
  `Entry` mediumint unsigned NOT NULL,
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `LevelScalingMin` smallint NOT NULL DEFAULT '0',
  `LevelScalingMax` smallint NOT NULL DEFAULT '0',
  `LevelScalingDeltaMin` smallint NOT NULL DEFAULT '0',
  `LevelScalingDeltaMax` smallint NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int DEFAULT NULL,
  PRIMARY KEY (`Entry`,`DifficultyID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `creature_template_spell` */

DROP TABLE IF EXISTS `creature_template_spell`;

CREATE TABLE `creature_template_spell` (
  `entry` int unsigned NOT NULL,
  `spellid` int unsigned NOT NULL,
  `action` enum('NONE','CAST_ON_SPAWN','CAST_ON_AGGRO','CAST_IN_COMBAT','CAST_OUT_OF_COMBAT') NOT NULL DEFAULT 'NONE',
  `action_param1` int unsigned NOT NULL DEFAULT '0',
  `action_param2` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`spellid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `creature_text` */

DROP TABLE IF EXISTS `creature_text`;

CREATE TABLE `creature_text` (
  `CreatureID` mediumint unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `Text` longtext,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Language` tinyint NOT NULL DEFAULT '0',
  `Probability` float unsigned NOT NULL DEFAULT '0',
  `Emote` mediumint unsigned NOT NULL DEFAULT '0',
  `Duration` mediumint unsigned NOT NULL DEFAULT '0',
  `Sound` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextId` mediumint NOT NULL DEFAULT '0',
  `TextRange` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_text_locale` */

DROP TABLE IF EXISTS `creature_text_locale`;

CREATE TABLE `creature_text_locale` (
  `CreatureID` mediumint unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `Text` text,
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `creature_trainer` */

DROP TABLE IF EXISTS `creature_trainer`;

CREATE TABLE `creature_trainer` (
  `CreatureId` int unsigned NOT NULL,
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `OptionIndex` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureId`,`MenuId`,`OptionIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `criteria_data` */

DROP TABLE IF EXISTS `criteria_data`;

CREATE TABLE `criteria_data` (
  `criteria_id` mediumint NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `value1` mediumint unsigned NOT NULL DEFAULT '0',
  `value2` mediumint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Achievment system';

/*Table structure for table `disables` */

DROP TABLE IF EXISTS `disables`;

CREATE TABLE `disables` (
  `sourceType` int unsigned NOT NULL,
  `entry` int unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `params_0` varchar(255) NOT NULL DEFAULT '',
  `params_1` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceType`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `disenchant_loot_template` */

DROP TABLE IF EXISTS `disenchant_loot_template`;

CREATE TABLE `disenchant_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `event_scripts` */

DROP TABLE IF EXISTS `event_scripts`;

CREATE TABLE `event_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `exploration_basexp` */

DROP TABLE IF EXISTS `exploration_basexp`;

CREATE TABLE `exploration_basexp` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `basexp` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';

/*Table structure for table `fishing_loot_template` */

DROP TABLE IF EXISTS `fishing_loot_template`;

CREATE TABLE `fishing_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

/*Table structure for table `game_event` */

DROP TABLE IF EXISTS `game_event`;

CREATE TABLE `game_event` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint unsigned DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_arena_seasons` */

DROP TABLE IF EXISTS `game_event_arena_seasons`;

CREATE TABLE `game_event_arena_seasons` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint unsigned NOT NULL COMMENT 'Arena season number',
  UNIQUE KEY `season` (`season`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_battleground_holiday` */

DROP TABLE IF EXISTS `game_event_battleground_holiday`;

CREATE TABLE `game_event_battleground_holiday` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `bgflag` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_condition` */

DROP TABLE IF EXISTS `game_event_condition`;

CREATE TABLE `game_event_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_creature` */

DROP TABLE IF EXISTS `game_event_creature`;

CREATE TABLE `game_event_creature` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_creature_quest` */

DROP TABLE IF EXISTS `game_event_creature_quest`;

CREATE TABLE `game_event_creature_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_gameobject` */

DROP TABLE IF EXISTS `game_event_gameobject`;

CREATE TABLE `game_event_gameobject` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_gameobject_quest` */

DROP TABLE IF EXISTS `game_event_gameobject_quest`;

CREATE TABLE `game_event_gameobject_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_model_equip` */

DROP TABLE IF EXISTS `game_event_model_equip`;

CREATE TABLE `game_event_model_equip` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_npc_vendor` */

DROP TABLE IF EXISTS `game_event_npc_vendor`;

CREATE TABLE `game_event_npc_vendor` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` mediumint unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `BonusListIDs` text,
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `IgnoreFiltering` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_npcflag` */

DROP TABLE IF EXISTS `game_event_npcflag`;

CREATE TABLE `game_event_npcflag` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_pool` */

DROP TABLE IF EXISTS `game_event_pool`;

CREATE TABLE `game_event_pool` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  PRIMARY KEY (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_prerequisite` */

DROP TABLE IF EXISTS `game_event_prerequisite`;

CREATE TABLE `game_event_prerequisite` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` mediumint unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`prerequisite_event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_quest_condition` */

DROP TABLE IF EXISTS `game_event_quest_condition`;

CREATE TABLE `game_event_quest_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` mediumint unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `game_event_seasonal_questrelation` */

DROP TABLE IF EXISTS `game_event_seasonal_questrelation`;

CREATE TABLE `game_event_seasonal_questrelation` (
  `questId` int unsigned NOT NULL COMMENT 'Quest Identifier',
  `eventEntry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the game event',
  PRIMARY KEY (`questId`,`eventEntry`),
  KEY `idx_quest` (`questId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Player System';

/*Table structure for table `game_event_spell_area` */

DROP TABLE IF EXISTS `game_event_spell_area`;

CREATE TABLE `game_event_spell_area` (
  `eventEntry` tinyint unsigned NOT NULL,
  `areaId` int unsigned NOT NULL,
  `spellId` int unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`areaId`,`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `game_tele` */

DROP TABLE IF EXISTS `game_tele`;

CREATE TABLE `game_tele` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3065 DEFAULT CHARSET=utf8 COMMENT='Tele Command';

/*Table structure for table `game_weather` */

DROP TABLE IF EXISTS `game_weather`;

CREATE TABLE `game_weather` (
  `zone` mediumint unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

/*Table structure for table `gameobject` */

DROP TABLE IF EXISTS `gameobject`;

CREATE TABLE `gameobject` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `id` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnDifficulties` varchar(100) NOT NULL DEFAULT '0',
  `phaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int DEFAULT '0',
  `PhaseGroup` int DEFAULT '0',
  `terrainSwapMap` int NOT NULL DEFAULT '-1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int NOT NULL DEFAULT '0',
  `animprogress` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  `isActive` tinyint unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) DEFAULT '',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM AUTO_INCREMENT=255094 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

/*Table structure for table `gameobject_addon` */

DROP TABLE IF EXISTS `gameobject_addon`;

CREATE TABLE `gameobject_addon` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `parent_rotation0` float NOT NULL DEFAULT '0',
  `parent_rotation1` float NOT NULL DEFAULT '0',
  `parent_rotation2` float NOT NULL DEFAULT '0',
  `parent_rotation3` float NOT NULL DEFAULT '1',
  `invisibilityType` tinyint unsigned NOT NULL DEFAULT '0',
  `invisibilityValue` int unsigned NOT NULL DEFAULT '0',
  `WorldEffectID` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gameobject_loot_template` */

DROP TABLE IF EXISTS `gameobject_loot_template`;

CREATE TABLE `gameobject_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

/*Table structure for table `gameobject_questender` */

DROP TABLE IF EXISTS `gameobject_questender`;

CREATE TABLE `gameobject_questender` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gameobject_questitem` */

DROP TABLE IF EXISTS `gameobject_questitem`;

CREATE TABLE `gameobject_questitem` (
  `GameObjectEntry` int unsigned NOT NULL DEFAULT '0',
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`GameObjectEntry`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gameobject_queststarter` */

DROP TABLE IF EXISTS `gameobject_queststarter`;

CREATE TABLE `gameobject_queststarter` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `quest` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gameobject_template` */

DROP TABLE IF EXISTS `gameobject_template`;

CREATE TABLE `gameobject_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `IconName` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `unk1` varchar(100) NOT NULL DEFAULT '',
  `size` float NOT NULL DEFAULT '1',
  `Data0` int NOT NULL DEFAULT '0',
  `Data1` int NOT NULL DEFAULT '0',
  `Data2` int NOT NULL DEFAULT '0',
  `Data3` int NOT NULL DEFAULT '0',
  `Data4` int NOT NULL DEFAULT '0',
  `Data5` int NOT NULL DEFAULT '0',
  `Data6` int NOT NULL DEFAULT '0',
  `Data7` int NOT NULL DEFAULT '0',
  `Data8` int NOT NULL DEFAULT '0',
  `Data9` int NOT NULL DEFAULT '0',
  `Data10` int NOT NULL DEFAULT '0',
  `Data11` int NOT NULL DEFAULT '0',
  `Data12` int NOT NULL DEFAULT '0',
  `Data13` int NOT NULL DEFAULT '0',
  `Data14` int NOT NULL DEFAULT '0',
  `Data15` int NOT NULL DEFAULT '0',
  `Data16` int NOT NULL DEFAULT '0',
  `Data17` int NOT NULL DEFAULT '0',
  `Data18` int NOT NULL DEFAULT '0',
  `Data19` int NOT NULL DEFAULT '0',
  `Data20` int NOT NULL DEFAULT '0',
  `Data21` int NOT NULL DEFAULT '0',
  `Data22` int NOT NULL DEFAULT '0',
  `Data23` int NOT NULL DEFAULT '0',
  `Data24` int NOT NULL DEFAULT '0',
  `Data25` int NOT NULL DEFAULT '0',
  `Data26` int NOT NULL DEFAULT '0',
  `Data27` int NOT NULL DEFAULT '0',
  `Data28` int NOT NULL DEFAULT '0',
  `Data29` int NOT NULL DEFAULT '0',
  `Data30` int NOT NULL DEFAULT '0',
  `Data31` int NOT NULL DEFAULT '0',
  `Data32` int NOT NULL DEFAULT '0',
  `Data33` int NOT NULL DEFAULT '0',
  `ContentTuningId` int NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

/*Table structure for table `gameobject_template_addon` */

DROP TABLE IF EXISTS `gameobject_template_addon`;

CREATE TABLE `gameobject_template_addon` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint unsigned NOT NULL DEFAULT '0',
  `WorldEffectID` mediumint unsigned NOT NULL DEFAULT '0',
  `AIAnimKitID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gameobject_template_locale` */

DROP TABLE IF EXISTS `gameobject_template_locale`;

CREATE TABLE `gameobject_template_locale` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `name` text,
  `castBarCaption` text,
  `unk1` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `garrison_follower_class_spec_abilities` */

DROP TABLE IF EXISTS `garrison_follower_class_spec_abilities`;

CREATE TABLE `garrison_follower_class_spec_abilities` (
  `classSpecId` int unsigned NOT NULL DEFAULT '0',
  `abilityId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classSpecId`,`abilityId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `garrison_plot_finalize_info` */

DROP TABLE IF EXISTS `garrison_plot_finalize_info`;

CREATE TABLE `garrison_plot_finalize_info` (
  `garrPlotInstanceId` int unsigned NOT NULL,
  `hordeGameObjectId` int unsigned NOT NULL DEFAULT '0',
  `hordeX` float NOT NULL DEFAULT '0',
  `hordeY` float NOT NULL DEFAULT '0',
  `hordeZ` float NOT NULL DEFAULT '0',
  `hordeO` float NOT NULL DEFAULT '0',
  `hordeAnimKitId` smallint unsigned NOT NULL DEFAULT '0',
  `allianceGameObjectId` int unsigned NOT NULL DEFAULT '0',
  `allianceX` float NOT NULL DEFAULT '0',
  `allianceY` float NOT NULL DEFAULT '0',
  `allianceZ` float NOT NULL DEFAULT '0',
  `allianceO` float NOT NULL DEFAULT '0',
  `allianceAnimKitId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`garrPlotInstanceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `garrison_scripts` */

DROP TABLE IF EXISTS `garrison_scripts`;

CREATE TABLE `garrison_scripts` (
  `GarSiteLevelId` int unsigned NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`GarSiteLevelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `gossip_menu` */

DROP TABLE IF EXISTS `gossip_menu`;

CREATE TABLE `gossip_menu` (
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `TextId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuId`,`TextId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gossip_menu_option` */

DROP TABLE IF EXISTS `gossip_menu_option`;

CREATE TABLE `gossip_menu_option` (
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `OptionIndex` int unsigned NOT NULL DEFAULT '0',
  `OptionIcon` tinyint unsigned NOT NULL DEFAULT '0',
  `OptionText` text,
  `OptionBroadcastTextId` int unsigned NOT NULL DEFAULT '0',
  `OptionType` int unsigned NOT NULL DEFAULT '0',
  `OptionNpcFlag` bigint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuId`,`OptionIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gossip_menu_option_action` */

DROP TABLE IF EXISTS `gossip_menu_option_action`;

CREATE TABLE `gossip_menu_option_action` (
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `OptionIndex` int unsigned NOT NULL DEFAULT '0',
  `ActionMenuId` int unsigned NOT NULL DEFAULT '0',
  `ActionPoiId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuId`,`OptionIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gossip_menu_option_box` */

DROP TABLE IF EXISTS `gossip_menu_option_box`;

CREATE TABLE `gossip_menu_option_box` (
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `OptionIndex` int unsigned NOT NULL DEFAULT '0',
  `BoxCoded` tinyint unsigned NOT NULL DEFAULT '0',
  `BoxMoney` int unsigned NOT NULL DEFAULT '0',
  `BoxText` text,
  `BoxBroadcastTextId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuId`,`OptionIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gossip_menu_option_locale` */

DROP TABLE IF EXISTS `gossip_menu_option_locale`;

CREATE TABLE `gossip_menu_option_locale` (
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `OptionIndex` int unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) NOT NULL,
  `OptionText` text,
  `BoxText` text,
  PRIMARY KEY (`MenuId`,`OptionIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `gossip_menu_option_trainer` */

DROP TABLE IF EXISTS `gossip_menu_option_trainer`;

CREATE TABLE `gossip_menu_option_trainer` (
  `MenuId` int unsigned NOT NULL DEFAULT '0',
  `OptionIndex` int unsigned NOT NULL DEFAULT '0',
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuId`,`OptionIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `graveyard_zone` */

DROP TABLE IF EXISTS `graveyard_zone`;

CREATE TABLE `graveyard_zone` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `GhostZone` mediumint unsigned NOT NULL DEFAULT '0',
  `Faction` smallint unsigned NOT NULL DEFAULT '0',
  `Comment` text,
  PRIMARY KEY (`ID`,`GhostZone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';

/*Table structure for table `guild_rewards` */

DROP TABLE IF EXISTS `guild_rewards`;

CREATE TABLE `guild_rewards` (
  `ItemID` mediumint unsigned NOT NULL DEFAULT '0',
  `MinGuildRep` tinyint unsigned DEFAULT '0',
  `RaceMask` bigint DEFAULT '0',
  `Cost` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`ItemID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `guild_rewards_req_achievements` */

DROP TABLE IF EXISTS `guild_rewards_req_achievements`;

CREATE TABLE `guild_rewards_req_achievements` (
  `ItemID` mediumint unsigned NOT NULL DEFAULT '0',
  `AchievementRequired` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ItemID`,`AchievementRequired`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `instance_difficulty_multiplier` */

DROP TABLE IF EXISTS `instance_difficulty_multiplier`;

CREATE TABLE `instance_difficulty_multiplier` (
  `mapId` int unsigned NOT NULL,
  `difficultyId` int unsigned NOT NULL,
  `healthMultiplier` float NOT NULL DEFAULT '1',
  `damageMultiplier` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`mapId`,`difficultyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `instance_encounters` */

DROP TABLE IF EXISTS `instance_encounters`;

CREATE TABLE `instance_encounters` (
  `entry` int unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
  `creditType` tinyint unsigned NOT NULL DEFAULT '0',
  `creditEntry` int unsigned NOT NULL DEFAULT '0',
  `lastEncounterDungeon` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
  `comment` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `instance_template` */

DROP TABLE IF EXISTS `instance_template`;

CREATE TABLE `instance_template` (
  `map` smallint unsigned NOT NULL,
  `parent` smallint unsigned NOT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  `allowMount` tinyint unsigned NOT NULL DEFAULT '0',
  `insideResurrection` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `item_bonus_chances` */

DROP TABLE IF EXISTS `item_bonus_chances`;

CREATE TABLE `item_bonus_chances` (
  `Id` int unsigned NOT NULL,
  `Group` tinyint unsigned NOT NULL,
  `BonusListID` int unsigned NOT NULL,
  `Chance` float DEFAULT NULL,
  PRIMARY KEY (`Id`,`Group`,`BonusListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `item_loot_template` */

DROP TABLE IF EXISTS `item_loot_template`;

CREATE TABLE `item_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `item_random_bonus_list_template` */

DROP TABLE IF EXISTS `item_random_bonus_list_template`;

CREATE TABLE `item_random_bonus_list_template` (
  `Id` int unsigned NOT NULL,
  `BonusListID` int unsigned NOT NULL,
  `Chance` float NOT NULL,
  PRIMARY KEY (`Id`,`BonusListID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';

/*Table structure for table `item_scrapping_loot` */

DROP TABLE IF EXISTS `item_scrapping_loot`;

CREATE TABLE `item_scrapping_loot` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `class` int unsigned NOT NULL,
  `subclass` int unsigned NOT NULL,
  `inventoryType` int NOT NULL,
  `minLevel` int unsigned NOT NULL,
  `maxLevel` int unsigned NOT NULL,
  `quality` int NOT NULL,
  `isCrafted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `item_script_names` */

DROP TABLE IF EXISTS `item_script_names`;

CREATE TABLE `item_script_names` (
  `Id` int unsigned NOT NULL,
  `ScriptName` varchar(64) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `item_template_addon` */

DROP TABLE IF EXISTS `item_template_addon`;

CREATE TABLE `item_template_addon` (
  `Id` int unsigned NOT NULL,
  `FlagsCu` int unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint unsigned NOT NULL DEFAULT '0',
  `MinMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `MaxMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `SpellPPMChance` float unsigned NOT NULL DEFAULT '0',
  `RandomBonusListTemplateId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Table structure for table `lfg_dungeon_rewards` */

DROP TABLE IF EXISTS `lfg_dungeon_rewards`;

CREATE TABLE `lfg_dungeon_rewards` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `otherQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `lfg_dungeon_template` */

DROP TABLE IF EXISTS `lfg_dungeon_template`;

CREATE TABLE `lfg_dungeon_template` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `requiredItemLevel` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`dungeonId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `linked_respawn` */

DROP TABLE IF EXISTS `linked_respawn`;

CREATE TABLE `linked_respawn` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `linkedGuid` bigint unsigned NOT NULL DEFAULT '0',
  `linkType` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';

/*Table structure for table `locales_gossip_menu_option` */

DROP TABLE IF EXISTS `locales_gossip_menu_option`;

CREATE TABLE `locales_gossip_menu_option` (
  `menu_id` int unsigned NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`menu_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `mail_level_reward` */

DROP TABLE IF EXISTS `mail_level_reward`;

CREATE TABLE `mail_level_reward` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `raceMask` bigint unsigned NOT NULL,
  `mailTemplateId` mediumint unsigned NOT NULL DEFAULT '0',
  `senderEntry` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Mail System';

/*Table structure for table `mail_loot_template` */

DROP TABLE IF EXISTS `mail_loot_template`;

CREATE TABLE `mail_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `milling_loot_template` */

DROP TABLE IF EXISTS `milling_loot_template`;

CREATE TABLE `milling_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `mount_definitions` */

DROP TABLE IF EXISTS `mount_definitions`;

CREATE TABLE `mount_definitions` (
  `spellId` int unsigned NOT NULL,
  `otherFactionSpellId` int unsigned NOT NULL,
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `npc_spellclick_spells` */

DROP TABLE IF EXISTS `npc_spellclick_spells`;

CREATE TABLE `npc_spellclick_spells` (
  `npc_entry` int unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int unsigned NOT NULL COMMENT 'spell which should be casted ',
  `cast_flags` tinyint unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `user_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click',
  PRIMARY KEY (`npc_entry`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `npc_teleport` */

DROP TABLE IF EXISTS `npc_teleport`;

CREATE TABLE `npc_teleport` (
  `menu` int unsigned NOT NULL,
  `submenu` int unsigned NOT NULL,
  `icon` int unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` int unsigned NOT NULL,
  `faction` int unsigned NOT NULL,
  `map` int unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `o` float NOT NULL,
  PRIMARY KEY (`menu`,`submenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `npc_text` */

DROP TABLE IF EXISTS `npc_text`;

CREATE TABLE `npc_text` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Probability0` float NOT NULL DEFAULT '0',
  `Probability1` float NOT NULL DEFAULT '0',
  `Probability2` float NOT NULL DEFAULT '0',
  `Probability3` float NOT NULL DEFAULT '0',
  `Probability4` float NOT NULL DEFAULT '0',
  `Probability5` float NOT NULL DEFAULT '0',
  `Probability6` float NOT NULL DEFAULT '0',
  `Probability7` float NOT NULL DEFAULT '0',
  `BroadcastTextID0` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID1` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID2` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID3` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID4` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID5` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID6` mediumint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID7` mediumint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `npc_trainer` */

DROP TABLE IF EXISTS `npc_trainer`;

CREATE TABLE `npc_trainer` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `SpellID` mediumint NOT NULL DEFAULT '0',
  `MoneyCost` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillLine` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `ReqLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `Index` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`SpellID`),
  KEY `INX_ID` (`ID`),
  KEY `INX_SPELLID` (`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `npc_vendor` */

DROP TABLE IF EXISTS `npc_vendor`;

CREATE TABLE `npc_vendor` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` mediumint NOT NULL DEFAULT '0',
  `maxcount` mediumint unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint unsigned NOT NULL DEFAULT '0',
  `OverrideGoldCost` bigint NOT NULL DEFAULT '-1',
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `BonusListIDs` text,
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `IgnoreFiltering` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';

/*Table structure for table `outdoorpvp_template` */

DROP TABLE IF EXISTS `outdoorpvp_template`;

CREATE TABLE `outdoorpvp_template` (
  `TypeId` tinyint unsigned NOT NULL,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `comment` text,
  PRIMARY KEY (`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='OutdoorPvP Templates';

/*Table structure for table `page_text` */

DROP TABLE IF EXISTS `page_text`;

CREATE TABLE `page_text` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Text` longtext,
  `NextPageID` mediumint unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System';

/*Table structure for table `page_text_locale` */

DROP TABLE IF EXISTS `page_text_locale`;

CREATE TABLE `page_text_locale` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Text` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pet_levelstats` */

DROP TABLE IF EXISTS `pet_levelstats`;

CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `hp` smallint unsigned NOT NULL,
  `mana` smallint unsigned NOT NULL,
  `armor` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL,
  `agi` smallint unsigned NOT NULL,
  `sta` smallint unsigned NOT NULL,
  `inte` smallint unsigned NOT NULL,
  `spi` smallint unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';

/*Table structure for table `pet_name_generation` */

DROP TABLE IF EXISTS `pet_name_generation`;

CREATE TABLE `pet_name_generation` (
  `id` mediumint unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `half` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

/*Table structure for table `phase_area` */

DROP TABLE IF EXISTS `phase_area`;

CREATE TABLE `phase_area` (
  `AreaId` int unsigned NOT NULL,
  `PhaseId` int unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AreaId`,`PhaseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pickpocketing_loot_template` */

DROP TABLE IF EXISTS `pickpocketing_loot_template`;

CREATE TABLE `pickpocketing_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `player_classlevelstats` */

DROP TABLE IF EXISTS `player_classlevelstats`;

CREATE TABLE `player_classlevelstats` (
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `str` smallint unsigned NOT NULL COMMENT 'strength',
  `agi` smallint unsigned NOT NULL COMMENT 'agility',
  `sta` smallint unsigned NOT NULL COMMENT 'stamina',
  `inte` smallint unsigned NOT NULL COMMENT 'intellect',
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

/*Table structure for table `player_factionchange_achievement` */

DROP TABLE IF EXISTS `player_factionchange_achievement`;

CREATE TABLE `player_factionchange_achievement` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `player_factionchange_items` */

DROP TABLE IF EXISTS `player_factionchange_items`;

CREATE TABLE `player_factionchange_items` (
  `race_A` int unsigned NOT NULL,
  `alliance_id` int unsigned NOT NULL,
  `commentA` text,
  `race_H` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  `commentH` text,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `player_factionchange_quests` */

DROP TABLE IF EXISTS `player_factionchange_quests`;

CREATE TABLE `player_factionchange_quests` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`),
  UNIQUE KEY `alliance_uniq` (`alliance_id`),
  UNIQUE KEY `horde_uniq` (`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `player_factionchange_reputations` */

DROP TABLE IF EXISTS `player_factionchange_reputations`;

CREATE TABLE `player_factionchange_reputations` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `player_factionchange_spells` */

DROP TABLE IF EXISTS `player_factionchange_spells`;

CREATE TABLE `player_factionchange_spells` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `player_factionchange_titles` */

DROP TABLE IF EXISTS `player_factionchange_titles`;

CREATE TABLE `player_factionchange_titles` (
  `alliance_id` int NOT NULL,
  `horde_id` int NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `player_racestats` */

DROP TABLE IF EXISTS `player_racestats`;

CREATE TABLE `player_racestats` (
  `race` tinyint unsigned NOT NULL,
  `str` smallint NOT NULL COMMENT 'strength',
  `agi` smallint NOT NULL COMMENT 'agility',
  `sta` smallint NOT NULL COMMENT 'stamina',
  `inte` smallint NOT NULL COMMENT 'intellect',
  PRIMARY KEY (`race`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores race stats.';

/*Table structure for table `player_xp_for_level` */

DROP TABLE IF EXISTS `player_xp_for_level`;

CREATE TABLE `player_xp_for_level` (
  `Level` tinyint unsigned NOT NULL,
  `Experience` float unsigned NOT NULL,
  PRIMARY KEY (`Level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice` */

DROP TABLE IF EXISTS `playerchoice`;

CREATE TABLE `playerchoice` (
  `ChoiceId` int NOT NULL,
  `UiTextureKitId` int NOT NULL DEFAULT '0',
  `SoundKitId` int unsigned NOT NULL DEFAULT '0',
  `Question` varchar(255) DEFAULT NULL,
  `HideWarboardHeader` tinyint(1) NOT NULL DEFAULT '0',
  `KeepOpenAfterChoice` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_locale` */

DROP TABLE IF EXISTS `playerchoice_locale`;

CREATE TABLE `playerchoice_locale` (
  `ChoiceId` int NOT NULL,
  `locale` varchar(4) NOT NULL,
  `Question` varchar(255) DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response` */

DROP TABLE IF EXISTS `playerchoice_response`;

CREATE TABLE `playerchoice_response` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `ResponseIdentifier` smallint unsigned NOT NULL,
  `Index` int unsigned NOT NULL,
  `ChoiceArtFileId` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WidgetSetID` int unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasElementID` int unsigned NOT NULL DEFAULT '0',
  `SoundKitID` int unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` int NOT NULL DEFAULT '0',
  `Answer` varchar(511) NOT NULL,
  `Header` varchar(511) NOT NULL,
  `SubHeader` varchar(100) NOT NULL DEFAULT '',
  `ButtonTemplate` varchar(400) NOT NULL DEFAULT '',
  `Description` varchar(2047) NOT NULL,
  `Confirmation` varchar(127) NOT NULL,
  `RewardQuestID` int unsigned DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_locale` */

DROP TABLE IF EXISTS `playerchoice_response_locale`;

CREATE TABLE `playerchoice_response_locale` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `locale` varchar(4) NOT NULL,
  `Header` varchar(511) NOT NULL DEFAULT '',
  `SubHeader` varchar(100) NOT NULL DEFAULT '',
  `ButtonTooltip` varchar(400) NOT NULL DEFAULT '',
  `Answer` varchar(511) NOT NULL DEFAULT '',
  `Description` varchar(2047) NOT NULL DEFAULT '',
  `Confirmation` varchar(127) NOT NULL DEFAULT '',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_maw_power` */

DROP TABLE IF EXISTS `playerchoice_response_maw_power`;

CREATE TABLE `playerchoice_response_maw_power` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `TypeArtFileID` int DEFAULT '0',
  `Rarity` int DEFAULT '0',
  `RarityColor` int unsigned DEFAULT '0',
  `SpellID` int DEFAULT '0',
  `MaxStacks` int DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_reward` */

DROP TABLE IF EXISTS `playerchoice_response_reward`;

CREATE TABLE `playerchoice_response_reward` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `TitleId` int NOT NULL DEFAULT '0',
  `PackageId` int NOT NULL DEFAULT '0',
  `SkillLineId` int unsigned NOT NULL DEFAULT '0',
  `SkillPointCount` int unsigned NOT NULL DEFAULT '0',
  `ArenaPointCount` int unsigned NOT NULL DEFAULT '0',
  `HonorPointCount` int unsigned NOT NULL DEFAULT '0',
  `Money` bigint unsigned NOT NULL DEFAULT '0',
  `Xp` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_reward_currency` */

DROP TABLE IF EXISTS `playerchoice_response_reward_currency`;

CREATE TABLE `playerchoice_response_reward_currency` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `CurrencyId` int unsigned NOT NULL DEFAULT '0',
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_reward_faction` */

DROP TABLE IF EXISTS `playerchoice_response_reward_faction`;

CREATE TABLE `playerchoice_response_reward_faction` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `FactionId` int unsigned NOT NULL DEFAULT '0',
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_reward_item` */

DROP TABLE IF EXISTS `playerchoice_response_reward_item`;

CREATE TABLE `playerchoice_response_reward_item` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `BonusListIDs` text,
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playerchoice_response_reward_item_choice` */

DROP TABLE IF EXISTS `playerchoice_response_reward_item_choice`;

CREATE TABLE `playerchoice_response_reward_item_choice` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `BonusListIDs` text,
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playercreateinfo` */

DROP TABLE IF EXISTS `playercreateinfo`;

CREATE TABLE `playercreateinfo` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `zone` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playercreateinfo_action` */

DROP TABLE IF EXISTS `playercreateinfo_action`;

CREATE TABLE `playercreateinfo_action` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `button` smallint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playercreateinfo_cast_spell` */

DROP TABLE IF EXISTS `playercreateinfo_cast_spell`;

CREATE TABLE `playercreateinfo_cast_spell` (
  `raceMask` bigint unsigned NOT NULL,
  `classMask` int unsigned NOT NULL DEFAULT '0',
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playercreateinfo_item` */

DROP TABLE IF EXISTS `playercreateinfo_item`;

CREATE TABLE `playercreateinfo_item` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint unsigned NOT NULL DEFAULT '0',
  `amount` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`itemid`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `playercreateinfo_spell_custom` */

DROP TABLE IF EXISTS `playercreateinfo_spell_custom`;

CREATE TABLE `playercreateinfo_spell_custom` (
  `racemask` bigint unsigned NOT NULL,
  `classmask` int unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`racemask`,`classmask`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `points_of_interest` */

DROP TABLE IF EXISTS `points_of_interest`;

CREATE TABLE `points_of_interest` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `Icon` mediumint unsigned NOT NULL DEFAULT '0',
  `Flags` mediumint unsigned NOT NULL DEFAULT '0',
  `Importance` mediumint unsigned NOT NULL DEFAULT '0',
  `Name` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `points_of_interest_locale` */

DROP TABLE IF EXISTS `points_of_interest_locale`;

CREATE TABLE `points_of_interest_locale` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Name` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pool_creature` */

DROP TABLE IF EXISTS `pool_creature`;

CREATE TABLE `pool_creature` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pool_gameobject` */

DROP TABLE IF EXISTS `pool_gameobject`;

CREATE TABLE `pool_gameobject` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pool_pool` */

DROP TABLE IF EXISTS `pool_pool`;

CREATE TABLE `pool_pool` (
  `pool_id` mediumint unsigned NOT NULL DEFAULT '0',
  `mother_pool` mediumint unsigned NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pool_quest` */

DROP TABLE IF EXISTS `pool_quest`;

CREATE TABLE `pool_quest` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `pool_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`),
  KEY `idx_guid` (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `pool_template` */

DROP TABLE IF EXISTS `pool_template`;

CREATE TABLE `pool_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `prospecting_loot_template` */

DROP TABLE IF EXISTS `prospecting_loot_template`;

CREATE TABLE `prospecting_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `quest_details` */

DROP TABLE IF EXISTS `quest_details`;

CREATE TABLE `quest_details` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_greeting` */

DROP TABLE IF EXISTS `quest_greeting`;

CREATE TABLE `quest_greeting` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `GreetEmoteType` smallint unsigned NOT NULL DEFAULT '0',
  `GreetEmoteDelay` int unsigned NOT NULL DEFAULT '0',
  `Greeting` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_greeting_locale` */

DROP TABLE IF EXISTS `quest_greeting_locale`;

CREATE TABLE `quest_greeting_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Greeting` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`type`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_mail_sender` */

DROP TABLE IF EXISTS `quest_mail_sender`;

CREATE TABLE `quest_mail_sender` (
  `QuestId` int unsigned NOT NULL DEFAULT '0',
  `RewardMailSenderEntry` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `quest_objectives` */

DROP TABLE IF EXISTS `quest_objectives`;

CREATE TABLE `quest_objectives` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `QuestID` mediumint unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Order` tinyint unsigned NOT NULL DEFAULT '0',
  `StorageIndex` tinyint NOT NULL DEFAULT '0',
  `ObjectID` int NOT NULL DEFAULT '0',
  `Amount` int NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Flags2` int unsigned NOT NULL DEFAULT '0',
  `ProgressBarWeight` float NOT NULL DEFAULT '0',
  `Description` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_objectives_locale` */

DROP TABLE IF EXISTS `quest_objectives_locale`;

CREATE TABLE `quest_objectives_locale` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `QuestId` mediumint unsigned NOT NULL DEFAULT '0',
  `StorageIndex` tinyint NOT NULL DEFAULT '0',
  `Description` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_offer_reward` */

DROP TABLE IF EXISTS `quest_offer_reward`;

CREATE TABLE `quest_offer_reward` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `RewardText` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_offer_reward_locale` */

DROP TABLE IF EXISTS `quest_offer_reward_locale`;

CREATE TABLE `quest_offer_reward_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `RewardText` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `quest_poi` */

DROP TABLE IF EXISTS `quest_poi`;

CREATE TABLE `quest_poi` (
  `QuestID` int NOT NULL DEFAULT '0',
  `BlobIndex` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `ObjectiveIndex` int NOT NULL DEFAULT '0',
  `QuestObjectiveID` int NOT NULL DEFAULT '0',
  `QuestObjectID` int NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `UiMapID` int NOT NULL DEFAULT '0',
  `Priority` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WorldEffectID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `NavigationPlayerConditionID` int NOT NULL DEFAULT '0',
  `SpawnTrackingID` int NOT NULL DEFAULT '0',
  `AlwaysAllowMergingBlobs` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`BlobIndex`,`Idx1`),
  KEY `idx` (`QuestID`,`BlobIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_poi_points` */

DROP TABLE IF EXISTS `quest_poi_points`;

CREATE TABLE `quest_poi_points` (
  `QuestID` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `Idx2` int NOT NULL DEFAULT '0',
  `X` int NOT NULL DEFAULT '0',
  `Y` int NOT NULL DEFAULT '0',
  `Z` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`Idx1`,`Idx2`),
  KEY `questId_id` (`QuestID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_request_items` */

DROP TABLE IF EXISTS `quest_request_items`;

CREATE TABLE `quest_request_items` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteOnCompleteDelay` int unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncompleteDelay` int unsigned NOT NULL DEFAULT '0',
  `CompletionText` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_request_items_locale` */

DROP TABLE IF EXISTS `quest_request_items_locale`;

CREATE TABLE `quest_request_items_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `CompletionText` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `quest_reward_choice_items` */

DROP TABLE IF EXISTS `quest_reward_choice_items`;

CREATE TABLE `quest_reward_choice_items` (
  `QuestID` int unsigned NOT NULL,
  `Type1` tinyint unsigned DEFAULT '0',
  `Type2` tinyint unsigned DEFAULT '0',
  `Type3` tinyint unsigned DEFAULT '0',
  `Type4` tinyint unsigned DEFAULT '0',
  `Type5` tinyint unsigned DEFAULT '0',
  `Type6` tinyint unsigned DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_reward_display_spell` */

DROP TABLE IF EXISTS `quest_reward_display_spell`;

CREATE TABLE `quest_reward_display_spell` (
  `QuestID` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `SpellID` int unsigned DEFAULT '0',
  `PlayerConditionID` int unsigned DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_template` */

DROP TABLE IF EXISTS `quest_template`;

CREATE TABLE `quest_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QuestType` tinyint unsigned NOT NULL DEFAULT '2',
  `QuestPackageID` int unsigned NOT NULL DEFAULT '0',
  `ContentTuningID` int unsigned NOT NULL DEFAULT '0',
  `QuestSortID` smallint NOT NULL DEFAULT '0',
  `QuestInfoID` smallint unsigned NOT NULL DEFAULT '0',
  `SuggestedGroupNum` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardNextQuest` int unsigned NOT NULL DEFAULT '0',
  `RewardXPDifficulty` int unsigned NOT NULL DEFAULT '0',
  `RewardXPMultiplier` float NOT NULL DEFAULT '1',
  `RewardMoney` int NOT NULL DEFAULT '0',
  `RewardMoneyDifficulty` int unsigned NOT NULL DEFAULT '0',
  `RewardMoneyMultiplier` float NOT NULL DEFAULT '1',
  `RewardBonusMoney` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell1` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell2` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell3` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell4` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell5` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell6` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell7` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell8` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell9` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell10` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell11` int NOT NULL DEFAULT '0',
  `RewardDisplaySpell12` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition1` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition2` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition3` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition4` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition5` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition6` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition7` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition8` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition9` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition10` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition11` int NOT NULL DEFAULT '0',
  `RewardDisplaySpellPlayerCondition12` int NOT NULL DEFAULT '0',
  `RewardSpell` int unsigned NOT NULL DEFAULT '0',
  `RewardHonor` int unsigned NOT NULL DEFAULT '0',
  `RewardKillHonor` int unsigned NOT NULL DEFAULT '0',
  `StartItem` int unsigned NOT NULL DEFAULT '0',
  `RewardArtifactXPDifficulty` int unsigned NOT NULL DEFAULT '0',
  `RewardArtifactXPMultiplier` float NOT NULL DEFAULT '1',
  `RewardArtifactCategoryID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `FlagsEx` int unsigned NOT NULL DEFAULT '0',
  `FlagsEx2` int unsigned NOT NULL DEFAULT '0',
  `RewardItem1` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount1` int unsigned NOT NULL DEFAULT '0',
  `RewardItem2` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount2` int unsigned NOT NULL DEFAULT '0',
  `RewardItem3` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount3` int unsigned NOT NULL DEFAULT '0',
  `RewardItem4` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount4` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop1` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity1` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop2` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity2` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop3` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity3` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop4` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID6` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity6` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID6` int unsigned NOT NULL DEFAULT '0',
  `POIContinent` int unsigned NOT NULL DEFAULT '0',
  `POIx` float NOT NULL DEFAULT '0',
  `POIy` float NOT NULL DEFAULT '0',
  `POIPriority` int NOT NULL DEFAULT '0',
  `RewardTitle` int unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` int unsigned NOT NULL DEFAULT '0',
  `RewardSkillLineID` int unsigned NOT NULL DEFAULT '0',
  `RewardNumSkillUps` int unsigned NOT NULL DEFAULT '0',
  `PortraitGiver` int unsigned NOT NULL DEFAULT '0',
  `PortraitGiverMount` int NOT NULL DEFAULT '0',
  `PortraitTurnIn` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionID1` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue1` int NOT NULL DEFAULT '0',
  `RewardFactionOverride1` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn1` int NOT NULL DEFAULT '0',
  `RewardFactionID2` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue2` int NOT NULL DEFAULT '0',
  `RewardFactionOverride2` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn2` int NOT NULL DEFAULT '0',
  `RewardFactionID3` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue3` int NOT NULL DEFAULT '0',
  `RewardFactionOverride3` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn3` int NOT NULL DEFAULT '0',
  `RewardFactionID4` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue4` int NOT NULL DEFAULT '0',
  `RewardFactionOverride4` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn4` int NOT NULL DEFAULT '0',
  `RewardFactionID5` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue5` int NOT NULL DEFAULT '0',
  `RewardFactionOverride5` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn5` int NOT NULL DEFAULT '0',
  `RewardFactionFlags` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID1` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty1` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID2` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty2` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID3` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty3` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID4` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty4` int unsigned NOT NULL DEFAULT '0',
  `AcceptedSoundKitID` int unsigned NOT NULL DEFAULT '0',
  `CompleteSoundKitID` int unsigned NOT NULL DEFAULT '0',
  `AreaGroupID` int unsigned NOT NULL DEFAULT '0',
  `TimeAllowed` int unsigned NOT NULL DEFAULT '0',
  `AllowableRaces` bigint unsigned NOT NULL DEFAULT '0',
  `TreasurePickerID` int NOT NULL DEFAULT '0',
  `Expansion` int NOT NULL DEFAULT '0',
  `ManagedWorldStateID` int NOT NULL DEFAULT '0',
  `QuestSessionBonus` int NOT NULL DEFAULT '0',
  `LogTitle` text,
  `LogDescription` text,
  `QuestDescription` text,
  `AreaDescription` text,
  `PortraitGiverText` text,
  `PortraitGiverName` text,
  `PortraitTurnInText` text,
  `PortraitTurnInName` text,
  `QuestCompletionLog` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

/*Table structure for table `quest_template_addon` */

DROP TABLE IF EXISTS `quest_template_addon`;

CREATE TABLE `quest_template_addon` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `AllowableClasses` int unsigned NOT NULL DEFAULT '0',
  `SourceSpellID` mediumint unsigned NOT NULL DEFAULT '0',
  `PrevQuestID` mediumint NOT NULL DEFAULT '0',
  `NextQuestID` mediumint NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint NOT NULL DEFAULT '0',
  `RewardMailTemplateID` mediumint unsigned NOT NULL DEFAULT '0',
  `RewardMailDelay` int unsigned NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint NOT NULL DEFAULT '0',
  `ProvidedItemCount` tinyint unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_template_locale` */

DROP TABLE IF EXISTS `quest_template_locale`;

CREATE TABLE `quest_template_locale` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `LogTitle` text,
  `LogDescription` text,
  `QuestDescription` text,
  `AreaDescription` text,
  `PortraitGiverText` text,
  `PortraitGiverName` text,
  `PortraitTurnInText` text,
  `PortraitTurnInName` text,
  `QuestCompletionLog` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `quest_visual_effect` */

DROP TABLE IF EXISTS `quest_visual_effect`;

CREATE TABLE `quest_visual_effect` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Index` tinyint unsigned NOT NULL DEFAULT '0',
  `VisualEffect` mediumint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Index`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `race_unlock_requirement` */

DROP TABLE IF EXISTS `race_unlock_requirement`;

CREATE TABLE `race_unlock_requirement` (
  `raceID` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '0',
  `achievementId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`raceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `reference_loot_template` */

DROP TABLE IF EXISTS `reference_loot_template`;

CREATE TABLE `reference_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`,`Reference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `reputation_reward_rate` */

DROP TABLE IF EXISTS `reputation_reward_rate`;

CREATE TABLE `reputation_reward_rate` (
  `faction` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `quest_daily_rate` float NOT NULL DEFAULT '1',
  `quest_weekly_rate` float NOT NULL DEFAULT '1',
  `quest_monthly_rate` float NOT NULL DEFAULT '1',
  `quest_repeatable_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `reputation_spillover_template` */

DROP TABLE IF EXISTS `reputation_spillover_template`;

CREATE TABLE `reputation_spillover_template` (
  `faction` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max rank,above this will not give any spillover',
  `faction2` smallint unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint unsigned NOT NULL DEFAULT '0',
  `faction3` smallint unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint unsigned NOT NULL DEFAULT '0',
  `faction4` smallint unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint unsigned NOT NULL DEFAULT '0',
  `faction5` smallint unsigned NOT NULL DEFAULT '0',
  `rate_5` float NOT NULL DEFAULT '0',
  `rank_5` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Reputation spillover reputation gain';

/*Table structure for table `scenario_poi` */

DROP TABLE IF EXISTS `scenario_poi`;

CREATE TABLE `scenario_poi` (
  `CriteriaTreeID` int NOT NULL DEFAULT '0',
  `BlobIndex` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `UiMapID` int NOT NULL DEFAULT '0',
  `Priority` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WorldEffectID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `NavigationPlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CriteriaTreeID`,`BlobIndex`,`Idx1`),
  KEY `idx` (`CriteriaTreeID`,`BlobIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `scenario_poi_points` */

DROP TABLE IF EXISTS `scenario_poi_points`;

CREATE TABLE `scenario_poi_points` (
  `CriteriaTreeID` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `Idx2` int NOT NULL DEFAULT '0',
  `X` int NOT NULL DEFAULT '0',
  `Y` int NOT NULL DEFAULT '0',
  `Z` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CriteriaTreeID`,`Idx1`,`Idx2`),
  KEY `questId_id` (`CriteriaTreeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `scenarios` */

DROP TABLE IF EXISTS `scenarios`;

CREATE TABLE `scenarios` (
  `map` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `scenario_A` int unsigned NOT NULL DEFAULT '0',
  `scenario_H` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `scene_template` */

DROP TABLE IF EXISTS `scene_template`;

CREATE TABLE `scene_template` (
  `SceneId` int unsigned NOT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `ScriptPackageID` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`SceneId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `scrapping_loot_template` */

DROP TABLE IF EXISTS `scrapping_loot_template`;

CREATE TABLE `scrapping_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `script_params` */

DROP TABLE IF EXISTS `script_params`;

CREATE TABLE `script_params` (
  `entryOrGuid` bigint NOT NULL,
  `index` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `numericParam` double NOT NULL,
  `stringParam` varchar(255) NOT NULL,
  PRIMARY KEY (`entryOrGuid`,`index`),
  KEY `index` (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `script_spline_chain_meta` */

DROP TABLE IF EXISTS `script_spline_chain_meta`;

CREATE TABLE `script_spline_chain_meta` (
  `entry` int unsigned NOT NULL,
  `chainId` smallint unsigned NOT NULL,
  `splineId` tinyint unsigned NOT NULL,
  `expectedDuration` int unsigned NOT NULL,
  `msUntilNext` int unsigned NOT NULL,
  PRIMARY KEY (`entry`,`chainId`,`splineId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `script_spline_chain_waypoints` */

DROP TABLE IF EXISTS `script_spline_chain_waypoints`;

CREATE TABLE `script_spline_chain_waypoints` (
  `entry` int unsigned NOT NULL,
  `chainId` smallint unsigned NOT NULL,
  `splineId` tinyint unsigned NOT NULL,
  `wpId` tinyint unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  PRIMARY KEY (`entry`,`chainId`,`splineId`,`wpId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `script_waypoint` */

DROP TABLE IF EXISTS `script_waypoint`;

CREATE TABLE `script_waypoint` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template entry',
  `pointid` mediumint unsigned NOT NULL DEFAULT '0',
  `location_x` float NOT NULL DEFAULT '0',
  `location_y` float NOT NULL DEFAULT '0',
  `location_z` float NOT NULL DEFAULT '0',
  `waittime` int unsigned NOT NULL DEFAULT '0' COMMENT 'waittime in millisecs',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Creature waypoints';

/*Table structure for table `skill_discovery_template` */

DROP TABLE IF EXISTS `skill_discovery_template`;

CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';

/*Table structure for table `skill_extra_item_template` */

DROP TABLE IF EXISTS `skill_extra_item_template`;

CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';

/*Table structure for table `skill_fishing_base_level` */

DROP TABLE IF EXISTS `skill_fishing_base_level`;

CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';

/*Table structure for table `skill_perfect_item_template` */

DROP TABLE IF EXISTS `skill_perfect_item_template`;

CREATE TABLE `skill_perfect_item_template` (
  `spellId` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `perfectCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create the perfect item instead',
  `perfectItemType` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'perfect item type to create instead',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Crafting Perfection System';

/*Table structure for table `skill_tiers` */

DROP TABLE IF EXISTS `skill_tiers`;

CREATE TABLE `skill_tiers` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Value1` int unsigned NOT NULL DEFAULT '0',
  `Value2` int unsigned NOT NULL DEFAULT '0',
  `Value3` int unsigned NOT NULL DEFAULT '0',
  `Value4` int unsigned NOT NULL DEFAULT '0',
  `Value5` int unsigned NOT NULL DEFAULT '0',
  `Value6` int unsigned NOT NULL DEFAULT '0',
  `Value7` int unsigned NOT NULL DEFAULT '0',
  `Value8` int unsigned NOT NULL DEFAULT '0',
  `Value9` int unsigned NOT NULL DEFAULT '0',
  `Value10` int unsigned NOT NULL DEFAULT '0',
  `Value11` int unsigned NOT NULL DEFAULT '0',
  `Value12` int unsigned NOT NULL DEFAULT '0',
  `Value13` int unsigned NOT NULL DEFAULT '0',
  `Value14` int unsigned NOT NULL DEFAULT '0',
  `Value15` int unsigned NOT NULL DEFAULT '0',
  `Value16` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `skinning_loot_template` */

DROP TABLE IF EXISTS `skinning_loot_template`;

CREATE TABLE `skinning_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `smart_scripts` */

DROP TABLE IF EXISTS `smart_scripts`;

CREATE TABLE `smart_scripts` (
  `entryorguid` bigint NOT NULL,
  `source_type` tinyint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `link` smallint unsigned NOT NULL DEFAULT '0',
  `event_type` tinyint unsigned NOT NULL DEFAULT '0',
  `event_phase_mask` tinyint unsigned NOT NULL DEFAULT '0',
  `event_chance` tinyint unsigned NOT NULL DEFAULT '100',
  `event_flags` smallint unsigned NOT NULL DEFAULT '0',
  `event_param1` int unsigned NOT NULL DEFAULT '0',
  `event_param2` int unsigned NOT NULL DEFAULT '0',
  `event_param3` int unsigned NOT NULL DEFAULT '0',
  `event_param4` int unsigned NOT NULL DEFAULT '0',
  `event_param5` int unsigned NOT NULL DEFAULT '0',
  `event_param_string` varchar(255) NOT NULL DEFAULT '',
  `action_type` tinyint unsigned NOT NULL DEFAULT '0',
  `action_param1` int unsigned NOT NULL DEFAULT '0',
  `action_param2` int unsigned NOT NULL DEFAULT '0',
  `action_param3` int unsigned NOT NULL DEFAULT '0',
  `action_param4` int unsigned NOT NULL DEFAULT '0',
  `action_param5` int unsigned NOT NULL DEFAULT '0',
  `action_param6` int unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint unsigned NOT NULL DEFAULT '0',
  `target_param1` int unsigned NOT NULL DEFAULT '0',
  `target_param2` int unsigned NOT NULL DEFAULT '0',
  `target_param3` int unsigned NOT NULL DEFAULT '0',
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` text NOT NULL COMMENT 'Event Comment',
  PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Table structure for table `spell_area` */

DROP TABLE IF EXISTS `spell_area`;

CREATE TABLE `spell_area` (
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `area` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_start` mediumint unsigned NOT NULL DEFAULT '0',
  `quest_end` mediumint unsigned NOT NULL DEFAULT '0',
  `aura_spell` mediumint NOT NULL DEFAULT '0',
  `teamId` tinyint NOT NULL DEFAULT '-1',
  `racemask` bigint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `flags` tinyint unsigned NOT NULL DEFAULT '3',
  `quest_start_status` int NOT NULL DEFAULT '64',
  `quest_end_status` int NOT NULL DEFAULT '11',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`aura_spell`,`teamId`,`racemask`,`gender`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_areatrigger` */

DROP TABLE IF EXISTS `spell_areatrigger`;

CREATE TABLE `spell_areatrigger` (
  `SpellMiscId` int unsigned NOT NULL,
  `AreaTriggerId` int unsigned NOT NULL,
  `MoveCurveId` int unsigned NOT NULL DEFAULT '0',
  `ScaleCurveId` int unsigned NOT NULL DEFAULT '0',
  `MorphCurveId` int unsigned NOT NULL DEFAULT '0',
  `FacingCurveId` int unsigned NOT NULL DEFAULT '0',
  `AnimId` int NOT NULL DEFAULT '0',
  `AnimKitId` int NOT NULL DEFAULT '0',
  `DecalPropertiesId` int unsigned NOT NULL DEFAULT '0',
  `TimeToTarget` int unsigned NOT NULL DEFAULT '0',
  `TimeToTargetScale` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellMiscId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_areatrigger_circular` */

DROP TABLE IF EXISTS `spell_areatrigger_circular`;

CREATE TABLE `spell_areatrigger_circular` (
  `SpellMiscId` int unsigned NOT NULL,
  `StartDelay` int unsigned NOT NULL DEFAULT '0',
  `CircleRadius` float NOT NULL DEFAULT '0',
  `BlendFromRadius` float NOT NULL DEFAULT '0',
  `InitialAngle` float NOT NULL DEFAULT '0',
  `ZOffset` float NOT NULL DEFAULT '0',
  `CounterClockwise` tinyint unsigned NOT NULL DEFAULT '0',
  `CanLoop` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellMiscId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `spell_areatrigger_rollpitchyaw` */

DROP TABLE IF EXISTS `spell_areatrigger_rollpitchyaw`;

CREATE TABLE `spell_areatrigger_rollpitchyaw` (
  `SpellMiscId` int unsigned NOT NULL,
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `TargetX` float NOT NULL DEFAULT '0',
  `TargetY` float NOT NULL DEFAULT '0',
  `TargetZ` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellMiscId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `spell_areatrigger_splines` */

DROP TABLE IF EXISTS `spell_areatrigger_splines`;

CREATE TABLE `spell_areatrigger_splines` (
  `SpellMiscId` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellMiscId`,`Idx`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_custom_attr` */

DROP TABLE IF EXISTS `spell_custom_attr`;

CREATE TABLE `spell_custom_attr` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'spell id',
  `attributes` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCustomAttributes',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='SpellInfo custom attributes';

/*Table structure for table `spell_dbc` */

DROP TABLE IF EXISTS `spell_dbc`;

CREATE TABLE `spell_dbc` (
  `Id` int unsigned NOT NULL,
  `Attributes` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx8` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx9` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx10` int unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` int unsigned NOT NULL DEFAULT '1',
  `DurationIndex` int unsigned NOT NULL DEFAULT '0',
  `RangeIndex` int unsigned NOT NULL DEFAULT '1',
  `SchoolMask` int unsigned NOT NULL DEFAULT '0',
  `SpellAuraOptionsId` int unsigned NOT NULL DEFAULT '0',
  `SpellCastingRequirementsId` int unsigned NOT NULL DEFAULT '0',
  `SpellCategoriesId` int unsigned NOT NULL DEFAULT '0',
  `SpellClassOptionsId` int unsigned NOT NULL DEFAULT '0',
  `SpellEquippedItemsId` int unsigned NOT NULL DEFAULT '0',
  `SpellLevelsId` int unsigned NOT NULL DEFAULT '0',
  `SpellTargetRestrictionsId` int unsigned NOT NULL DEFAULT '0',
  `SpellInterruptsId` int unsigned NOT NULL DEFAULT '0',
  `Comment` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Custom spell.dbc entries';

/*Table structure for table `spell_enchant_proc_data` */

DROP TABLE IF EXISTS `spell_enchant_proc_data`;

CREATE TABLE `spell_enchant_proc_data` (
  `EnchantID` int unsigned NOT NULL,
  `Chance` float NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `HitMask` int unsigned NOT NULL DEFAULT '0',
  `AttributesMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnchantID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';

/*Table structure for table `spell_group` */

DROP TABLE IF EXISTS `spell_group`;

CREATE TABLE `spell_group` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `spell_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

/*Table structure for table `spell_group_stack_rules` */

DROP TABLE IF EXISTS `spell_group_stack_rules`;

CREATE TABLE `spell_group_stack_rules` (
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_learn_spell` */

DROP TABLE IF EXISTS `spell_learn_spell`;

CREATE TABLE `spell_learn_spell` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `Active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

/*Table structure for table `spell_linked_spell` */

DROP TABLE IF EXISTS `spell_linked_spell`;

CREATE TABLE `spell_linked_spell` (
  `spell_trigger` mediumint NOT NULL,
  `spell_effect` mediumint NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';

/*Table structure for table `spell_loot_template` */

DROP TABLE IF EXISTS `spell_loot_template`;

CREATE TABLE `spell_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

/*Table structure for table `spell_pet_auras` */

DROP TABLE IF EXISTS `spell_pet_auras`;

CREATE TABLE `spell_pet_auras` (
  `spell` mediumint unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint unsigned NOT NULL DEFAULT '0',
  `pet` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`effectId`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_proc` */

DROP TABLE IF EXISTS `spell_proc`;

CREATE TABLE `spell_proc` (
  `SpellId` int NOT NULL DEFAULT '0',
  `SchoolMask` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask3` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `SpellTypeMask` int unsigned NOT NULL DEFAULT '0',
  `SpellPhaseMask` int unsigned NOT NULL DEFAULT '0',
  `HitMask` int unsigned NOT NULL DEFAULT '0',
  `AttributesMask` int unsigned NOT NULL DEFAULT '0',
  `DisableEffectsMask` int unsigned NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '0',
  `Cooldown` int unsigned NOT NULL DEFAULT '0',
  `Charges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_required` */

DROP TABLE IF EXISTS `spell_required`;

CREATE TABLE `spell_required` (
  `spell_id` mediumint NOT NULL DEFAULT '0',
  `req_spell` mediumint NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';

/*Table structure for table `spell_script_names` */

DROP TABLE IF EXISTS `spell_script_names`;

CREATE TABLE `spell_script_names` (
  `spell_id` int NOT NULL,
  `ScriptName` char(64) NOT NULL,
  UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_scripts` */

DROP TABLE IF EXISTS `spell_scripts`;

CREATE TABLE `spell_scripts` (
  `id` mediumint unsigned NOT NULL DEFAULT '0',
  `effIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spell_target_position` */

DROP TABLE IF EXISTS `spell_target_position`;

CREATE TABLE `spell_target_position` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `EffectIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`EffectIndex`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

/*Table structure for table `spell_threat` */

DROP TABLE IF EXISTS `spell_threat`;

CREATE TABLE `spell_threat` (
  `entry` mediumint unsigned NOT NULL,
  `flatMod` int DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Table structure for table `spell_totem_model` */

DROP TABLE IF EXISTS `spell_totem_model`;

CREATE TABLE `spell_totem_model` (
  `SpellID` int unsigned NOT NULL,
  `RaceID` tinyint unsigned NOT NULL,
  `DisplayID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellID`,`RaceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `spelleffect_dbc` */

DROP TABLE IF EXISTS `spelleffect_dbc`;

CREATE TABLE `spelleffect_dbc` (
  `Id` int unsigned NOT NULL,
  `Effect` int unsigned NOT NULL DEFAULT '0',
  `EffectValueMultiplier` float unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName` int unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude` int unsigned NOT NULL DEFAULT '0',
  `EffectBasePoints` int NOT NULL DEFAULT '0',
  `EffectBonusMultiplier` float unsigned NOT NULL DEFAULT '0',
  `EffectDamageMultiplier` float unsigned NOT NULL DEFAULT '0',
  `EffectChainTarget` int unsigned NOT NULL DEFAULT '0',
  `EffectDieSides` int NOT NULL DEFAULT '0',
  `EffectItemType` int unsigned NOT NULL DEFAULT '0',
  `EffectMechanic` int unsigned NOT NULL DEFAULT '0',
  `EffectMiscValue` int NOT NULL DEFAULT '0',
  `EffectMiscValueB` int NOT NULL DEFAULT '0',
  `EffectRadiusIndex` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndexMax` int unsigned NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel` float unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC` int unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA` int unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellId` int unsigned NOT NULL,
  `EffectIndex` int unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `terrain_swap_defaults` */

DROP TABLE IF EXISTS `terrain_swap_defaults`;

CREATE TABLE `terrain_swap_defaults` (
  `MapId` int unsigned NOT NULL,
  `TerrainSwapMap` int unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MapId`,`TerrainSwapMap`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `terrain_worldmap` */

DROP TABLE IF EXISTS `terrain_worldmap`;

CREATE TABLE `terrain_worldmap` (
  `TerrainSwapMap` int unsigned NOT NULL,
  `UiMapPhaseId` int unsigned NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TerrainSwapMap`,`UiMapPhaseId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `trainer` */

DROP TABLE IF EXISTS `trainer`;

CREATE TABLE `trainer` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '2',
  `Greeting` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `trainer_locale` */

DROP TABLE IF EXISTS `trainer_locale`;

CREATE TABLE `trainer_locale` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `Greeting_lang` text,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `trainer_spell` */

DROP TABLE IF EXISTS `trainer_spell`;

CREATE TABLE `trainer_spell` (
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  `SpellId` int unsigned NOT NULL DEFAULT '0',
  `MoneyCost` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillLine` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillRank` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility1` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility2` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility3` int unsigned NOT NULL DEFAULT '0',
  `ReqLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TrainerId`,`SpellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `transports` */

DROP TABLE IF EXISTS `transports`;

CREATE TABLE `transports` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name` text,
  `phaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `phaseid` int NOT NULL DEFAULT '0',
  `phasegroup` int NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

/*Table structure for table `trinity_string` */

DROP TABLE IF EXISTS `trinity_string`;

CREATE TABLE `trinity_string` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `updates` */

DROP TABLE IF EXISTS `updates`;

CREATE TABLE `updates` (
  `name` varchar(200) NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of all applied updates in this database.';

/*Table structure for table `updates_include` */

DROP TABLE IF EXISTS `updates_include`;

CREATE TABLE `updates_include` (
  `path` varchar(200) NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='List of directories where we want to include sql updates.';

/*Table structure for table `vehicle_accessory` */

DROP TABLE IF EXISTS `vehicle_accessory`;

CREATE TABLE `vehicle_accessory` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`guid`,`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Table structure for table `vehicle_template_accessory` */

DROP TABLE IF EXISTS `vehicle_template_accessory`;

CREATE TABLE `vehicle_template_accessory` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `accessory_entry` mediumint unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

/*Table structure for table `version` */

DROP TABLE IF EXISTS `version`;

CREATE TABLE `version` (
  `core_version` varchar(120) NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) DEFAULT NULL,
  `db_version` varchar(120) DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int DEFAULT '0',
  PRIMARY KEY (`core_version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Version Notes';

/*Table structure for table `warden_checks` */

DROP TABLE IF EXISTS `warden_checks`;

CREATE TABLE `warden_checks` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned DEFAULT NULL,
  `data` varchar(48) DEFAULT NULL,
  `str` varchar(20) DEFAULT NULL,
  `address` int unsigned DEFAULT NULL,
  `length` tinyint unsigned DEFAULT NULL,
  `result` varchar(24) DEFAULT NULL,
  `comment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=787 DEFAULT CHARSET=utf8;

/*Table structure for table `waypoint_data` */

DROP TABLE IF EXISTS `waypoint_data`;

CREATE TABLE `waypoint_data` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `move_type` int NOT NULL DEFAULT '0',
  `action` int NOT NULL DEFAULT '0',
  `action_chance` smallint NOT NULL DEFAULT '100',
  `wpguid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`point`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `waypoint_scripts` */

DROP TABLE IF EXISTS `waypoint_scripts`;

CREATE TABLE `waypoint_scripts` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` int unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `guid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `waypoints` */

DROP TABLE IF EXISTS `waypoints`;

CREATE TABLE `waypoints` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `pointid` mediumint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `point_comment` text,
  PRIMARY KEY (`entry`,`pointid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature waypoints';

/*Table structure for table `world_quest` */

DROP TABLE IF EXISTS `world_quest`;

CREATE TABLE `world_quest` (
  `id` int unsigned NOT NULL,
  `duration` int unsigned NOT NULL,
  `variable` int NOT NULL,
  `value` int NOT NULL,
  `VerifiedBuild` smallint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `world_quest_reward` */

DROP TABLE IF EXISTS `world_quest_reward`;

CREATE TABLE `world_quest_reward` (
  `id` int unsigned NOT NULL,
  `questType` mediumint unsigned NOT NULL,
  `rewardType` enum('ITEM','CURRENCY','GOLD') NOT NULL,
  `rewardId` int unsigned NOT NULL,
  `rewardCount` int DEFAULT NULL,
  `rewardContext` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`questType`,`rewardType`,`rewardId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Table structure for table `world_safe_locs` */

DROP TABLE IF EXISTS `world_safe_locs`;

CREATE TABLE `world_safe_locs` (
  `ID` int unsigned NOT NULL,
  `MapID` int unsigned DEFAULT NULL,
  `LocX` float DEFAULT NULL,
  `LocY` float DEFAULT NULL,
  `LocZ` float DEFAULT NULL,
  `Facing` float DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `zone_scripts` */

DROP TABLE IF EXISTS `zone_scripts`;

CREATE TABLE `zone_scripts` (
  `zoneId` int unsigned NOT NULL,
  `scriptname` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`zoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
