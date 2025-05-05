CREATE TABLE holidays (
    date DATE PRIMARY KEY,
    category TEXT CHECK (
        category IN (
            'Weekday',
            'Weekend',
            'Peak-Weekday',
            'Peak-Weekend'
        )
    )
);
