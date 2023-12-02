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
    StreetAddress VARCHAR(255),
    AgentID INT,
    FOREIGN KEY AgentID REFERENCES TravelAgents(AgentID)
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
    PackageID INT,
    FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID)
);

DROP TABLE IF EXISTS `Assigned_to`;
CREATE TABLE Assigned_to (
    GuideID INT,
    PackageID INT,
    FOREIGN KEY (GuideID) REFERENCES TourGuide(GuideID),
    FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID)
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
    Days INT,
    Nights INT,
    Price FLOAT
);

DROP TABLE IF EXISTS `Bookings_TouristID`;
CREATE TABLE Bookings_TouristID(
   TouristsID INT,
   BookingID INT,
   TouristID INT,
   PackageID INT,
   FOREIGN KEY (BookingID) REFERENCES Bookings1(BookingID),
   FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID),
   FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID)
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
    Day FLOAT,
    Night FLOAT
);

DROP TABLE IF EXISTS `ReviewsAndFeedback2`;
-- Reviews and Feedback Table
CREATE TABLE ReviewsAndFeedback2 (
    ReviewID INT PRIMARY KEY,
    Rating FLOAT,
    Comments VARCHAR(255),
    BookingDate DATE,
);

DROP TABLE IF EXISTS `ReviewsAndFeedback1`;
CREATE TABLE ReviewsAndFeedback1(
    ReviewID INT PRIMARY KEY,
    TouristID INT,
    PackageID INT,
    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID),
    FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID),
);

DROP TABLE IF EXISTS `Offers2`;
-- Offers Table
CREATE TABLE Offers2 (
    OfferID INT PRIMARY KEY,
    OfferName VARCHAR(255),
    Description VARCHAR(255),
    DiscountPercentage FLOAT,
    Status VARCHAR(255)
);

DROP TABLE IF EXISTS `Offers1`;
CREATE TABLE Offers1 (
    OfferID INT PRIMARY KEY,
    PackageID INT,
    FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID)
);

DROP TABLE IF EXISTS `Bookings2`;
-- Bookings Table
CREATE TABLE Bookings2 (
    BookingID INT PRIMARY KEY,
    BookingDate DATE,
    TotalAmount FLOAT,
    AmountPaid FLOAT,
    AmountDue FLOAT
);

DROP TABLE IF EXISTS `Bookings1`;
CREATE TABLE Bookings1 (
   BookingID INT,
   TouristID INT,
   PackageID INT,
   FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID),
   FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID    )
)

DROP TABLE IF EXISTS `CustomizableTransportBooking1`;
-- Customizable Transport Booking Table
CREATE TABLE CustomizableTransportBooking1 (
    TransportBookingID INT PRIMARY KEY,
    TransportID INT,
    FOREIGN KEY (TransportID) REFERENCES CustomizableTransport(TransportID)
);

DROP TABLE IF EXISTS `CustomizableTransportBooking2`;
-- Customizable Transport Booking Table
CREATE TABLE CustomizableTransportBooking2 (
    TransportBookingID INT PRIMARY KEY,
    DepartureDateTime DATETIME,
);

DROP TABLE IF EXISTS `CustomizableHotelBooking2`;
-- Customizable Hotel Booking Table
CREATE TABLE CustomizableHotelBooking2 (
    HotelBookingID INT PRIMARY KEY,
    BookingDate DATE,
    DurationDay INT,
    DurationNight INT,
);

DROP TABLE IF EXISTS `CustomizableHotelBooking1`;
-- Customizable Hotel Booking Table
CREATE TABLE CustomizableHotelBooking1 (
    HotelBookingID INT PRIMARY KEY,
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES CustomizableHotel(HotelID)
);

DROP TABLE IF EXISTS `CustomizedBookings2`;
-- Customized Bookings Table
CREATE TABLE CustomizedBookings2 (
    CustomBookingID INT PRIMARY KEY,
    TouristID INT,
    BookingDate DATE,
    Gender VARCHAR(255),
    Language VARCHAR(255),
    AmountPaid FLOAT,
    AmountDue FLOAT,
    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID)
);

DROP TABLE IF EXISTS `CustomizedBookings1`;
-- Customized Bookings Table
CREATE TABLE CustomizedBookings1 (
    CustomBookingID INT PRIMARY KEY,
    PlaceID INT,
    TransportBookingID INT,
    TransportID INT,
    HotelBookingID INT,
    HotelID INT,
    FOREIGN KEY (PlaceID) REFERENCES CustomizablePlaces(PlaceID),
    FOREIGN KEY (TransportBookingID) REFERENCES CustomizableTransportBooking(TransportBookingID),
    FOREIGN KEY (TransportID) REFERENCES CustomizableTransport(TransportID),
    FOREIGN KEY (HotelBookingID) REFERENCES CustomizableHotelBooking(HotelBookingID),
    FOREIGN KEY (HotelID) REFERENCES CustomizableHotel(HotelID)
);

DROP TABLE IF EXISTS `Payments2`;
-- Payments Table
CREATE TABLE Payments2 (
    PaymentID INT PRIMARY KEY,
    BookingType VARCHAR(255),
    PaymentDate DATE,
    PaymentAmount FLOAT,
    PaymentMethod VARCHAR(255)
);

DROP TABLE IF EXISTS `Payments1`;
CREATE TABLE Payments1 (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    TouristID INT,
    PackageID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings1(BookingID),
    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID),
    FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID)
);

DROP TABLE IF EXISTS `LanguagesSpoken`;
CREATE TABLE LanguagesSpoken(
    LanguagesSpoken VARCHAR(255),
    GuideID INT,
    FOREIGN KEY (GuideID) REFERENCES TourGuide(GuideID)
);

DROP TABLE IF EXISTS `BookingHandler`;
CREATE TABLE BookingHandler (
    PaymentID INT,
    BookingID INT,
    TouristID INT,
    PackageID INT,
    AgentID INT,
    FOREIGN KEY (PaymentID) REFERENCES Payments1(PaymentID),
    FOREIGN KEY (BookingID) REFERENCES Bookings1(BookingID),
    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID),
    FOREIGN KEY (PackageID) REFERENCES TourPackages(PackageID),
    FOREIGN KEY (AgentID) REFERENCES TravelAgents(AgentID)
);

DROP TABLE IF EXISTS `TouristsIDs`;
CREATE TABLE TouristsIDs (
    TouristsIDs INT PRIMARY KEY,
    PlaceID INT,
    TransportBookingID INT,
    TransportID INT,
    HotelBookingID INT,
    HotelID INT,
    CustomBookingID INT,
    FOREIGN KEY (PlaceID) REFERENCES CustomizablePlaces(PlaceID),
    FOREIGN KEY (TransportBookingID) REFERENCES CustomizableTransportBooking(TransportBookingID),
    FOREIGN KEY (TransportID) REFERENCES CustomizableTransport(TransportID),
    FOREIGN KEY (HotelBookingID) REFERENCES CustomizableHotelBooking(HotelBookingID),
    FOREIGN KEY (HotelID) REFERENCES CustomizableHotel(HotelID),
    FOREIGN KEY (CustomBookingID) REFERENCES CustomizedBookings1(CustomBookingID)
);