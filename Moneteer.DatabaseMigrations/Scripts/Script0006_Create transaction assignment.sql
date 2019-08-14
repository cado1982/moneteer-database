CREATE TABLE app.transaction_assignment (
	"id"				uuid NOT NULL PRIMARY KEY,
	"transaction_id"	uuid NOT NULL references app.transaction(id) ON DELETE CASCADE,
	"envelope_id"		uuid NULL references app.envelope(id) ON DELETE RESTRICT,
	"inflow"			numeric(18,2) NOT NULL,
	"outflow"			numeric(18,2) NOT NULL,
	UNIQUE ("transaction_id", "envelope_id")
);

CREATE INDEX ix_transaction_assignment__transaction_id ON app.transaction_assignment(transaction_id);