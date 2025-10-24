CREATE TABLE locations (
    name VARCHAR(200) PRIMARY KEY,
    name_variant VARCHAR(200),
    description VARCHAR(1000),

    address VARCHAR(200),

    phone VARCHAR(30)
);

INSERT INTO locations (name, name_variant, description, address, phone) VALUES
('UNMU', '운무', NULL, '강원도 화천군 하남면 호수길 206-31 (원천리 136-40)', NULL);



CREATE TABLE admin_contacts (
    admin_id VARCHAR(40) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(30),
    email VARCHAR(100),

    reservation_alert BOOLEAN NOT NULL DEFAULT TRUE,
    checkinout_alert BOOLEAN NOT NULL DEFAULT TRUE,

    quiet_mode BOOLEAN DEFAULT FALSE,
     -- quiet_mode가 true인 경우, 해당 관리자는 알림을 받지 않음

    manual_order NUMERIC,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admin_contacts (admin_id, name, phone, email, reservation_alert, checkinout_alert, quiet_mode, manual_order, created_at, updated_at) VALUES
('A1548', 'Admin 1', '010-2889-1548', NULL, TRUE, TRUE, FALSE, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('A4590', 'Admin 2', '010-7499-4590', NULL, FALSE, TRUE, FALSE, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('ARESV', 'Admin 3', NULL, 'reserve@terene.kr', TRUE, FALSE, FALSE, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('A7802', '이다교', '010-2449-7802', NULL, FALSE, FALSE, TRUE, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);



CREATE TABLE employees (
    id VARCHAR(40) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    
    phone VARCHAR(30),
    email VARCHAR(100),

    location VARCHAR(200), -- REFERENCES locations(name),

    headquaters BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE attendance (
    date VARCHAR(20) NOT NULL,
    location VARCHAR(200) NOT NULL, -- REFERENCES locations(name),
    employee_id VARCHAR(40) NOT NULL, -- REFERENCES employees(id),

    attend BOOLEAN NOT NULL DEFAULT FALSE,
    time_interval VARCHAR(40),

    PRIMARY KEY (date, location, employee_id)
);

CREATE TABLE managements (
    date VARCHAR(20) NOT NULL,
    location VARCHAR(200) NOT NULL, -- REFERENCES locations(name),
    sefi_price NUMERIC, -- Settlement Final Price

    attendace_remarks TEXT[],

    PRIMARY KEY (date, location)
);
