CREATE TABLE coupon_definitions_250618 (
    coupon_definition_id VARCHAR(23) PRIMARY KEY,  -- 쿠폰 정의 ID (예시: CD-250527-1143-00000000)

    priority INTEGER,  -- 우선순위 (NULL이면 우선순위 없음)
    name VARCHAR(100) NOT NULL,  -- 쿠폰 명칭
    description VARCHAR(200) NOT NULL,  -- 사용자 표시 설명
    discount_type VARCHAR(20) NOT NULL CHECK (
        discount_type IN ('percentage', 'fixed')
    ),  -- 할인 방식
    discount_value NUMERIC NOT NULL,  -- 할인 수치 (예: 10%, 10000원)
    scope VARCHAR(20) NOT NULL CHECK (
        scope IN ('per_stay', 'per_day')
    ),  -- 할인 적용 범위 (percentage 혹은 membership에서는 비활성화 필수)
    type VARCHAR(20) DEFAULT 'global' CHECK (
        type IN ('global', 'code', 'membership')
    ),  -- 쿠폰 타입 (membership은 쿠폰 당 하루에만 적용 가능)
    conditions_json JSONB,  -- 쿠폰 조건
    -- 예시:
    -- [
    --   { "type": "date", "startDate": "2025-07-01", "endDate": "2025-09-01" },
    --   { "type": "seasonal", "allowedCategories": ["Weekend", "Peak-Weekend"] },
    --   { "type": "membership", "members": ["TERENE 6", "UNMU 6"] }
    --   { "type": "targetDays", "min": 1, "max": 1 }
    -- ]
    enabled BOOLEAN NOT NULL DEFAULT FALSE  -- 쿠폰 사용 가능 여부
);
