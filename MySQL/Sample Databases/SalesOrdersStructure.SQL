-- 【概要】SalesOrdersSampleデータベースを作成し、販売注文管理システムの全テーブルを定義する。顧客・従業員・商品・カテゴリ・注文・注文明細・仕入先・仕入発注の各テーブルと、集計用タリーテーブルを含む。

CREATE DATABASE SalesOrdersSample;

USE SalesOrdersSample;

-- 商品カテゴリテーブル（カテゴリID・カテゴリ説明）
CREATE TABLE Categories (
	CategoryID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	CategoryDescription varchar (75) NULL 
	);

-- 顧客テーブル（顧客ID・氏名・住所・電話番号等）
CREATE TABLE Customers (
	CustomerID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	CustFirstName varchar (25) NULL ,
	CustLastName varchar (25) NULL ,
	CustStreetAddress varchar (50) NULL ,
	CustCity varchar (30) NULL ,
	CustState varchar (2) NULL ,
	CustZipCode varchar (10) NULL ,
	CustAreaCode smallint NULL DEFAULT 0 ,
	CustPhoneNumber varchar (8) NULL 
	);

-- 従業員テーブル（従業員ID・氏名・住所・生年月日・マネージャーID等）
CREATE TABLE Employees (
	EmployeeID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	EmpFirstName varchar (25) NULL ,
	EmpLastName varchar (25) NULL ,
	EmpStreetAddress varchar (50) NULL ,
	EmpCity varchar (30) NULL ,
	EmpState varchar (2) NULL ,
	EmpZipCode varchar (10) NULL ,
	EmpAreaCode smallint NULL DEFAULT 0 ,
	EmpPhoneNumber varchar (8) NULL ,
	EmpDOB datetime NULL ,
	ManagerID int NULL
	);

-- 注文明細テーブル（注文番号・商品番号・見積価格・注文数量）
CREATE TABLE Order_Details (
	OrderNumber int NOT NULL ,
	ProductNumber int NOT NULL ,
	QuotedPrice decimal (15,2) NULL DEFAULT 0 ,
	QuantityOrdered smallint NULL DEFAULT 0  
	);

-- 注文ヘッダーテーブル（注文番号・注文日・出荷日・顧客ID・担当従業員ID・注文合計）
CREATE TABLE Orders (
	OrderNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	OrderDate date NULL ,
	ShipDate date NULL ,
	CustomerID int NULL ,
	EmployeeID int NULL ,
	OrderTotal decimal (15,2) NULL DEFAULT 0 
	);

-- 商品仕入先テーブル（商品番号・仕入先ID・卸売価格・納品日数）
CREATE TABLE Product_Vendors (
	ProductNumber int NOT NULL ,
	VendorID int NOT NULL ,
	WholesalePrice decimal (15,2) NULL DEFAULT 0 ,
	DaysToDeliver smallint NULL DEFAULT 0 
	);

-- 商品テーブル（商品番号・商品名・説明・UPC・小売価格・在庫数・カテゴリID）
CREATE TABLE Products (
	ProductNumber int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	ProductName varchar (50) NULL ,
	ProductDescription varchar (100) NULL ,
	ProductUPD varchar (12) NULL ,
	RetailPrice decimal (15,2) NULL DEFAULT 0 ,
	QuantityOnHand smallint NULL DEFAULT 0 ,
	CategoryID int NULL 
	);

-- 仕入先テーブル（仕入先ID・会社名・住所・電話・FAX・WEBサイト・メール）
CREATE TABLE Vendors (
	VendorID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	VendName varchar (25) NULL ,
	VendStreetAddress varchar (50) NULL ,
	VendCity varchar (30) NULL ,
	VendState varchar (2) NULL ,
	VendZipCode varchar (10) NULL ,
	VendPhoneNumber varchar (15) NULL ,
	VendFaxNumber varchar (15) NULL ,
	VendWebPage text NULL ,
	VendEMailAddress varchar (50) NULL
	);
	
-- 仕入発注テーブル（発注ID・仕入先ID・発注日・納品日）
CREATE TABLE PurchaseOrders (
	PurchaseID int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	VendorID int NOT NULL ,
	OrderDate date NOT NULL ,
	DeliveryDate date NOT NULL
);

-- タリーテーブル: 月情報（月/年・年月番号・月開始終了日・月フラグ列）
CREATE TABLE ztblMonths (
	MonthYear varchar (15) NOT NULL ,
        YearNumber smallint NOT NULL ,
        MonthNumber smallint NOT NULL ,
        MonthStart date NOT NULL ,
        MonthEnd date NOT NULL ,
        January smallint NOT NULL DEFAULT 0 ,
        February smallint NOT NULL DEFAULT 0 ,
        March smallint NOT NULL DEFAULT 0 ,
        April smallint NOT NULL DEFAULT 0 ,
        May smallint NOT NULL DEFAULT 0 ,
        June smallint NOT NULL DEFAULT 0 ,
        July smallint NOT NULL DEFAULT 0 ,
        August smallint NOT NULL DEFAULT 0 ,
        September smallint NOT NULL DEFAULT 0 ,
        October smallint NOT NULL DEFAULT 0 ,
        November smallint NOT NULL DEFAULT 0 ,
        December smallint NOT NULL DEFAULT 0 
) ;


-- タリーテーブル: 価格帯（カテゴリ名・最低価格・最高価格）
CREATE TABLE ztblPriceRanges (
        PriceCategory varchar (20) NOT NULL ,
        LowPrice decimal (15,2) NULL ,
        HighPrice decimal (15,2) NULL
) ;


-- タリーテーブル: 購入クーポン（購入金額下限・上限・クーポン枚数）
CREATE TABLE ztblPurchaseCoupons (
        LowSpend decimal (15,2) NOT NULL ,
        HighSpend decimal (15,2) NULL ,
        NumCoupons smallint NULL DEFAULT 0 
) ;


-- タリーテーブル: 連番（行複製・ループ処理等に使用するシーケンス番号）
CREATE TABLE ztblSeqNumbers (
        Sequence int NOT NULL DEFAULT 0
) ;


CREATE  INDEX CustAreaCode ON Customers(CustAreaCode);

CREATE  INDEX CustZipCode ON Customers(CustZipCode);

CREATE  INDEX EmpAreaCode ON Employees(EmpAreaCode);

CREATE  INDEX EmpZipCode ON Employees(EmpZipCode);

ALTER TABLE Order_Details 
	ADD CONSTRAINT Order_Details_PK PRIMARY KEY 
	(
		OrderNumber, 
		ProductNumber
	);

CREATE  INDEX OrdersOrderDetails ON Order_Details(OrderNumber);

CREATE  INDEX ProductsOrderDetails ON Order_Details(ProductNumber);

CREATE  INDEX CustomerID ON Orders(CustomerID);

CREATE  INDEX EmployeeID ON Orders(EmployeeID);

ALTER TABLE Product_Vendors 
	ADD CONSTRAINT Product_Vendors_PK PRIMARY KEY 
	(
		ProductNumber, 
		VendorID
	);

CREATE  INDEX ProductsProductVendors ON Product_Vendors(ProductNumber);

CREATE  INDEX VendorID ON Product_Vendors(VendorID);

CREATE  INDEX CategoryID ON Products(CategoryID);

CREATE  INDEX VendZipCode ON Vendors(VendZipCode);

CREATE 	INDEX VendorID ON PurchaseOrders(VendorID);

ALTER TABLE ztblMonths ADD
 	CONSTRAINT ztblMonths_PK PRIMARY KEY 
	(
		YearNumber, 
                MonthNumber
	) ;


 CREATE  UNIQUE INDEX Month_End ON ztblMonths(MonthEnd) ;


 CREATE  UNIQUE INDEX Month_Start ON ztblMonths(MonthStart) ;


 CREATE  UNIQUE INDEX Month_Year ON ztblMonths(MonthYear) ;


ALTER TABLE ztblPriceRanges ADD 
	CONSTRAINT ztblPriceRanges_PK PRIMARY KEY 
	(
		PriceCategory 
	) ;


ALTER TABLE ztblPurchaseCoupons ADD 
	CONSTRAINT ztblPurchaseCoupons_PK PRIMARY KEY 
	( 
		LowSpend
	) ;


 CREATE  INDEX Num_Coupons ON ztblPurchaseCoupons(NumCoupons) ;


ALTER TABLE ztblSeqNumbers ADD 
        CONSTRAINT ztblSeqNumbers_PK PRIMARY KEY
        (
                Sequence
        ) ;


ALTER TABLE Order_Details 
	ADD CONSTRAINT Order_Details_FK00 FOREIGN KEY 
	(
		OrderNumber
	) REFERENCES Orders (
		OrderNumber
	),
	ADD CONSTRAINT Order_Details_FK01 FOREIGN KEY 
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	);

ALTER TABLE Orders 
	ADD CONSTRAINT Orders_FK00 FOREIGN KEY 
	(
		CustomerID
	) REFERENCES Customers (
		CustomerID
	),
	ADD CONSTRAINT Orders_FK01 FOREIGN KEY 
	(
		EmployeeID
	) REFERENCES Employees (
		EmployeeID
	);

ALTER TABLE Product_Vendors 
	ADD CONSTRAINT Product_Vendors_FK00 FOREIGN KEY 
	(
		ProductNumber
	) REFERENCES Products (
		ProductNumber
	),
	ADD CONSTRAINT Product_Vendors_FK01 FOREIGN KEY 
	(
		VendorID
	) REFERENCES Vendors (
		VendorID
	);

ALTER TABLE Products 
	ADD CONSTRAINT Products_FK00 FOREIGN KEY 
	(
		CategoryID
	) REFERENCES Categories (
		CategoryID
	);
	
ALTER TABLE PurchaseOrders 
	ADD CONSTRAINT Purchase_Vendors_FK01 FOREIGN KEY 
	(
		VendorID
	) REFERENCES Vendors (
		VendorID
	);
