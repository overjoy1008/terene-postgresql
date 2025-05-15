-- 1. 법인 회원 (ADMIN)
INSERT INTO customers (
    membership_number, id, password,
    name_kor, name_eng,
    is_personal, business_registration_number,
    contact_person_name, contact_person_phone,
    address, phone, email,
    membership_grade,
    owned_mileage, signup_date, used_coupons, remarks
) VALUES (
    'A-00000001', 'vaadd', 'vaadd',
    '바드건축사사무소', 'VAADD architects',
    FALSE, '463-88-02624',
    '오기원 / 대표', '010-2889-1548',
    '서울특별시 마포구 독막로15길 3-13, 5층', '02-6952-1548', 'vaadd@vaadd.kr',
    'All-Free',
    100000, NULL, ARRAY[]::TEXT[], ARRAY[]::TEXT[]
);

-- 2. 개인 회원 1 (오기원)
INSERT INTO customers (
    membership_number, id, password,
    name_kor, name_eng,
    is_personal, birthdate, gender,
    contact_person_name, contact_person_phone,
    address, phone, email,
    membership_grade,
    owned_mileage, signup_date, used_coupons, remarks
) VALUES (
    'U-12345678', 'geewon_oh', 'password111',
    '오기원', 'GEEWON OH',
    TRUE, '19870212', 'Male',
    '오기원 / 대표', '010-2889-1548',
    '서울특별시 마포구 독막로15길 3-13, 5층', '010-2889-1548', 'ogw@vaadd.kr',
    'UNMU 24',
    5000, '2025-05-08', ARRAY[]::TEXT[], ARRAY[]::TEXT[]
);

-- 3. 개인 회원 2 (김민수)
INSERT INTO customers (
    membership_number, id, password,
    name_kor, name_eng,
    is_personal, birthdate, gender,
    address, phone, email,
    membership_grade,
    owned_mileage, signup_date, used_coupons, remarks
) VALUES (
    'U-22222222', 'minsu_kim', 'password222',
    '김민수', 'MINSOO KIM',
    TRUE, '19900420', 'Male',
    '서울특별시 종로구 세종대로 1', '010-1234-5678', 'minsu0420@example.com',
    'UNMU 12',
    1500, '2025-05-10', ARRAY[]::TEXT[], ARRAY[]::TEXT[]
);

-- 4. 개인 회원 3 (이수지)
INSERT INTO customers (
    membership_number, id, password,
    name_kor, name_eng,
    is_personal, birthdate, gender,
    address, phone, email,
    membership_grade,
    owned_mileage, signup_date, used_coupons, remarks
) VALUES (
    'U-33333333', 'sooji_lee', 'password333',
    '이수지', 'SOOJI LEE',
    TRUE, '19920305', 'Female',
    '경기도 성남시 분당구 정자일로 15', '010-5678-1234', 'sooji0305@example.com',
    'UNMU 9',
    0, '2025-05-14', ARRAY[]::TEXT[], ARRAY[]::TEXT[]
);

-- 5. 개인 회원 4 (정하늘)
INSERT INTO customers (
    membership_number, id, password,
    name_kor, name_eng,
    is_personal, birthdate, gender,
    address, phone, email,
    membership_grade,
    owned_mileage, signup_date, used_coupons, remarks
) VALUES (
    'U-44444444', 'skyjung', 'password444',
    '정하늘', 'HANEUL JUNG',
    TRUE, '19950812', 'Female',
    '부산광역시 수영구 남천동 101', '010-0000-1111', 'haneul0812@hanmail.net',
    'UNMU 6',
    0, NULL, ARRAY[]::TEXT[], ARRAY[]::TEXT[]
);

-- 6. 개인 회원 5 (박지훈)
INSERT INTO customers (
    membership_number, id, password,
    name_kor, name_eng,
    is_personal, birthdate, gender,
    address, phone, email,
    membership_grade,
    owned_mileage, signup_date, used_coupons, remarks
) VALUES (
    'U-55555555', 'jihoon_park', 'password555',
    '박지훈', 'JIHUN PARK',
    TRUE, '19880101', 'Male',
    '대전광역시 유성구 궁동 123', '010-9876-5432', 'jeehun0101@naver.com',
    'Non-Member',
    0, NULL, ARRAY[]::TEXT[], ARRAY[]::TEXT[]
);
