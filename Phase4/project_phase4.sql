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

DROP TABLE IF EXISTS Customizable_Places;
CREATE TABLE IF NOT EXISTS Customizable_Places
(
  Place_ID INT NOT NULL,
  Destination_name VARCHAR(30) NOT NULL,
  Place_Name VARCHAR(30) NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (Place_ID)
);

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

DROP TABLE IF EXISTS Customizable_Hotel;
CREATE TABLE IF NOT EXISTS Customizable_Hotel
(
  Hotel_ID INT NOT NULL,
  Hotel_Name VARCHAR(50) NOT NULL,
  Hotel_Rating FLOAT NOT NULL,
  Day INT NOT NULL,
  Night INT NOT NULL,
  PRIMARY KEY (Hotel_ID)
);

DROP TABLE IF EXISTS Offers1;
CREATE TABLE IF NOT EXISTS Offers1
(
  Offer_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Offer_ID, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

DROP TABLE IF EXISTS Customizable_Transport_Booking1;
CREATE TABLE IF NOT EXISTS Customizable_Transport_Booking1
(
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  PRIMARY KEY (Transport_Booking_ID, Transport_ID),
  FOREIGN KEY (Transport_ID) REFERENCES Customizable_Transport(Transport_ID)
);

DROP TABLE IF EXISTS Customizable_Hotel_booking1;
CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking1
(
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID, Hotel_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Customizable_Hotel(Hotel_ID)
);

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

DROP TABLE IF EXISTS Languages_Spoken;
CREATE TABLE IF NOT EXISTS Languages_Spoken
(
  Languages_Spoken INT NOT NULL,
  Guide_ID INT NOT NULL,
  PRIMARY KEY (Languages_Spoken, Guide_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID)
);

DROP TABLE IF EXISTS Places;
CREATE TABLE IF NOT EXISTS Places
(
  Places INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Places, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

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

DROP TABLE IF EXISTS Assigned_to;
CREATE TABLE IF NOT EXISTS Assigned_to
(
  Guide_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Guide_ID, Package_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

DROP TABLE IF EXISTS Payments2;
CREATE TABLE IF NOT EXISTS Payments2
(
  Payment_ID INT NOT NULL,
  Booking_Type INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Payment_Amount INT NOT NULL,
  Payment_Method INT NOT NULL,
  PRIMARY KEY (Payment_ID)
);

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
