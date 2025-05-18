CREATE TABLE days (
    date VARCHAR(20) PRIMARY KEY,
    category VARCHAR(20) CHECK (
        category IN (
            'Weekday',
            'Weekend',
            'Peak-Weekday',
            'Peak-Weekend'
        )
    ),
    is_holiday BOOLEAN NOT NULL,
    is_occupied BOOLEAN NOT NULL,
    occupied_order_id VARCHAR(20),
    FOREIGN KEY (occupied_order_id) REFERENCES orders(order_id)
);
