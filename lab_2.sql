-- 1
CREATE DATABASE lab1;
-- 2
CREATE TABLE airline_info (
    airline_id INT,
    airline_code VARCHAR(30),
    airline_name VARCHAR(50),
    airline_country VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    info VARCHAR(50)
);

CREATE TABLE airport (
    airport_id INT,
    airport_name VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE baggage_check (
    baggage_check_id INT,
    check_result VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    booking_id INT,
    passenger_id INT
);

CREATE TABLE baggage (
    baggage_id INT,
    weight_in_kg DECIMAL(4,2),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    booking_id INT
);

CREATE TABLE boarding_pass (
    boarding_pass_id INT,
    booking_id INT,
    seat VARCHAR(50),
    boarding_time TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE booking_flight (
    booking_flight_id INT,
    booking_id INT,
    flight_id INT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE booking (
    booking_id INT,
    flight_id INT,
    passenger_id INT,
    booking_platform VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    status VARCHAR(50),
    price DECIMAL(7,2)
);

CREATE TABLE flights (
    flight_id INT,
    sch_departure_time TIMESTAMP,
    sch_arrival_time TIMESTAMP,
    departing_airport_id INT,
    arriving_airport_id INT,
    departing_gate VARCHAR(50),
    arriving_gate VARCHAR(50),
    airline_id INT,
    act_departure_time TIMESTAMP,
    act_arrival_time TIMESTAMP,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE passengers (
    passenger_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender VARCHAR(50),
    country_of_citizenship VARCHAR(50),
    country_of_residence VARCHAR(50),
    passport_number VARCHAR(20),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE security_check (
    security_check_id INT,
    check_result VARCHAR(20),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    passenger_id INT
);




ALTER TABLE airline_info
ADD PRIMARY KEY (airline_id);

ALTER TABLE airport
ADD PRIMARY KEY (airport_id);

ALTER TABLE baggage_check
ADD PRIMARY KEY (baggage_check_id);

ALTER TABLE baggage
ADD PRIMARY KEY (baggage_id);

ALTER TABLE boarding_pass
ADD PRIMARY KEY (boarding_pass_id);

ALTER TABLE booking_flight
ADD PRIMARY KEY (booking_flight_id);

ALTER TABLE booking
ADD PRIMARY KEY (booking_id);

ALTER TABLE flights
ADD PRIMARY KEY (flight_id);

ALTER TABLE passengers
ADD PRIMARY KEY (passenger_id);

ALTER TABLE security_check
ADD PRIMARY KEY (security_check_id);






-- Airline_info
ALTER TABLE airline_info
ALTER COLUMN airline_id SET NOT NULL,
ALTER COLUMN airline_code SET NOT NULL,
ALTER COLUMN airline_name SET NOT NULL,
ALTER COLUMN airline_country SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN info DROP NOT NULL;

-- Airport
ALTER TABLE airport
ALTER COLUMN airport_id SET NOT NULL,
ALTER COLUMN airport_name SET NOT NULL,
ALTER COLUMN country SET NOT NULL,
ALTER COLUMN state DROP NOT NULL,
ALTER COLUMN city SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

-- Baggage_check
ALTER TABLE baggage_check
ALTER COLUMN baggage_check_id SET NOT NULL,
ALTER COLUMN check_result SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL,
ALTER COLUMN passenger_id SET NOT NULL;

-- Baggage
ALTER TABLE baggage
ALTER COLUMN baggage_id SET NOT NULL,
ALTER COLUMN weight_in_kg SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL;

-- Boarding_pass
ALTER TABLE boarding_pass
ALTER COLUMN boarding_pass_id SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL,
ALTER COLUMN seat SET NOT NULL,
ALTER COLUMN boarding_time SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

-- Booking_flight
ALTER TABLE booking_flight
ALTER COLUMN booking_flight_id SET NOT NULL,
ALTER COLUMN booking_id SET NOT NULL,
ALTER COLUMN flight_id SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

-- Booking
ALTER TABLE booking
ALTER COLUMN booking_id SET NOT NULL,
ALTER COLUMN flight_id SET NOT NULL,
ALTER COLUMN passenger_id SET NOT NULL,
ALTER COLUMN booking_platform SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN status SET NOT NULL,
ALTER COLUMN price SET NOT NULL;

-- Flights
ALTER TABLE flights
ALTER COLUMN flight_id SET NOT NULL,
ALTER COLUMN sch_departure_time SET NOT NULL,
ALTER COLUMN sch_arrival_time SET NOT NULL,
ALTER COLUMN departing_airport_id SET NOT NULL,
ALTER COLUMN arriving_airport_id SET NOT NULL,
ALTER COLUMN departing_gate DROP NOT NULL,
ALTER COLUMN arriving_gate DROP NOT NULL,
ALTER COLUMN airline_id SET NOT NULL,
ALTER COLUMN act_departure_time DROP NOT NULL,
ALTER COLUMN act_arrival_time DROP NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

-- Passengers
ALTER TABLE passengers
ALTER COLUMN passenger_id SET NOT NULL,
ALTER COLUMN first_name SET NOT NULL,
ALTER COLUMN last_name SET NOT NULL,
ALTER COLUMN date_of_birth SET NOT NULL,
ALTER COLUMN gender SET NOT NULL,
ALTER COLUMN country_of_citizenship SET NOT NULL,
ALTER COLUMN country_of_residence SET NOT NULL,
ALTER COLUMN passport_number DROP NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL;

-- Security_check
ALTER TABLE security_check
ALTER COLUMN security_check_id SET NOT NULL,
ALTER COLUMN check_result SET NOT NULL,
ALTER COLUMN created_at SET NOT NULL,
ALTER COLUMN updated_at SET NOT NULL,
ALTER COLUMN passenger_id SET NOT NULL;




--ALTER TABLE airline_info RENAME TO airline;



--ALTER TABLE booking RENAME COLUMN price TO ticket_price;


--ALTER TABLE flights ALTER COLUMN departing_gate TYPE TEXT;



--ALTER TABLE airline DROP COLUMN info;






ALTER TABLE security_checkADD CONSTRAINT fk_passenger_security
FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id);
ALTER TABLE bookingADD CONSTRAINT fk_passenger_booking
FOREIGN KEY (passenger_id) references passengers(passenger_id);
ALTER TABLE baggage_checkADD CONSTRAINT fk_passenger_baggagecheck
FOREIGN KEY (passenger_id) references passengers(passenger_id);
ALTER TABLE baggage_checkADD CONSTRAINT fk_booking_baggagecheck
FOREIGN KEY (booking_id) references booking(booking_id);
ALTER TABLE baggageADD CONSTRAINT fk_booking_baggage
FOREIGN KEY (booking_id) references booking(booking_id);
ALTER TABLE boarding_passADD CONSTRAINT fk_booking_boardingpass
FOREIGN KEY (booking_id) references booking(booking_id);
ALTER TABLE booking_flightADD CONSTRAINT fk_booking_flight
FOREIGN KEY (booking_id) references booking(booking_id);
ALTER TABLE booking_flightADD CONSTRAINT fk_flight_booking_flight
FOREIGN KEY (flight_id) references flights(flight_id);
ALTER TABLE flightsADD CONSTRAINT  fk_departing_airport_id
FOREIGN KEY (departing_airport_id) references airport(airport_id);
ALTER TABLE flightsADD CONSTRAINT fk_flights_arriving_airport
FOREIGN KEY (arriving_airport_id) references airport(airport_id);
ALTER TABLE flightsADD CONSTRAINT fk_flights_1
FOREIGN KEY (airline_id) references airline(airline_id);

















insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (1, 'EAN', 'Phifer Airfield', 'Japan', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (2, 'JUO', 'Jurado Airport', 'Bangladesh', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (3, 'DHT', 'Dalhart Municipal Airport', 'Sri Lanka', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (4, 'TIO', 'Tilin Airport', 'Uruguay', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (5, 'MJC', 'Man Airport', 'Poland', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (6, 'PBH', 'Paro Airport', 'Aland Islands', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (7, 'BOW', 'Bartow Municipal Airport', 'Albania', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (8, 'KXR', 'Karoola Airport', 'Peru', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (9, 'YKF', 'Waterloo Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (10, 'GDZ', 'Gelendzhik Airport', 'Greece', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (11, 'ROL', 'Roosevelt Municipal Airport', 'France', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (12, 'XMI', 'Masasi Airport', 'Poland', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (13, 'DRS', 'Dresden Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (14, 'YLR', 'Leaf Rapids Airport', 'Czech Republic', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (15, 'YTT', 'Tisdale Airport', 'Serbia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (16, 'VBS', 'Brescia Airport', 'Russia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (17, 'OXB', 'Osvaldo Vieira International Airport', 'Brazil', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (18, 'UDR', 'Maharana Pratap Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (19, 'AST', 'Astoria Regional Airport', 'Czech Republic', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (20, 'CMT', 'New Cametá Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (21, 'CQP', 'Cape Flattery Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (22, 'GAJ', 'Yamagata Airport', 'Portugal', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (23, 'WAI', 'Ambalabe Airport', 'Colombia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (24, 'SPJ', 'Sparti Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (25, 'CVJ', 'General Mariano Matamoros Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (26, 'JCJ', 'Chuja Port Heliport', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (27, 'ELX', 'Isla de Tigre  Heliport', 'Ukraine', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (28, 'LWA', 'Lebak Rural Airport', 'Sweden', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (29, 'BJM', 'Bujumbura International Airport', 'South Africa', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (30, 'UBB', 'Mabuiag Island Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (31, 'UKT', 'Quakertown Airport', 'Russia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (32, 'IXK', 'Keshod Airport', 'Sweden', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (33, 'SPC', 'La Palma Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (34, 'IXW', 'Sonari Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (35, 'LGX', 'Lugh Ganane Airport', 'Vietnam', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (36, 'LOQ', 'Lobatse Airport', 'Pakistan', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (37, 'SHO', 'Sokcho (Mulchi Airfield) (G-407/K-50) Airport', 'Czech Republic', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (38, 'RMD', 'Basanth Nagar Airport', 'Cambodia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (39, 'KRU', 'Kerau Airport', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (40, 'COK', 'Cochin International Airport', 'Tajikistan', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (41, 'MQZ', 'Margaret River Airport', 'United States', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (42, 'SVU', 'Savusavu Airport', 'Honduras', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (43, 'DHR', 'De Kooy Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (44, 'JVI', 'Central Jersey Regional Airport', 'Marshall Islands', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (45, 'SWP', 'Swakopmund Airport', 'Pakistan', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (46, 'MWR', 'Motswari Airport', 'Thailand', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (47, 'SYP', 'Ruben Cantu Airport', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (48, 'ABF', 'Abaiang Airport', 'United States', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (49, 'SHF', 'Huayuan Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (50, 'LEB', 'Lebanon Municipal Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (51, '0', 'São Sepé Airport', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (52, 'ERG', 'Yerbogachen Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (53, 'YPM', 'Pikangikum Airport', 'Argentina', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (54, 'MZU', 'Muzaffarpur Airport', 'South Africa', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (55, 'KDA', 'Kolda North Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (56, 'MYE', 'Miyakejima Airport', 'Greece', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (57, 'MLN', 'Melilla Airport', 'Sri Lanka', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (58, 'CYR', 'Laguna de Los Patos International Airport', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (59, 'KNT', 'Kennett Memorial Airport', 'Belarus', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (60, 'TMB', 'Kendall-Tamiami Executive Airport', 'Jamaica', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (61, 'PDR', 'Presidente José Sarney Airport', 'France', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (62, 'TCC', 'Tucumcari Municipal Airport', 'Nepal', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (63, 'ASP', 'SIT', 'Vietnam', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (64, 'SMQ', 'Sampit(Hasan) Airport', 'Argentina', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (65, 'PVD', 'Theodore Francis Green State Airport', 'Brazil', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (66, 'MXY', 'Mc Carthy Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (67, 'VIJ', 'Virgin Gorda Airport', 'Greece', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (68, 'MWC', 'Lawrence J Timmerman Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (69, 'FBK', 'Ladd AAF Airfield', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (70, 'YEU', 'Eureka Airport', 'United Kingdom', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (71, 'TKI', 'Tokeen Seaplane Base', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (72, 'DTM', 'Dortmund Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (73, 'NAJ', 'Nakhchivan Airport', 'Portugal', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (74, 'ROU', 'Ruse Airport', 'Peru', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (75, 'FRG', 'Republic Airport', 'Sweden', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (76, 'QHN', 'Taguatinga Airport', 'Dominican Republic', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (77, 'AHM', 'Ashland Municipal Sumner Parker Field', 'Argentina', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (78, 'AFY', 'Afyon Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (79, 'NWI', 'Norwich International Airport', 'Brazil', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (80, 'KBY', 'Streaky Bay Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (81, 'REH', 'Rehoboth Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (82, 'XFN', 'Xiangyang Liuji Airport', 'Mexico', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (83, 'YQB', 'Quebec Jean Lesage International Airport', 'Ukraine', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (84, 'DTA', 'Delta Municipal Airport', 'Azerbaijan', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (85, 'ODS', 'Odessa International Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (86, 'KSM', 'St Mary''s Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (87, 'DJR', 'Dajarra Airport', 'France', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (88, 'YXD', 'Edmonton City Centre (Blatchford Field) Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (89, 'NHD', 'Al Minhad Air Base', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (90, 'GAO', 'Mariana Grajales Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (91, 'TUF', 'Tours-Val-de-Loire Airport', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (92, 'PWA', 'Wiley Post Airport', 'Indonesia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (93, 'CPR', 'Casper-Natrona County International Airport', 'Russia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (94, 'MQN', 'Mo i Rana Airport, Røssvoll', 'China', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (95, 'BFO', 'Buffalo Range Airport', 'Portugal', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (96, 'MHY', 'Morehead Airport', 'Belarus', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (97, 'JUT', 'Jutigalpa airport', 'Russia', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (98, 'NST', 'Nakhon Si Thammarat Airport', 'Portugal', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (99, 'WIT', 'Wittenoom Airport', 'Philippines', null);
insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (100, 'APY', 'Alto Parnaíba Airport', 'China', null);
















insert into airline_info (airline_id, airline_code, airline_name, airline_country, info) values (101, 'ALA', 'KazAir',  'Kazakhstan', null);











update airline_info
set airline_country = "Turkey"
where airline_name = "KazAir";




DELETE FROM airline_info WHERE airline_name = "SIT";





insert into airline_info (airline_id, airline_code, airline_name, airline_country, info)
values (102, 'ALA', 'AirEasy',  'France', null),
(103, 'ALA', 'FlyHigh',  'Brazil', null),
(104, 'ALA', 'FlyFly',  'Poland', null);

update booking
set price = price + price/10;


DELETE FROM booking WHERE price < 1000;




