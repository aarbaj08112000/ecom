-- Dummy Address Records
INSERT INTO `customer_address` (`customer_id`, `address`, `city`, `state`, `pincode`, `address_type`, `status`) VALUES
(1, 'A-101, Shanti Nagar, Near Jain Temple', 'Ahmedabad', 'Gujarat', '380001', 'Billing', 'Active'),
(1, 'Plot 25, Gandhi Marg, Behind Bus Depot', 'Ahmedabad', 'Gujarat', '380002', 'Shipping', 'Active'),
(2, 'Flat 402, Crystal Heights, MG Road', 'Pune', 'Maharashtra', '411001', 'Billing', 'Active'),
(2, 'Warehouse 7, Industrial Area Phase 2', 'Pune', 'Maharashtra', '411026', 'Shipping', 'Active'),
(3, 'Sector 15, Vashi, Navi Mumbai', 'Mumbai', 'Maharashtra', '400703', 'Billing', 'Active'),
(4, 'Baner Road, Near Balewadi High Street', 'Pune', 'Maharashtra', '411045', 'Shipping', 'Active'),
(5, 'Indira Nagar, Near Metro Station', 'Bangalore', 'Karnataka', '560038', 'Billing', 'Active');

-- Dummy Bank Records
INSERT INTO `customer_bank` (`customer_id`, `bank_name`, `account_no`, `ifsc_code`, `branch_name`, `status`) VALUES
(1, 'State Bank of India', '123456789012', 'SBIN0000456', 'Ellis Bridge', 'Active'),
(1, 'HDFC Bank', '987654321098', 'HDFC0001234', 'Aundh', 'Inactive'),
(2, 'ICICI Bank', '555566667777', 'ICIC0000111', 'Kothrud', 'Active'),
(3, 'Axis Bank', '112233445566', 'UTIB0000123', 'Vashi', 'Active'),
(4, 'Kotak Mahindra Bank', '998877665544', 'KKBK0000456', 'Baner', 'Active'),
(5, 'Canara Bank', '776655443322', 'CNRB0000789', 'Indira Nagar', 'Active');
