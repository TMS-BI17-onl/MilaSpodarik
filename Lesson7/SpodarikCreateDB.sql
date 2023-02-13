CREATE DATABASE EducationProject

USE EducationProject

CREATE TABLE dim_students
(
    ID_students    INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    name		   VARCHAR(45) NOT NULL,
	lastname       VARCHAR(45) NOT NULL,
    dob	           DATE NOT NULL, 
    passport_id	   NVARCHAR(45) NOT NULL UNIQUE,
    phone_number   VARCHAR(45) NOT NULL,
    email          VARCHAR(45) NOT NULL,
    group_id       INT  NOT NULL,
    start_date	   DATE NOT NULL,
	end_date	   DATE NOT NULL,
  );

  ALTER TABLE dim_students
  ADD CONSTRAINT group_id_unique UNIQUE (group_id) 
  
  /--без этого назначения не могла создать в fct_timetable FK на group_id в dim_students/ 

  CREATE TABLE dim_teachers
(
    ID_teacher     INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    name		   VARCHAR(45) NOT NULL,
	lastname       VARCHAR(45) NOT NULL,
    dob	           DATE NOT NULL,
	speciality	   NVARCHAR(225) NOT NULL,
      );


  CREATE TABLE dim_lessons
(
    ID_lesson      INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
	name		   NVARCHAR(90) NOT NULL,
    course_name	   NVARCHAR(100) NOT NULL,
	description	   NVARCHAR(225) NOT NULL,
      );


   CREATE TABLE fct_attendance_and_mark
(
    ID_attendmark  INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    ID_students	   INT NOT NULL,
	attendance     BIT NOT NULL,
    date           DATE NOT NULL,
	ID_lesson      INT NOT NULL,
	mark	       INT NOT NULL,
	CONSTRAINT FK_ID_students FOREIGN KEY (ID_students)
    REFERENCES dim_students(ID_students),
	CONSTRAINT FK_ID_lesson FOREIGN KEY (ID_lesson)
    REFERENCES dim_lessons(ID_lesson),
);
   
      CREATE TABLE fct_timetable
(
    ID_timetable   INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    group_id	   INT NOT NULL,
	date_time      DATETIME NOT NULL,
	ID_lesson      INT NOT NULL,
	ID_teacher     INT NOT NULL,
	room	       VARCHAR(45) NOT NULL,
	CONSTRAINT FK_group_id FOREIGN KEY (group_id)
    REFERENCES dim_students(group_id),
	CONSTRAINT FK_ID_lesson2 FOREIGN KEY (ID_lesson)
    REFERENCES dim_lessons(ID_lesson),
	CONSTRAINT FK_ID_teacher FOREIGN KEY (ID_teacher)
    REFERENCES dim_teachers(ID_teacher),
);