-- 1. 회원 주문
INSERT INTO orders (
    order_id,
    membership_number,
    nonmember_password,
    order_product,
    payment_status,
    date_info,
    stay_date_range,
    reserver_name,
    reserver_birthdate,
    reserver_contact,
    reserver_email,
    order_details,
    price,
    coupons
) VALUES (
    'O-250512-00001273',
    'U-44444444',
    NULL,
    'UNMU',
    'accepted',
    '{
        "order_datetime": "2025-05-12T10:30:00",
        "approval_datetime": "2025-05-12T11:00:00",
        "cancellation_datetime": null,
        "refund_datetime": null
    }',
    '{
        "departure_date": "2025-06-15",
        "arrival_date": "2025-06-17"
    }',
    '정하늘',
    '950812',
    '010-0000-1111',
    'haneul0812@hanmail.net',
    '{
        "number_of_guests": { "adults": 2, "children": 0 },
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
    }',
    '{
        "initialPrice": 2000000,
        "discountedPrice": 1600000,
        "additionalPrice": 40000,
        "integratedPrice": 1640000,
        "fianlPrice": 1940000
    }',
    '[
        { "coupon_id": "early_bird_20", "coupon_name": "Early Bird 20%", "amount": 400000 }
    ]'
);

-- 2. 비회원 주문
INSERT INTO orders (
    order_id,
    membership_number,
    nonmember_password,
    order_product,
    payment_status,
    date_info,
    stay_date_range,
    reserver_name,
    reserver_birthdate,
    reserver_contact,
    reserver_email,
    order_details,
    price,
    coupons
) VALUES (
    'O-250513-00001274',
    NULL,
    'password123',
    'UNMU',
    'pending',
    '{
        "order_datetime": "2025-05-13T14:00:00",
        "approval_datetime": null,
        "cancellation_datetime": null,
        "refund_datetime": null
    }',
    '{
        "departure_date": "2025-06-20",
        "arrival_date": "2025-06-22"
    }',
    '김철수',
    '850505',
    '010-9876-5432',
    'chskim0505@gmail.com',
    '{
        "number_of_guests": { "adults": 2, "children": 2 },
        "special_requests": null,
        "anniversary": null,
        "terms_agreement": {
            "facility_policy": true,
            "cancellation_policy": true,
            "privacy_policy": true,
            "marketing_consent": false
        },
        "additional_services": []        
    }',
    '{
        "initialPrice": 2500000,
        "discountedPrice": 2500000,
        "additionalPrice": 0,
        "integratedPrice": 2500000,
        "fianlPrice": 2800000
    }',
    NULL
);
