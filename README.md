# DnA_Project
## Latex code for Phase-1
```
https://www.overleaf.com/5474393319cgjnrrmyhjkb
```

entity types:

Customers:



CustomerID (Primary Key)

First Name

Last Name

Contact Information (Email, Phone)

Address

Passport/ID Information (for international bookings)





Bookings:



BookingID (Primary Key)

CustomerID (Foreign Key to Customers Table)

Tour Package/Service ID (Foreign Key to Tour Packages Table)

Booking Date

Number of Travelers

Payment Status

Total Amount





Tour Packages:



PackageID (Primary Key)

Package Name

Destination

Description

Duration

Price

Availability Status
