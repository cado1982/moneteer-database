CREATE TABLE budget (
	"id"									uuid NOT NULL PRIMARY KEY,
	"name"									varchar(256) NOT NULL,
	"user_id"								uuid NOT NULL,
	"available"								numeric(18,2) NOT NULL,
	"date_format"							varchar(40) NOT NULL,
	"thousands_separator"					varchar(1) NOT NULL,
	"decimal_separator"						varchar(1) NOT NULL,
	"decimal_places"						smallint NOT NULL,
	"currency_code"							varchar(3) NOT NULL,
	"currency_symbol_location"				smallint NOT NULL,
	UNIQUE ("name", "user_id")
);

CREATE INDEX ix_budget__user_id ON budget (user_id);