CREATE TABLE customers (
    id VARCHAR(50) PRIMARY KEY NOT NULL,
    password VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL CHECK (
        nationality = 'Korean' OR nationality LIKE 'Foreigner(%'
    ),
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    occupation_category VARCHAR(30) CHECK (
        occupation_category IN (
            'Employee(General)',
            'Employee(Executive)',
            'Professional',
            'Public Official',
            'Artist',
            'Influencer',
            'Freelancer',
            'Unemployed',
            'Other'
        )
    ),
    occupation_detail VARCHAR(100),
    recommender_affiliation VARCHAR(100),
    recommender_name VARCHAR(50)
);
