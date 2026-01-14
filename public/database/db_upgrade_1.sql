-- Database Upgrade Script #1
-- Purpose: Create contact_us_master table for Contact Us form submissions
-- Date: 2026-01-14

CREATE TABLE IF NOT EXISTS `contact_us_master` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` enum('New','Read','Replied') NOT NULL DEFAULT 'New',
  `added_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contact_id`),
  KEY `idx_status` (`status`),
  KEY `idx_added_date` (`added_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
