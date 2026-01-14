-- Create customer_address table
CREATE TABLE IF NOT EXISTS `customer_address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `address` text,
  `city` varchar(100),
  `state` varchar(100),
  `pincode` varchar(20),
  `address_type` enum('Billing','Shipping') DEFAULT 'Shipping',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`address_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer_master`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create customer_bank table
CREATE TABLE IF NOT EXISTS `customer_bank` (
  `bank_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `bank_name` varchar(255),
  `account_no` varchar(50),
  `ifsc_code` varchar(20),
  `branch_name` varchar(255),
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`bank_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer_master`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert dummy data for customer 1 (Aarav Patel)
INSERT INTO `customer_address` (`customer_id`, `address`, `city`, `state`, `pincode`, `address_type`, `status`) VALUES
(1, 'A-101, Shanti Nagar, Near Jain Temple', 'Ahmedabad', 'Gujarat', '380001', 'Billing', 'Active'),
(1, 'Plot 25, Gandhi Marg, Behind Bus Depot', 'Ahmedabad', 'Gujarat', '380002', 'Shipping', 'Active');

INSERT INTO `customer_bank` (`customer_id`, `bank_name`, `account_no`, `ifsc_code`, `branch_name`, `status`) VALUES
(1, 'State Bank of India', '123456789012', 'SBIN0000456', 'Ellis Bridge', 'Active'),
(1, 'HDFC Bank', '987654321098', 'HDFC0001234', 'Aundh', 'Inactive');
