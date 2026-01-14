-- Add personal information fields to customer_master
ALTER TABLE `customer_master` 
ADD COLUMN `dob` DATE DEFAULT NULL AFTER `pan_no`,
ADD COLUMN `gender` ENUM('Male', 'Female', 'Other') DEFAULT NULL AFTER `dob`,
ADD COLUMN `identity_details` TEXT DEFAULT NULL AFTER `gender`;

-- Add account holder name to customer_bank
ALTER TABLE `customer_bank`
ADD COLUMN `account_holder_name` VARCHAR(255) DEFAULT NULL AFTER `customer_id`;
