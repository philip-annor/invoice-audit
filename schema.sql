BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "client" (
	"Client_ID"	INTEGER,
	"Client_FirstName"	TEXT,
	"Client_LastName"	TEXT,
	"Phone"	TEXT,
	"Email"	TEXT,
	"Address"	TEXT,
	PRIMARY KEY("Client_ID")
);
CREATE TABLE IF NOT EXISTS "invoice" (
	"Invoice_ID"	INTEGER,
	"Matter_ID"	INTEGER,
	"Invoice_Number"	TEXT,
	"Issue_Date"	TEXT,
	"Status"	TEXT,
	"Prepared_By"	TEXT,
	"Approved_By"	TEXT,
	"Approved_Date"	TEXT,
	PRIMARY KEY("Invoice_ID"),
	FOREIGN KEY("Matter_ID") REFERENCES "matter"("Matter_ID")
);
CREATE TABLE IF NOT EXISTS "invoice_line" (
	"Invoice_Line_ID"	INTEGER,
	"Time_Entry_ID"	INTEGER,
	"Invoice_ID"	INTEGER,
	"Line_Number"	INTEGER,
	"Amount"	REAL,
	PRIMARY KEY("Invoice_Line_ID"),
	FOREIGN KEY("Invoice_ID") REFERENCES "invoice"("Invoice_ID"),
	FOREIGN KEY("Time_Entry_ID") REFERENCES "time_entry"("Time_Entry_ID")
);
CREATE TABLE IF NOT EXISTS "lawyer" (
	"Lawyer_ID"	INTEGER,
	"Lawyer_Name"	TEXT,
	"Bar_Number"	TEXT,
	"Email"	TEXT,
	"Phone"	TEXT,
	"Department"	TEXT,
	PRIMARY KEY("Lawyer_ID")
);
CREATE TABLE IF NOT EXISTS "matter" (
	"Matter_ID"	INTEGER,
	"ResponsibleLawyer_ID"	INTEGER,
	"Client_ID"	INTEGER,
	"Matter_Title"	TEXT,
	"Practice_Area"	TEXT,
	"Open_Date"	TEXT,
	"Close_Date"	TEXT,
	"Status"	TEXT,
	PRIMARY KEY("Matter_ID"),
	FOREIGN KEY("Client_ID") REFERENCES "client"("Client_ID"),
	FOREIGN KEY("ResponsibleLawyer_ID") REFERENCES "lawyer"("Lawyer_ID")
);
CREATE TABLE IF NOT EXISTS "payment" (
	"Payment_ID"	INTEGER,
	"Invoice_ID"	INTEGER,
	"Payment_Date"	TEXT,
	"Amount"	REAL,
	"Method"	TEXT,
	"Reference"	TEXT,
	PRIMARY KEY("Payment_ID"),
	FOREIGN KEY("Invoice_ID") REFERENCES "invoice"("Invoice_ID")
);
CREATE TABLE IF NOT EXISTS "time_entry" (
	"Time_Entry_ID"	INTEGER,
	"Lawyer_ID"	INTEGER,
	"Matter_ID"	INTEGER,
	"Work_Date"	TEXT,
	"Hours"	REAL,
	"Rate"	REAL,
	"Description"	TEXT,
	PRIMARY KEY("Time_Entry_ID"),
	FOREIGN KEY("Lawyer_ID") REFERENCES "lawyer"("Lawyer_ID"),
	FOREIGN KEY("Matter_ID") REFERENCES "matter"("Matter_ID")
);
CREATE TABLE IF NOT EXISTS "trust_transaction" (
	"Trust_Transaction_ID"	INTEGER,
	"Matter_ID"	INTEGER,
	"Invoice_ID"	INTEGER,
	"Transaction_Date"	TEXT,
	"Type"	TEXT,
	"Amount"	REAL,
	"Reference"	TEXT,
	"Recorded_By"	TEXT,
	PRIMARY KEY("Trust_Transaction_ID"),
	FOREIGN KEY("Invoice_ID") REFERENCES "invoice"("Invoice_ID"),
	FOREIGN KEY("Matter_ID") REFERENCES "matter"("Matter_ID")
);
COMMIT;
