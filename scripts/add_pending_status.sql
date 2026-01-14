-- Update customer_master status column to include 'Pending'
ALTER TABLE `customer_master` 
MODIFY COLUMN `status` ENUM('Approved', 'Rejected', 'Pending', 'Blocked', 'Active', 'Inactive') DEFAULT 'Pending';

-- Optional: If there are any nulls or weird values, default them to Pending
UPDATE `customer_master` SET `status` = 'Pending' WHERE `status` IS NULL OR `status` NOT IN ('Approved', 'Rejected', 'Pending', 'Blocked', 'Active', 'Inactive');
