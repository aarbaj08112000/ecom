-- Order & Payment Schema Enhancement SQL

-- 1. Enhance 'orders' table
ALTER TABLE `orders` 
ADD COLUMN `shipping_address_json` TEXT AFTER `user_id`,
ADD COLUMN `billing_address_json` TEXT AFTER `shipping_address_json`,
ADD COLUMN `coupon_id` INT DEFAULT NULL AFTER `billing_address_json`,
ADD COLUMN `discount_amount` DECIMAL(10,2) DEFAULT 0.00 AFTER `total_amount`,
ADD COLUMN `shipping_charge` DECIMAL(10,2) DEFAULT 0.00 AFTER `discount_amount`,
ADD COLUMN `tax_amount` DECIMAL(10,2) DEFAULT 0.00 AFTER `shipping_charge`,
ADD COLUMN `net_amount` DECIMAL(10,2) DEFAULT 0.00 AFTER `tax_amount`,
ADD COLUMN `payment_status` ENUM('Unpaid', 'Paid', 'Partially Paid', 'Partially Refunded', 'Refunded', 'Failed') DEFAULT 'Unpaid' AFTER `order_status`,
ADD COLUMN `payment_method` VARCHAR(50) DEFAULT NULL AFTER `payment_status`;

-- 2. Enhance 'order_items' table
ALTER TABLE `order_items`
ADD COLUMN `product_name_at_order` VARCHAR(255) AFTER `product_id`,
ADD COLUMN `sku_at_order` VARCHAR(100) AFTER `product_name_at_order`,
ADD COLUMN `discount_amount` DECIMAL(10,2) DEFAULT 0.00 AFTER `price`,
ADD COLUMN `tax_amount` DECIMAL(10,2) DEFAULT 0.00 AFTER `discount_amount`,
ADD COLUMN `final_price` DECIMAL(10,2) DEFAULT 0.00 AFTER `tax_amount`;

-- 3. Enhance 'payments' table
ALTER TABLE `payments`
ADD COLUMN `payment_gateway` VARCHAR(50) DEFAULT NULL AFTER `payment_method`,
ADD COLUMN `gateway_order_id` VARCHAR(255) DEFAULT NULL AFTER `payment_gateway`,
ADD COLUMN `gateway_transaction_id` VARCHAR(255) DEFAULT NULL AFTER `gateway_order_id`,
ADD COLUMN `gateway_response` TEXT DEFAULT NULL AFTER `gateway_transaction_id`,
ADD COLUMN `error_message` TEXT DEFAULT NULL AFTER `gateway_response`,
ADD COLUMN `paid_date` DATETIME DEFAULT NULL AFTER `error_message`;

-- 4. Create 'order_history' table for Audit Trail
CREATE TABLE IF NOT EXISTS `order_history` (
  `history_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `status_from` VARCHAR(50) DEFAULT NULL,
  `status_to` VARCHAR(50) NOT NULL,
  `remarks` TEXT DEFAULT NULL,
  `added_by` INT DEFAULT NULL,
  `added_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  INDEX (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 5. Create 'refunds' table
CREATE TABLE IF NOT EXISTS `refunds` (
  `refund_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `payment_id` INT NOT NULL,
  `refund_amount` DECIMAL(10,2) NOT NULL,
  `refund_status` ENUM('Requested', 'Processing', 'Completed', 'Failed') DEFAULT 'Requested',
  `gateway_refund_id` VARCHAR(255) DEFAULT NULL,
  `reason` TEXT DEFAULT NULL,
  `added_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`refund_id`),
  INDEX (`order_id`),
  INDEX (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
