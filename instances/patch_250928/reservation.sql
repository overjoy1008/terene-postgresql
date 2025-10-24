CREATE TABLE refund_policy (
    start_dday INT NOT NULL,
    end_dday INT NOT NULL,

    dvc_percent NUMERIC(5,2) NOT NULL, -- Discounted price with Vat, Customer
    svc_percent NUMERIC(5,2) NOT NULL, -- Service price with Vat, Customer
    dpc_percent NUMERIC(5,2) NOT NULL, -- Deposit with Vat, Customer
    x1c_percent NUMERIC(5,2), -- Extra category 1, Customer
    x2c_percent NUMERIC(5,2), -- Extra category 2, Customer
    x3c_percent NUMERIC(5,2), -- Extra category 3, Customer

    dva_percent NUMERIC(5,2) NOT NULL, -- Discounted price with Vat, Admin
    sva_percent NUMERIC(5,2) NOT NULL, -- Service price with Vat, Admin
    dpa_percent NUMERIC(5,2) NOT NULL, -- Deposit with Vat, Admin
    x1a_percent NUMERIC(5,2), -- Extra category 1, Admin
    x2a_percent NUMERIC(5,2), -- Extra category 2, Admin
    x3a_percent NUMERIC(5,2), -- Extra category 3, Admin

    PRIMARY KEY (start_dday, end_dday)
);

INSERT INTO refund_policy (start_dday, end_dday, dvc_percent, svc_percent, dpc_percent, x1c_percent, x2c_percent, x3c_percent, dva_percent, sva_percent, dpa_percent, x1a_percent, x2a_percent, x3a_percent) VALUES
(0, 1, 0, 0, 100, NULL, NULL, NULL, 100, 100, 100, NULL, NULL, NULL),
(2, 9, 0, 100, 100, NULL, NULL, NULL, 100, 100, 100, NULL, NULL, NULL),
(10, 14, 60, 100, 100, NULL, NULL, NULL, 100, 100, 100, NULL, NULL, NULL),
(15, 30, 80, 100, 100, NULL, NULL, NULL, 100, 100, 100, NULL, NULL, NULL),
(31, 9999, 100, 100, 100, NULL, NULL, NULL, 100, 100, 100, NULL, NULL, NULL);



CREATE TABLE additional_services (
    id VARCHAR(40) PRIMARY KEY,
    title VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(200) NOT NULL,

    available BOOLEAN NOT NULL DEFAULT FALSE,
     -- available이 false인 경우, 프론트엔드에서 선택 불가
    
    paid BOOLEAN NOT NULL,
    price NUMERIC(12) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    
    default_text VARCHAR(100) NOT NULL,
    default_allowed BOOLEAN NOT NULL DEFAULT FALSE,
    
    type VARCHAR(20) NOT NULL, -- CHECK (type IN ('fixed', 'proportional')
    
    show_change BOOLEAN,
    change_amount NUMERIC(12),
    
    manual_order NUMERIC,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO additional_services (id, title, description, available, paid, price, unit, default_text, default_allowed, type, show_change, change_amount, manual_order, created_at, updated_at) VALUES
('BBQGrill', 'BBQ 용품 준비', '1회 제공분 : 그릴 2장, 숯 2KG, 점화제 3개', TRUE, TRUE, 25000, '회', '1회', TRUE, 'proportional', NULL, NULL, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('BBQFood', 'BBQ 식재료 준비', '-', FALSE, TRUE, 20000, '인', '인원수', FALSE, 'proportional', NULL, NULL, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Stretch', '모닝 스트레칭 클래스', '전문강사와 함께 아침 8시부터 약 1시간 동안 야외 스트레칭 프로그램을 체험할 수 있습니다', FALSE, FALSE, 0, '인', '인원수', FALSE, 'proportional', NULL, NULL, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Catering', '케이터링 서비스', '-', FALSE, FALSE, 0, '인', '인원수', FALSE, 'proportional', NULL, NULL, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);



CREATE TABLE memberships (
    name VARCHAR(40) PRIMARY KEY,

    yearly_weekday INT NOT NULL,
    yearly_weekend INT NOT NULL,
    yearly_peak INT NOT NULL,
    
    month_limit INT NOT NULL
);

INSERT INTO memberships (name, yearly_weekday, yearly_weekend, yearly_peak, month_limit) VALUES
('Non-Member', 0, 0, 0, 2),
('TERENE 6', 4, 1, 1, 3),
('TERENE 9', 5, 2, 2, 6),
('TERENE 12', 7, 3, 2, 8),
('TERENE 24', 13, 6, 5, 12),
('All-Free', 9999, 9999, 9999, 9999);



CREATE TABLE settings (
    id VARCHAR(40) PRIMARY KEY,
    rule VARCHAR(200) NOT NULL,
    description VARCHAR(1000),

    type VARCHAR(20) NOT NULL DEFAULT 'boolean', -- CHECK (type IN ('boolean', 'numeric', 'text', 'selection')),
    
    boolean_setting BOOLEAN,
    
    numeric_setting NUMERIC(20),
    numeric_min NUMERIC(20),
    numeric_max NUMERIC(20),
    numberic_step NUMERIC(20),

    text_setting VARCHAR(200),

    selection_setting TEXT[],
    selection_default VARCHAR(200)
);

INSERT INTO settings (id, rule, description, type, boolean_setting, numeric_setting, numeric_min, numeric_max, numberic_step, text_setting, selection_setting, selection_default) VALUES
('DeadlineTime', '오늘 N시 전까지', NULL, 'text', NULL, NULL, NULL, NULL, NULL, '15:00', NULL, NULL),
('DeadlineDday', 'D+N일 예약 가능', NULL, 'numeric', NULL, 2, 1, 10, 1, NULL, NULL, NULL),
('OpenDate', '예약 가능일', NULL, 'text', NULL, NULL, NULL, NULL, NULL, '2025-07-08', NULL, NULL),
('CheckinTime', '입실 시간', NULL, 'text', NULL, NULL, NULL, NULL, NULL, '15:00', NULL, NULL),
('CheckoutTime', '퇴실 시간', NULL, 'text', NULL, NULL, NULL, NULL, NULL, '10:30', NULL, NULL),
('MaxStayDays', '최대 숙박 일수', NULL, 'numeric', NULL, 3, 1, 10, 1, NULL, NULL, NULL),
('ShowManagementContact', '지점 운영 연락처 표시', NULL, 'boolean', FALSE, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ShowManagementSefiPrice', '지점 운영 정산 가격 표시', NULL, 'boolean', FALSE, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ServerMaintenance', '서버 점검', '개발된 내용을 안전하게 적용하기 위해, 개발자와 관리자를 제외한 계정은 예약이 제한됩니다.', 'boolean', FALSE, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('DeveloperID', '개발자 계정', '서버 점검 시에도 예약이 가능한 개발자 계정입니다. 여러 개의 아이디를 콤마(,)로 구분하여 입력할 수 있습니다.', 'selection', NULL, NULL, NULL, NULL, NULL, NULL, ARRAY['U-98765432'], 'U-98765432');
