-- 1. DELETE EXISTING DATA
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `product_images`;
TRUNCATE TABLE `product_attributes`;
TRUNCATE TABLE `products`;
TRUNCATE TABLE `categories`;
TRUNCATE TABLE `brands`;
TRUNCATE TABLE `attribute`;
SET FOREIGN_KEY_CHECKS = 1;

-- 2. INSERT CATEGORIES
INSERT INTO `categories` (`category_id`, `category_name`, `status`) VALUES
(1, 'Resin Art', 'Active'),
(2, 'Crochet', 'Active'),
(3, 'Custom Gifts', 'Active'),
(4, 'Home Décor', 'Active'),
(5, 'Jewellery', 'Active');

-- 3. INSERT BRANDS
INSERT INTO `brands` (`brand_id`, `brand_name`, `status`) VALUES
(1, 'Resinify', 'Active'),
(2, 'Stitch & Soul', 'Active'),
(3, 'Giftify', 'Active'),
(4, 'DecorVibe', 'Active'),
(5, 'Craftopia', 'Active');

-- 4. INSERT ATTRIBUTES
INSERT INTO `attribute` (`attribute_id`, `attribute_code`, `attribute_name`, `status`) VALUES
(1, 'ATTR-MAT', 'Material', 'Active'),
(2, 'ATTR-COL', 'Color', 'Active'),
(3, 'ATTR-SIZ', 'Size', 'Active'),
(4, 'ATTR-WGT', 'Weight', 'Active'),
(5, 'ATTR-STY', 'Style', 'Active');

-- 5. INSERT PRODUCTS
INSERT INTO `products` (`id`, `name`, `detail`, `price`, `category_id`, `brand_id`, `stock_quantity`, `status`) VALUES
(1, 'Ocean Resin Coaster', 'Handcrafted ocean-themed resin coaster with real sand.', 120.00, 1, 1, 100, 'Active'),
(2, 'Crochet Dino Toy', 'Cute green amigurumi crochet dinosaur toy.', 45.00, 2, 2, 100, 'Active'),
(3, 'Personalized Wood Frame', 'Custom laser-engraved wooden photo frame.', 85.00, 3, 3, 100, 'Active'),
(4, 'Macrame Wall Hanging', 'Bohemian style cotton rope wall hanging.', 150.00, 4, 4, 100, 'Active'),
(5, 'Crystal Amethyst Bracelet', 'Elegant silver bracelet with amethyst beads.', 60.00, 5, 5, 100, 'Active');

-- 6. INSERT PRODUCT ATTRIBUTES
INSERT INTO `product_attributes` (`product_id`, `attribute_id`, `attribute_value`, `status`) VALUES
(1, 1, 'Resin', 'Active'),
(1, 2, 'Ocean Blue', 'Active'),
(2, 1, 'Cotton Yarn', 'Active'),
(2, 3, 'Small', 'Active'),
(3, 1, 'Oak Wood', 'Active'),
(4, 1, 'Cotton Rope', 'Active'),
(5, 5, 'Minimalist', 'Active');

-- 7. INSERT PRODUCT IMAGES
INSERT INTO `product_images` (`product_id`, `image_path`, `is_cover`, `is_delete`) VALUES
(1, 'public/uploads/products/1/cover.png', '1', '0'),
(2, 'public/uploads/products/2/cover.png', '1', '0'),
(3, 'public/uploads/products/3/cover.png', '1', '0'),
(4, 'public/uploads/products/4/cover.png', '1', '0'),
(5, 'public/uploads/products/5/cover.png', '1', '0');
