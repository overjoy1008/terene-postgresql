INSERT INTO coupon_definitions_250618 (
    coupon_definition_id, name, description, discount_type,
    discount_value, scope, counter, type, conditions_json,
    validity_type, validity_value, refillable, enabled
)
VALUES
-- TERENE 6
('CD-250717-0300-06wd0000', '평일 _TERENE 회원 할인', '평일 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 6","UNMU 6"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-06we0000', '주말 _TERENE 회원 할인', '주말 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 6","UNMU 6"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-06ps0000', '성수기 _TERENE 회원 할인', '성수기 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 6","UNMU 6"]}]',
 'year', '1', TRUE, TRUE),

-- TERENE 9
('CD-250717-0300-09wd0000', '평일 _TERENE 회원 할인', '평일 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 9","UNMU 9"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-09we0000', '주말 _TERENE 회원 할인', '주말 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 9","UNMU 9"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-09ps0000', '성수기 _TERENE 회원 할인', '성수기 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 9","UNMU 9"]}]',
 'year', '1', TRUE, TRUE),

-- TERENE 12
('CD-250717-0300-12wd0000', '평일 _TERENE 회원 할인', '평일 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 12","UNMU 12"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-12we0000', '주말 _TERENE 회원 할인', '주말 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 12","UNMU 12"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-12ps0000', '성수기 _TERENE 회원 할인', '성수기 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 12","UNMU 12"]}]',
 'year', '1', TRUE, TRUE),

-- TERENE 24
('CD-250717-0300-24wd0000', '평일 _TERENE 회원 할인', '평일 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 24","UNMU 24"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-24we0000', '주말 _TERENE 회원 할인', '주말 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 24","UNMU 24"]}]',
 'year', '1', TRUE, TRUE),

('CD-250717-0300-24ps0000', '성수기 _TERENE 회원 할인', '성수기 _TERENE 회원 50% 할인', 'percentage', 50, 1, 1, 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 24","UNMU 24"]}]',
 'year', '1', TRUE, TRUE);
