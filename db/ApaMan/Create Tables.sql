CREATE DATABASE db_ApaMan;

USE db_ApaMan;

CREATE TABLE [tbl_Role] (
  [fld_RoleId] INT NOT NULL PRIMARY KEY,
  [fld_RoleName] VARCHAR(50) NOT NULL
);

CREATE TABLE [tbl_User] (
  [fld_UserId] INT NOT NULL PRIMARY KEY,
  [fld_Username] VARCHAR(255) NOT NULL UNIQUE,
  [fld_Password] VARCHAR(255) NOT NULL,
  [fld_Email] VARCHAR(255) NOT NULL UNIQUE,
  [fld_FirstName] VARCHAR(255) NOT NULL,
  [fld_LastName] VARCHAR(255) NOT NULL,
  [fld_PhoneNumber] VARCHAR(20),
  [fld_Address] TEXT,
  [fld_RoleId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Role](fld_RoleId)
);

CREATE TABLE [tbl_Property] (
  [fld_PropertyId] INT NOT NULL PRIMARY KEY,
  [fld_PropertyName] VARCHAR(255) NOT NULL,
  [fld_PropertyAddress] TEXT NOT NULL,
  [fld_TotalApartments] INT NOT NULL,
  [fld_TotalRooms] INT NOT NULL
);

CREATE TABLE [tbl_Apartment] (
  [fld_ApartmentId] INT NOT NULL PRIMARY KEY,
  [fld_ApartmentName] VARCHAR(255) NOT NULL,
  [fld_ApartmentDescription] TEXT,
  [fld_ApartmentSize] FLOAT NOT NULL,
  [fld_ApartmentRentAmount] FLOAT NOT NULL,
  [fld_PropertyId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Property](fld_PropertyId)
);

CREATE TABLE [tbl_Room] (
  [fld_RoomId] INT NOT NULL PRIMARY KEY,
  [fld_RoomNumber] VARCHAR(20) NOT NULL,
  [fld_RoomDescription] TEXT,
  [fld_RoomRentAmount] FLOAT NOT NULL,
  [fld_ApartmentId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Apartment](fld_ApartmentId)
);

CREATE TABLE [tbl_Rent] (
  [fld_RentId] INT NOT NULL PRIMARY KEY,
  [fld_RentAmount] FLOAT NOT NULL,
  [fld_RentStartDate] DATE NOT NULL,
  [fld_RentEndDate] DATE NOT NULL,
  [fld_RentPaidDate] DATE,
  [fld_IsRentPaid] BIT NOT NULL,
  [fld_RentNotes] TEXT,
  [fld_ResidentId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_User](fld_UserId),
  [fld_RoomId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Room](fld_RoomId)
);

CREATE TABLE [tbl_Maintenance] (
  [fld_MaintenanceId] INT NOT NULL PRIMARY KEY,
  [fld_MaintenanceRequestDate] DATE NOT NULL,
  [fld_MaintenanceDescription] TEXT NOT NULL,
  [fld_MaintenanceStatus] VARCHAR(50) NOT NULL,
  [fld_MaintenanceNotes] TEXT,
  [fld_ResidentId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_User](fld_UserId),
  [fld_RoomId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Room](fld_RoomId)
);

CREATE TABLE [tbl_Expense] (
  [fld_ExpenseId] INT NOT NULL PRIMARY KEY,
  [fld_ExpenseDate] DATE NOT NULL,
  [fld_ExpenseAmount] FLOAT NOT NULL,
  [fld_ExpenseDescription] TEXT NOT NULL,
  [fld_ExpenseCategory] VARCHAR(50) NOT NULL,
  [fld_PropertyId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Property](fld_PropertyId)
);

CREATE TABLE [tbl_Occupancy] (
  [fld_OccupancyId] INT NOT NULL PRIMARY KEY,
  [fld_ApartmentId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Apartment](fld_ApartmentId),
  [fld_RoomId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_Room](fld_RoomId),
  [fld_ResidentId] INT NOT NULL FOREIGN KEY REFERENCES [tbl_User](fld_UserId),
  [fld_OccupancyStartDate] DATE NOT NULL,
  [fld_OccupancyEndDate] DATE
);

CREATE TABLE [tbl_Notification] (
    [fld_NotificationId] INT PRIMARY KEY,
    [fld_NotificationDate] DATE,
    [fld_NotificationTitle] VARCHAR(255),
    [fld_NotificationMessage] TEXT,
    [fld_RecipientId] INT FOREIGN KEY REFERENCES [tbl_User]([fld_UserId])
);

CREATE TABLE [tbl_Security] (
    [fld_SecurityId] INT PRIMARY KEY,
    [fld_SecurityGuardName] VARCHAR(255),
    [fld_SecurityGuardPhone] VARCHAR(20),
    [fld_SurveillanceCameraLocation] TEXT,
    [fld_SurveillanceCameraModel] VARCHAR(50),
    [fld_PropertyId] INT FOREIGN KEY REFERENCES [tbl_Property]([fld_PropertyId])
);

CREATE TABLE [tbl_Booking] (
    [fld_BookingId] INT PRIMARY KEY,
    [fld_BookingStartDate] DATE,
    [fld_BookingEndDate] DATE,
    [fld_BookingNotes] TEXT,
    [fld_UserId] INT FOREIGN KEY REFERENCES [tbl_User]([fld_UserId]),
    [fld_RoomId] INT FOREIGN KEY REFERENCES [tbl_Room]([fld_RoomId])
);

CREATE TABLE [tbl_Feedback] (
    [fld_FeedbackId] INT PRIMARY KEY,
    [fld_FeedbackDate] DATE,
    [fld_FeedbackTitle] VARCHAR(255),
    [fld_FeedbackMessage] TEXT,
    [fld_FeedbackCategory] VARCHAR(50),
    [fld_UserId] INT FOREIGN KEY REFERENCES [tbl_User]([fld_UserId]),
);
