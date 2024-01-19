--create Audit table for all tables

CREATE TABLE Students_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    S_id INT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    date_of_birth DATE,
    email VARCHAR(225),
    phone_number VARCHAR(20),
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Staff_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    staff_id INT,
    first_name VARCHAR(225),
    last_name VARCHAR(225),
    position VARCHAR(225),
    email VARCHAR(225),
    phone_number VARCHAR(20),
    salary DECIMAL(10, 2),
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Courses_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    C_id INT,
    name VARCHAR(225),
    level INT,
    price DECIMAL(10, 2),
    start_date DATE,
    end_date DATE,
    capacity INT,
    instructor_id INT,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Materials_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    M_id INT,
    C_id INT,
    type VARCHAR(225),
    link VARCHAR(225),
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Payments_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    P_id INT,
    S_id INT,
    C_id INT,
    cost DECIMAL(10, 2),
    date DATE,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Classrooms_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    CLS_id INT,
    location VARCHAR(5),
    capacity INT,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Certifications_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    CRTFCT_id INT,
    name VARCHAR(225),
    grade VARCHAR(50),
    date_earned DATE,
    issuing_organization VARCHAR(225),
    S_id INT,
    C_id INT,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SC_enrollment_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    S_id INT,
    C_id INT,
    date DATE,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE SC_attendance_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    S_id INT,
    C_id INT,
    date DATE,
    status BIT,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Classrooms_Courses_Audit (
    Audit_id INT IDENTITY(1,1) PRIMARY KEY,
    CLS_id INT,
    C_id INT,
    day VARCHAR(50),
    time TIME,
    audit_action VARCHAR(10) CHECK (audit_action = 'INSERT' or audit_action = 'DELETE' or audit_action = 'UPDATE'),
    audit_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);
