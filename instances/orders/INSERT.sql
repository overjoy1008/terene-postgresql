INSERT INTO orders (
    order_id,
    membership_number,
    order_product,
    start_date,
    end_date,
    reserver_name,
    reserver_birthdate,
    reserver_contact,
    reserver_email,
    payment_status,
    payment_timeline,
    stay_status,
    stay_timeline,
    adult,
    child,
    order_details,
    final_price,
    receipt,
    coupons
) VALUES (
    'O-250512-00001273',
    'U-44444444',
    'UNMU',
    '2025-06-15',
    '2025-06-17',
    '정하늘',
    '950812',
    '010-0000-1111',
    'haneul0812@hanmail.net',
    'accepted',
    '{
        "order_datetime": "2025-05-12T10:30:00",
        "approval_datetime": "2025-05-12T11:00:00",
        "cancellation_datetime": null,
        "refund_datetime": null
    }'::jsonb,
    'before_checkin',
    '{
        "checkin_datetime": null,
        "checkout_datetime": null
    }'::jsonb,
    2,
    0,
    '{
        "special_requests": "창가 자리 요청",
        "anniversary": { "type": "birthday", "value": "6월 16일 저의 남자친구(동훈)의 30번쨰 생일축하" },
        "terms_agreement": {
            "facility_policy": true,
            "cancellation_policy": true,
            "privacy_policy": true,
            "marketing_consent": true
        },
        "additional_services": [
            { "name": "BbqGrill", "value": true },
            { "name": "BbqFood", "value": 2 }
        ]
    }'::jsonb,
    2104000,
    '{
        "initialPrice": 2000000,
        "discountedPrice": 1600000,
        "additionalPrice": 40000,
        "integratedPrice": 1640000,
        "vatPrice": 164000,
        "finalPrice": 2104000
    }'::jsonb,
    '[
        { "coupon_id": "early_bird_20", "coupon_name": "Early Bird 20%", "amount": 400000 }
    ]'::jsonb
);

INSERT INTO orders (
    order_id,
    membership_number,
    order_product,
    start_date,
    end_date,
    reserver_name,
    reserver_birthdate,
    reserver_contact,
    reserver_email,
    payment_status,
    payment_timeline,
    stay_status,
    stay_timeline,
    adult,
    child,
    order_details,
    final_price,
    receipt,
    coupons
) VALUES (
    'O-250513-00001274',
    NULL,
    'UNMU',
    '2025-06-20',
    '2025-06-22',
    '김철수',
    '850505',
    '010-9876-5432',
    'chskim0505@gmail.com',
    'pending',
    '{
        "order_datetime": "2025-05-13T14:00:00",
        "approval_datetime": null,
        "cancellation_datetime": null,
        "refund_datetime": null
    }'::jsonb,
    'before_checkin',
    '{
        "checkin_datetime": null,
        "checkout_datetime": null
    }'::jsonb,
    2,
    2,
    '{
        "special_requests": null,
        "anniversary": null,
        "terms_agreement": {
            "facility_policy": true,
            "cancellation_policy": true,
            "privacy_policy": true,
            "marketing_consent": false
        },
        "additional_services": []
    }'::jsonb,
    3050000,
    '{
        "initialPrice": 2500000,
        "discountedPrice": 2500000,
        "additionalPrice": 0,
        "integratedPrice": 2500000,
        """: 25000"0,
        "finalPrice": 3050000
    }'::jsonb,
    NULL
);
