CREATE TABLE thcs_type(
	typeId_n	INT 			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	typeName_x	VARCHAR(10)		NOT NULL,
	create_dt 	DATETIME 		NOT NULL
);

CREATE TABLE thcs_cashier(
	cashierId_n	INT 			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	name_x		VARCHAR(10)		NOT NULL,
	create_dt 	DATETIME 		NOT NULL
);

CREATE TABLE thcs_table(
	tableId_n 	INT 			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	name_x		VARCHAR(20) 	NOT NULL,
	typeName_x	VARCHAR(10)	NOT NULL,
	note_x		VARCHAR(250) 	NULL,
	status_c	VARCHAR(10)		NOT NULL,
	create_dt 	DATETIME 		NOT NULL
);
	
CREATE TABLE thcs_order(
	orderId_n 	INT 			NOT NULL 	AUTO_INCREMENT 	PRIMARY KEY,
	tableId_n 	INT 			NOT NULL,
	fromId_n	INT				NULL,
	start_dt 	DATETIME 		NOT NULL,
	end_dt 		DATETIME 		NULL,
	totalMinute_n	INT 		NULL,
	cashier_x	VARCHAR(10)		NULL,
	evaluateCost_n	FLOAT 		NULL,
	actualCost_n	FLOAT 		NULL,
	otherCost_n		FLOAT 		NULL,
	amount_n	FLOAT			NULL,
	actualAmount_n FLOAT NULL,
	note_x		VARCHAR(250)	NULL,
	status_c	VARCHAR(10)		NOT NULL,
	create_dt 	DATETIME 		NOT NULL
);