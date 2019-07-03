CREATE TABLE account (
	"id"			uuid NOT NULL PRIMARY KEY,
	"name"			varchar(255) NOT NULL,
	"is_budget"		boolean NOT NULL,
	"budget_id"		uuid NOT NULL references budget(id) ON DELETE CASCADE,
    "balance"       numeric(18,2) NOT NULL,
	UNIQUE ("name", "budget_id")
);

CREATE INDEX ix_account__budget_id ON account (budget_id);