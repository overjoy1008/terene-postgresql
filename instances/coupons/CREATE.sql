CREATE TABLE coupons (
    id VARCHAR(50) PRIMARY KEY,                        -- 쿠폰 ID (예: early_bird_20)
    name VARCHAR(100) NOT NULL,                        -- 쿠폰 명칭 (예: Early Bird 20)
    description TEXT,                                  -- 설명 (NULL 허용)
    display VARCHAR(200) NOT NULL,                     -- 사용자에게 표시될 문구
    discount_type VARCHAR(20) NOT NULL CHECK (
        discount_type IN ('percentage', 'fixed')
    ),                                                 -- 할인 방식 (percent/fixed 구분)
    discount_value NUMERIC NOT NULL,                   -- 할인 수치 (예: 20 or 100000)
    scope VARCHAR(20) NOT NULL CHECK (
        scope IN ('per_stay', 'per_day')
    ),                                                 -- 할인 범위

    type VARCHAR(20) DEFAULT 'global' CHECK (
        type IN ('global', 'personal', 'code')
    ),                                                 -- 쿠폰 타입 (기본은 global)

    allowed_members TEXT[],                            -- 허용된 멤버십 번호들 (type이 personal일 때 사용)
    code VARCHAR(50),                                  -- 사용자 입력 쿠폰 코드 (type이 code일 때 사용)

    conditions_json JSONB,                             -- 조건 정보들 (날짜, 멤버십 등 복합 조건)
    start_date VARCHAR(10),                            -- YYYY-MM-DD
    end_date VARCHAR(10),                              -- YYYY-MM-DD

    enabled BOOLEAN DEFAULT FALSE,  -- ✅ 추가된 필드
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
