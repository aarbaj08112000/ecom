-- Order Seeding Script
-- Populates orders, order_items, and payments for testing

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `order_history`;
TRUNCATE TABLE `refunds`;
TRUNCATE TABLE `payments`;
TRUNCATE TABLE `order_items`;
TRUNCATE TABLE `orders`;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Insert Orders
-- Order 1: Delivered, Paid via Credit Card
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_json`, `total_amount`, `discount_amount`, `shipping_charge`, `tax_amount`, `net_amount`, `order_status`, `payment_status`, `payment_method`) VALUES
(1, 1, '{"name":"Aarav Patel","address":"123 Silk St","city":"Mumbai","state":"Maharashtra","zip":"400001"}', 1200.00, 120.00, 50.00, 194.40, 1324.40, 'delivered', 'Paid', 'Credit Card');

-- Order 2: Shipped, Paid via PayPal
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_json`, `total_amount`, `discount_amount`, `shipping_charge`, `tax_amount`, `net_amount`, `order_status`, `payment_status`, `payment_method`) VALUES
(2, 2, '{"name":"Riya Sharma","address":"456 Knit Rd","city":"Pune","state":"Maharashtra","zip":"411001"}', 2500.00, 125.00, 0.00, 427.50, 2802.50, 'shipped', 'Paid', 'PayPal');

-- Order 3: Processing, Unpaid (COD)
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_json`, `total_amount`, `discount_amount`, `shipping_charge`, `tax_amount`, `net_amount`, `order_status`, `payment_status`, `payment_method`) VALUES
(3, 4, '{"name":"Sneha Desai","address":"789 Resin Ave","city":"Surat","state":"Gujarat","zip":"395001"}', 1800.00, 0.00, 100.00, 324.00, 2224.00, 'processing', 'Unpaid', 'COD');

-- Order 4: Pending, Payment Failed
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_json`, `total_amount`, `discount_amount`, `shipping_charge`, `tax_amount`, `net_amount`, `order_status`, `payment_status`, `payment_method`) VALUES
(4, 5, '{"name":"Nikhil Singh","address":"321 Craft Blvd","city":"Jaipur","state":"Rajasthan","zip":"302001"}', 850.00, 0.00, 50.00, 0.00, 900.00, 'pending', 'Failed', 'Razorpay');

-- Order 5: Cancelled, Refunded
INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_json`, `total_amount`, `discount_amount`, `shipping_charge`, `tax_amount`, `net_amount`, `order_status`, `payment_status`, `payment_method`) VALUES
(5, 7, '{"name":"Rahul Yadav","address":"222 Jewel Ln","city":"Indore","state":"MP","zip":"452001"}', 1100.00, 110.00, 0.00, 0.00, 990.00, 'cancelled', 'Refunded', 'Credit Card');

-- 2. Insert Order Items
INSERT INTO `order_items` (`order_id`, `product_id`, `product_name_at_order`, `quantity`, `price`, `discount_amount`, `tax_amount`, `final_price`) VALUES
(1, 1, 'Ocean Wave Resin Coasters', 1, 1200.00, 120.00, 194.40, 1274.40),
(2, 2, 'Pressed Flower Resin Tray', 1, 2500.00, 125.00, 427.50, 2802.50),
(3, 3, 'Glow-in-the-Dark Resin Pyramid', 1, 1800.00, 0.00, 324.00, 2124.00),
(4, 7, 'Amigurumi Crochet Bunny', 1, 850.00, 0.00, 0.00, 850.00),
(5, 23, 'Silk Thread Bangle Set', 1, 1100.00, 110.00, 0.00, 990.00);

-- 3. Insert Payments
INSERT INTO `payments` (`order_id`, `payment_method`, `amount`, `payment_status`, `transaction_id`, `payment_gateway`, `gateway_transaction_id`, `paid_date`) VALUES
(1, 'credit_card', 1324.40, 'completed', 'TXN_RD_998877', 'Stripe', 'st_9988776655', NOW()),
(2, 'paypal', 2802.50, 'completed', 'PAY-PP-554433', 'PayPal', 'pp_5544332211', NOW()),
(3, 'cash_on_delivery', 2224.00, 'pending', NULL, NULL, NULL, NULL),
(4, 'credit_card', 900.00, 'failed', 'TXN_FL_111222', 'Razorpay', 'rzp_111222333', NULL),
(5, 'credit_card', 990.00, 'completed', 'TXN_RF_444555', 'Stripe', 'st_444555666', NOW());

-- 4. Order History
INSERT INTO `order_history` (`order_id`, `status_from`, `status_to`, `remarks`) VALUES
(1, 'pending', 'delivered', 'Order completed successfully'),
(2, 'pending', 'shipped', 'Package handed over to carrier'),
(3, 'pending', 'processing', 'Order under review'),
(5, 'pending', 'cancelled', 'Customer requested cancellation');

-- 5. Refunds
INSERT INTO `refunds` (`order_id`, `payment_id`, `refund_amount`, `refund_status`, `reason`) VALUES
(5, 5, 990.00, 'Completed', 'Order Cancelled');
