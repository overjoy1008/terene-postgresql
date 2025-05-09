-- 1. Early Bird 20%
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'early_bird_20', 'Early Bird 20', '8월 말까지 예약 시 20% 할인', '가오픈 기념 20% off (25년 8월 31일까지)',
    'percentage', 20, 'per_stay',
    'global', NULL, NULL,
    '{"type": "date", "endDate": "2025-08-31"}', NULL, '2025-08-31'
);

-- 2. Personal VIP 할인
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'personal_vip_100k', 'VIP Personal Fixed Discount', 'VIP 고객 전용 10만원 할인', 'VIP 혜택',
    'fixed', 100000, 'per_stay',
    'personal', ARRAY['U-12345678', 'U-00001111'], NULL,
    '{"type": "personal"}', NULL, NULL
);

-- 3. 코드 쿠폰: SUMMER25
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'code_summer25', 'Summer Code 25%', '쿠폰코드 입력 시 25% 할인', '코드 할인 (SUMMER25)',
    'percentage', 25, 'per_stay',
    'code', NULL, 'SUMMER25',
    '{"type": "date", "endDate": "2025-09-01"}', NULL, '2025-09-01'
);

-- 4. UNMU24 고정 할인
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'unmu24_fixed', 'UNMU 24 할인', 'UNMU 24 회원은 100,000원 할인', 'UNMU 24 회원 특가',
    'fixed', 100000, 'per_stay',
    'global', NULL, NULL,
    '{"type": "membership", "members": ["UNMU 24"]}', NULL, NULL
);

-- 5. 가입 후 7일 이내 보너스
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'signup_bonus', 'Signup Bonus', '가입 후 7일 이내 10% 할인', '',
    'percentage', 10, 'per_day',
    'global', NULL, NULL,
    '{"type": "signup_within_days", "days": 7}', NULL, NULL
);

-- 6. 가격 조건 할인
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'price_over_10000', '만원 이상 할인', '1만원 이상 구매 시 1000원 할인', '',
    'fixed', 1000, 'per_stay',
    'global', NULL, NULL,
    '{"type": "price_condition", "min": 10000}', NULL, NULL
);

-- 7. 여름 성수기 주말 할인
INSERT INTO coupons (
    id, name, description, display,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, start_date, end_date
) VALUES (
    'summer_weekend_15', '여름 성수기 주말 15%', '여름(7~8월) 성수기 주말에는 15% 할인', '여름 성수기 이벤트 15% off',
    'percentage', 15, 'per_day',
    'global', NULL, NULL,
    '{
        "type": "seasonal",
        "allowedCategories": ["Peak-Weekend"],
        "startDate": "2025-07-01",
        "endDate": "2025-08-31"
    }',
    '2025-07-01', '2025-08-31'
);
