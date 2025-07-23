INSERT INTO coupon_definitions_250618 (
    coupon_definition_id, priority, name, description, discount_type,
    discount_value, scope, type, conditions_json, enabled
)
VALUES
-- TERENE 6
('CD-250717-0300-06wd0000', 1, 'WEEK DAYS 50%', 'TERENE 6 회원 평일 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 6","UNMU 6"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-06we0000', 1, 'WEEKEND 50%', 'TERENE 6 회원 주말 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 6","UNMU 6"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-06ps0000', 1, 'PEAK SEASON 50%', 'TERENE 6 회원 성수기 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 6","UNMU 6"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

-- TERENE 9
('CD-250717-0300-09wd0000', 1, 'WEEK DAYS 50%', 'TERENE 9 회원 평일 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 9","UNMU 9"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-09we0000', 1, 'WEEKEND 50%', 'TERENE 9 회원 주말 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 9","UNMU 9"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-09ps0000', 1, 'PEAK SEASON 50%', 'TERENE 9 회원 성수기 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 9","UNMU 9"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

-- TERENE 12
('CD-250717-0300-12wd0000', 1, 'WEEK DAYS 50%', 'TERENE 12 회원 평일 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 12","UNMU 12"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-12we0000', 1, 'WEEKEND 50%', 'TERENE 12 회원 주말 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 12","UNMU 12"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-12ps0000', 1, 'PEAK SEASON 50%', 'TERENE 12 회원 성수기 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 12","UNMU 12"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

-- TERENE 24
('CD-250717-0300-24wd0000', 1, 'WEEK DAYS 50%', 'TERENE 24 회원 평일 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekday","Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 24","UNMU 24"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-24we0000', 1, 'WEEKEND 50%', 'TERENE 24 회원 주말 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Weekend","Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 24","UNMU 24"]},{"type":"targetDays","min":1,"max":1}]', TRUE),

('CD-250717-0300-24ps0000', 1, 'PEAK SEASON 50%', 'TERENE 24 회원 성수기 50% 할인', 'percentage', 50, 'per_stay', 'membership',
 '[{"type":"seasonal","allowedCategories":["Peak-Weekday","Peak-Weekend"]},{"type":"membership","members":["TERENE 24","UNMU 24"]},{"type":"targetDays","min":1,"max":1}]', TRUE);
