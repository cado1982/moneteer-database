CREATE TABLE "payee" (
	"id"					uuid NOT NULL PRIMARY KEY,
	"budget_id"				uuid NOT NULL references budget(id) ON DELETE CASCADE,
	"name"					varchar(512) NOT NULL,
	"last_envelope_id"		uuid references envelope(id) ON DELETE SET NULL,
	UNIQUE ("budget_id", "name")
);

CREATE INDEX ix_payee__budget_id ON "payee"(budget_id);