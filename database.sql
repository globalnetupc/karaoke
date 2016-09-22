-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-09-07 23:48:18.744

-- tables
-- Table: tbgroup
CREATE  TABLE IF NOT EXISTS tbgroup (
  id INT(11) NOT NULL AUTO_INCREMENT ,
  levelGroup INT(2) NOT NULL ,
  description VARCHAR(100) NOT NULL ,
  CONSTRAINT tbgroup_pk PRIMARY KEY (Id)
 );
  
-- Table: employee
CREATE  TABLE IF NOT EXISTS employee (
  userName VARCHAR(100) NULL ,
  firstName VARCHAR(100) NOT NULL ,
  lastName VARCHAR(100) NOT NULL ,
  email VARCHAR(100) NOT NULL ,
  group_id INT NOT NULL DEFAULT 0 ,
  dateIn DATE NOT NULL ,
  dateOut DATE NULL ,
  password VARCHAR(100) NOT NULL ,
  isValid BIT(1) NOT NULL ,
  languageIt VARCHAR(2) NOT NULL ,
  validationOrigin TINYINT NOT NULL ,
  isSystemUser BIT(1) NOT NULL ,
  dni int(11) NOT NULL,
  time_created TIMESTAMP NOT NULL,
  CONSTRAINT employee_pk PRIMARY KEY (dni)
   
);

-- Table: city
CREATE TABLE city (
    id int NOT NULL AUTO_INCREMENT,
    city_name varchar(128) NOT NULL,
    country_id int NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY (id)
);

-- Table: location
CREATE  TABLE IF NOT EXISTS location (
  id INT(11) NOT NULL AUTO_INCREMENT ,
  name VARCHAR(100) NOT NULL ,
  description VARCHAR(600) NOT NULL ,
  address VARCHAR(400) NOT NULL ,
  phone VARCHAR(100) NOT NULL ,
  coordenate VARCHAR(50) NOT NULL ,
  management INT(11) NOT NULL ,
  city_id int NOT NULL,
  CONSTRAINT location_pk PRIMARY KEY (id)
);

-- Table: box
CREATE  TABLE IF NOT EXISTS box (
  id INT(11) NOT NULL AUTO_INCREMENT ,
  name VARCHAR(100) NOT NULL ,
  description VARCHAR(600) NOT NULL ,
  location_id INT(11) NOT NULL ,
  phone VARCHAR(100) NOT NULL ,
  score INT(1) NOT NULL,
  bussy BIT(1) NOT NULL ,
  CONSTRAINT box_pk PRIMARY KEY (id)
 );


-- Table: client
CREATE TABLE client (
    id int NOT NULL AUTO_INCREMENT,
    firstName varchar(128) NOT NULL,
    lastName varchar(128) NOT NULL,
    companyName varchar(128) NULL,
	email varchar(128) NULL,
	phone varchar(128) NULL,
	birthday date null,
    VAT_ID varchar(64) NULL,
	group_id int NOT NULL,
    client_address text NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id)
);

-- Table: event
CREATE TABLE event (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(128) NOT NULL,
	description text NOT NULL,
	date_event date NOT NULL,
	time_event time NOT NULL,
	capacity int(4) NOT NULL,
    CONSTRAINT event_pk PRIMARY KEY (id)
);

-- Table: booking
CREATE TABLE booking (
    id int NOT NULL AUTO_INCREMENT,
    box_id int NOT NULL,
    time_created timestamp NOT NULL,
	client_id int NOT NULL,
	date_book date NOT NULL,
	time_book time NOT NULL,
	description text NOT NULL,
    CONSTRAINT event_pk PRIMARY KEY (id)
);

-- Table: song
CREATE TABLE song (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(200) NOT NULL,
	singer_band varchar(200) NOT NULL,
	description text NOT NULL,
	duration int NOT NULL,
	code int NOT NULL,
    CONSTRAINT song_pk PRIMARY KEY (id)
);

-- Table: country
CREATE TABLE country (
    id int NOT NULL AUTO_INCREMENT,
    country_name varchar(128) NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY (id)
);

-- Table: billing
CREATE TABLE billing (
    id int NOT NULL AUTO_INCREMENT,
    client_id int NOT NULL,
    time_created timestamp NOT NULL,
    payment_type_id int NOT NULL,
    billing_address text NOT NULL,
    products_price decimal(8,2) NOT NULL,
    discount decimal(8,2) NOT NULL,
    final_price decimal(8,2) NOT NULL,
	final_oper bit(1),
    CONSTRAINT billing_pk PRIMARY KEY (id)
);

-- Table: payment_data
CREATE TABLE payment_data (
    id int NOT NULL AUTO_INCREMENT,
    payment_type_id int NOT NULL,
    data_name varchar(255) NOT NULL,
    data_type varchar(255) NOT NULL,
    UNIQUE INDEX payment_data_ak_1 (payment_type_id,data_name),
    CONSTRAINT payment_data_pk PRIMARY KEY (id)
);

-- Table: payment_details
CREATE TABLE payment_details (
    id int NOT NULL AUTO_INCREMENT,
    shipment_id int NOT NULL,
    payment_data_id int NOT NULL,
    value varchar(255) NOT NULL,
    CONSTRAINT payment_details_pk PRIMARY KEY (id)
);

-- Table: payment_type
CREATE TABLE payment_type (
    id int NOT NULL AUTO_INCREMENT,
    type_name varchar(64) NOT NULL,
    CONSTRAINT payment_type_pk PRIMARY KEY (id)
) COMMENT 'e.g. card, cash, paypal, wire transfer';

-- Table: product
CREATE TABLE product (
    id int NOT NULL AUTO_INCREMENT,
    product_name varchar(64) NOT NULL,
    product_description varchar(255) NOT NULL,
    product_type_id int NOT NULL,
    unit varchar(16) NOT NULL,
    price_per_unit decimal(8,2) NOT NULL,
    CONSTRAINT product_pk PRIMARY KEY (id)
);

-- Table: product_type
CREATE TABLE product_type (
    id int NOT NULL AUTO_INCREMENT,
    type_name varchar(64) NOT NULL,
    CONSTRAINT product_type_pk PRIMARY KEY (id)
);

-- Table: shipment
CREATE TABLE shipment (
    id int NOT NULL AUTO_INCREMENT,
    client_id int NOT NULL,
    time_created timestamp NOT NULL,
    shipment_type_id int NOT NULL,
    payment_type_id int NOT NULL,
    shipping_address text NOT NULL,
    billing_address text NOT NULL,
    products_price decimal(8,2) NOT NULL,
    delivery_cost decimal(8,2) NOT NULL,
    discount decimal(8,2) NOT NULL,
    final_price decimal(8,2) NOT NULL,
    CONSTRAINT shipment_pk PRIMARY KEY (id)
);

-- Table: shipment_details
CREATE TABLE shipment_details (
    id int NOT NULL AUTO_INCREMENT,
    shipment_id int NOT NULL,
    product_id int NOT NULL,
    quanitity decimal(8,2) NOT NULL,
    price_per_unit decimal(8,2) NOT NULL,
    price decimal(8,2) NOT NULL,
    UNIQUE INDEX shipmet_details_ak_1 (shipment_id,product_id),
    CONSTRAINT shipment_details_pk PRIMARY KEY (id)
);

-- Table: shipment_status
CREATE TABLE shipment_status (
    id int NOT NULL AUTO_INCREMENT,
    shipment_id int NOT NULL,
    status_catalog_id int NOT NULL,
    status_time timestamp NOT NULL,
    notes text NULL,
    CONSTRAINT shipment_status_pk PRIMARY KEY (id)
);

-- Table: shipment_type
CREATE TABLE shipment_type (
    id int NOT NULL AUTO_INCREMENT,
    type_name varchar(64) NOT NULL,
    CONSTRAINT shipment_type_pk PRIMARY KEY (id)
) COMMENT 'e.g. send after payment, charge after delivery, ...';

-- Table: status_catalog
CREATE TABLE status_catalog (
    id int NOT NULL AUTO_INCREMENT,
    status_name varchar(255) NOT NULL,
    CONSTRAINT status_catalog_pk PRIMARY KEY (id)
) COMMENT 'list of all possible statuses: ordered, paid, delivered';

-- Table: stock
CREATE TABLE stock (
    product_id int NOT NULL AUTO_INCREMENT,
    in_stock decimal(8,2) NOT NULL,
    last_update_time timestamp NOT NULL,
    CONSTRAINT stock_pk PRIMARY KEY (product_id)
);

-- views
-- View: product_details
CREATE VIEW product_details AS
SELECT
  p.id,
  p.product_name,
  p.product_description,
  pt.type_name,
  p.unit,
  p.price_per_unit,
  s.in_stock,
  s.last_update_time
FROM product p
LEFT JOIN product_type pt ON p.product_type_id = pt.id
LEFT JOIN stock s ON p.id = s.product_id;

-- foreign keys
-- Reference: city_country (table: city)
ALTER TABLE city ADD CONSTRAINT city_country FOREIGN KEY city_country (country_id)
    REFERENCES country (id);

-- Reference: employee_tbgroup (table: employee)
ALTER TABLE employee ADD CONSTRAINT employee_tbgroup FOREIGN KEY employee_tbgroup (group_id)
    REFERENCES tbgroup (id);
	
-- Reference: client_tbgroup (table: client)
ALTER TABLE client ADD CONSTRAINT client_tbgroup FOREIGN KEY client_tbgroup (group_id)
    REFERENCES tbgroup (id);
		
-- Reference: location_city (table: location)
ALTER TABLE location ADD CONSTRAINT location_city FOREIGN KEY location_city (city_id)
    REFERENCES city (id);

-- Reference: box_location (table: box)
ALTER TABLE box ADD CONSTRAINT box_location FOREIGN KEY box_location (location_id)
    REFERENCES location (id);

-- Reference: booking_box (table: booking)
ALTER TABLE booking ADD CONSTRAINT booking_box FOREIGN KEY booking_box (box_id)
    REFERENCES box (id);	
	
-- Reference: booking_client (table: booking)
ALTER TABLE booking ADD CONSTRAINT booking_client FOREIGN KEY booking_client (client_id)
    REFERENCES client (id);
	
-- Reference: payment_data_payment_type (table: payment_data)
ALTER TABLE payment_data ADD CONSTRAINT payment_data_payment_type FOREIGN KEY payment_data_payment_type (payment_type_id)
    REFERENCES payment_type (id);

-- Reference: payment_details_payment_data (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_payment_data FOREIGN KEY payment_details_payment_data (payment_data_id)
    REFERENCES payment_data (id);

-- Reference: payment_details_shipment (table: payment_details)
ALTER TABLE payment_details ADD CONSTRAINT payment_details_shipment FOREIGN KEY payment_details_shipment (shipment_id)
    REFERENCES shipment (id);

-- Reference: product_product_type (table: product)
ALTER TABLE product ADD CONSTRAINT product_product_type FOREIGN KEY product_product_type (product_type_id)
    REFERENCES product_type (id);

-- Reference: shipment_client (table: shipment)
ALTER TABLE shipment ADD CONSTRAINT shipment_client FOREIGN KEY shipment_client (client_id)
    REFERENCES client (id);

-- Reference: shipment_payment_type (table: shipment)
ALTER TABLE shipment ADD CONSTRAINT shipment_payment_type FOREIGN KEY shipment_payment_type (payment_type_id)
    REFERENCES payment_type (id);
	
-- Reference: billing_client (table: billing)
ALTER TABLE billing ADD CONSTRAINT billing_client FOREIGN KEY billing_client (client_id)
    REFERENCES client (id);

-- Reference: billing_payment_type (table: billing)
ALTER TABLE billing ADD CONSTRAINT billing_payment_type FOREIGN KEY billing_payment_type (payment_type_id)
    REFERENCES payment_type (id);

-- Reference: shipment_shipment_type (table: shipment)
ALTER TABLE shipment ADD CONSTRAINT shipment_shipment_type FOREIGN KEY shipment_shipment_type (shipment_type_id)
    REFERENCES shipment_type (id);

-- Reference: shipment_status_shipment (table: shipment_status)
ALTER TABLE shipment_status ADD CONSTRAINT shipment_status_shipment FOREIGN KEY shipment_status_shipment (shipment_id)
    REFERENCES shipment (id);

-- Reference: shipment_status_status_catalog (table: shipment_status)
ALTER TABLE shipment_status ADD CONSTRAINT shipment_status_status_catalog FOREIGN KEY shipment_status_status_catalog (status_catalog_id)
    REFERENCES status_catalog (id);

-- Reference: shipmet_details_product (table: shipment_details)
ALTER TABLE shipment_details ADD CONSTRAINT shipmet_details_product FOREIGN KEY shipmet_details_product (product_id)
    REFERENCES product (id);

-- Reference: shipmet_details_shipment (table: shipment_details)
ALTER TABLE shipment_details ADD CONSTRAINT shipmet_details_shipment FOREIGN KEY shipmet_details_shipment (shipment_id)
    REFERENCES shipment (id);

-- Reference: stock_product (table: stock)
ALTER TABLE stock ADD CONSTRAINT stock_product FOREIGN KEY stock_product (product_id)
    REFERENCES product (id);

-- End of file.


