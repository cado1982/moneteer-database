CREATE TABLE app.envelope_category (
	"id"						uuid NOT NULL PRIMARY KEY,
	"name"						varchar(255) NOT NULL,
	"budget_id"					uuid NOT NULL references app.budget(id) ON DELETE CASCADE,
	"is_deleted"                boolean NOT NULL default false,
	"is_hidden"                 boolean NOT NULL default false,
	UNIQUE ("name", "budget_id")
);

CREATE INDEX ix_envelope_category__budget_id ON app.envelope_category (budget_id);

CREATE TABLE app.envelope (
	"id"						uuid NOT NULL PRIMARY KEY,
	"name"						varchar(255) NOT NULL,
	"envelope_category_id"		uuid NOT NULL references app.envelope_category(id) ON DELETE CASCADE,
	"is_deleted"				boolean NOT NULL default false,
	"is_hidden"					boolean NOT NULL default false,
	"balance"					numeric(18,2) NOT NULL,
	UNIQUE ("name", "envelope_category_id")
);

CREATE INDEX ix_envelope__envelope_category_id ON app.envelope (envelope_category_id);
