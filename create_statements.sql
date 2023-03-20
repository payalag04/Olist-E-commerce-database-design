/*##################################################################################################*/

create table order_dataset(
	order_id varchar, 
	order_status varchar, 
	order_purchase_timestamp date, 
	order_approved_at date, 
	order_delivered_carrier_date date, 
	order_delivered_customer_date date, 
	order_estimated_delivery_date date,
	primary key(order_id)
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

/*##################################################################################################*/


create table customer_dataset(
	cust_order_id varchar, 
	cust_unique_id varchar,
	cust_zip integer, 
	cust_city varchar,
	cust_state varchar,
	primary key (cust_unique_id,cust_order_id)
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

Alter table customer_dataset add FOREIGN KEY (cust_order_id) REFERENCES order_dataset(order_id) on delete cascade;


/*##################################################################################################*/



create table seller_dataset(
	seller_id varchar, 
	seller_zip_code integer, 
	seller_city varchar, 
	seller_state varchar, 
	primary key(seller_id)
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

/*##################################################################################################*/


create table product_dataset(
	product_id varchar, 
	product_category varchar, 
	product_weight_g integer, 
	product_length_cm integer, 
	primary key(product_id)
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

/*##################################################################################################*/


create table order_reviews(
	review_id varchar, 
	order_id varchar, 
	review_score integer, 
	review_comment varchar,
	primary key(review_id, order_id),
	FOREIGN KEY (order_id) REFERENCES order_dataset(order_id) on delete cascade
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

/*##################################################################################################*/

create table payment_dataset(
	order_id varchar, 
	payment_id varchar,
	payment_type varchar, 
	payment_installments integer, 
	payment_values integer,
	primary key( payment_id, order_id),
	FOREIGN KEY (order_id) REFERENCES order_dataset(order_id) on delete cascade
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

/*##################################################################################################*/


create table order_items(
	order_id varchar, 
	order_item_id varchar,
	product_id varchar, 
	seller_id varchar,
	shipping_date date,
	price integer,
	primary key (order_id, order_item_id,product_id,seller_id),
	FOREIGN KEY (order_id) REFERENCES order_dataset(order_id) on delete cascade,
	FOREIGN KEY (product_id) REFERENCES product_dataset(product_id) on delete cascade,
	FOREIGN KEY (seller_id) REFERENCES seller_dataset(seller_id) on delete cascade
);

/*INSERT ALL ROWS FROM INSERT SHEET*/

##################################################################################################


