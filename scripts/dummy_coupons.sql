-- Dummy data for coupons table
INSERT INTO `coupons` (`code`, `discount`, `discount_type`, `min_order_value`, `expires_at`, `coupons_status`, `added_date`, `added_by`, `status`, `is_delete`) VALUES
('WELCOME10', 10.00, 'Percentage', 0.00, '2026-12-31', 'Active', NOW(), 1, 'Active', '0'),
('SAVE500', 500.00, 'Fixed', 2000.00, '2026-06-30', 'Active', NOW(), 1, 'Active', '0'),
('FESTIVE20', 20.00, 'Percentage', 1000.00, '2026-01-20', 'Active', NOW(), 1, 'Active', '0'),
('FREESHIP', 100.00, 'Fixed', 500.00, '2026-03-15', 'Active', NOW(), 1, 'Active', '0'),
('EXPIRED5', 5.00, 'Percentage', 0.00, '2025-12-31', 'Expired', '2025-01-01 10:00:00', 1, 'Inactive', '0'),
('FLASH30', 30.00, 'Percentage', 1500.00, '2026-02-01', 'Active', NOW(), 1, 'Active', '0'),
('NEWUSER', 200.00, 'Fixed', 1000.00, '2026-12-31', 'Active', NOW(), 1, 'Active', '0'),
('WINTER25', 25.00, 'Percentage', 800.00, '2026-02-28', 'Active', NOW(), 1, 'Active', '0'),
('OFFER15', 15.00, 'Percentage', 500.00, '2026-05-10', 'Active', NOW(), 1, 'Active', '0'),
('BULK1000', 1000.00, 'Fixed', 5000.00, '2026-08-15', 'Active', NOW(), 1, 'Active', '0');
