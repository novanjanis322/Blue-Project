-- Insert into branch_details (12 records)
INSERT INTO branch_details 
(branch_code, branch_name, region_id, operation_start_date, is_active, max_capacity, last_renovation_date)
VALUES
('BR001', 'Jakarta Central Store', 1, '2018-03-15', TRUE, 500, '2023-06-20'),
('BR002', 'Jakarta North Branch', 1, '2019-07-22', TRUE, 350, '2023-11-15'),
('BR003', 'Bandung Main Store', 2, '2017-05-10', TRUE, 450, '2024-01-10'),
('BR004', 'Bandung West Branch', 2, '2020-09-18', TRUE, 300, '2024-03-05'),
('BR005', 'Surabaya Central', 3, '2016-11-25', TRUE, 600, '2023-08-30'),
('BR006', 'Surabaya East Branch', 3, '2021-02-14', TRUE, 400, '2024-02-20'),
('BR007', 'Medan Store', 4, '2019-04-30', TRUE, 380, '2023-09-12'),
('BR008', 'Yogyakarta Branch', 5, '2018-08-05', TRUE, 320, '2023-12-01'),
('BR009', 'Semarang Central', 6, '2017-12-20', TRUE, 420, '2024-04-15'),
('BR010', 'Denpasar Store', 7, '2020-06-10', FALSE, 350, '2023-07-25'),
('BR011', 'Makassar Branch', 8, '2019-10-15', TRUE, 400, '2024-01-30'),
('BR012', 'Palembang Store', 9, '2021-03-25', TRUE, 330, '2024-05-10');

-- Insert into staff_records (15 records)
INSERT INTO staff_records
(staff_id, branch_code, join_date, role_code, base_salary, supervisor_id, resignation_date, performance_score)
VALUES
('STF001', 'BR001', '2018-04-01', 'MGR', 15000000.00, NULL, NULL, 4.50),
('STF002', 'BR001', '2019-06-15', 'CSH', 5500000.00, 'STF001', NULL, 4.20),
('STF003', 'BR001', '2020-08-20', 'CSH', 5200000.00, 'STF001', NULL, 3.80),
('STF004', 'BR002', '2019-08-01', 'MGR', 14500000.00, NULL, NULL, 4.30),
('STF005', 'BR002', '2021-01-10', 'CSH', 5000000.00, 'STF004', NULL, 4.00),
('STF006', 'BR003', '2017-06-01', 'MGR', 16000000.00, NULL, NULL, 4.70),
('STF007', 'BR003', '2022-03-15', 'CSH', 4800000.00, 'STF006', NULL, 3.50),
('STF008', 'BR004', '2020-10-01', 'SPV', 9000000.00, NULL, NULL, 4.10),
('STF009', 'BR005', '2017-01-15', 'MGR', 17000000.00, NULL, NULL, 4.80),
('STF010', 'BR005', '2023-02-20', 'CSH', 4500000.00, 'STF009', '2024-06-30', 3.20),
('STF011', 'BR006', '2021-03-01', 'SPV', 8500000.00, NULL, NULL, 3.90),
('STF012', 'BR007', '2019-05-15', 'MGR', 15500000.00, NULL, NULL, 4.40),
('STF013', 'BR008', '2018-09-01', 'SPV', 9500000.00, NULL, NULL, 4.25),
('STF014', 'BR009', '2018-01-10', 'MGR', 16500000.00, NULL, NULL, 4.60),
('STF015', 'BR011', '2019-11-01', 'CSH', 5300000.00, NULL, NULL, 3.95);

-- Insert into product_hierarchy (20 products)
INSERT INTO product_hierarchy
(product_code, product_name, category_l1, category_l2, category_l3, unit_cost, unit_price, supplier_id, minimum_stock, is_perishable)
VALUES
('PRD001', 'Indomie Goreng Original', 'Food', 'Instant Food', 'Noodles', 2500.00, 3500.00, 'SUP001', 200, FALSE),
('PRD002', 'Indomie Soto', 'Food', 'Instant Food', 'Noodles', 2500.00, 3500.00, 'SUP001', 150, FALSE),
('PRD003', 'Ultra Milk 1L', 'Beverages', 'Dairy', 'Milk', 18000.00, 24000.00, 'SUP002', 100, TRUE),
('PRD004', 'Aqua 600ml', 'Beverages', 'Water', 'Mineral Water', 2800.00, 4000.00, 'SUP003', 300, FALSE),
('PRD005', 'Chitato 68g', 'Snacks', 'Chips', 'Potato Chips', 8500.00, 12000.00, 'SUP004', 150, FALSE),
('PRD006', 'Oreo 133g', 'Snacks', 'Biscuits', 'Cream Biscuits', 6500.00, 9000.00, 'SUP005', 120, FALSE),
('PRD007', 'Lifebuoy Soap 75g', 'Personal Care', 'Bath', 'Soap', 3200.00, 5000.00, 'SUP006', 200, FALSE),
('PRD008', 'Pepsodent 190g', 'Personal Care', 'Oral Care', 'Toothpaste', 12000.00, 17000.00, 'SUP006', 100, FALSE),
('PRD009', 'Rinso 1kg', 'Household', 'Laundry', 'Detergent', 18000.00, 25000.00, 'SUP007', 80, FALSE),
('PRD010', 'Sunlight 800ml', 'Household', 'Kitchen', 'Dish Soap', 11000.00, 15000.00, 'SUP007', 90, FALSE),
('PRD011', 'Bread Talk Chocolate', 'Food', 'Bakery', 'Bread', 15000.00, 22000.00, 'SUP008', 50, TRUE),
('PRD012', 'Fresh Banana 1kg', 'Food', 'Fruits', 'Local Fruits', 12000.00, 18000.00, 'SUP009', 80, TRUE),
('PRD013', 'Chicken Breast 1kg', 'Food', 'Meat', 'Poultry', 35000.00, 48000.00, 'SUP010', 60, TRUE),
('PRD014', 'Teh Botol Sosro 350ml', 'Beverages', 'Tea', 'Ready to Drink', 3500.00, 5000.00, 'SUP011', 200, FALSE),
('PRD015', 'Pocari Sweat 500ml', 'Beverages', 'Isotonic', 'Sports Drink', 6000.00, 8500.00, 'SUP012', 150, FALSE),
('PRD016', 'Qtela Tempe 55g', 'Snacks', 'Chips', 'Vegetable Chips', 7000.00, 10000.00, 'SUP004', 100, FALSE),
('PRD017', 'Yakult 5x65ml', 'Beverages', 'Dairy', 'Probiotic', 11000.00, 15000.00, 'SUP002', 120, TRUE),
('PRD018', 'Mie Sedaap Goreng', 'Food', 'Instant Food', 'Noodles', 2300.00, 3200.00, 'SUP013', 180, FALSE),
('PRD019', 'Kopiko Coffee Candy', 'Snacks', 'Candy', 'Coffee Candy', 8000.00, 12000.00, 'SUP014', 200, FALSE),
('PRD020', 'Bear Brand 189ml', 'Beverages', 'Dairy', 'Milk', 9000.00, 12000.00, 'SUP002', 130, TRUE);

-- Insert into inventory_movements (37 records - updated with ADJ and RTN)
INSERT INTO inventory_movements
(movement_id, product_code, branch_code, transaction_type, quantity, transaction_date, batch_number, expiry_date, unit_cost_at_time)
VALUES
-- May 2024
(1001, 'PRD001', 'BR001', 'IN', 500, '2024-05-01', 'BTH20240501', '2025-05-01', 2500.00),
(1002, 'PRD003', 'BR001', 'IN', 200, '2024-05-02', 'BTH20240502', '2024-05-16', 18000.00),
(1003, 'PRD001', 'BR001', 'OUT', 120, '2024-05-03', 'BTH20240501', NULL, 2500.00),
(1004, 'PRD004', 'BR002', 'IN', 400, '2024-05-05', 'BTH20240505', '2025-11-05', 2800.00),
(1005, 'PRD003', 'BR001', 'RTN', 2, '2024-05-04', 'BTH20240502', '2024-05-16', 18000.00),
(1006, 'PRD005', 'BR003', 'IN', 300, '2024-05-10', 'BTH20240510', '2024-11-10', 8500.00),
(1007, 'PRD001', 'BR001', 'OUT', 85, '2024-05-15', 'BTH20240501', NULL, 2500.00),
(1008, 'PRD011', 'BR004', 'IN', 100, '2024-05-12', 'BTH20240512', '2024-05-19', 15000.00),
(1009, 'PRD013', 'BR005', 'IN', 150, '2024-05-18', 'BTH20240518', '2024-05-25', 35000.00),
(1010, 'PRD011', 'BR004', 'OUT', 45, '2024-05-18', 'BTH20240512', NULL, 15000.00),
(1011, 'PRD003', 'BR001', 'EXP', 50, '2024-05-17', 'BTH20240502', '2024-05-16', 18000.00),
(1012, 'PRD001', 'BR001', 'ADJ', -15, '2024-05-20', 'BTH20240501', '2025-05-01', 2500.00),
-- June 2024
(1013, 'PRD002', 'BR001', 'IN', 450, '2024-06-01', 'BTH20240601', '2025-06-01', 2500.00),
(1014, 'PRD006', 'BR002', 'IN', 250, '2024-06-03', 'BTH20240603', '2024-12-03', 6500.00),
(1015, 'PRD002', 'BR001', 'OUT', 180, '2024-06-05', 'BTH20240601', NULL, 2500.00),
(1016, 'PRD006', 'BR002', 'RTN', 5, '2024-06-07', 'BTH20240603', '2024-12-03', 6500.00),
(1017, 'PRD007', 'BR003', 'IN', 350, '2024-06-08', 'BTH20240608', '2026-06-08', 3200.00),
(1018, 'PRD013', 'BR005', 'OUT', 80, '2024-06-10', 'BTH20240518', NULL, 35000.00),
(1019, 'PRD013', 'BR005', 'RTN', 1, '2024-06-11', 'BTH20240518', '2024-05-25', 35000.00),
(1020, 'PRD008', 'BR006', 'IN', 200, '2024-06-12', 'BTH20240612', '2025-12-12', 12000.00),
(1021, 'PRD004', 'BR002', 'OUT', 150, '2024-06-15', 'BTH20240505', NULL, 2800.00),
(1022, 'PRD009', 'BR007', 'IN', 180, '2024-06-18', 'BTH20240618', '2025-06-18', 18000.00),
(1023, 'PRD011', 'BR004', 'EXP', 30, '2024-06-20', 'BTH20240512', '2024-05-19', 15000.00),
(1024, 'PRD012', 'BR008', 'IN', 120, '2024-06-20', 'BTH20240620', '2024-06-27', 12000.00),
(1025, 'PRD005', 'BR003', 'ADJ', 10, '2024-06-25', 'BTH20240510', '2024-11-10', 8500.00),
-- July 2024
(1026, 'PRD014', 'BR001', 'IN', 500, '2024-07-02', 'BTH20240702', '2025-01-02', 3500.00),
(1027, 'PRD015', 'BR001', 'IN', 300, '2024-07-03', 'BTH20240703', '2025-07-03', 6000.00),
(1028, 'PRD014', 'BR001', 'OUT', 220, '2024-07-05', 'BTH20240702', NULL, 3500.00),
(1029, 'PRD016', 'BR003', 'IN', 200, '2024-07-08', 'BTH20240708', '2024-10-08', 7000.00),
(1030, 'PRD014', 'BR001', 'ADJ', -25, '2024-07-10', 'BTH20240702', '2025-01-02', 3500.00),
(1031, 'PRD017', 'BR005', 'IN', 250, '2024-07-10', 'BTH20240710', '2024-07-24', 11000.00),
(1032, 'PRD018', 'BR006', 'IN', 400, '2024-07-12', 'BTH20240712', '2025-07-12', 2300.00),
(1033, 'PRD015', 'BR001', 'OUT', 125, '2024-07-15', 'BTH20240703', NULL, 6000.00),
(1034, 'PRD015', 'BR001', 'RTN', 3, '2024-07-16', 'BTH20240703', '2025-07-03', 6000.00),
(1035, 'PRD019', 'BR009', 'IN', 300, '2024-07-18', 'BTH20240718', '2025-07-18', 8000.00),
(1036, 'PRD020', 'BR011', 'IN', 200, '2024-07-20', 'BTH20240720', '2024-08-03', 9000.00),
(1037, 'PRD012', 'BR008', 'EXP', 40, '2024-07-28', 'BTH20240620', '2024-06-27', 12000.00);

-- Insert into sales_transactions (12 records)
INSERT INTO sales_transactions
(transaction_id, branch_code, transaction_date, staff_id, payment_method, total_amount, discount_amount, loyalty_points_earned, loyalty_points_redeemed, customer_id)
VALUES
('TRX202405030001', 'BR001', '2024-05-03 09:15:00', 'STF002', 'CASH', 87500.00, 0.00, 88, 0, 'CUST001'),
('TRX202405030002', 'BR001', '2024-05-03 14:30:00', 'STF003', 'DEBIT', 156000.00, 15600.00, 140, 100, 'CUST002'),
('TRX202405150001', 'BR001', '2024-05-15 11:20:00', 'STF002', 'CREDIT', 234500.00, 11725.00, 223, 0, 'CUST003'),
('TRX202406050001', 'BR001', '2024-06-05 10:45:00', 'STF003', 'EWALLET', 178000.00, 8900.00, 169, 50, 'CUST004'),
('TRX202406050002', 'BR001', '2024-06-05 16:30:00', 'STF002', 'CASH', 95000.00, 0.00, 95, 0, 'CUST005'),
('TRX202406100001', 'BR005', '2024-06-10 12:00:00', 'STF009', 'DEBIT', 384000.00, 19200.00, 365, 200, 'CUST006'),
('TRX202406150001', 'BR002', '2024-06-15 13:15:00', 'STF005', 'CREDIT', 126000.00, 6300.00, 120, 0, 'CUST007'),
('TRX202407050001', 'BR001', '2024-07-05 09:30:00', 'STF002', 'EWALLET', 198500.00, 9925.00, 189, 100, 'CUST008'),
('TRX202407050002', 'BR001', '2024-07-05 15:45:00', 'STF003', 'CASH', 67000.00, 0.00, 67, 0, 'CUST009'),
('TRX202407150001', 'BR001', '2024-07-15 11:00:00', 'STF002', 'DEBIT', 289000.00, 28900.00, 260, 150, 'CUST010'),
('TRX202407180001', 'BR009', '2024-07-18 14:20:00', 'STF014', 'CREDIT', 144000.00, 7200.00, 137, 0, 'CUST011'),
('TRX202407200001', 'BR011', '2024-07-20 10:30:00', 'STF015', 'CASH', 96000.00, 0.00, 96, 0, 'CUST012');

-- Insert into sales_line_items
INSERT INTO sales_line_items
(transaction_id, line_number, product_code, quantity, unit_price_at_time, discount_percentage, total_line_amount)
VALUES
-- Transaction 1
('TRX202405030001', 1, 'PRD001', 10, 3500.00, 0.00, 35000.00),
('TRX202405030001', 2, 'PRD004', 8, 4000.00, 0.00, 32000.00),
('TRX202405030001', 3, 'PRD005', 2, 12000.00, 0.00, 24000.00),
-- Transaction 2
('TRX202405030002', 1, 'PRD003', 3, 24000.00, 10.00, 64800.00),
('TRX202405030002', 2, 'PRD011', 2, 22000.00, 10.00, 39600.00),
('TRX202405030002', 3, 'PRD005', 4, 12000.00, 10.00, 43200.00),
-- Transaction 3
('TRX202405150001', 1, 'PRD001', 15, 3500.00, 5.00, 49875.00),
('TRX202405150001', 2, 'PRD002', 15, 3200.00, 5.00, 45600.00),
('TRX202405150001', 3, 'PRD018', 20, 3200.00, 5.00, 60800.00),
('TRX202405150001', 4, 'PRD004', 20, 4000.00, 5.00, 76000.00),
-- Transaction 4
('TRX202406050001', 1, 'PRD002', 25, 3500.00, 5.00, 83125.00),
('TRX202406050001', 2, 'PRD018', 20, 3200.00, 5.00, 60800.00),
('TRX202406050001', 3, 'PRD014', 10, 5000.00, 5.00, 47500.00),
-- Transaction 5
('TRX202406050002', 1, 'PRD005', 3, 12000.00, 0.00, 36000.00),
('TRX202406050002', 2, 'PRD006', 3, 9000.00, 0.00, 27000.00),
('TRX202406050002', 3, 'PRD016', 3, 10000.00, 0.00, 30000.00),
-- Transaction 6
('TRX202406100001', 1, 'PRD013', 5, 48000.00, 5.00, 228000.00),
('TRX202406100001', 2, 'PRD004', 24, 4000.00, 5.00, 91200.00),
('TRX202406100001', 3, 'PRD015', 12, 8500.00, 5.00, 96900.00),
-- Transaction 7
('TRX202406150001', 1, 'PRD007', 6, 5000.00, 5.00, 28500.00),
('TRX202406150001', 2, 'PRD008', 3, 17000.00, 5.00, 48450.00),
('TRX202406150001', 3, 'PRD009', 2, 25000.00, 5.00, 47500.00),
-- Transaction 8
('TRX202407050001', 1, 'PRD014', 20, 5000.00, 5.00, 95000.00),
('TRX202407050001', 2, 'PRD015', 15, 8500.00, 5.00, 121125.00),
-- Transaction 9
('TRX202407050002', 1, 'PRD019', 4, 12000.00, 0.00, 48000.00),
('TRX202407050002', 2, 'PRD006', 2, 9000.00, 0.00, 18000.00),
-- Transaction 10
('TRX202407150001', 1, 'PRD015', 10, 8500.00, 10.00, 76500.00),
('TRX202407150001', 2, 'PRD003', 5, 24000.00, 10.00, 108000.00),
('TRX202407150001', 3, 'PRD001', 20, 3500.00, 10.00, 63000.00),
('TRX202407150001', 4, 'PRD005', 5, 12000.00, 10.00, 54000.00),
-- Transaction 11
('TRX202407180001', 1, 'PRD007', 10, 5000.00, 5.00, 47500.00),
('TRX202407180001', 2, 'PRD008', 6, 17000.00, 5.00, 96900.00),
-- Transaction 12
('TRX202407200001', 1, 'PRD020', 8, 12000.00, 0.00, 96000.00);

--generated by Claude