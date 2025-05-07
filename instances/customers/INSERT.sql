-- 일반 고객: 내국인, 회사원(일반)
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'user001', 'pass1234', 'Korean', 'Kim', 'Minji',
    '010-1234-5678', 'minji.kim@example.com', 'Seoul, South Korea',
    'Employee(General)', 'Samsung Electronics',
    'Korea Univ.', 'Lee Hyun'
);

-- 외국인 고객: 미국 국적, 아티스트
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'user002', 'securePass!', 'Foreigner(USA)', 'Smith', 'John',
    '+1-202-555-0173', 'john.smith@example.com', 'New York, USA',
    'Artist', 'Visual Artist',
    'Art Center NY', 'Emma Green'
);

-- 프리랜서 고객, 무추천
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'user003', 'freePass99', 'Korean', 'Park', 'Yuna',
    '010-7777-8888', 'yuna.freelance@gmail.com', 'Busan, South Korea',
    'Freelancer', 'UX Writer',
    NULL, NULL
);

-- 공무원 고객, 추천인 있음
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'user004', 'govi99$', 'Korean', 'Choi', 'Jisoo',
    '010-4321-8765', 'jisoo.choi@gov.kr', 'Daejeon, South Korea',
    'Public Official', 'Ministry of Education',
    'Gov. Training Institute', 'Kim Taehwan'
);

-- Influencer, 외국인
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'user005', 'influ3nce', 'Foreigner(France)', 'Dubois', 'Clara',
    '+33-1-23-45-67-89', 'clara.influencer@social.fr', 'Paris, France',
    'Influencer', 'YouTube (Travel)',
    'Social Marketing Group', 'Lee Hanna'
);

-- 무직, 추천인 없음
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'user006', 'n0jobman', 'Korean', 'Jung', 'Woohyuk',
    '010-5678-1234', 'woohyuk.jung@nomail.com', 'Incheon, South Korea',
    'Unemployed', 'N/A',
    NULL, NULL
);

-- 관리자 계정 (관리 목적)
INSERT INTO customers (
    id, password, nationality, lastname, firstname,
    phone, email, address,
    occupation_category, occupation_detail,
    recommender_affiliation, recommender_name
) VALUES (
    'admin001', 'Adm1n$trong!', 'Korean', 'Admin', 'Master',
    '000-0000-0000', 'admin@system.local', 'HQ Server Room',
    'Other', 'System Administrator',
    NULL, NULL
);
