CREATE TABLE app.transaction (
	"id"			uuid NOT NULL PRIMARY KEY,
	"account_id"	uuid NOT NULL references app.account(id) ON DELETE CASCADE,
	"payee_id"		uuid references app.payee(id) ON DELETE RESTRICT,
	"is_cleared"	boolean NOT NULL,
	"date"			date NOT NULL,
	"description"	varchar,
	"is_reconciled" boolean NOT NULL,
	"inflow"		numeric(18,2) NOT NULL,
	"outflow"		numeric(18,2) NOT NULL
);

CREATE INDEX ix_transaction__account_id ON app.transaction(account_id);
CREATE INDEX ix_transaction__payee_id ON app.transaction(payee_id);