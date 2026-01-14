-- Update customer_master status column to include more states
ALTER TABLE `customer_master` 
MODIFY COLUMN `status` ENUM('Approved', 'Blocked', 'Rejected', 'Active', 'Inactive') DEFAULT 'Active';

-- Optional: Map existing 'Active' customers to 'Approved'
UPDATE `customer_master` SET `status` = 'Approved' WHERE `status` = 'Active';
