-- autor: Violeeeeeeee
-- tables
-- Table: bill
CREATE TABLE bill (
    id int NOT NULL,
    created_at datetime NOT NULL,
    total_amount decimal(10, 2) NOT NULL,
    pdf_url text NOT NULL,
    order_id int NOT NULL,
    CONSTRAINT bill_pk PRIMARY KEY (id)
);
-- Table: car
CREATE TABLE car (
    id int NOT NULL,
    customer_id int NOT NULL,
    model nvarchar(32) NOT NULL,
    vin nvarchar(17) NOT NULL,
    engine nvarchar(32) NOT NULL,
    transmission nvarchar(32) NOT NULL,
    car_brand_id int NOT NULL,
    registration_plate nvarchar(12) NOT NULL,
    UNIQUE INDEX unique_vin (vin),
    UNIQUE INDEX unique_registration_plate (registration_plate),
    CONSTRAINT car_pk PRIMARY KEY (id)
);
-- Table: car_brand
CREATE TABLE car_brand (
    id int NOT NULL,
    brand_name nvarchar(32) NOT NULL,
    CONSTRAINT car_brand_pk PRIMARY KEY (id)
);
-- Table: customers
CREATE TABLE customers (
    id int NOT NULL,
    first_name nvarchar(32) NOT NULL,
    last_name nvarchar(32) NOT NULL,
    phone nvarchar(24) NOT NULL,
    email nvarchar(32) NOT NULL,
    address nvarchar(128) NOT NULL,
    city nvarchar(16) NOT NULL,
    region nvarchar(16) NOT NULL,
    country nvarchar(16) NOT NULL,
    postal_code nvarchar(10) NOT NULL,
    registration datetime NOT NULL,
    notes text NOT NULL,
    UNIQUE INDEX unique_email (email),
    UNIQUE INDEX unique_phone (phone),
    CONSTRAINT customers_pk PRIMARY KEY (id)
);
-- Table: employees
CREATE TABLE employees (
    id int NOT NULL,
    first_name nvarchar(32) NOT NULL,
    last_name nvarchar(32) NOT NULL,
    title nvarchar(32) NOT NULL,
    birth_date date NOT NULL,
    hire_date date NOT NULL,
    email nvarchar(32) NOT NULL,
    phone nvarchar(24) NOT NULL,
    address nvarchar(128) NOT NULL,
    city nvarchar(16) NOT NULL,
    region nvarchar(16) NOT NULL,
    country nvarchar(16) NOT NULL,
    postal_code nvarchar(10) NOT NULL,
    UNIQUE INDEX unique_email (email),
    UNIQUE INDEX unique_phone (phone),
    CONSTRAINT employees_pk PRIMARY KEY (id)
);
-- Table: mechanic_schedule
CREATE TABLE mechanic_schedule (
    id int NOT NULL,
    mechanic_id int NOT NULL,
    work_date date NOT NULL,
    shift_start time NOT NULL,
    shift_end time NOT NULL,
    is_day_off bool NOT NULL,
    notes text NOT NULL,
    CONSTRAINT mechanic_schedule_pk PRIMARY KEY (id)
);
-- Table: order_status
CREATE TABLE order_status (
    id int NOT NULL,
    order_id int NOT NULL,
    order_status enum(
        'pendein',
        'in_progress',
        'completed',
        'cancelled'
    ) NOT NULL,
    changed_at datetime NOT NULL,
    CONSTRAINT order_status_pk PRIMARY KEY (id)
);
-- Table: orders
CREATE TABLE orders (
    id int NOT NULL,
    customer_id int NOT NULL,
    employee_id int NOT NULL,
    car_id int NOT NULL,
    order_date datetime NOT NULL,
    appointment_date date NOT NULL,
    start_date datetime NOT NULL,
    end_date datetime NOT NULL,
    notes text NOT NULL,
    CONSTRAINT orders_pk PRIMARY KEY (id)
);
-- Table: part_shipments
CREATE TABLE part_shipments (
    id int NOT NULL,
    part_id int NOT NULL,
    supplier_id int NOT NULL,
    ordered_quantity int NOT NULL,
    received_quantity int NOT NULL,
    expected_delivery datetime NOT NULL,
    received_by_employee_id int NOT NULL,
    received_date datetime NOT NULL,
    price_per_unit decimal(10, 2) NOT NULL,
    notes text NOT NULL,
    CONSTRAINT part_shipments_pk PRIMARY KEY (id)
);
-- Table: parts
CREATE TABLE parts (
    id int NOT NULL,
    name nvarchar(128) NOT NULL,
    car_brand_id int NOT NULL,
    year int NOT NULL,
    is_second_hand bool NOT NULL,
    stock_quantity int NOT NULL,
    ordered_quantity int NOT NULL,
    price decimal(10, 2) NOT NULL,
    details text NOT NULL,
    CONSTRAINT parts_pk PRIMARY KEY (id)
);
-- Table: payment_method
CREATE TABLE payment_method (
    id int NOT NULL,
    name enum('cash', 'credit_card', 'bank_transfer', 'paypal') NOT NULL,
    CONSTRAINT payment_method_status_pk PRIMARY KEY (id)
);
-- Table: payment_status
CREATE TABLE payment_status (
    id int NOT NULL,
    status enum('paid', 'unpaid', 'refunded', 'failed') NOT NULL,
    CONSTRAINT payment_status_pk PRIMARY KEY (id)
);
-- Table: payments
CREATE TABLE payments (
    id int NOT NULL,
    order_id int NOT NULL,
    method_id int NOT NULL,
    payment_status_id int NOT NULL,
    amount decimal(10, 2) NOT NULL,
    payment_date datetime NOT NULL,
    CONSTRAINT payment_pk PRIMARY KEY (id)
);
-- Table: supplier
CREATE TABLE supplier (
    id int NOT NULL,
    company_name nvarchar(32) NOT NULL,
    contact_name nvarchar(32) NOT NULL,
    email nvarchar(32) NOT NULL,
    phone_number nvarchar(24) NOT NULL,
    address nvarchar(128) NOT NULL,
    city nvarchar(16) NOT NULL,
    region nvarchar(16) NOT NULL,
    country nvarchar(16) NOT NULL,
    postal_code nvarchar(10) NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (id)
);
-- Table: used_parts
CREATE TABLE used_parts (
    id int NOT NULL,
    order_id int NOT NULL,
    part_id int NOT NULL,
    used_at datetime NOT NULL,
    from_shipment_id int NOT NULL,
    quantity int NOT NULL,
    CONSTRAINT part_in_order_pk PRIMARY KEY (id)
);
-- foreign keys
-- Reference: bill_orders (table: bill)
ALTER TABLE bill
ADD CONSTRAINT bill_orders FOREIGN KEY bill_orders (order_id) REFERENCES orders (id);
-- Reference: car_car_brand (table: car)
ALTER TABLE car
ADD CONSTRAINT car_car_brand FOREIGN KEY car_car_brand (car_brand_id) REFERENCES car_brand (id);
-- Reference: car_customers (table: car)
ALTER TABLE car
ADD CONSTRAINT car_customers FOREIGN KEY car_customers (customer_id) REFERENCES customers (id);
-- Reference: mechanic_schedule_employees (table: mechanic_schedule)
ALTER TABLE mechanic_schedule
ADD CONSTRAINT mechanic_schedule_employees FOREIGN KEY mechanic_schedule_employees (mechanic_id) REFERENCES employees (id);
-- Reference: order_status_orders (table: order_status)
ALTER TABLE order_status
ADD CONSTRAINT order_status_orders FOREIGN KEY order_status_orders (order_id) REFERENCES orders (id);
-- Reference: orders_car (table: orders)
ALTER TABLE orders
ADD CONSTRAINT orders_car FOREIGN KEY orders_car (car_id) REFERENCES car (id);
-- Reference: orders_customers (table: orders)
ALTER TABLE orders
ADD CONSTRAINT orders_customers FOREIGN KEY orders_customers (customer_id) REFERENCES customers (id);
-- Reference: orders_employees (table: orders)
ALTER TABLE orders
ADD CONSTRAINT orders_employees FOREIGN KEY orders_employees (employee_id) REFERENCES employees (id);
-- Reference: part_in_order_orders (table: used_parts)
ALTER TABLE used_parts
ADD CONSTRAINT part_in_order_orders FOREIGN KEY part_in_order_orders (order_id) REFERENCES orders (id);
-- Reference: part_in_order_parts (table: used_parts)
ALTER TABLE used_parts
ADD CONSTRAINT part_in_order_parts FOREIGN KEY part_in_order_parts (part_id) REFERENCES parts (id);
-- Reference: part_shipments_employees (table: part_shipments)
ALTER TABLE part_shipments
ADD CONSTRAINT part_shipments_employees FOREIGN KEY part_shipments_employees (received_by_employee_id) REFERENCES employees (id);
-- Reference: part_shipments_parts (table: part_shipments)
ALTER TABLE part_shipments
ADD CONSTRAINT part_shipments_parts FOREIGN KEY part_shipments_parts (part_id) REFERENCES parts (id);
-- Reference: part_shipments_supplier (table: part_shipments)
ALTER TABLE part_shipments
ADD CONSTRAINT part_shipments_supplier FOREIGN KEY part_shipments_supplier (supplier_id) REFERENCES supplier (id);
-- Reference: parts_car_brand (table: parts)
ALTER TABLE parts
ADD CONSTRAINT parts_car_brand FOREIGN KEY parts_car_brand (car_brand_id) REFERENCES car_brand (id);
-- Reference: payment_orders (table: payments)
ALTER TABLE payments
ADD CONSTRAINT payment_orders FOREIGN KEY payment_orders (order_id) REFERENCES orders (id);
-- Reference: payments_payment_method (table: payments)
ALTER TABLE payments
ADD CONSTRAINT payments_payment_method FOREIGN KEY payments_payment_method (method_id) REFERENCES payment_method (id);
-- Reference: payments_payment_status (table: payments)
ALTER TABLE payments
ADD CONSTRAINT payments_payment_status FOREIGN KEY payments_payment_status (payment_status_id) REFERENCES payment_status (id);
-- End of file.