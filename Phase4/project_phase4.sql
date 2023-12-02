DROP DATABASE IF EXISTS TRAVEL_AGENCY;
CREATE SCHEMA TRAVEL_AGENCY;
USE TRAVEL_AGENCY;


CREATE TABLE IF NOT EXISTS Tour_Guide
(
  Guide_ID INT NOT NULL,
  First_Name INT NOT NULL,
  Second_Name INT NOT NULL,
  Identity_Type INT NOT NULL,
  Gender INT NOT NULL,
  Contact_Number INT NOT NULL,
  Rating INT NOT NULL,
  Serving_Destination INT NOT NULL,
  Availability_Status INT NOT NULL,
  PRIMARY KEY (Guide_ID)
);

CREATE TABLE IF NOT EXISTS Travel_Agents
(
  Agent_ID INT NOT NULL,
  First_Name INT NOT NULL,
  Second_Name INT NOT NULL,
  Identity_Type INT NOT NULL,
  Identity_Number INT NOT NULL,
  Contact_Number INT NOT NULL,
  PRIMARY KEY (Agent_ID)
);

CREATE TABLE IF NOT EXISTS Tour_Packages
(
  Package_ID INT NOT NULL,
  Destination INT NOT NULL,
  Days INT NOT NULL,
  Nights INT NOT NULL,
  Price INT NOT NULL,
  PRIMARY KEY (Package_ID)
);

CREATE TABLE IF NOT EXISTS Customizable_Places
(
  Place_ID INT NOT NULL,
  Destination_name INT NOT NULL,
  Place_Name INT NOT NULL,
  Cost INT NOT NULL,
  PRIMARY KEY (Place_ID)
);

CREATE TABLE IF NOT EXISTS Customizable_Transport
(
  Transport_ID INT NOT NULL,
  Source_Location INT NOT NULL,
  Destination_Location INT NOT NULL,
  Duration INT NOT NULL,
  Transportation_Mode INT NOT NULL,
  Transport_Price INT NOT NULL,
  PRIMARY KEY (Transport_ID)
);

CREATE TABLE IF NOT EXISTS Customizable_Hotel
(
  Hotel_ID INT NOT NULL,
  Hotel_Name INT NOT NULL,
  Hotel_Rating INT NOT NULL,
  Day INT NOT NULL,
  Night INT NOT NULL,
  PRIMARY KEY (Hotel_ID)
);

CREATE TABLE IF NOT EXISTS Offers1
(
  Offer_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Offer_ID, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

CREATE TABLE IF NOT EXISTS Customizable_Transport_Booking1
(
  Transport_Booking_ID INT NOT NULL,
  Transport_ID INT NOT NULL,
  PRIMARY KEY (Transport_Booking_ID, Transport_ID),
  FOREIGN KEY (Transport_ID) REFERENCES Customizable_Transport(Transport_ID)
);

CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking1
(
  Hotel_Booking_ID INT NOT NULL,
  Hotel_ID INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID, Hotel_ID),
  FOREIGN KEY (Hotel_ID) REFERENCES Customizable_Hotel(Hotel_ID)
);


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

CREATE TABLE IF NOT EXISTS Languages_Spoken
(
  Languages_Spoken INT NOT NULL,
  Guide_ID INT NOT NULL,
  PRIMARY KEY (Languages_Spoken, Guide_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID)
);

CREATE TABLE IF NOT EXISTS Places
(
  Places INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Places, Package_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

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

CREATE TABLE IF NOT EXISTS Assigned_to
(
  Guide_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Guide_ID, Package_ID),
  FOREIGN KEY (Guide_ID) REFERENCES Tour_Guide(Guide_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

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

CREATE TABLE IF NOT EXISTS Offers2
(
  Offer_ID INT NOT NULL,
  Offer_Name INT NOT NULL,
  Description INT NOT NULL,
  Discount_Percentage INT NOT NULL,
  Status INT NOT NULL,
  PRIMARY KEY (Offer_ID)
);

CREATE TABLE IF NOT EXISTS Reviews_and_Feedback2
(
  Review_ID INT NOT NULL,
  Rating INT NOT NULL,
  Comments INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  PRIMARY KEY (Review_ID)
);

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

CREATE TABLE IF NOT EXISTS Customizable_Hotel_booking2
(
  Hotel_Booking_ID INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Night INT NOT NULL,
  PRIMARY KEY (Hotel_Booking_ID)
);

CREATE TABLE IF NOT EXISTS Tourists
(
  Tourist_ID INT NOT NULL,
  First_Name INT NOT NULL,
  Second_Name INT NOT NULL,
  Identity_Type INT NOT NULL,
  House_Number INT NOT NULL,
  Postal_Code INT NOT NULL,
  Street_Address INT NOT NULL,
  Contact_Number INT NOT NULL,
  Identity_Number INT NOT NULL,
  Agent_ID INT NOT NULL,
  PRIMARY KEY (Tourist_ID),
  FOREIGN KEY (Agent_ID) REFERENCES Travel_Agents(Agent_ID)
);

CREATE TABLE IF NOT EXISTS Reviews_and_Feedback1
(
  Review_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Review_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

CREATE TABLE IF NOT EXISTS Bookings1
(
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID),
  FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

CREATE TABLE IF NOT EXISTS Payments1
(
  Payment_ID INT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Payment_ID, Booking_ID, Tourist_ID, Package_ID),
  FOREIGN KEY (Booking_ID, Tourist_ID, Package_ID) REFERENCES Bookings1(Booking_ID, Tourist_ID, Package_ID)
);

CREATE TABLE IF NOT EXISTS Bookings_Tourists_IDs
(
  Tourists_IDs INT NOT NULL,
  Booking_ID INT NOT NULL,
  Tourist_ID INT NOT NULL,
  Package_ID INT NOT NULL,
  PRIMARY KEY (Tourists_IDs),
  FOREIGN KEY (Booking_ID, Tourist_ID, Package_ID) REFERENCES Bookings1(Booking_ID, Tourist_ID, Package_ID)
);

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

CREATE TABLE IF NOT EXISTS Customized_Bookings2
(
  Custom_Booking_ID INT NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Language INT NOT NULL,
  Gender INT NOT NULL,
  Amount_Paid INT NOT NULL,
  Amount_Due INT NOT NULL,
  Tourist_ID INT NOT NULL,
  PRIMARY KEY (Custom_Booking_ID),
  FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID)
);
