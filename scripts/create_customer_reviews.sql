-- Create customer_reviews table
CREATE TABLE IF NOT EXISTS `customer_reviews` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `customer_id` INT(11) NOT NULL,
    `reviewer_type` ENUM('admin', 'staff', 'system') NOT NULL DEFAULT 'admin',
    `rating` TINYINT(1) NOT NULL CHECK (`rating` BETWEEN 1 AND 5),
    `comment` TEXT NOT NULL,
    `status` ENUM('Active', 'Inactive') NOT NULL DEFAULT 'Active',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_delete` ENUM('0', '1') NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    INDEX `idx_customer` (`customer_id`),
    CONSTRAINT `fk_review_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer_master` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert dummy data for customer reviews
-- Assuming customer IDs 1, 2, 3 exist
INSERT INTO `customer_reviews` (`customer_id`, `reviewer_type`, `rating`, `comment`, `status`) VALUES
(1, 'admin', 5, 'Excellent buyer, quick payment and great communication.', 'Active'),
(1, 'staff', 4, 'Very polite and always provides clear requirements.', 'Active'),
(1, 'system', 5, 'Automatic high rating based on 10 consecutive successful orders.', 'Active'),
(2, 'admin', 3, 'Average buyer, sometimes slow to respond to queries.', 'Active'),
(2, 'staff', 2, 'Multiple payment delays reported by accountancy.', 'Active'),
(2, 'admin', 4, 'Condition improved, recent orders were smoother.', 'Active'),
(3, 'admin', 1, 'Frequent cancellations. Caution advised for high-value orders.', 'Active'),
(3, 'staff', 2, 'Difficult to reach on mobile for delivery confirmations.', 'Active');
