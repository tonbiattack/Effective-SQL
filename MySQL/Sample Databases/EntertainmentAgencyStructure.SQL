-- 【概要】EntertainmentAgencySampleデータベースを作成し、エンターテインメントエージェンシー管理システムの全テーブルを定義する。エージェント・顧客・エンターテイナー・メンバー・音楽スタイル・契約・嗜好の各テーブルと集計用タリーテーブルを含む。

CREATE DATABASE EntertainmentAgencySample;

USE EntertainmentAgencySample;

-- エージェントテーブル（エージェントID・氏名・住所・電話番号・採用日・給与・歩合率）
CREATE TABLE Agents (
        AgentID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        AgtFirstName varchar (25) NULL ,
        AgtLastName varchar (25) NULL ,
        AgtStreetAddress varchar (50) NULL ,
        AgtCity varchar (30) NULL ,
        AgtState varchar (2) NULL ,
        AgtZipCode varchar (10) NULL ,
        AgtPhoneNumber varchar (15) NULL ,
        DateHired date NULL ,
        Salary decimal(15, 2) NULL DEFAULT 0 ,
        CommissionRate float(24) NULL 
);

-- 顧客テーブル（顧客ID・氏名・住所・電話番号）
CREATE TABLE Customers (
	CustomerID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CustFirstName varchar (25) NULL ,
	CustLastName varchar (25) NULL ,
	CustStreetAddress varchar (50) NULL ,
	CustCity varchar (30) NULL ,
	CustState varchar (2) NULL ,
	CustZipCode varchar (10) NULL ,
	CustPhoneNumber varchar (15) NULL
);

-- 契約テーブル（契約番号・開始/終了日時・契約金額・顧客ID・エージェントID・エンターテイナーID）
CREATE TABLE Engagements (
	EngagementNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	StartDate date NULL ,
	EndDate date NULL ,
	StartTime time NULL ,
	StopTime time NULL ,
	ContractPrice decimal(15,2) NULL DEFAULT 0 ,
	CustomerID int NULL ,
	AgentID int NULL ,
	EntertainerID int NULL 
);

-- エンターテイナーメンバーテーブル（エンターテイナーID・メンバーID・ステータス）
CREATE TABLE Entertainer_Members (
	EntertainerID int NOT NULL ,
	MemberID int NOT NULL ,
	Status smallint NULL DEFAULT 0 
);

-- エンターテイナースタイルテーブル（エンターテイナーID・スタイルID・スタイル強度）
CREATE TABLE Entertainer_Styles (
	EntertainerID int NOT NULL ,
	StyleID int NOT NULL ,
	StyleStrength smallint NOT NULL DEFAULT 0
);

-- エンターテイナーテーブル（ID・ステージ名・SSN・住所・電話・WEB・メール・登録日・日額）
CREATE TABLE Entertainers (
	EntertainerID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	EntStageName varchar (50) NULL ,
	EntSSN varchar (12) NULL ,
	EntStreetAddress varchar (50) NULL ,
	EntCity varchar (30) NULL ,
	EntState varchar (2) NULL ,
	EntZipCode varchar (10) NULL ,
	EntPhoneNumber varchar (15) NULL ,
	EntWebPage varchar (50) NULL ,
	EntEMailAddress varchar (50) NULL ,
	DateEntered date NULL ,
	EntPricePerDay decimal(15,2) NULL 
);

-- メンバーテーブル（メンバーID・氏名・電話番号・性別）
CREATE TABLE Members (
	MemberID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	MbrFirstName varchar (25) NULL ,
	MbrLastName varchar (25) NULL ,
	MbrPhoneNumber varchar (15) NULL ,
	Gender varchar (2) NULL 
);

-- 音楽嗜好テーブル（顧客ID・スタイルID・嗜好順位）
CREATE TABLE Musical_Preferences (
	CustomerID int NOT NULL ,
	StyleID int NOT NULL ,
	PreferenceSeq smallint NOT NULL DEFAULT 0
);

-- 音楽スタイルテーブル（スタイルID・スタイル名）
CREATE TABLE Musical_Styles (
	StyleID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	StyleName varchar (75) NULL 
);

CREATE TABLE ztblDays (
        DateField date NOT NULL 
);

CREATE TABLE ztblMonths ( 
        MonthYear varchar (15) NULL ,
        YearNumber smallint NOT NULL ,
        MonthNumber smallint NOT NULL ,
        MonthStart date NULL ,
        MonthEnd date NULL ,
        January smallint NULL DEFAULT 0 ,
        February smallint NULL DEFAULT 0 ,
        March smallint NULL DEFAULT 0 ,
        April smallint NULL DEFAULT 0 ,
        May smallint NULL DEFAULT 0 ,
        June smallint NULL DEFAULT 0 ,
        July smallint NULL DEFAULT 0 ,
        August smallint NULL DEFAULT 0 ,
        September smallint NULL DEFAULT 0 ,
        October smallint NULL DEFAULT 0 ,
        November smallint NULL DEFAULT 0 ,
        December smallint NULL DEFAULT 0 
);

CREATE TABLE ztblQuarters ( 
        QuarterYear varchar (15) NULL ,
        YearNumber smallint NOT NULL ,
        QuarterNumber smallint NOT NULL ,
        QuarterStart date NULL ,
        QuarterEnd date NULL ,
        Qtr_1st smallint NULL DEFAULT 0 ,
        Qtr_2nd smallint NULL DEFAULT 0 ,
        Qtr_3rd smallint NULL DEFAULT 0 ,
        Qtr_4th smallint NULL DEFAULT 0 
         
);

CREATE TABLE ztblSkipLabels (
        LabelCount int NOT NULL  
);


CREATE TABLE ztblWeeks ( 
        WeekStart date NOT NULL ,
        WeekEnd date NULL 
);


CREATE  INDEX AgtZipCode ON Agents(AgtZipCode);

CREATE  INDEX CustZipCode ON Customers(CustZipCode);

CREATE  INDEX AgentsEngagements ON Engagements(AgentID);

CREATE  INDEX CustomerID ON Engagements(CustomerID);

CREATE  INDEX EmployeeID ON Engagements(AgentID);

CREATE  INDEX EntertainerID ON Engagements(EntertainerID);

ALTER TABLE Entertainer_Members 
        ADD CONSTRAINT Entertainer_Members_PK PRIMARY KEY 
        (
                EntertainerID, 
                MemberID
        );

CREATE  INDEX EntertainersEntertainer_Members ON Entertainer_Members(EntertainerID);

CREATE  INDEX MembersEntertainer_Members ON Entertainer_Members(MemberID);

ALTER TABLE Entertainer_Styles 
        ADD CONSTRAINT Entertainer_Styles_PK PRIMARY KEY 
        (
                EntertainerID, 
                StyleID
        );

CREATE  INDEX EntertainersEntertainer_Styles ON Entertainer_Styles(EntertainerID);

CREATE  INDEX Musical_StylesEntertainer_Styles ON Entertainer_Styles(StyleID);

CREATE  INDEX EntZipCode ON Entertainers(EntZipCode);

ALTER TABLE Musical_Preferences 
        ADD CONSTRAINT Musical_Preferences_PK PRIMARY KEY 
        (
                CustomerID, 
                StyleID
        );

CREATE  INDEX CustomerID ON Musical_Preferences(CustomerID);

CREATE  INDEX StyleID ON Musical_Preferences(StyleID);

ALTER TABLE ztblDays ADD 
        CONSTRAINT ztblDays_PK PRIMARY KEY 
        ( 
                DateField 
        );


ALTER TABLE ztblMonths ADD 
        CONSTRAINT ztblMonths_PK PRIMARY KEY 
        ( 
                YearNumber, 
                MonthNumber
        );


 CREATE UNIQUE INDEX ztblMonths_MonthEnd ON ztblMonths(MonthEnd) ;


 CREATE UNIQUE INDEX ztblMonths_MonthStart ON ztblMonths(MonthStart) ;


 CREATE UNIQUE INDEX ztblMonths_MonthYear ON ztblMonths(MonthYear) ;


ALTER TABLE ztblQuarters ADD 
        CONSTRAINT ztblQuarters_PK PRIMARY KEY 
        ( 
                YearNumber, 
                QuarterNumber
        );


 CREATE UNIQUE INDEX ztblQuarters_QuarterEnd ON ztblQuarters(QuarterEnd) ;


 CREATE UNIQUE INDEX ztblQuarters_QuarterStart ON ztblQuarters(QuarterStart) ;


 CREATE UNIQUE INDEX ztblQuarters_QuarterYear ON ztblQuarters(QuarterYear) ;


ALTER TABLE ztblSkipLabels ADD 
        CONSTRAINT ztblSkipLabels_PK PRIMARY KEY 
        (
                LabelCount 
        ) ;


ALTER TABLE ztblWeeks ADD 
        CONSTRAINT ztblWeeks_PK PRIMARY KEY 
        ( 
                WeekStart 
        ) ;


ALTER TABLE Engagements 
        ADD CONSTRAINT Engagements_FK00 FOREIGN KEY 
        (
                AgentID
        ) REFERENCES Agents (
                AgentID
        ),
        ADD CONSTRAINT Engagements_FK01 FOREIGN KEY 
        (
                CustomerID
        ) REFERENCES Customers (
                CustomerID
        ),
        ADD CONSTRAINT Engagements_FK02 FOREIGN KEY 
        (
               EntertainerID
        ) REFERENCES Entertainers (
               EntertainerID
        );

ALTER TABLE Entertainer_Members 
        ADD CONSTRAINT Entertainer_Members_FK00 FOREIGN KEY 
        (
                EntertainerID
        ) REFERENCES Entertainers (
                EntertainerID
        ),
        ADD CONSTRAINT Entertainer_Members_FK01 FOREIGN KEY 
        (
                MemberID
        ) REFERENCES Members (
                MemberID
        );

ALTER TABLE Entertainer_Styles 
        ADD CONSTRAINT Entertainer_Styles_FK00 FOREIGN KEY 
        (
                EntertainerID
        ) REFERENCES Entertainers (
                EntertainerID
        ) ON DELETE CASCADE,
        ADD CONSTRAINT Entertainer_Styles_FK01 FOREIGN KEY 
        (
                StyleID
        ) REFERENCES Musical_Styles 
        (
                StyleID
        );

ALTER TABLE Musical_Preferences 
        ADD CONSTRAINT Musical_Preferences_FK00 FOREIGN KEY 
        (
                CustomerID
        ) REFERENCES Customers (
                CustomerID
        ) ON DELETE CASCADE,
        ADD CONSTRAINT Musical_Preferences_FK01 FOREIGN KEY 
        (
                StyleID
        ) REFERENCES Musical_Styles (
                StyleID
        );