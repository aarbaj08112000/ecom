-- Add Pricing and GST fields to products table
ALTER TABLE `products` 
ADD COLUMN `discount_percentage` DECIMAL(5,2) DEFAULT 0.00 AFTER `price`,
ADD COLUMN `is_gst_applicable` ENUM('Yes', 'No') DEFAULT 'No' AFTER `discount_percentage`,
ADD COLUMN `gst_percentage` DECIMAL(5,2) DEFAULT 0.00 AFTER `is_gst_applicable`;

-- Update existing records if necessary
UPDATE `products` SET `is_gst_applicable` = 'No', `gst_percentage` = 0.00, `discount_percentage` = 0.00;
