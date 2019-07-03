CREATE TABLE "transaction" (
	"id"			uuid NOT NULL PRIMARY KEY,
	"account_id"	uuid NOT NULL references account(id) ON DELETE CASCADE,
	"payee_id"		uuid references payee(id) ON DELETE RESTRICT,
	"is_cleared"	boolean NOT NULL,
	"date"			date NOT NULL,
	"description"	varchar,
	"is_reconciled" boolean NOT NULL,
	"inflow"		numeric(18,2) NOT NULL,
	"outflow"		numeric(18,2) NOT NULL
);

CREATE INDEX ix_transaction__account_id ON "transaction"(account_id);
CREATE INDEX ix_transaction__payee_id ON "transaction"(payee_id);