create table users(
	id int primary key,
	username varchar(50),
	address varchar(100),
	phonenumber varchar(13),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

create table seller(
	id int primary key,
	sellername varchar(50),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

create table products(
	id int primary key,
	productname varchar(50),
	price int,
	weight int,
	stock int,
	sellerid int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
	foreign key (sellerid) references seller(id)
);

create table shipping_agent(
	idshipping int primary key,
	shippingname varchar(50),
	defshippingfee int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

create table promos(
	promoid int primary key,
	promoname varchar(50),
	promodiscount int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

create table payment_method(
	idpayment int primary key,
	payment varchar(50),
	servicefee int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    invoice VARCHAR(100),
    deliveryinsurancefee INT,
    shippingfee INT,
    applicationfee INT,
    totalprice INT,
    user_id INT,
    seller_id INT,
    payment_method_id INT,
    shipping_agent_id INT,
    promo_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (seller_id) REFERENCES seller(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(idpayment),
    FOREIGN KEY (shipping_agent_id) REFERENCES shipping_agent(idshipping),
    foreign key (promo_id) references promos(promoid)
);

create table payment_list(
	idpaymentlist int primary key,
	idpayment int,
	orderid int,
	transactionAmount int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
	foreign key (orderid) references orders(order_id),
	foreign key (idpayment) references payment_method(idpayment)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

create table promo_list(
	promolist_id int primary key,
	promoid int,
	orderid int,
	transactionAmount int,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
	foreign key (promoid) references promos(promoid),
	foreign key (orderid) references orders(order_id)
);