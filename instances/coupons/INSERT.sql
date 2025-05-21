-- 1. 회원 할인
INSERT INTO coupons (
    id, priority, name, description,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, enabled
) VALUES (
    'member_discount_50', 1, 'UNMU 회원 50% 할인', '회원가 50% off',
    'percentage', 50, 'per_stay',
    'global', NULL, NULL,
    '[
        { "type": "membership", "members": ["UNMU 6", "UNMU 9", "UNMU 12", "UNMU 24"] }
    ]',
    TRUE
);

-- 2. Early Bird 20%
INSERT INTO coupons (
    id, priority, name, description,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, enabled
) VALUES (
    'early_bird_20', 2, '가오픈 기념 20% 할인', '가오픈 기념 20% off (25년 8월 31일까지)',
    'percentage', 20, 'per_stay',
    'global', NULL, NULL,
    '[
        { "type": "date", "endDate": "2025-08-31" }
    ]',
    TRUE
);

-- 3. 연박 2박 할인
INSERT INTO coupons (
    id, priority, name, description,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, enabled
) VALUES (
    'relay_discount_2days', 3, '연박 할인', '2박 예약 시 10% off',
    'percentage', 10, 'per_stay',
    'global', NULL, NULL,
    '[
        { "type": "relay", "min": 2, "max": 2 }
    ]',
    TRUE
);

-- 4. 연박 3박 이상 할인
INSERT INTO coupons (
    id, priority, name, description,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, enabled
) VALUES (
    'relay_discount_3days', 4, '연박 할인', '3박 이상 예약 시 10% off',
    'percentage', 10, 'per_stay',
    'global', NULL, NULL,
    '[
        { "type": "relay", "min": 3 }
    ]',
    TRUE
);




-- -- 2. Personal VIP 할인
-- INSERT INTO coupons (
--     id, name, description,
--     discount_type, discount_value, scope,
--     type, allowed_members, code,
--     conditions_json, enabled
-- ) VALUES (
--     'personal_vip_100k', 'VIP Personal Fixed Discount', 'VIP 혜택',
--     'fixed', 100000, 'per_stay',
--     'personal', ARRAY['U-12345678', 'A-00000001'], NULL,
--     '[]',
--     TRUE
-- );

-- 5. 코드 쿠폰: SUMMER25
INSERT INTO coupons (
    id, priority, name, description,
    discount_type, discount_value, scope,
    type, allowed_members, code,
    conditions_json, enabled
) VALUES (
    'code_summer25', 5, 'Summer Code 25%', '코드 할인 (SUMMER25)',
    'percentage', 25, 'per_stay',
    'code', NULL, 'SUMMER25',
    '[
        { "type": "date", "startDate": "2025-07-01", "endDate": "2025-09-01" },
        { "type": "seasonal", "allowedCategories": ["Weekend", "Peak-Weekend"] }
    ]',
    TRUE
);

-- -- 4. 가입 후 7일 이내 보너스
-- INSERT INTO coupons (
--     id, name, description,
--     discount_type, discount_value, scope,
--     type, allowed_members, code,
--     conditions_json, enabled
-- ) VALUES (
--     'signup_bonus', 'Signup Bonus', '가입 후 7일 이내 10% 할인',
--     'percentage', 10, 'per_day',
--     'global', NULL, NULL,
--     '[
--         { "type": "signup_within_days", "days": 7 }
--     ]',
--     FALSE
-- );

-- -- 5. 가격 조건 할인
-- INSERT INTO coupons (
--     id, name, description,
--     discount_type, discount_value, scope,
--     type, allowed_members, code,
--     conditions_json, enabled
-- ) VALUES (
--     'price_over_100', '100만원 이상 할인', '100만원 이상 구매 시 100000원 할인',
--     'fixed', 100000, 'per_stay',
--     'global', NULL, NULL,
--     '[
--         { "type": "minimum_price", "min": 1000000 }
--     ]',
--     FALSE
-- );

-- -- 6. 복합 조건
-- INSERT INTO coupons (
--     id, name, description,
--     discount_type, discount_value, scope,
--     type, allowed_members, code,
--     conditions_json, enabled
-- ) VALUES (
--     'unmu_12_weekend_12', 'UNMU 12 Weekend 12', 'UNMU 12 주말당 12만원씩 할인',
--     'percentage', 25, 'per_stay',
--     'global', NULL, NULL,
--     '[
--         { "type": "membership", "members": ["UNMU 12"] },
--         { "type": "signup_within_days", "days": 12 },
--         { "type": "seasonal", "allowedCategories": ["Weekend", "Peak-Weekend"], "startDate": "2025-07-01", "endDate": "2025-08-31" }
--     ]',
--     TRUE
-- );

-- -- 9. 할인 금액 제한 조건
-- INSERT INTO coupons (
--     id, name, description,
--     discount_type, discount_value, scope,
--     type, allowed_members, code,
--     conditions_json, enabled
-- ) VALUES (
--     'applied_discount_limit', '비회원 최대 100만원 할인', '비회원 최대 100만원까지 할인',
--     'fixed', 400000, 'per_day',
--     'global', NULL, NULL,
--     '[
--         { "type": "applied_discount", "max": 1000000 }
--     ]',
--     TRUE
-- );
