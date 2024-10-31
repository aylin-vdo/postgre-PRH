-- Script to create tables

-- Create table Users
CREATE TABLE Users (
    UserID INTEGER PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Type INTEGER NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL
);

COMMENT ON TABLE Users IS 'Stores information about users';
COMMENT ON COLUMN Users.UserID IS 'Primary key for user';
COMMENT ON COLUMN Users.Name IS 'Name of the user';
COMMENT ON COLUMN Users.Password IS 'Password for the user account';
COMMENT ON COLUMN Users.Type IS 'Type of user (e.g., admin, regular)';
COMMENT ON COLUMN Users.UserCreation IS 'User who created the record';
COMMENT ON COLUMN Users.CreatedAt IS 'Timestamp when the record was created';
COMMENT ON COLUMN Users.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN Users.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN Users.Active IS 'Indicates whether the record is active (true) or inactive (false)';

-- Create table Degrees
CREATE TABLE Degrees (
    Identity SERIAL PRIMARY KEY,
    DegreeName VARCHAR(255) NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL
);

COMMENT ON TABLE Degrees IS 'Stores information about degrees offered';
COMMENT ON COLUMN Degrees.Identity IS 'Primary key for degree';
COMMENT ON COLUMN Degrees.DegreeName IS 'Name of the degree';
COMMENT ON COLUMN Degrees.UserCreation IS 'User who created the record';
COMMENT ON COLUMN Degrees.CreatedAt IS 'Timestamp when the record was created';
COMMENT ON COLUMN Degrees.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN Degrees.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN Degrees.Active IS 'Indicates whether the record is active (true) or inactive (false)';

-- Create table Advisors
CREATE TABLE Advisors (
    StudentIDNumber INTEGER PRIMARY KEY,
    Gender VARCHAR(50) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    DegreeIdentity INTEGER NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL,
    FOREIGN KEY (DegreeIdentity) REFERENCES Degrees(Identity)
);

COMMENT ON TABLE Advisors IS 'Stores information about advisors';
COMMENT ON COLUMN Advisors.StudentIDNumber IS 'Primary key for advisor, using StudentIDNumber ID';
COMMENT ON COLUMN Advisors.Gender IS 'Gender of the advisor';
COMMENT ON COLUMN Advisors.Name IS 'Name of the advisor';
COMMENT ON COLUMN Advisors.DegreeIdentity IS 'Foreign key to degree table';
COMMENT ON COLUMN Advisors.UserCreation IS 'User who created the record';
COMMENT ON COLUMN Advisors.CreatedAt IS 'Timestamp when the record was created';
COMMENT ON COLUMN Advisors.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN Advisors.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN Advisors.Active IS 'Indicates whether the record is active (true) or inactive (false)';

-- Create table Advisees
CREATE TABLE Advisees (
    StudentIDNumber INTEGER PRIMARY KEY,
    Gender VARCHAR(50) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    DegreeIdentity INTEGER NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL,
    FOREIGN KEY (DegreeIdentity) REFERENCES Degrees(Identity)
);

COMMENT ON TABLE Advisees IS 'Stores information about advisees';
COMMENT ON COLUMN Advisees.StudentIDNumber IS 'Primary key for advisee, using StudentIDNumber ID';
COMMENT ON COLUMN Advisees.Gender IS 'Gender of the advisee';
COMMENT ON COLUMN Advisees.Name IS 'Name of the advisee';
COMMENT ON COLUMN Advisees.DegreeIdentity IS 'Foreign key to degree table';
COMMENT ON COLUMN Advisees.UserCreation IS 'User who created the record';
COMMENT ON COLUMN Advisees.CreatedAt IS 'Timestamp when the record was created';
COMMENT ON COLUMN Advisees.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN Advisees.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN Advisees.Active IS 'Indicates whether the record is active (true) or inactive (false)';

-- Create table LearningUnits
CREATE TABLE LearningUnits (
    Identity SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DegreeIdentity INTEGER NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL,
    FOREIGN KEY (DegreeIdentity) REFERENCES Degrees(Identity)
);

COMMENT ON TABLE LearningUnits IS 'Stores information about learning units';
COMMENT ON COLUMN LearningUnits.Identity IS 'Primary key for learning unit';
COMMENT ON COLUMN LearningUnits.Name IS 'Name of the learning unit';
COMMENT ON COLUMN LearningUnits.DegreeIdentity IS 'Foreign key to degree table';
COMMENT ON COLUMN LearningUnits.UserCreation IS 'User who created the record';
COMMENT ON COLUMN LearningUnits.CreatedAt IS 'Timestamp when the record was created';
COMMENT ON COLUMN LearningUnits.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN LearningUnits.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN LearningUnits.Active IS 'Indicates whether the record is active (true) or inactive (false)';

-- Create table AdvisorySessions
CREATE TABLE AdvisorySessions (
    Identity SERIAL PRIMARY KEY,
    LearningUnitIdentity INTEGER NOT NULL,
    Topic VARCHAR(255) NOT NULL,
    Professor VARCHAR(255) NOT NULL,
    ClassType VARCHAR(100) NOT NULL, -- Clase Ordinaria, Sabatino y Autogestivo
    AdvisorIdentity INTEGER NOT NULL,
    AdviseeIdentity INTEGER NOT NULL,
    SessionDate DATE NOT NULL,
    StartTime TIMESTAMP NOT NULL,
    EndTime TIMESTAMP NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL,
    FOREIGN KEY (LearningUnitIdentity) REFERENCES LearningUnits(Identity),
    FOREIGN KEY (AdvisorIdentity) REFERENCES Advisors(StudentIDNumber),
    FOREIGN KEY (AdviseeIdentity) REFERENCES Advisees(StudentIDNumber)
);

COMMENT ON TABLE AdvisorySessions IS 'Stores information about advisory sessions';
COMMENT ON COLUMN AdvisorySessions.Identity IS 'Primary key for advisory session';
COMMENT ON COLUMN AdvisorySessions.LearningUnitIdentity IS 'Foreign key to learning unit table';
COMMENT ON COLUMN AdvisorySessions.Topic IS 'Topic of the advisory session';
COMMENT ON COLUMN AdvisorySessions.Professor IS 'Professor leading the session';
COMMENT ON COLUMN AdvisorySessions.ClassType IS 'Type of class (e.g., lecture, lab)';
COMMENT ON COLUMN AdvisorySessions.AdvisorIdentity IS 'Foreign key to advisor table';
COMMENT ON COLUMN AdvisorySessions.AdviseeIdentity IS 'Foreign key to advisee table';
COMMENT ON COLUMN AdvisorySessions.SessionDate IS 'Date of the advisory session';
COMMENT ON COLUMN AdvisorySessions.StartTime IS 'Start time of the advisory session';
COMMENT ON COLUMN AdvisorySessions.EndTime IS 'End time of the advisory session';
COMMENT ON COLUMN AdvisorySessions.UserCreation IS 'User who created the record';
COMMENT ON COLUMN AdvisorySessions.CreatedAt IS 'Timestamp when the record was created';
COMMENT ON COLUMN AdvisorySessions.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN AdvisorySessions.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN AdvisorySessions.Active IS 'Indicates whether the record is active (true) or inactive (false)';

CREATE TABLE EntryExitRecord (
    Identity SERIAL PRIMARY KEY,
    AdvisorIdentity INTEGER NOT NULL,
    EntryTime TIMESTAMP NOT NULL,
    ExitTime TIMESTAMP NOT NULL,
    CurrentDate DATE NOT NULL,
    UserCreation INTEGER NOT NULL,
    CreatedAt TIMESTAMP NOT NULL,
    UserUpdate INTEGER NOT NULL,
    UpdatedAt TIMESTAMP NOT NULL,
    Active BOOLEAN NOT NULL,
    FOREIGN KEY (AdvisorIdentity) REFERENCES Advisors(StudentIDNumber)
);

COMMENT ON TABLE EntryExitRecord IS 'Stores records of the entry and exit times of every advisor as well as the date';
COMMENT ON COLUMN EntryExitRecord.Identity IS 'Primary key for the record';
COMMENT ON COLUMN EntryExitRecord.AdvisorIdentity IS 'Foreign key to advisor table';
COMMENT ON COLUMN EntryExitRecord.EntryTime IS 'Time at which the advisor clocked in';
COMMENT ON COLUMN EntryExitRecord.ExitTime IS 'Time at which the advisor clocked out';
COMMENT ON COLUMN EntryExitRecord.CurrentDate IS 'Date of the entry and exit records for the advisor';
COMMENT ON COLUMN EntryExitRecord.UserCreation IS 'User who created the record';
COMMENT ON COLUMN EntryExitRecord.CreatedAt IS 'Timestamp when the record was create':
COMMENT ON COLUMN EntryExitRecord.UserUpdate IS 'User who last updated the record';
COMMENT ON COLUMN EntryExitRecord.UpdatedAt IS 'Timestamp when the record was last updated';
COMMENT ON COLUMN EntryExitRecord.Active IS 'Indicates whether the record is active (true) or inactive (false)';