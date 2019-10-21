ALTER TABLE app.transaction_assignment
	ADD COLUMN account_id uuid NULL references app.account(id) ON DELETE RESTRICT,
	ADD UNIQUE (transaction_id, account_id);