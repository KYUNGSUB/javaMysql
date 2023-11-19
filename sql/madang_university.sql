SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS work_prog;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS work_dept;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS work_in;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Professor;




/* Create Tables */

CREATE TABLE Department
(
	dno int NOT NULL,
	dname varchar(30) NOT NULL,
	office varchar(20) NOT NULL,
	ssn int NOT NULL,
	PRIMARY KEY (dno),
	UNIQUE (dno),
	UNIQUE (ssn)
);


CREATE TABLE Graduate
(
	ssn int NOT NULL,
	name varchar(20) NOT NULL,
	age int,
	deg_prog varchar(10) NOT NULL,
	dno int NOT NULL,
	graduatessn int NOT NULL,
	PRIMARY KEY (ssn),
	UNIQUE (ssn),
	UNIQUE (dno),
	UNIQUE (graduatessn)
);


CREATE TABLE Professor
(
	ssn int NOT NULL,
	name varchar(20) NOT NULL,
	age int,
	prank varchar(20) NOT NULL,
	speciality varchar(30) NOT NULL,
	PRIMARY KEY (ssn),
	UNIQUE (ssn)
);


CREATE TABLE Project
(
	pid int NOT NULL AUTO_INCREMENT,
	sponsor varchar(30) NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	budget bigint NOT NULL,
	ssn int NOT NULL,
	PRIMARY KEY (pid),
	UNIQUE (pid),
	UNIQUE (ssn)
);


CREATE TABLE work_dept
(
	ssn int NOT NULL,
	dno int NOT NULL,
	pct_time int NOT NULL,
	UNIQUE (ssn),
	UNIQUE (dno)
);


CREATE TABLE work_in
(
	ssn int NOT NULL,
	pid int NOT NULL,
	UNIQUE (ssn),
	UNIQUE (pid)
);


CREATE TABLE work_prog
(
	pid int NOT NULL,
	ssn int NOT NULL,
	UNIQUE (pid),
	UNIQUE (ssn)
);



/* Create Foreign Keys */

ALTER TABLE Graduate
	ADD CONSTRAINT major FOREIGN KEY (dno)
	REFERENCES Department (dno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE work_dept
	ADD CONSTRAINT operated FOREIGN KEY (dno)
	REFERENCES Department (dno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Graduate
	ADD CONSTRAINT advisor FOREIGN KEY (graduatessn)
	REFERENCES Graduate (ssn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE work_prog
	ADD CONSTRAINT participate_wg FOREIGN KEY (ssn)
	REFERENCES Graduate (ssn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Department
	ADD CONSTRAINT run FOREIGN KEY (ssn)
	REFERENCES Professor (ssn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Project
	ADD CONSTRAINT manage_pp FOREIGN KEY (ssn)
	REFERENCES Professor (ssn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE work_dept
	ADD CONSTRAINT manage_pw FOREIGN KEY (ssn)
	REFERENCES Professor (ssn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE work_in
	ADD CONSTRAINT participate_pw FOREIGN KEY (ssn)
	REFERENCES Professor (ssn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE work_in
	ADD CONSTRAINT work_in_wp FOREIGN KEY (pid)
	REFERENCES Project (pid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE work_prog
	ADD CONSTRAINT work_in_pw FOREIGN KEY (pid)
	REFERENCES Project (pid)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



