--create all tables

CREATE TABLE  Students (
    S_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
);
GO

CREATE TABLE  Staff (
    staff_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
	position VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
	salary DECIMAL(10, 2) NOT NULL
);
GO

CREATE TABLE  Courses (
    C_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    level INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
	start_date DATE,
    end_date DATE,
    capacity INT,
    instructor_id INT NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES Staff (staff_id)
);
GO

CREATE TABLE  Materials (
    M_id INT PRIMARY KEY IDENTITY(1,1),
    C_id INT NOT NULL,
    type VARCHAR(255),
    link VARCHAR(255),
    FOREIGN KEY (C_id) REFERENCES Courses (C_id)
);
GO

CREATE TABLE  Payments (
    P_id INT PRIMARY KEY IDENTITY(1,1),
    S_id INT NOT NULL,
    C_id INT NOT NULL,
    cost DECIMAL(10, 2),
    date DATE DEFAULT GETDATE(),
    FOREIGN KEY (S_id) REFERENCES Students (S_id),
    FOREIGN KEY (C_id) REFERENCES Courses (C_id)
);
GO

CREATE TABLE Classrooms (
    CLS_id INT PRIMARY KEY IDENTITY(1,1),
    location VARCHAR(5) NOT NULL,
    capacity INT,
);
GO

CREATE TABLE  Certifications (
    CRTFCT_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(255) NOT NULL,
    grade VARCHAR(50) NOT NULL,
    date_earned DATE NOT NULL,
    issuing_organization NVARCHAR(255),
    S_id INT NOT NULL,
    C_id INT NOT NULL,
    FOREIGN KEY (C_id) REFERENCES Courses (C_id),
    FOREIGN KEY (S_id) REFERENCES Students (S_id)
);
GO

CREATE TABLE  SC_enrollment (
    S_id INT,
    C_id INT,
    date DATE DEFAULT GETDATE(),
    FOREIGN KEY (S_id) REFERENCES Students (S_id),
    FOREIGN KEY (C_id) REFERENCES Courses (C_id),
    CONSTRAINT PK_Composite1 PRIMARY KEY (S_id, C_id)
);
GO

CREATE TABLE  SC_attendance (
    S_id INT,
    C_id INT,
    date DATE DEFAULT GETDATE(),
    status BIT  NOT NULL, -- 1 for Present, 0 for Absent
    FOREIGN KEY (S_id) REFERENCES Students (S_id),
    FOREIGN KEY (C_id) REFERENCES Courses (C_id),
    CONSTRAINT PK_Composite2 PRIMARY KEY (S_id, C_id)
);
GO

CREATE TABLE Classrooms_Courses (
    CLS_id INT,
    C_id INT,
    FOREIGN KEY (CLS_id) REFERENCES Classrooms (CLS_id),
    FOREIGN KEY (C_id) REFERENCES Courses (C_id),
    CONSTRAINT PK_Composite PRIMARY KEY (CLS_id, C_id),
	day varchar(50),
	time Time
);
GO
ALTER TABLE Students
ADD Address varchar(255);

ALTER TABLE Students
DROP COLUMN Address;

ALTER TABLE	Staff
ADD CONSTRAINT  unq_stf unique(phone_number);

ALTER TABLE Staff
DROP CONSTRAINT unq_stf;

update Classrooms set capacity = 40 where CLS_id = 1;

update Courses set price = 300 where C_id = 10;

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('mariam','ahmed','2003-11-11','mariam.ahmed@gmail.com','(914) 152-7643');

delete from Students where S_id=44;