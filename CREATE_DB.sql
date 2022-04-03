DROP TABLE IF EXISTS Bookings;

DROP TABLE IF EXISTS RoomCategories;

DROP TABLE IF EXISTS Phones;

DROP TABLE IF EXISTS Clients;

DROP TABLE IF EXISTS Addresses;

--ALTER TABLE
--nikos safsa--
CREATE TABLE Addresses (
    ID int AUTO_INCREMENT,
    Country varchar(255),
    City varchar(255),
    StreetName varchar(255),
    StreetNo int,
    PRIMARY KEY (ID)
);

CREATE TABLE Clients (
    ClientID int AUTO_INCREMENT,
    ClientNo int NOT NULL UNIQUE,
    IdentityNumber varchar(100) UNIQUE,
    Lastname varchar(255),
    Firstname varchar(255),
    FullAddressID int,
    RegistrationDate DATE,
    PRIMARY KEY (ClientID),
    FOREIGN KEY (FullAddressID) REFERENCES Addresses(ID)
);

CREATE TABLE Phones (
    PhoneID int AUTO_INCREMENT,
    PhoneNumber int UNIQUE,
    ClientID int,
    PRIMARY KEY (PhoneID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

CREATE TABLE RoomCategories (
    RoomCategoryID int AUTO_INCREMENT,
    Name varchar(255) UNIQUE,
    RoomPrice int,
    RoomCount int,
    PRIMARY KEY (RoomCategoryID)
);

CREATE TABLE Rooms (
    RoomID int UNIQUE,
    RoomCategory int NOT NULL,
    RoomNumber int,
    FloorNumber int,
    SquareMeters int,
    BookTimes int,
    PRIMARY KEY (RoomID),
    FOREIGN KEY (RoomCategory) REFERENCES RoomCategories(RoomCategoryID)
);

ALTER TABLE
    Rooms
ADD
    CONSTRAINT RoomNumber UNIQUE NONCLUSTERED(RoomNumber, RoomCategory);

CREATE TABLE Bookings (
    BookID int AUTO_INCREMENT,
    BookInDate DATE,
    BookOutDate DATE,
    Bill int,
    ClientID int,
    PRIMARY KEY (BookID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

ALTER TABLE
    Bookings
ADD
    CONSTRAINT ClientID UNIQUE NONCLUSTERED(ClientID, BookInDate, BookOutDate);

CREATE TABLE Facilities (
    FacilityID int AUTO_INCREMENT,
    Name varchar(255) UNIQUE,
    DailyPrice int,
    PRIMARY KEY (FacilityID)
);