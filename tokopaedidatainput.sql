INSERT INTO users (id, username, address, phonenumber) VALUES
(1, 'Sum Ting Wong', 'Digital Park, Sambau, Kecamatan Nongsa, Kota Batam, Kepulauan Riau 29466','081212121212'),
(2, 'Holy Sheet', 'Hang Kasturi, Batu Besar, Kecamatan Nongsa, Kota Batam', '081313131313'),
(3, 'MikeBrown', '789 Pine Road', '081414141414');

insert into seller (id, sellername) values
(1, 'COC Komputer'),
(2, 'Toko Komputer Premium'),
(3, 'TechieStore');

insert into products (id, productname, price, weight, stock, sellerid) values
(1, 'Sapphire Nitro+ Radeon RX 7900 XT 24GB', 52000000, 5, 10, 1),
(2, 'Logitech Mouse', 150000, 0.5, 50, 2),
(3, 'Samsung SSD 1TB', 2000000, 0.2, 30, 3);

INSERT INTO shipping_agent (idshipping, shippingname, defshippingfee)
VALUES
    (1, 'JNE Express', 9000),
    (2, 'SiCepat Fast', 8000),
    (3, 'GoSend Same Day', 15000);

INSERT INTO promos (promoid, promoname, promodiscount)
VALUES
    (1, 'New Year Sale', 10),
    (2, 'Black Friday Discount', 20),
    (3, 'Cyber Monday Deals', 15);

INSERT INTO payment_method (idpayment, payment, servicefee)
VALUES
    (1, 'BCA Virtual Account', 5000),
    (2, 'Credit Card', 3000),
    (3, 'Gopay Coins', 0);
   
INSERT INTO orders VALUES
    (1, 'INV12345', 1000, 5000, 2000, 75000, 1, 1, 1, 1, 1),
    (2, 'INV67890', 1500, 6000, 2500, 90000, 2, 2, 2, 2, 2);

INSERT INTO payment_list (idpaymentlist, idpayment, orderid, transactionAmount)
VALUES
    (1, 1, 1, 75000),
    (2, 2, 2, 90000);

INSERT INTO promo_list (promolist_id, promoid, orderid, transactionAmount)
VALUES
    (1, 1, 1, 75000),
    (2, 2, 2, 90000);
   
INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price)
VALUES
    (1, 1, 1, 2, 100000),
    (2, 2, 2, 3, 20000);
