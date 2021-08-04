
-- sollte hier in irgendeinem kommentar
-- oder eintrag oder etc. pp. der stanzel
-- ohne e geschrieben werden so soll
-- mir sofort und auf ewig verziehen sein
-- servus


INSERT INTO seat (
    seat_id,
    seat_row,
    seat_number,
    is_smoker
) VALUES (
    3,
    'Z',
    2,
    1
);

UPDATE seat
SET
    flight_class_id = 'Economy'
WHERE
    seat_id = 2;

UPDATE seat
SET
    flight_class_id = 'Economy'
WHERE
    seat_id = 3;

UPDATE seat
SET
    flight_class_id = 'Economy'
WHERE
    seat_id = 1;
    
-- alle auch der stanzel nach london mit der 737 (Stanzel Raucher!)    
UPDATE seat
SET
    aircraft_id = 1
WHERE
    seat_id < 4;


-- der stanzel bekommt seinen raucherplatz auch 
-- nach dubai aber in einer anderen maschine
-- jetzt eine 787

INSERT INTO seat (
    seat_id,
    seat_row,
    seat_number,
    is_smoker,
    flight_class_id,
    aircraft_id
) VALUES (
    4,
    'X',
    3,
    1,
    'Economy',
    2
);

INSERT INTO aircraft_type (
    aircraft_type_id,
    type_ident,
    manufacturer,
    range_in_miles
) VALUES (
    'A-737',
    'AAA-75654-C',
    'BOEING',
    10320
);

INSERT INTO aircraft_type (
    aircraft_type_id,
    type_ident,
    manufacturer,
    range_in_miles
) VALUES (
    'A-787',
    'AGV-74-C',
    'BOEING',
    17000
);
commit;
INSERT INTO aircraft_type (
    aircraft_type_id,
    type_ident,
    manufacturer,
    range_in_miles
) VALUES (
    'A-737 max8',
    'AFT-12-C',
    'BOEING',
    20000
);

COMMIT;

INSERT INTO aircraft (
    aircraft_id,
    internat_reg_number,
    aircraft_name,
    date_of_service_entry,
    aircraft_type_id,
    airline_code
) VALUES (
    1,
    'ZE-734-GE',
    'Tin Lizzy',
    '11.08.66',
    'A-737',
    'PA'
);

INSERT INTO aircraft (
    aircraft_id,
    internat_reg_number,
    aircraft_name,
    date_of_service_entry,
    aircraft_type_id,
    airline_code
) VALUES (
    2,
    'OP-7w4-LP',
    'Lauca Tok',
    '11.08.90',
    'A-787',
    'PA'
);

INSERT INTO aircraft (
    aircraft_id,
    internat_reg_number,
    aircraft_name,
    date_of_service_entry,
    aircraft_type_id,
    airline_code
) VALUES (
    3,
    'Go-Go_Hodschi_Minh',
    'Come Down Now',
    '11.08.90',
    'A-737 max8',
    'PA'
);

INSERT INTO departure (
    departure_id,
    departure_scheduled,
    departure_actual,
    airport_name
) VALUES (
    2,
    '12.08.21 16:00',
    '12.08.21 17:00',
    'Heathrow Airport'
);

INSERT INTO departure (
    departure_id,
    departure_scheduled,
    departure_actual,
    airport_name
) VALUES (
    3,
    '13.08.21 16:00',
    '13.08.21 16:00',
    'John F. Kennedy'
);

INSERT INTO airline (
    airline_code,
    airline_name,
    airline_headquarter
) VALUES (
    'PA',
    'PanAm',
    'Washington D.C.'
);

INSERT INTO airport (
    airport_name,
    city,
    latitude,
    longitude,
    country,
    aircraft_capacity
) VALUES (
    'Josef Schwaiger',
    'Stauffn',
    009965,
    234411,
    'Vilpern',
    3000
);

INSERT INTO airport (
    airport_name,
    city,
    latitude,
    longitude,
    country,
    aircraft_capacity,
    airport_code
) VALUES (
    'Heathrow Airport',
    'London',
    009965,
    234411,
    'Great Britain',
    5000,
    'LHR'
);

INSERT INTO airport (
    airport_name,
    city,
    latitude,
    longitude,
    country,
    aircraft_capacity,
    airport_code
) VALUES (
    'John F. Kennedy',
    'New York',
    345243,
    675342,
    'United States',
    15000,
    'JFK'
);

INSERT INTO airport (
    airport_name,
    city,
    latitude,
    longitude,
    country,
    aircraft_capacity,
    airport_code
) VALUES (
    'John F. Kennedy',
    'New York',
    345243,
    675342,
    'United States',
    15000,
    'JFK'
);

INSERT INTO airport (
    airport_name,
    city,
    latitude,
    longitude,
    country,
    aircraft_capacity,
    airport_code
) VALUES (
    'Dubai International Airport',
    'Dubai',
    636787,
    848774,
    'United Arab Emirates',
    1000,
    'DXB'
);

COMMIT;

INSERT INTO arrival (
    arrival_id,
    arrival_scheduled,
    arrival_actual,
    airport_name
) VALUES (
    1,
    '11.08.21 23:00:00',
    '11.08.21 23:00:00',
    'Josef Schwaiger'
);

INSERT INTO arrival (
    arrival_id,
    arrival_scheduled,
    arrival_actual,
    airport_name
) VALUES (
    2,
    '13.08.21 23:00:00',
    '13.08.21 23:00:00',
    'Heathrow Airport'
);

INSERT INTO arrival (
    arrival_id,
    arrival_scheduled,
    arrival_actual,
    airport_name
) VALUES (
    3,
    '14.08.21 23:00:00',
    '14.08.21 23:00:00',
    'Dubai International Airport'
);

INSERT INTO flight (
    flight_number,
    passenger_flight
) VALUES (
    'AAA 002',
    3
);

INSERT INTO flight_departure (
    id,
    flight_number,
    departure_id
) VALUES (
    2,
    'AAA 002',
    3
);
INSERT INTO flight_arrival (
    id,
    flight_number,
    arrival_id
) VALUES (
    2,
    'AAA 002',
    2
);


INSERT INTO flight (
    flight_number,
    passenger_flight
) VALUES (
    'AAA 003',
    3
);

INSERT INTO flight_departure (
    id,
    flight_number,
    departure_id
) VALUES (
    3,
    'AAA 003',
    2
);
INSERT INTO flight_arrival (
    id,
    flight_number,
    arrival_id
) VALUES (
    3,
    'AAA 003',
    3
);





COMMIT;

INSERT INTO departure (
    departure_id,
    departure_scheduled,
    departure_actual,
    airport_name
) VALUES (
    1,
    '11.08.21 23:00:00',
    '11.08.21 23:00:00',
    'Josef Schwaiger'
);

INSERT INTO distance (
    distance_id,
    flight_miles,
    aircraft_id,
    departure_id,
    arrival_id
) VALUES (
    1,
    4320,
    1,
    1,
    1
);

INSERT INTO passenger_flight (
    id,
    passenger_number,
    flight_number
) VALUES (
    3,
    3,
    'AAA 001'
);

UPDATE passenger_flight
SET
    id = 2,
    passenger_number = 2,
    flight_number = 'AAA 001';

INSERT INTO flight (
    flight_number,
    passenger_flight
) VALUES (
    'AAA 001',
    1
);

INSERT INTO passenger (
    passenger_number,
    first_name,
    last_name,
    title,
    salutation,
    passenger_flight
) VALUES (
    3,
    'Da',
    'Stanzl eXtreme',
    'Prof.Data',
    'Mr.',
    1
);

INSERT INTO flight_departure (
    id,
    flight_number,
    departure_id
) VALUES (
    1,
    'AAA 001',
    1
);

COMMIT;

INSERT INTO flight_class (
    flight_class_id,
    seats_booked,
    seats_available,
    saet_max
) VALUES (
    'Economy',
    10,
    190,
    200
);

INSERT INTO flight_class (
    flight_class_id,
    seats_booked,
    seats_available,
    saet_max
) VALUES (
    'Business',
    10,
    20,
    30
);
commit;

INSERT INTO seating_plan (
    plan_id,
    aircraft_type_id,
    flight_class_id
) VALUES (
    1,
    'A-737',
    'Economy'
);

INSERT INTO seating_plan (
    plan_id,
    aircraft_type_id,
    flight_class_id
) VALUES (
    2,
    'A-737',
    'Business'
);

INSERT INTO seating_plan (
    plan_id,
    aircraft_type_id,
    flight_class_id
) VALUES (
    3,
    'A-787',
    'Business'
);



INSERT INTO flight_arrival (
    id,
    flight_number,
    arrival_id
) VALUES (
    1,
    'AAA 001',
    1
);

INSERT INTO ticket (
    ticket_number,
    date_of_issue,
    price,
    currency,
    flight_number,
    passenger_number
) VALUES (
    'XXA-000001',
    '01.08.21',
    423,
    'Dollar',
    'AAA 001',
    1
);

INSERT INTO ticket (
    ticket_number,
    date_of_issue,
    price,
    currency,
    flight_number,
    passenger_number
) VALUES (
    'XXA-000003',
    '07.02.21',
    20,
    'Dollar',
    'AAA 001',
    3
);

INSERT INTO boarding_card (
    boarding_card_id,
    seat_id,
    ticket_number
) VALUES (
    3,
    3,
    'XXA-000003'
);

UPDATE passenger
SET
    last_name = 'Stanzel der Geilste',  --stanzl besteht drauf
    title = 'God of DB'
WHERE
    passenger_number = 3;

COMMIT;

UPDATE flight_departure
SET
    departure_id = 3      --stanzl 1. flug departure new york
WHERE
    id = 1;

UPDATE flight_departure
SET
    departure_id = 2     --stanzl 2. flug dep heathrow
WHERE
    id = 2;

UPDATE flight_arrival
SET
    arrival_id = 2       --stanzl 1,flug arrival heathrow
WHERE
    id = 1;

UPDATE flight_arrival
SET
    arrival_id = 3       --stanzl 2.flug arrival dubai
WHERE
    id = 2;
    
    
-- nur der stanzl fliegt weiter nach dubai alle anderen bleiben in London    
INSERT INTO passenger_flight (
    id,
    passenger_number,
    flight_number
) VALUES (
    4,
    3,
    'AAA 002'
);


--der stanzl kriegt natürlich a sei ticket na dubai
INSERT INTO ticket (
    ticket_number,
    date_of_issue,
    price,
    currency,
    flight_number,
    passenger_number
) VALUES (
    'XXA-000004',
    '08.03.21',
    70,
    'Dollar',
    'AAA 002',
    3
);

commit;
    
SELECT
    *
FROM
    passenger;