CREATE TABLE seat (
    seat_id     NUMBER(6) NOT NULL PRIMARY KEY,
    seat_row    CHAR(2),
    seat_number NUMBER(3),
    is_smoker   NUMBER(1) DEFAULT '0'
);

alter table seat add ( flight_class_id varchar(32) references flight_class(flight_class_id)); 

commit;


CREATE TABLE aircraft_type (
    aircraft_type_id VARCHAR(32) NOT NULL PRIMARY KEY,
    type_ident       VARCHAR(32),
    manufacturer     VARCHAR(32),
    range_in_miles   NUMBER(10)
);

CREATE TABLE airline (
    airline_code        VARCHAR(32) NOT NULL PRIMARY KEY,
    airline_name        VARCHAR(32),
    airline_headquarter VARCHAR(32)
);

CREATE TABLE airport (
    airport_name      VARCHAR(32) NOT NULL PRIMARY KEY,
    city              VARCHAR(32),
    latitude          NUMBER(6),
    longitude         NUMBER(6),
    country           VARCHAR(32),
    aircraft_capacity NUMBER(6)
);

CREATE TABLE arrival (
    arrival_id        NUMBER(6, 0) PRIMARY KEY,
    arrival_scheduled DATE,
    arrival_actual    DATE,
    airport_name      VARCHAR(32) NOT NULL
        REFERENCES airport ( airport_name )
);



-- über airport_name und flight_number bekomme ich mit select arrival 
-- departure

CREATE TABLE flight_plan (
    id INT NOT NULL PRIMARY KEY,
    airport_name
        REFERENCES airport ( airport_name ),
    flight_number
        REFERENCES flight ( flight_number )
);

CREATE TABLE departure (
    departure_id        NUMBER(6) NOT NULL PRIMARY KEY,
    departure_scheduled DATE,
    departure_actual    DATE,
    airport_name        VARCHAR(32) NOT NULL
        REFERENCES airport ( airport_name )
);

CREATE TABLE aircraft (
    aircraft_id           NUMBER(6) PRIMARY KEY,
    internat_reg_number   VARCHAR(32),
    aircraft_name         VARCHAR(32),
    date_of_service_entry DATE,
    aircraft_type_id      VARCHAR(32)
        REFERENCES aircraft_type ( aircraft_type_id ),
    airline_code          VARCHAR(32)
        REFERENCES airline ( airline_code )
);

CREATE TABLE distance (
    distance_id       NUMBER(6) PRIMARY KEY,
    flight_miles      NUMBER(10),
    aircraft_id       NUMBER(6),
    departure_airport VARCHAR(32)
        REFERENCES airport ( airport_name ),
    arrival_airport   VARCHAR(32)
        REFERENCES airport ( airport_name )
);

CREATE TABLE flight (
    flight_number VARCHAR(32) PRIMARY KEY,
    departure_id  NUMBER(6) NOT NULL
        REFERENCES departure ( departure_id ),
    arrival_id    NUMBER(6) NOT NULL
        REFERENCES arrival ( arrival_id )
);

CREATE TABLE flight_departure (
    id            INT NOT NULL PRIMARY KEY,
    flight_number VARCHAR(32)
        REFERENCES flight ( flight_number ),
    departure_id  NUMBER(6)
        REFERENCES departure ( departure_id )
);

CREATE TABLE flight_arrival (
    id            INT NOT NULL PRIMARY KEY,
    flight_number VARCHAR(32)
        REFERENCES flight ( flight_number ),
    arrival_id    NUMBER(6)
        REFERENCES arrival ( arrival_id )
);

COMMIT;

ALTER TABLE flight DROP ( departure_id,
                          arrival_id );

ALTER TABLE flight ADD (
    passenger_flight INT
        REFERENCES passenger_flight ( id )
);

CREATE TABLE passenger (
    passenger_number NUMBER(6) NOT NULL PRIMARY KEY,
    first_name       VARCHAR(20) NOT NULL,
    last_name        VARCHAR(20) NOT NULL,
    title            VARCHAR(10) DEFAULT '--',
    salutation       VARCHAR(5) DEFAULT '--'
);

CREATE TABLE passenger_flight (
    id INT NOT NULL PRIMARY KEY,
    passenger_number
        REFERENCES passenger ( passenger_number ),
    flight_number
        REFERENCES flight ( flight_number )
);
alter table passenger_flight drop (passenger_number, flight_number);
commit;


ALTER TABLE passenger ADD passenger_flight
    REFERENCES passenger_flight ( id );

COMMIT;

CREATE TABLE ticket (
    ticket_number    VARCHAR(32) NOT NULL PRIMARY KEY,
    date_of_issue    DATE,
    price            NUMBER(6, 2),
    currency         VARCHAR(32),
    passenger_number NUMBER(6)
        REFERENCES passenger ( passenger_number ),
    flight_number    VARCHAR(32)
        REFERENCES flight ( flight_number )
);

Alter table ticket drop (passenger_number);
Alter table ticket add (
passenger_number references passenger(passenger_number));


CREATE TABLE flight_class (
    flight_class_id VARCHAR(32) NOT NULL PRIMARY KEY,
    seats_booked    NUMBER(6),
    seats_available NUMBER(6),
    saet_max        NUMBER(3),
    seat_id         NUMBER(6)
        REFERENCES seat ( seat_id )
);


alter table flight_class drop (seat_id);

alter table aircraft_type add (distance_id references distance(distance_id)); 

CREATE TABLE seating_plan (
    plan_id          NUMBER(6) NOT NULL PRIMARY KEY,
    aircraft_type_id VARCHAR(32)
        REFERENCES aircraft_type ( aircraft_type_id ),
    flight_class_id  VARCHAR(32)
        REFERENCES flight_class ( flight_class_id )
);

CREATE TABLE boarding_card (
    boarding_card_id NUMBER(6) NOT NULL PRIMARY KEY,
    seat_id          NUMBER(6)
        REFERENCES seat ( seat_id ),
    ticket_number    VARCHAR(32)
        REFERENCES ticket ( ticket_number )
);

alter table airport add ( airport_code varchar(10));

alter table distance drop(departure_airport,arrival_airport);

alter table distance add(arrival_id references arrival(arrival_id));

alter table departure modify departure_scheduled timestamp;
commit;

alter table passenger_flight add(
passenger_number references passenger(passenger_number));

alter table passenger_flight add(
flight_number references flight(flight_number));

alter table seat add(
aircraft_id references aircraft(aircraft_id));

commit;
