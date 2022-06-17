CREATE TABLE newspaper(
  Name VARCHAR(25) NOT NULL,
  frequency_publication ENUM('daily','weekly','monthly') NOT NULL,
  Owner varchar(25) NOT NULL,
  PRIMARY KEY (Name)
) engine=InnoDB;

CREATE TABLE paper(
  Name VARCHAR(25) NOT NULL,
  Paper_number INT(25) NOT NULL,
  Release_date DATE NOT NULL,  
  Pages INT(3) DEFAULT '30' NOT NULL,
  PRIMARY KEY(Name,Paper_number),
  CONSTRAINT EFF FOREIGN KEY (Name) REFERENCES newspaper(Name)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;


CREATE TABLE category(
  Id INT(9) NOT NULL,
  Name VARCHAR(25) NOT NULL,
  Description VARCHAR(25) DEFAULT 'unknown' NOT NULL,
  Parental SET ('Politics','Finance','Social','Gossip','Sports') DEFAULT NULL,
  PRIMARY KEY(Id)
) engine=InnoDB;


CREATE TABLE article(
  Path VARCHAR(255) NOT NULL,
  Title VARCHAR(25) NOT NULL,
  Summary varchar(255) DEFAULT 'unknown' NOT NULL,
  Article_id INT(9) NOT NULL,
  Page_name VARCHAR(25) NOT NULL,
  Page_num INT(25) NOT NULL,
  Cover INT(5) NOT NULL,
  Extent INT(5) NOT NULL,
  PRIMARY KEY (Path),
  CONSTRAINT NCD FOREIGN KEY (Article_id) REFERENCES category(Id)
  ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT NUP FOREIGN KEY (Page_name,Page_num) REFERENCES paper(Name,Paper_number)
  ON UPDATE CASCADE ON DELETE CASCADE
) engine=InnoDB;

CREATE TABLE key(
  Article  VARCHAR(255) NOT NULL,
  Word_id VARCHAR(25) NOT NULL,
  PRIMARY KEY (Article, Word_id),
  CONSTRAINT AWK
  FOREIGN KEY(Article) REFERENCES article(Path)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE employee(
  Email  VARCHAR(255) NOT NULL,
  Name VARCHAR(25) NOT NULL,
  Last_name VARCHAR(25) NOT NULL,
  Salary INT(9) NOT NULL,
  Recruitment_date DATE NOT NULL,
  News_name VARCHAR(25) NOT NULL,
  PRIMARY KEY (email),
  CONSTRAINT NSP FOREIGN KEY (News_name) REFERENCES newspaper(Name)
  ON UPDATE CASCADE ON DELETE CASCADE
) engine=InnoDB;

CREATE TABLE administrator(
  Email VARCHAR(255) NOT NULL,
  duties  ENUM('Secretary','Logistics') NOT NULL,
  Street VARCHAR(25) DEFAULT 'unknown' NOT NULL,
  City VARCHAR(25) DEFAULT 'unknown' NOT NULL,
  Number INT(9) DEFAULT '0' NOT NULL,
  PRIMARY KEY(Email),
  CONSTRAINT DKT
  FOREIGN KEY(Email) REFERENCES employee(Email)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE journalist(
  Email VARCHAR(255) NOT NULL,
  CV VARCHAR(255) NOT NULL,
  Work_experience INT(5) NULL,
  PRIMARY KEY(Email),
  CONSTRAINT JRN
  FOREIGN KEY(Email) REFERENCES employee(Email)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE editor(
  Path VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Name VARCHAR(25) NOT NULL,
  Paper_number INT(25) NOT NULL,
  Page INT(5) NOT NULL,
  PRIMARY KEY(Email,Page),
  CONSTRAINT TTT
  FOREIGN KEY(Email) REFERENCES employee(Email)
  ON DELETE CASCADE ON UPDATE CASCADE,  
  CONSTRAINT LLL FOREIGN KEY (Name,Paper_number) REFERENCES paper(Name,Paper_number)
  ON UPDATE CASCADE ON DELETE CASCADE
) engine=InnoDB;

CREATE TABLE adm_phone_num(
  Administrative VARCHAR(255) NOT NULL,
  Phone_num VARCHAR(10) NOT NULL,
  PRIMARY KEY(Administrative,Phone_num),
  CONSTRAINT DPH
  FOREIGN KEY(Administrative) REFERENCES administrator(Email)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE submited_by(
  Email VARCHAR(255) NOT NULL,
  Path VARCHAR(255) NOT NULL,
  Date DATE NOT NULL,
  PRIMARY KEY(Email,Path),
  CONSTRAINT SBM FOREIGN KEY(Email) REFERENCES journalist(Email) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT SBMT FOREIGN KEY(Path) REFERENCES article(Path)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;

CREATE TABLE compose(
  Email VARCHAR(255) NOT NULL,
  Path VARCHAR(255) NOT NULL,
  Approval BOOL NOT NULL,
  Resubmit BOOL NOT NULL,
  Changes VARCHAR(255),
  Approval_date DATE,
  PRIMARY KEY(Email,Path),
  CONSTRAINT SSS FOREIGN KEY(Email) REFERENCES editor(Email) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT PPP FOREIGN KEY(Path) REFERENCES article(Path)
  ON DELETE CASCADE ON UPDATE CASCADE
) engine=InnoDB;
