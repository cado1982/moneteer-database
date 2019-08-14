CREATE TABLE app.payee (
	"id"					uuid NOT NULL PRIMARY KEY,
	"budget_id"				uuid NOT NULL references app.budget(id) ON DELETE CASCADE,
	"name"					varchar(512) NOT NULL,
	"last_envelope_id"		uuid references app.envelope(id) ON DELETE SET NULL,
	UNIQUE ("budget_id", "name")
);

CREATE INDEX ix_payee__budget_id ON app.payee(budget_id);