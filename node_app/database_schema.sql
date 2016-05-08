CREATE DATABASE IF NOT EXISTS `user_health_information`;
USE `user_health_information`;

--
-- Table structure for users --
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` INT NOT NULL,
  `name` VARCHAR(256) NOT NULL,
  PRIMARY KEY(`id`),
  INDEX `name_idx` (`name`)
) ENGINE=InnoDB;


--
-- Table structure for table health_stats --
--

DROP TABLE IF EXISTS `health_stats`;
CREATE TABLE `health_stats` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `step_count` INT NOT NULL,
  `flights_climbed` INT NOT NULL,
  `distance` FLOAT NOT NULL,
  `time` DATETIME NOT NULL,
  PRIMARY KEY(`id`),
  FOREIGN KEY(`user_id`) REFERENCES user(`id`),
  INDEX `time_idx` (`time`)
) ENGINE=InnoDB;
