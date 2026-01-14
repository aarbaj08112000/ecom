CREATE TABLE IF NOT EXISTS `traffic_logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ip_address` VARCHAR(45) DEFAULT NULL,
  `user_agent` TEXT DEFAULT NULL,
  `request_uri` VARCHAR(255) DEFAULT NULL,
  `referrer` TEXT DEFAULT NULL,
  `device_type` ENUM('Mobile', 'Desktop', 'Tablet') DEFAULT 'Desktop',
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `idx_timestamp` (`timestamp`),
  INDEX `idx_request_uri` (`request_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
