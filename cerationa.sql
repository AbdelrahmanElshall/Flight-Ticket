CREATE TABLE country(
country_id NUMBER(20) NOT NULL,
country_name VARCHAR2(50) NOT NULL,
constraint country_id_pk PRIMARY KEY(country_id));

CREATE TABLE city(
city_id NUMBER(20) NOT NULL,
city_name VARCHAR2(50) NOT NULL,
country_id_fk NUMBER(20) NOT NULL,
CONSTRAINT city_id_pk PRIMARY KEY(city_id),
CONSTRAINT country_id_fk1 FOREIGN KEY(country_id_fk) REFERENCES country(country_id));

CREATE TABLE Airport(
Airport_id VARCHAR2(20) NOT NULL,
airport_name VARCHAR2(50) NOT NULL,
city_id_fk NUMBER(20) NOT NULL,
CONSTRAINT Airport_id_pk PRIMARY KEY(Airport_id),
CONSTRAINT city_id_fk1 FOREIGN KEY(city_id_fk) REFERENCES city(city_id));

CREATE TABLE Airplane_manufacturer(
manufacturer_id NUMBER(20) NOT NULL,
manufacturer_name VARCHAR2(50) NOT NULL,
man_phone_1 NUMBER(13) NOT NULL,
man_phone_2 NUMBER(13) NOT NULL,
man_address VARCHAR2(100) NOT NULL,
man_website VARCHAR2(100) NOT NULL,
CONSTRAINT manufacturer_id_pk PRIMARY KEY(manufacturer_id));

CREATE TABLE Airplane_type(
air_type_id VARCHAR2(20) NOT NULL,
air_type_name VARCHAR2(50) NOT NULL,
man_id_fk NUMBER(20) NOT NULL,
CONSTRAINT air_type_id_pk PRIMARY KEY(air_type_id),
CONSTRAINT manufacturer_id_fk1 FOREIGN KEY(man_id_fk) REFERENCES Airplane_manufacturer (manufacturer_id));

CREATE TABLE Airplane (
airplane_id NUMBER(20) NOT NULL,
num_of_eco_seat VARCHAR2(700) UNIQUE,
num_of_first_seat VARCHAR2(100) UNIQUE,
airplane_model VARCHAR2(50) NOT NULL,
air_type_id_fk VARCHAR2(20) NOT NULL,
CONSTRAINT airplane_id_pk PRIMARY KEY(airplane_id),
CONSTRAINT air_type_id_fk1 FOREIGN KEY(air_type_id_fk) REFERENCES Airplane_type (air_type_id ));

CREATE TABLE Flight_Company(
company_id NUMBER(20) NOT NULL,
company_name VARCHAR2(50) NOT NULL,
company_phone_1 NUMBER (14) NOT NULL,
company_phone_2 NUMBER (14) NOT NULL,
company_address VARCHAR2(50) NOT NULL,
company_website VARCHAR2(50) NOT NULL,
num_of_active_plane VARCHAR(1000) NULL,
num_of_inactive_plane VARCHAR(1000) NULL,
airplane_id_fk NUMBER(20),
CONSTRAINT company_id_pk PRIMARY KEY(company_id),
CONSTRAINT airplane_id_fk1 FOREIGN KEY(airplane_id_fk) REFERENCES Airplane (airplane_id));

CREATE TABLE Passenger(
passenger_id NUMBER(20) NOT NULL,
passenger_first_name VARCHAR2(50) NOT NULL,
passenger_last_name VARCHAR2(50) NOT NULL,
passenger_SSN NUMBER(14) NOT NULL,
passenger_address VARCHAR2(100) NOT NULL,
passenger_phone1 NUMBER (14) NOT NULL,
passenger_phone2 NUMBER (14) NOT NULL,
passenger_gender VARCHAR2(10) NOT NULL,
passenger_birth_date DATE NOT NULL,
Num_Of_Flight NUMBER(20) NOT NULL,
city_id_fk1 NUMBER(20) NOT NULL,
offer_id_fk NUMBER(20) NOT NULL,
CONSTRAINT passenger_id_pk PRIMARY KEY(passenger_id),
CONSTRAINT city_id_fk2 FOREIGN KEY(city_id_fk1) REFERENCES city(city_id),
CONSTRAINT offer_id_fk FOREIGN KEY(offer_id_fk) REFERENCES offer(offer_id));

CREATE TABLE Passenger_credit(
credit_num NUMBER(14) NOT NULL,
CVV NUMBER(3) NOT NULL,
expier_date TIMESTAMP NOT NULL,
passenger_id_fk1 NUMBER(20) NOT NULL,
CONSTRAINT credit_num_pk PRIMARY KEY(credit_num),
CONSTRAINT passenger_id_fk2 FOREIGN KEY(passenger_id_fk1) REFERENCES Passenger(passenger_id));

CREATE TABLE Flight(
flight_id VARCHAR2(30) NOT NULL,
FIRST_class_price FLOAT(15) NOT NULL,
economy_class_price FLOAT(15) NOT NULL,
n_of_fst_class_seat_free VARCHAR2(100) UNIQUE,
n_of_eco_class_seat_free VARCHAR2(700) UNIQUE,
airport_id_fk2 VARCHAR2(20) NOT NULL,
company_id_fk1 NUMBER(20) NOT NULL,
airplane_id_fk1 NUMBER(20) NOT NULL,
city_id_fk3 number(20) NOT NULL,
CONSTRAINT flight_id_pk PRIMARY KEY(flight_id),
CONSTRAINT airport_id_fk1 FOREIGN KEY(airport_id_fk2) REFERENCES Airport(Airport_id),
CONSTRAINT company_id_fk2 FOREIGN KEY(company_id_fk1) REFERENCES Flight_Company(company_id),
CONSTRAINT airplane_id_fk3 FOREIGN KEY(airplane_id_fk1) REFERENCES Airplane(airplane_id),
CONSTRAINT city_id_fk3 FOREIGN KEY(city_id_fk3) REFERENCES city(city_id));

CREATE TABLE Flight_Date_Departure(
departure_date TIMESTAMP NOT NULL,
flight_id_fk3 VARCHAR2(30) NOT NULL,
CONSTRAINT departure_date_pk PRIMARY KEY(departure_date),
CONSTRAINT flight_id_fk1 FOREIGN KEY(flight_id_fk3) REFERENCES Flight(flight_id));

CREATE TABLE Flight_Date_Arrivel(
arrivel_date TIMESTAMP NOT NULL,
flight_id_fk4 VARCHAR2(30) NOT NULL,
CONSTRAINT arrivel_date_pk PRIMARY KEY(arrivel_date),
CONSTRAINT flight_id_fk2 FOREIGN KEY(flight_id_fk4) REFERENCES Flight(flight_id));

CREATE TABLE transient(
transient_airport_id NUMBER(20) NULL,
arrivel_date TIMESTAMP NULL,
departure_date TIMESTAMP NULL,
airport_id_fk VARCHAR2(20) NOT NULL,
flight_id_fk VARCHAR2(30) NOT NULL,
CONSTRAINT transient_airport_id_pk PRIMARY KEY(transient_airport_id),
CONSTRAINT airport_id_fk4 FOREIGN KEY(airport_id_fk) REFERENCES Airport(airport_id),
CONSTRAINT flight_id_fk3 FOREIGN KEY(flight_id_fk) REFERENCES Flight(flight_id));

CREATE TABLE Destination(
destination_airport_id  NUMBER(20) NOT NULL,
arrivel_date TIMESTAMP NOT NULL,
departure_date TIMESTAMP NOT NULL,
airport_id_fk1 VARCHAR2(20) NOT NULL,
flight_id_fk1 VARCHAR2(30) NOT NULL,
CONSTRAINT destination_airport_id_pk PRIMARY KEY(destination_airport_id),
CONSTRAINT airport_id_fk2 FOREIGN KEY(airport_id_fk1) REFERENCES Airport(airport_id),
CONSTRAINT flight_id_fk4 FOREIGN KEY(flight_id_fk1) REFERENCES Flight(flight_id));

CREATE TABLE Offer(
offer_id NUMBER(20) NOT NULL,
num_of_flight NUMBER(30) NOT NULL,
company_id_fk3 NUMBER(20) NOT NULL,
CONSTRAINT offer_id_pk PRIMARY KEY(offer_id),
CONSTRAINT company_id_fk3 FOREIGN KEY(company_id_fk3) REFERENCES Flight_Company(company_id));

CREATE TABLE Booking(
booking_id NUMBER(20) NOT NULL,
class_type VARCHAR2(50) NOT NULL,
seat_num VARCHAR2(800) NOT NULL,
passenger_id_fk4 NUMBER(20) NOT NULL,
flight_id_fk6 VARCHAR2(30) NOT NULL,
CONSTRAINT booking_id_pk PRIMARY KEY(booking_id),
CONSTRAINT passenger_id_fk4 FOREIGN KEY(passenger_id_fk4) REFERENCES Passenger(passenger_id),
CONSTRAINT flight_id_fk6 FOREIGN KEY(flight_id_fk6) REFERENCES Flight(flight_id));

CREATE TABLE Booking_Date(
booking_date TIMESTAMP NOT NULL,
booking_id_fk NUMBER(20) NOT null,
CONSTRAINT booking_date_pk PRIMARY KEY(booking_date),
CONSTRAINT booking_id_fk1 FOREIGN KEY(booking_id_fk) REFERENCES Booking(booking_id));

 
INSERT INTO country(country_id,country_name)
VALUES (1,'Egypt');
INSERT INTO country(country_id,country_name)
VALUES(2,'Australia');
INSERT INTO country(country_id,country_name)
VALUES(3,'United States of America');
INSERT INTO country(country_id,country_name)
VALUES(4,'Saudi Arabia');
INSERT INTO country(country_id,country_name)
VALUES(5,'China');
INSERT INTO country(country_id,country_name)
VALUES(6,'France');
INSERT INTO country(country_id,country_name)
VALUES(7,'Germany');
INSERT INTO country(country_id,country_name)
VALUES(8,'Greece');
INSERT INTO country(country_id,country_name)
VALUES(9,'Japan');
INSERT INTO country(country_id,country_name)
VALUES(10,'Spain');
SELECT*FROM country;

INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (11,'Cairo', 1);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (21,'ALexandria',1);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (31,'Aswan',1);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (41,'Hurghada',1);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (12,'Sydney',2);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (22,'Melbourne',2);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (32,'Brisbane',2);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (42,'Cairns',2);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (13,'Arkansas',3);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (23,'California',3);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (33,'Washington' ,3);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (43,'New York' ,3);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (14,'Jeddah',4);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (24,'Riyadh',4);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (34,'Ad Dammam',4);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (44,'Medina',4);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (15,'Beijing',5);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (25,'Hefei',5);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (35,'Huangshan',5);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (45,'Wushan', 5);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (16,'Paris',6);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (26,'Lyon',6);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (36,'Marseille',6);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (46,'Nice',6);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (17,'Berlin',7);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (27,'Munchen',7);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (37,'Frankfurt',7);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (47,'Dortmund',7);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (18,'Athens',8);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (28,'Heraklion',8);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (38,'Kalamata',8);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (48,'Santorini',8);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (19,'Tokyo',9);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (29,'Chiba',9);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (39,'Fukuoka',9);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (49,'Hokkaido',9);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (110,'Madrid',10);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (210,'Valencia',10);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (310,'Catalonia',10);
INSERT INTO city(city_id,city_name,country_id_fk)
VALUES (410,'Granada',10);
SELECT*FROM city;

INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (ec11,'Cairo International Airport',11);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (es21,'Alexandria International Airpot',21);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (ea31,'Aswan International Airport',31);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (eh41,'Hurghada International Airport',41);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (as12,'Sydney International Airport',12);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (am22,'Melborne International Airport',22);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (ab32,'Brisbane International Airport',32);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (ac42,'Cairns International Airport',42);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (ua13,'Arkansas International Airport',13);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (UC23,'California International Airport',23);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (UW33,'Washington International Airport',33);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (UN43,'New York International Airport',43);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SuJ14,'Jeddah International Airport',14);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SuR24,'Riyadh International Airport',24);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SuA34,'Ad Dammam International Airport',34);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SuM44,'Medina International Airport',44);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (CB15,'Beijing International Airport',15);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (CH25,'Hefei International Airport',25);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (CH35,'Huangshan International Airport',35);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (CW45,'Wushan International Airport',45);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (FP16,'Paris International Airport',16);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (FL26,'Lyon International Airport',26);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (FM36,'Marseille International Airport',36);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (FN46,'Nice International Airport',46);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GeB17,'Berlin International Airport',17);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GeM27,'Munchen International Airport',27);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GeF37,'Frankfurt International Airport',37);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GeD47,'Dortmund International Airport',47);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GrA18,'Athens International Airport',18);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GrH28,'Heraklion International Airport',28);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GrK38,'Kalamata International Airport',38);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (GrS48,'Santorini International Airport',48);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (JT19,'Tokyo International Airport',19);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (JC29,'Chiba International Airport',29);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (JF39,'Fukuoka International Airport',39);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (JH49,'Hokkaido International Airport',49);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SpM110,'Madrid International Airport',110);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SpV210,'Valencia International Airport',210);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SpC310 , 'Catalonia International Airport' , 310);
INSERT INTO Airport(Airport_id,airport_name,city_id_fk)
VALUES (SpG410 , 'Granada International Airport' , 410);
SELECT * from Airport;

select  count (flight_id) ,airport_name from flight , airport 
WHERE airport_name = 'Cairo International Airport'
GROUP by airport_name;

