DROP DATABASE IF EXISTS TRAVEL_AGENCY;
CREATE SCHEMA TRAVEL_AGENCY;
USE TRAVEL_AGENCY;





DROP TABLE IF EXISTS Tour_Guide;
CREATE TABLE IF NOT EXISTS Tour_Guide
(
  Guide_ID INT NOT NULL,
  First_Name VARCHAR(15) NOT NULL,
  Second_Name VARCHAR(15) NOT NULL,
  Identity_Type VARCHAR(30) NOT NULL,
  Identity_Number VARCHAR(15) NOT NULL,
  Gender CHAR(1) NOT NULL,
  Contact_Number INT NOT NULL,
  Rating FLOAT NOT NULL,
  Serving_Destination VARCHAR(30) NOT NULL,
  Availability_Status INT NOT NULL,
  PRIMARY KEY (Guide_ID)
);
INSERT INTO Tour_Guide
VALUES
  (1, 'John', 'Doe', 'Passport', 'ABC123456', 'M', 1234567890, 4.5, 'Paris', 1),
  (2, 'Jane', 'Smith', 'Driver License', 'XYZ987654', 'F', 9876543210, 4.2, 'Tokyo', 1),
  (3, 'Mike', 'Johnson', 'Passport', 'PQR789012', 'M', 5555555555, 4.8, 'New York', 1),
  (4, 'Emily', 'Davis', 'Driver License', 'LMN456789', 'F', 9998887776, 4.0, 'Arusha', 1),
  (5, 'Chris', 'Brown', 'Passport', 'DEF345678', 'M', 1112223333, 4.6, 'Cusco', 1);










DROP TABLE IF EXISTS Travel_Agents;
CREATE TABLE IF NOT EXISTS Travel_Agents
(
  Agent_ID INT NOT NULL,
  First_Name VARCHAR(15) NOT NULL,
  Second_Name VARCHAR(15) NOT NULL,
  Identity_Type VARCHAR(30) NOT NULL,
  Identity_Number VARCHAR(15) NOT NULL,
  Contact_Number INT NOT NULL,
  PRIMARY KEY (Agent_ID)
);
INSERT INTO Travel_Agents
VALUES
  (1, 'Emma', 'Johnson', 'Passport', 'AGT123456', 1234567890),
  (2, 'Daniel', 'Miller', 'Driver License', 'AGT987654', 9876543210),
  (3, 'Olivia', 'Clark', 'Passport', 'AGT789012', 5555555555),
  (4, 'William', 'Davis', 'Driver License', 'AGT456789', 9998887776),
  (5, 'Sophia', 'Wilson', 'Passport', 'AGT345678', 1112223333);










DROP TABLE IF EXISTS Tour_Packages;
CREATE TABLE IF NOT EXISTS Tour_Packages
(
  Package_ID INT NOT NULL,
  Destination VARCHAR(30) NOT NULL,
  Days INT NOT NULL,
  Nights INT NOT NULL,
  Price INT NOT NULL,
  PRIMARY KEY (Package_ID)
);
INSERT INTO Tour_Packages
VALUES
  (1, 'Paris', 7, 6, 2000),
  (2, 'Tokyo', 10, 9, 2500),
  (3, 'New York City', 5, 4, 1500),
  (4, 'Serengeti', 8, 7, 3000),
  (5, 'Machu Picchu', 6, 5, 1800);










DROP TABLE IF EXISTS Customizable_Places;
CREATE TABLE IF NOT EXISTS Customizable_Places
(
  Place_ID INT NOT NULL,
  Destination_name VARCHAR(30) NOT NULL,
  Place_Name VARCHAR(30) NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (Place_ID)
);
INSERT INTO Customizable_Places
VALUES
  (1, 'Paris', 'Eiffel Tower', 100),
  (2, 'Tokyo', 'Mount Fuji', 120),
  (3, 'New York', 'Statue of Liberty', 80),
  (4, 'Arusha', 'Serengeti National Park', 200),
  (5, 'Cusco', 'Machu Picchu', 150);











DROP TABLE IF EXISTS Customizable_Transport;
CREATE TABLE IF NOT EXISTS Customizable_Transport
(
  Transport_ID INT NOT NULL,
  Source_Location VARCHAR(30) NOT NULL,
  Destination_Location VARCHAR(30) NOT NULL,
  Duration INT NOT NULL,
  Transportation_Mode VARCHAR(15) NOT NULL,
  Transport_Price INT NOT NULL,
  PRIMARY KEY (Transport_ID)
);
INSERT INTO Customizable_Transport
VALUES
  (1, 'Paris', 'Nice', 3, 'Train', 50),
  (2, 'Tokyo', 'Osaka', 2, 'Bullet Train', 80),
  (3, 'New York', 'Washington DC', 4, 'Bus', 30),
  (4, 'Arusha', 'Serengeti', 5, 'Safari Jeep', 100),
  (5, 'Cusco', 'Aguas Calientes', 1, 'Train', 40);










DROP TABLE IF EXISTS Customizable_Hotel;
CREATE TABLE IF NOT EXISTS Customizable_Hotel
(
  Hotel_ID INT NOT NULL,
  Hotel_Name VARCHAR(50) NOT NULL,
  Hotel_Rating FLOAT NOT NULL,
  Day_Price INT NOT NULL,
  Night_Price INT NOT NULL,
  PRIMARY KEY (Hotel_ID)
);
INSERT INTO Customizable_Hotel
VALUES
  (1, 'Parisian Suites', 4.5, 150, 100),
  (2, 'Tokyo Grand Hotel', 4.2, 200, 150),
  (3, 'NYC View Hotel', 4.8, 120, 80),
  (4, 'Serengeti Safari Lodge', 4.0, 250, 200),
  (5, 'Machu Picchu Inn', 4.6, 180, 120);











DROP TABLE IF EXISTS Offers1;
CREATE TABLE IF NOT EXISTS Offers1
(
  Offer_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Offer_ID, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);
INSERT INTO Offers1
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);










DROP TABLE IF EXISTS Customizable_Transport_Booking1;
CREATE TABLE IF NOT EXISTS Customizable_Transport_Booking1
(
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  PRIMARY KEY (Transport_Booking_ID, Transport_ID),
  FOREIGN KEY (Transport_ID) REFERENCES Customizable_Transport(Transport_ID)
);
INSERT INTO Customizable_Transport_Booking1
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);










DROP TABLE IF EXISTS Customizable_Hotel_booking1;
CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking1
(
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID, Hotel_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Customizable_Hotel(Hotel_ID)
);
INSERT INTO Customizable_Hotel_booking1
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);










DROP TABLE IF EXISTS Customized_Bookings1;
CREATE TABLE IF NOT EXISTS Customized_Bookings1
(
  Custom_Booking_ID INT NOT NULL,
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  Place_ID INT NOT NULL,
  PRIMARY KEY (Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID),
  FOREIGN KEY (Transport_Booking_ID, Transport_ID) REFERENCES Customizable_Transport_Booking1(Transport_Booking_ID, Transport_ID),
  FOREIGN KEY (Hotel_Booking_ID, Hotel_ID) REFERENCES Customizable_Hotel_booking1(Hotel_Booking_ID, Hotel_ID),
  FOREIGN KEY (Place_ID) REFERENCES Customizable_Places(Place_ID)
);
INSERT INTO Customized_Bookings1
VALUES
  (1, 1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5, 5);










DROP TABLE IF EXISTS Languages_Spoken;
CREATE TABLE IF NOT EXISTS Languages_Spoken
(
  Languages_Spoken VARCHAR(20) NOT NULL,
  Guide_ID INT NOT NULL,
  PRIMARY KEY (Languages_Spoken, Guide_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID)
);
INSERT INTO Languages_Spoken
VALUES
  ('English', 2),
  ('Japanese', 2),
  ('Spanish', 3),
  ('Swahili', 4),
  ('Quechua', 5);










DROP TABLE IF EXISTS Places;
CREATE TABLE IF NOT EXISTS Places
(
  Places INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Places, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);
INSERT INTO Places
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);










DROP TABLE IF EXISTS Tourists_IDs;
CREATE TABLE IF NOT EXISTS Tourists_IDs
(
  Tourists_IDs INT NOT NULL,
  Custom_Booking_ID INT NOT NULL,
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  Place_ID INT NOT NULL,
  PRIMARY KEY (Tourists_IDs),
  FOREIGN KEY (Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID) REFERENCES Customized_Bookings1(Custom_Booking_ID, Transport_Booking_ID, Transport_ID, Hotel_Booking_ID, Hotel_ID, Place_ID)
);
INSERT INTO Tourists_IDs
VALUES
  (1, 1, 1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5, 5, 5);










DROP TABLE IF EXISTS Assigned_to;
CREATE TABLE IF NOT EXISTS Assigned_to
(
  Guide_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Guide_ID, Package_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);
INSERT INTO Assigned_to
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);










DROP TABLE IF EXISTS Payments2;
CREATE TABLE IF NOT EXISTS Payments2
(
  Payment_ID INT NOT NULL,
  Booking_Type VARCHAR(15) NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Payment_Amount INT NOT NULL,
  Payment_Method INT NOT NULL,
  PRIMARY KEY (Payment_ID)
);
INSERT INTO Payments2
VALUES
  (1, 'Customized', 1, 12, 2023, 500, 1),
  (2, 'Package', 2, 12, 2023, 1000, 2),
  (3, 'Customized', 3, 12, 2023, 700, 1),
  (4, 'Package', 4, 12, 2023, 1200, 2),
  (5, 'Customized', 5, 12, 2023, 600, 1);










DROP TABLE IF EXISTS Bookings2;
CREATE TABLE IF NOT EXISTS Bookings2
(
  Booking_ID INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Total_Amount INT NOT NULL,
  Amount_Paid INT NOT NULL,
  Amount_Due INT NOT NULL,
  PRIMARY KEY (Booking_ID)
);
INSERT INTO Bookings2
VALUES
  (1, 1, 12, 2023, 1500, 500, 1000),
  (2, 2, 12, 2023, 2500, 1000, 1500),
  (3, 3, 12, 2023, 1800, 700, 1100),
  (4, 4, 12, 2023, 3000, 1200, 1800),
  (5, 5, 12, 2023, 2000, 600, 1400);










DROP TABLE IF EXISTS Offers2;
CREATE TABLE IF NOT EXISTS Offers2
(
  Offer_ID INT NOT NULL,
  Offer_Name VARCHAR(30) NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Discount_Percentage INT NOT NULL,
  Status INT NOT NULL,
  PRIMARY KEY (Offer_ID)
);
INSERT INTO Offers2
VALUES
  (1, 'Winter Special', 'Enjoy a discount on customized tours!', 10, 1),
  (2, 'Early Bird Package', 'Book early and get a special discount on packages!', 15, 1),
  (3, 'Summer Escape', 'Special offers on selected destinations for summer!', 8, 1),
  (4, 'Adventure Lovers', 'Exciting discounts for adventure packages!', 12, 1),
  (5, 'Family Fun', 'Discounts for family-friendly tours!', 10, 1);










DROP TABLE IF EXISTS Reviews_and_Feedback2;
CREATE TABLE IF NOT EXISTS Reviews_and_Feedback2
(
  Review_ID INT NOT NULL,
  Rating FLOAT NOT NULL,
  Comments VARCHAR(100) NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  PRIMARY KEY (Review_ID)
);
INSERT INTO Reviews_and_Feedback2
VALUES
  (1, 4.5, 'Great experience with the tour guide!', 1, 12, 2023),
  (2, 4.0, 'Enjoyed the package tour, highly recommended!', 2, 12, 2023),
  (3, 4.8, 'Amazing customized tour, exceeded expectations!', 3, 12, 2023),
  (4, 4.2, 'Safari experience was fantastic!', 4, 12, 2023),
  (5, 4.6, 'Machu Picchu tour was a dream come true!', 5, 12, 2023);










DROP TABLE IF EXISTS Customizable_Transport_Booking2;
CREATE TABLE IF NOT EXISTS Customizable_Transport_Booking2
(
  Transport_Booking_ID INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Hour INT NOT NULL,
  Minute INT NOT NULL,
  PRIMARY KEY (Transport_Booking_ID)
);
INSERT INTO Customizable_Transport_Booking2
VALUES
  (1, 1, 12, 2023, 10, 30),
  (2, 2, 12, 2023, 12, 45),
  (3, 3, 12, 2023, 14, 15),
  (4, 4, 12, 2023, 9, 0),
  (5, 5, 12, 2023, 11, 30);










DROP TABLE IF EXISTS Customizable_Hotel_booking2;
CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking2
(
  Hotel_Booking_ID INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Days INT NOT NULL,
  Nights INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID)
);
INSERT INTO Customizable_Hotel_booking2
VALUES
  (1, 1, 12, 2023, 3, 2),
  (2, 2, 12, 2023, 4, 3),
  (3, 3, 12, 2023, 2, 1),
  (4, 4, 12, 2023, 5, 4),
  (5, 5, 12, 2023, 2, 1);










DROP TABLE IF EXISTS Tourists;
CREATE TABLE IF NOT EXISTS Tourists
(
  Tourist_ID INT NOT NULL,
  First_Name VARCHAR(15) NOT NULL,
  Second_Name VARCHAR(15) NOT NULL,
  Identity_Type VARCHAR(30) NOT NULL,
  Identity_Number VARCHAR(15) NOT NULL,
  House_Number INT NOT NULL,
  Postal_Code INT NOT NULL,
  Street_Address VARCHAR(50) NOT NULL,
  Contact_Number INT NOT NULL,
  Agent_ID INT NOT NULL,
  PRIMARY KEY (Tourist_ID),
  FOREIGN KEY (Agent_ID) REFERENCES Travel_Agents(Agent_ID)
);
INSERT INTO Tourists
VALUES
  (1, 'John', 'Smith', 'Passport', 'TS123456', 123, 456789, '123 Main St', 7890123456, 1),
  (2, 'Emily', 'Johnson', 'Driver License', 'DL987654', 456, 789012, '456 Oak St', 9876543210, 2),
  (3, 'David', 'Williams', 'Passport', 'TS789012', 789, 012345, '789 Pine St', 1234567890, 3),
  (4, 'Sophia', 'Brown', 'Driver License', 'DL456789', 234, 567890, '234 Maple St', 2345678901, 4),
  (5, 'Olivia', 'Miller', 'Passport', 'TS345678', 567, 890123, '567 Cedar St', 3456789012, 5);










DROP TABLE IF EXISTS Reviews_and_Feedback1;
CREATE TABLE IF NOT EXISTS Reviews_and_Feedback1
(
  Review_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Review_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);
INSERT INTO Reviews_and_Feedback1
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);










DROP TABLE IF EXISTS Bookings1;
CREATE TABLE IF NOT EXISTS Bookings1
(
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);
INSERT INTO Bookings1
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);










DROP TABLE IF EXISTS Payments1;
CREATE TABLE IF NOT EXISTS Payments1
(
  Payment_ID INT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Booking_ID, Tourist_ID, Package_ID) REFERENCES Bookings1(Booking_ID, Tourist_ID, Package_ID)
);
INSERT INTO Payments1
VALUES
  (1, 1, 1, 1),
  (2, 2, 2, 2),
  (3, 3, 3, 3),
  (4, 4, 4, 4),
  (5, 5, 5, 5);










DROP TABLE IF EXISTS Bookings_Tourists_IDs;
CREATE TABLE IF NOT EXISTS Bookings_Tourists_IDs
(
  Tourists_IDs INT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Tourists_IDs),
  FOREIGN KEY (Booking_ID, Tourist_ID, Package_ID) REFERENCES Bookings1(Booking_ID, Tourist_ID, Package_ID)
);
INSERT INTO Bookings_Tourists_IDs
VALUES
  (1, 1, 1, 1),
  (2, 2, 2, 2),
  (3, 3, 3, 3),
  (4, 4, 4, 4),
  (5, 5, 5, 5);










DROP TABLE IF EXISTS Booking_Handler;
CREATE TABLE IF NOT EXISTS Booking_Handler
(
  Payment_ID INT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  Agent_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID, Agent_ID),
  FOREIGN KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID) REFERENCES Payments1(Payment_ID, Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Agent_ID) REFERENCES Travel_Agents(Agent_ID)
);
INSERT INTO Booking_Handler
VALUES
  (1, 1, 1, 1, 1),
  (2, 2, 2, 2, 2),
  (3, 3, 3, 3, 3),
  (4, 4, 4, 4, 4),
  (5, 5, 5, 5, 5);










DROP TABLE IF EXISTS Customized_Bookings2;
CREATE TABLE IF NOT EXISTS Customized_Bookings2
(
  Custom_Booking_ID INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Language VARCHAR(20) NOT NULL,
  Gender CHAR(1) NOT NULL,
  Amount_Paid INT NOT NULL,
  Amount_Due INT NOT NULL,
  Tourist_ID INT NOT NULL,
  PRIMARY KEY (Custom_Booking_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID)
);
INSERT INTO Customized_Bookings2
VALUES
  (1, 1, 12, 2023, 'English', 'M', 500, 1000, 1),
  (2, 2, 12, 2023, 'Japanese', 'F', 1000, 1500, 2),
  (3, 3, 12, 2023, 'Spanish', 'M', 700, 1100, 3),
  (4, 4, 12, 2023, 'Swahili', 'F', 1200, 1800, 4),
  (5, 5, 12, 2023, 'Quechua', 'M', 600, 1400, 5);