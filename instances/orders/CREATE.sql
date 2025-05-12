CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,  -- 주문 ID
    membership_number VARCHAR(10),  -- NULL이면 비회원 주문
    nonmember_password VARCHAR(20),  -- 비회원 주문 시 비밀번호
    order_product VARCHAR(200) NOT NULL,  -- 주문 상품
    payment_status VARCHAR(20) NOT NULL CHECK (payment_status IN ('pending', 'accepted', 'cancelled', 'refunded')),  -- 결제 상태
    date_info JSONB NOT NULL,  -- 주문/승인/취소/환불 날짜/시간
    stay_date_range JSONB NOT NULL,  -- 출발일/도착일 (예: {"departure_date": "2025-05-01", "arrival_date": "2025-05-03"})
    reserver_name VARCHAR(100),
    reserver_birthdate VARCHAR(6),
    reserver_contact VARCHAR(30),
    reserver_email VARCHAR(100),
    order_details JSONB NOT NULL,  -- 숙박 인원, 요청사항, 기념일, 약관 동의, 추가 서비스 등
    price JSONB NOT NULL,  -- 가격 리스트
    coupons JSONB,  -- 쿠폰 리스트

    FOREIGN KEY (membership_number) REFERENCES customers (membership_number)
);
