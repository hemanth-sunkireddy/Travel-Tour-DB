-- any id(including identity number)= 10 digit no.
-- day, month = int(2)
-- year = int(4)
-- first name, last name = varchar(15)
-- gender = char(1)
-- contact no. = int(10)
-- rating = int(1)
-- serving destination/destination/destination location/source location = varchar(20)
-- availibility status/ status = int(1)
-- total amount/amount paid/ due/ price = int(10)
-- days/ nights/ discount percentage = int(2)
-- comments/description = varchar(1000)
-- identity type/ street address = varchar(100)
-- house no = int(3)
-- postal code = int(6)


DROP DATABASE IF EXISTS `TRAVEL_AGENCY`;
CREATE SCHEMA `TRAVEL_AGENCY`;
USE `TRAVEL_AGENCY`;
DROP TABLE IF EXISTS `Tourists`;

-- Tourists Table
CREATE TABLE 'Tourists' (
    TouristID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    SecondName VARCHAR(255),
    IdentityType VARCHAR(255),
    IdentityNumber VARCHAR(255),
    ContactNumber VARCHAR(255),
    HouseNumber VARCHAR(255),
    PostalCode VARCHAR(255),
    StreetAddress VARCHAR(255)
);

DROP TABLE IF EXISTS `TourGuide`;
-- Tour Guide Table
CREATE TABLE TourGuide (
    GuideID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    SecondName VARCHAR(255),
    IdentityType VARCHAR(255),
    IdentityNumber VARCHAR(255),
    Gender VARCHAR(255),
    ContactNumber VARCHAR(255),
    Rating FLOAT,
    ServingDestination VARCHAR(255),
    AvailabilityStatus VARCHAR(255)
);

DROP TABLE IF EXISTS `Places`;
CREATE TABLE Places (
Places VARCHAR(255),
FOREIGN KEY (Package_ID) REFERENCES TourPackages(PackageID)
);

DROP TABLE IF EXISTS `Assigned_to`;
CREATE TABLE Assigned_to (
FOREIGN KEY (Guide_ID) REFERENCES TourGuide(GuideID),
FOREIGN KEY (Package_ID) REFERENCES TourPackages(PackageID)
);

DROP TABLE IF EXISTS `TravelAgents`;
-- Travel Agents Table
CREATE TABLE TravelAgents (
    AgentID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    SecondName VARCHAR(255),
    IdentityType VARCHAR(255),
    IdentityNumber VARCHAR(255),
    ContactNumber VARCHAR(255)
);

DROP TABLE IF EXISTS `TourPackages`;
-- Tour Packages Table
CREATE TABLE TourPackages (
    PackageID INT PRIMARY KEY,
    Destination VARCHAR(255),
    Places VARCHAR(255),
    Days INT,
    Nights INT,
    Price FLOAT
);

DROP TABLE IF EXISTS `Book_Tourist_ID`;
CREATE TABLE Book_Tourist_ID(
   Tourists_ID INT,
   Booking_ID INT,
   Tourist_ID INT,
   Package_ID INT
);

DROP TABLE IF EXISTS `CustomizablePlaces`;
-- Customizable Places Table
CREATE TABLE CustomizablePlaces (
    PlaceID INT PRIMARY KEY,
    DestinationName VARCHAR(255),
    PlaceName VARCHAR(255),
    Cost FLOAT
);

DROP TABLE IF EXISTS `CustomizableTransport`;
-- Customizable Transport Table
CREATE TABLE CustomizableTransport (
    TransportID INT PRIMARY KEY,
    SourceLocation VARCHAR(255),
    DestinationLocation VARCHAR(255),
    Duration VARCHAR(255),
    TransportationMode VARCHAR(255),
    TransportPrice FLOAT
);

DROP TABLE IF EXISTS `CustomizableHotel`;
-- Customizable Hotel Table
CREATE TABLE CustomizableHotel (
    HotelID INT PRIMARY KEY,
    HotelName VARCHAR(255),
    HotelRating FLOAT,
    DayPrice FLOAT,
    NightPrice FLOAT
);

DROP TABLE IF EXISTS `ReviewsAndFeedback`;
-- Reviews and Feedback Table
CREATE TABLE ReviewsAndFeedback (
    ReviewID INT PRIMARY KEY,
    Rating FLOAT,
    Comments VARCHAR(255),
    Day INT,
    Month INT,
    Year INT
);

DROP TABLE IF EXISTS `ReviewsAndFeedback`;
CREATE TABLE ReviewsAndFeedback(
    ReviewID INT PRIMARY KEY,
    TouristID INT,
    PackageID INT,
);

DROP TABLE IF EXISTS `Offers`;
-- Offers Table
CREATE TABLE Offers (
    OfferID INT PRIMARY KEY,
    OfferName VARCHAR(255),
    Description VARCHAR(255),
    DiscountPercentage FLOAT,
    Status VARCHAR(255)
);

DROP TABLE IF EXISTS `Offers2`;
CREATE TABLE Offers2 (
    OfferID INT PRIMARY KEY,
    PackageID INT,
);

DROP TABLE IF EXISTS `Bookings`;
-- Bookings Table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TotalAmount FLOAT,
    AmountPaid FLOAT,
    AmountDue FLOAT
);

DROP TABLE IF EXISTS `Booking1`;
CREATE TABLE Booking1 (
   Booking_ID INT,
   Tourist_ID INT,
   Package_ID INT
)

DROP TABLE IF EXISTS `CustomizableTransportBooking`;
-- Customizable Transport Booking Table
CREATE TABLE CustomizableTransportBooking (
    TransportBookingID INT PRIMARY KEY,
    TransportID INT,
    DepartureDateTime DATETIME,
    FOREIGN KEY (TransportID) REFERENCES CustomizableTransport(TransportID)
);

DROP TABLE IF EXISTS `CustomizableHotelBooking`;
-- Customizable Hotel Booking Table
CREATE TABLE CustomizableHotelBooking (
    HotelBookingID INT PRIMARY KEY,
    HotelID INT,
    BookingDate DATE,
    DurationDay INT,
    DurationNight INT,
    Cost FLOAT,
    FOREIGN KEY (HotelID) REFERENCES CustomizableHotel(HotelID)
);

DROP TABLE IF EXISTS `CustomizedBookings`;
-- Customized Bookings Table
CREATE TABLE CustomizedBookings (
    CustomBookingID INT PRIMARY KEY,
    TouristID INT,
    BookingDate DATE,
    PlaceID INT,
    TransportBookingID INT,
    HotelBookingID INT,
    Gender VARCHAR(255),
    Language VARCHAR(255),
    TouristsIDs VARCHAR(255),
    TotalAmount FLOAT,
    AmountPaid FLOAT,
    AmountDue FLOAT,
    FOREIGN KEY (PlaceID) REFERENCES CustomizablePlaces(PlaceID),
    FOREIGN KEY (TransportBookingID) REFERENCES CustomizableTransportBooking(TransportBookingID),
    FOREIGN KEY (HotelBookingID) REFERENCES CustomizableHotelBooking(HotelBookingID)
);

DROP TABLE IF EXISTS `Payments1`;
-- Payments Table
CREATE TABLE Payments1 (
    PaymentID INT PRIMARY KEY,
    BookingType VARCHAR(255),
    BookingID INT,
    PaymentDate DATE,
    PaymentAmount FLOAT,
    PaymentMethod VARCHAR(255)
);

DROP TABLE IF EXISTS `Payments1`;
CREATE TABLE Payments1 (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    TouristID INT,
    PackageID INT
);

DROP TABLE IF EXISTS `Languages`;
CREATE TABLE Languages(
    LanguagesSpoken VARCHAR(255),
    FOREIGN KEY (Guide_ID) REFERENCES TourGuide(Guide_ID)
);