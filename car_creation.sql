CREATE TABLE sales_person(
	salesmen_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	date_hired DATE
);


CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	date_hired DATE
);

CREATE TABLE dealership(
	store_id SERIAL PRIMARY KEY,
	address VARCHAR(150),
	phone_number VARCHAR(10),
	salesmen_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(salesmen_id) REFERENCES sales_person(salesmen_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)

);

CREATE TABLE car_for_sale(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	year_made DATE,
	date_recieved DATE,
	date_sold DATE,
	is_new BOOLEAN
);


CREATE TABLE sale_invoice(
	invoice_id SERIAL PRIMARY KEY,
	purchase_date DATE,
	salesmen_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(salesmen_id) REFERENCES sales_person(salesmen_id),
	FOREIGN KEY(car_id) REFERENCES car_for_sale(car_id)
);

CREATE TABLE car_part(
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(100),
	part_cost NUMERIC(8,2)
);

CREATE TABLE service_history(
	history_id SERIAL PRIMARY KEY,
	service_description VARCHAR(150),
	date_serviced DATE
);

CREATE TABLE car_to_repair(
	car_repair_id SERIAL PRIMARY KEY,
	odometer INTEGER,
	problem_description VARCHAR(200),
	history_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(history_id) REFERENCES service_history(history_id),
	FOREIGN KEY(car_id) REFERENCES car_for_sale(car_id)
);

CREATE TABLE service_invoice(
	service_invoice_id SERIAL PRIMARY KEY,
	labor_cost NUMERIC(8,2),
	total_cost NUMERIC(8,2),
	part_id INTEGER NOT NULL,
	car_repair_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(part_id) REFERENCES car_part(part_id),
	FOREIGN KEY(car_repair_id) REFERENCES car_to_repair(car_repair_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE mechanic_service(
	mechanic_id INTEGER NOT NULL,
	service_invoice_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(service_invoice_id) REFERENCES service_invoice(service_invoice_id)
);

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number VARCHAR(10),
	payment_method VARCHAR(150),
	invoice_id INTEGER NOT NULL,
	service_invoice_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(invoice_id) REFERENCES sale_invoice(invoice_id),
	FOREIGN KEY(car_id) REFERENCES  car_for_sale(car_id),
	FOREIGN KEY(service_invoice_id) REFERENCES service_invoice(service_invoice_id)
	
);