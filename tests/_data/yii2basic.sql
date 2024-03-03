-- Set SQL mode and time zone
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- Create database yii2basic if it doesn't exist
CREATE DATABASE IF NOT EXISTS yii2basic CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Use the yii2basic database
USE yii2basic;

-- Create the user table
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Insert initial record into user table
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'KbQpiRJ7XbYkBLdBi4ZdtIWjuzYMkA6y', '$2y$13$k9i6FtvbpCtn/vx22HVg4OWJeSAVGHGlDb7ssoQN/WigkqYkvXoZy', NULL, 'admin@mail.com', 10, 1709286780, 1709286780);

-- Grant privileges to user 'dev' on database 'yii2basic'
GRANT INSERT, UPDATE, DELETE ON yii2basic.* TO 'dev'@'localhost' IDENTIFIED BY 'password';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;