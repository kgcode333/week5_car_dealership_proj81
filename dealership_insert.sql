INSERT INTO sales_person(
	salesmen_id,
	first_name,
	last_name,
	date_hired
)VALUES(
	1,
	'Mike',
	'Halloway',
	'01/20/2020'
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name,
	date_hired
)VALUES(
	'1',
	'Jim',
	'Fixer',
	'01/20/2020'
);

INSERT INTO dealership(
	store_id,
	address,
	phone_number,
	salesmen_id,
	mechanic_id
	
)VALUES(
	1,
	'183 Motor St Chicago, IL',
	'7085559685',
	1,
	1
);

INSERT INTO car_for_sale(
	car_id,
	make,
	model,
	year_made,
	date_recieved,
	date_sold,
	is_new
)VALUES(
	1,
	'Toyota',
	'Camry',
	'01/01/2021',
	'12/01/2021',
	'1/12/2022',
	'True'
	
);

INSERT INTO  sale_invoice(
	invoice_id,
	purchase_date,
	salesmen_id,
	car_id
)VALUES(
	1,
	'1/12/2022',
	1,
	1
);

INSERT INTO car_part(
	part_id,
	part_name,
	part_cost
)VALUES(
	1,
	'brakes',
	'50.00'

);

INSERT INTO service_history(
	history_id,
	service_description,
	date_serviced
)VALUES(
	1,
	'Brakes have been replaced with new ones.',
	'02/01/2022'

);


INSERT INTO car_to_repair(
	car_repair_id,
	odometer,
	problem_description,
	history_id,
	car_id
)VALUES(
	1,
	'5000',
	'Brakes are stopping as good and need to be replaced.',
	1,
	1
);

INSERT INTO service_invoice(
	service_invoice_id,
	labor_cost,
	total_cost,
	part_id,
	car_repair_id,
	mechanic_id
)VALUES(
	1,
	'75.00',
	'125.00',
	1,
	1,
	1
);

INSERT INTO mechanic_service(
	mechanic_id,
	service_invoice_id

)VALUES(
	1,
	1
);

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	phone_number,
	payment_method,
	invoice_id,
	service_invoice_id,
	car_id
)VALUES(
	1,
	'Sarah',
	'Marshall',
	'7085557878',
	'Debit Card',
	1,
	1,
	1
);








