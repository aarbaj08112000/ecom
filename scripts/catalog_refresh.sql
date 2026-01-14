-- Catalog Refresh Script
-- Resets catalog data and inserts high-quality dummy records for new niches

SET FOREIGN_KEY_CHECKS = 0;

-- Truncate existing tables
TRUNCATE TABLE `product_attributes`;
TRUNCATE TABLE `product_images`;
TRUNCATE TABLE `products`;
TRUNCATE TABLE `categories`;
TRUNCATE TABLE `brands`;
TRUNCATE TABLE `attribute`;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. Insert Attributes
INSERT INTO `attribute` (`attribute_id`, `attribute_code`, `attribute_name`, `status`) VALUES
(1, 'ATTR-MAT', 'Material', 'Active'),
(2, 'ATTR-COL', 'Color', 'Active'),
(3, 'ATTR-SIZ', 'Size', 'Active'),
(4, 'ATTR-WGT', 'Weight', 'Active'),
(5, 'ATTR-STY', 'Style', 'Active');

-- 2. Insert Categories
INSERT INTO `categories` (`category_id`, `category_name`, `status`) VALUES
(1, 'Resin Art', 'Active'),
(2, 'Crochet & Knits', 'Active'),
(3, 'Custom Gifts', 'Active'),
(4, 'Home Décor', 'Active'),
(5, 'Handmade Jewellery', 'Active'),
(6, 'Fine Art', 'Active'),
(7, 'DIY Craft Kits', 'Active');

-- 3. Insert Brands
INSERT INTO `brands` (`brand_id`, `brand_name`, `status`) VALUES
(1, 'Resinify', 'Active'),
(2, 'Stitch & Soul', 'Active'),
(3, 'Giftify', 'Active'),
(4, 'DecorVibe', 'Active'),
(5, 'Craftopia', 'Active');

-- 4. Insert Products (5 per niche/category roughly)
-- Resin Art (Cat 1)
INSERT INTO `products` (`id`, `name`, `detail`, `price`, `discount_percentage`, `is_gst_applicable`, `gst_percentage`, `stock_quantity`, `category_id`, `brand_id`, `status`) VALUES
(1, 'Ocean Wave Resin Coasters', 'Set of 4 handmade resin coasters with realistic ocean wave effects.', 1200.00, 10.00, 'Yes', 18.00, 50, 1, 1, 'Active'),
(2, 'Pressed Flower Resin Tray', 'Elegant serving tray featuring real preserved flowers embedded in crystal clear resin.', 2500.00, 5.00, 'Yes', 18.00, 20, 1, 1, 'Active'),
(3, 'Glow-in-the-Dark Resin Pyramid', 'Stunning decorative pyramid with cosmic glow effects.', 1800.00, 0.00, 'Yes', 18.00, 15, 1, 1, 'Active'),
(4, 'Resin Wall Clock - Marble Effect', '12-inch wall clock with luxury gold and white marble resin finish.', 3500.00, 15.00, 'Yes', 18.00, 10, 1, 1, 'Active'),
(5, 'Alphabet Resin Keychains', 'Personalized resin keychains with gold flakes and dried petals.', 250.00, 0.00, 'No', 0.00, 100, 1, 1, 'Active');

-- Crochet & Knits (Cat 2)
INSERT INTO `products` (`id`, `name`, `detail`, `price`, `discount_percentage`, `is_gst_applicable`, `gst_percentage`, `stock_quantity`, `category_id`, `brand_id`, `status`) VALUES
(6, 'Hand-Knitted Boho Cardigan', 'Soft cotton oversized cardigan, perfect for spring layering.', 2800.00, 10.00, 'No', 0.00, 12, 2, 2, 'Active'),
(7, 'Amigurumi Crochet Bunny', 'Cute handmade stuffed toy made from high-quality yarn.', 850.00, 0.00, 'No', 0.00, 30, 2, 2, 'Active'),
(8, 'Macrame Wall Hanging', 'Intricate leaf design macrame wall art for bohemian home decor.', 1500.00, 5.00, 'No', 0.00, 25, 2, 2, 'Active'),
(9, 'Crochet Bucket Hat - Pastel Mix', 'Trendy handmade bucket hat in multiple pastel shades.', 650.00, 0.00, 'No', 0.00, 40, 2, 2, 'Active'),
(10, 'Knitted Cable Throw Blanket', 'Luxurious and warm cable-stitched throw for your couch.', 4500.00, 20.00, 'No', 0.00, 8, 2, 2, 'Active');

-- Custom Gifts (Cat 3)
INSERT INTO `products` (`id`, `name`, `detail`, `price`, `discount_percentage`, `is_gst_applicable`, `gst_percentage`, `stock_quantity`, `category_id`, `brand_id`, `status`) VALUES
(11, 'Personalized Photo Explosion Box', 'Multi-layered gift box that "explodes" with photos and messages.', 1200.00, 0.00, 'Yes', 12.00, 100, 3, 3, 'Active'),
(12, 'Engraved Wooden Music Box', 'Vintage style music box with a custom message engraved on top.', 950.00, 5.00, 'Yes', 12.00, 45, 3, 3, 'Active'),
(13, 'Custom Vector Portrait Frame', 'A-4 size digital vector art of your photo, framed.', 1800.00, 0.00, 'Yes', 12.00, 50, 3, 3, 'Active'),
(14, 'Name-Embedded LED Lamp', 'Acrylic night lamp with your name glowing in warm white light.', 1500.00, 10.00, 'Yes', 12.00, 30, 3, 3, 'Active'),
(15, 'Hand-Painted Anniversary Plate', 'Ceramic plate with custom illustration of couples.', 2200.00, 0.00, 'Yes', 12.00, 15, 3, 3, 'Active');

-- Home Décor (Cat 4)
INSERT INTO `products` (`id`, `name`, `detail`, `price`, `discount_percentage`, `is_gst_applicable`, `gst_percentage`, `stock_quantity`, `category_id`, `brand_id`, `status`) VALUES
(16, 'Abstract Canvas Wall Art', 'Large hand-painted abstract canvas with textured gold leaf.', 5500.00, 15.00, 'Yes', 12.00, 5, 4, 4, 'Active'),
(17, 'Scented Soy Wax Candle Set', 'Set of 3 premium candles: Lavender, Sandalwood, and Vanilla.', 1200.00, 0.00, 'Yes', 12.00, 60, 4, 4, 'Active'),
(18, 'Hand-Carved Stone Buddha Head', 'Serene decorative piece for your living room or garden.', 3200.00, 10.00, 'Yes', 12.00, 12, 4, 4, 'Active'),
(19, 'Boho Ceramic Vase Trio', 'Minimalist matte-finish ceramic vases in earthy tones.', 2400.00, 0.00, 'Yes', 12.00, 18, 4, 4, 'Active'),
(20, 'Intricate Copper Wall Mandala', 'Metal wall art with detailed traditional sunburst design.', 4800.00, 5.00, 'Yes', 12.00, 7, 4, 4, 'Active');

-- Handmade Jewellery (Cat 5)
INSERT INTO `products` (`id`, `name`, `detail`, `price`, `discount_percentage`, `is_gst_applicable`, `gst_percentage`, `stock_quantity`, `category_id`, `brand_id`, `status`) VALUES
(21, 'Raw Crystal Pendant Necklace', 'Natural amethyst crystal wrapped in silver wire.', 850.00, 0.00, 'Yes', 3.00, 35, 5, 5, 'Active'),
(22, 'Terracotta Jhumka Set', 'Traditional hand-painted clay earrings with intricate patterns.', 450.00, 0.00, 'No', 0.00, 50, 5, 5, 'Active'),
(23, 'Silk Thread Bangle Set', 'Pack of 12 vibrant bangles wrapped in silk threads with stone work.', 1100.00, 10.00, 'No', 0.00, 25, 5, 5, 'Active'),
(24, 'Beaded Boho Anklets', 'Set of 2 colorful seed-bead anklets for summer vibes.', 350.00, 0.00, 'No', 0.00, 60, 5, 5, 'Active'),
(25, 'Handmade Polymer Clay Studs', 'Modern geometric design earrings made from lightweight clay.', 550.00, 5.00, 'No', 0.00, 40, 5, 5, 'Active');

-- 5. Insert Product Images (Placeholders for now)
INSERT INTO `product_images` (`product_id`, `image_path`, `is_cover`, `status`) VALUES
(1, 'ocean_coasters_1.jpg', '1', 'Active'),
(2, 'flower_tray_1.jpg', '1', 'Active'),
(3, 'pyramid_1.jpg', '1', 'Active'),
(4, 'clock_1.jpg', '1', 'Active'),
(5, 'keychain_1.jpg', '1', 'Active'),
(6, 'cardigan_1.jpg', '1', 'Active'),
(7, 'bunny_1.jpg', '1', 'Active'),
(8, 'macrame_1.jpg', '1', 'Active'),
(9, 'bucket_hat_1.jpg', '1', 'Active'),
(10, 'throw_1.jpg', '1', 'Active'),
(11, 'explosion_box_1.jpg', '1', 'Active'),
(12, 'music_box_1.jpg', '1', 'Active'),
(13, 'portrait_1.jpg', '1', 'Active'),
(14, 'led_lamp_1.jpg', '1', 'Active'),
(15, 'painted_plate_1.jpg', '1', 'Active'),
(16, 'canvas_art_1.jpg', '1', 'Active'),
(17, 'candle_set_1.jpg', '1', 'Active'),
(18, 'buddha_head_1.jpg', '1', 'Active'),
(19, 'vases_1.jpg', '1', 'Active'),
(20, 'mandala_1.jpg', '1', 'Active'),
(21, 'pendant_1.jpg', '1', 'Active'),
(22, 'terracotta_1.jpg', '1', 'Active'),
(23, 'bangles_1.jpg', '1', 'Active'),
(24, 'anklets_1.jpg', '1', 'Active'),
(25, 'clay_studs_1.jpg', '1', 'Active');
