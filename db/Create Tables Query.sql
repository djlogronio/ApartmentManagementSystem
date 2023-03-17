CREATE TABLE [dbo].[Role] (
  [RoleId] INT NOT NULL PRIMARY KEY,
  [RoleName] VARCHAR(50) NOT NULL
);

CREATE TABLE [dbo].[User] (
  [UserId] INT NOT NULL PRIMARY KEY,
  [Username] VARCHAR(255) NOT NULL UNIQUE,
  [Password] VARCHAR(255) NOT NULL,
  [Email] VARCHAR(255) NOT NULL UNIQUE,
  [FirstName] VARCHAR(255) NOT NULL,
  [LastName] VARCHAR(255) NOT NULL,
  [PhoneNumber] VARCHAR(20),
  [Address] TEXT,
  [RoleId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Role](RoleId)
);

CREATE TABLE [dbo].[Property] (
  [PropertyId] INT NOT NULL PRIMARY KEY,
  [PropertyName] VARCHAR(255) NOT NULL,
  [PropertyAddress] TEXT NOT NULL,
  [TotalApartments] INT NOT NULL,
  [TotalRooms] INT NOT NULL
);

CREATE TABLE [dbo].[Apartment] (
  [ApartmentId] INT NOT NULL PRIMARY KEY,
  [ApartmentName] VARCHAR(255) NOT NULL,
  [ApartmentDescription] TEXT,
  [ApartmentSize] FLOAT NOT NULL,
  [ApartmentRentAmount] FLOAT NOT NULL,
  [PropertyId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Property](PropertyId)
);

CREATE TABLE [dbo].[Room] (
  [RoomId] INT NOT NULL PRIMARY KEY,
  [RoomNumber] VARCHAR(20) NOT NULL,
  [RoomDescription] TEXT,
  [RoomRentAmount] FLOAT NOT NULL,
  [ApartmentId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Apartment](ApartmentId)
);

CREATE TABLE [dbo].[Rent] (
  [RentId] INT NOT NULL PRIMARY KEY,
  [RentAmount] FLOAT NOT NULL,
  [RentStartDate] DATE NOT NULL,
  [RentEndDate] DATE NOT NULL,
  [RentPaidDate] DATE,
  [IsRentPaid] BIT NOT NULL,
  [RentNotes] TEXT,
  [ResidentId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User](UserId),
  [RoomId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Room](RoomId)
);

CREATE TABLE [dbo].[Maintenance] (
  [MaintenanceId] INT NOT NULL PRIMARY KEY,
  [MaintenanceRequestDate] DATE NOT NULL,
  [MaintenanceDescription] TEXT NOT NULL,
  [MaintenanceStatus] VARCHAR(50) NOT NULL,
  [MaintenanceNotes] TEXT,
  [ResidentId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User](UserId),
  [RoomId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Room](RoomId)
);

CREATE TABLE [dbo].[Expense] (
  [ExpenseId] INT NOT NULL PRIMARY KEY,
  [ExpenseDate] DATE NOT NULL,
  [ExpenseAmount] FLOAT NOT NULL,
  [ExpenseDescription] TEXT NOT NULL,
  [ExpenseCategory] VARCHAR(50) NOT NULL,
  [PropertyId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Property](PropertyId)
);

CREATE TABLE [dbo].[Occupancy] (
  [OccupancyId] INT NOT NULL PRIMARY KEY,
  [ApartmentId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Apartment](ApartmentId),
  [RoomId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Room](RoomId),
  [ResidentId] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User](UserId),
  [OccupancyStartDate] DATE NOT NULL,
  [OccupancyEndDate] DATE
);

CREATE TABLE [dbo].[Notification] (
    [NotificationId] INT PRIMARY KEY,
    [NotificationDate] DATE,
    [NotificationTitle] VARCHAR(255),
    [NotificationMessage] TEXT,
    [RecipientId] INT FOREIGN KEY REFERENCES [dbo].[User]([UserId])
);

CREATE TABLE [dbo].[Security] (
    [SecurityId] INT PRIMARY KEY,
    [SecurityGuardName] VARCHAR(255),
    [SecurityGuardPhone] VARCHAR(20),
    [SurveillanceCameraLocation] TEXT,
    [SurveillanceCameraModel] VARCHAR(50),
    [PropertyId] INT FOREIGN KEY REFERENCES [dbo].[Property]([PropertyId])
);

CREATE TABLE [dbo].[Booking] (
    [BookingId] INT PRIMARY KEY,
    [BookingStartDate] DATE,
    [BookingEndDate] DATE,
    [BookingNotes] TEXT,
    [UserId] INT FOREIGN KEY REFERENCES [dbo].[User]([UserId]),
    [RoomId] INT FOREIGN KEY REFERENCES [dbo].[Room]([RoomId])
);

CREATE TABLE [dbo].[Feedback] (
    [FeedbackId] INT PRIMARY KEY,
    [FeedbackDate] DATE,
    [FeedbackTitle] VARCHAR(255),
    [FeedbackMessage] TEXT,
    [FeedbackCategory] VARCHAR(50),
    [UserId] INT FOREIGN KEY REFERENCES [dbo].[User]([UserId]),
);
