ALTER TABLE app.account 
	ADD CONSTRAINT check__account__name_not_empty CHECK (name <> ''),
	ADD CONSTRAINT check__account__name_length CHECK (char_length(name) <= 250),
	ADD CONSTRAINT check__account__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');

ALTER TABLE app.budget
	ADD CONSTRAINT check__budget__name_not_empty CHECK (name <> ''),
	ADD CONSTRAINT check__budget__name_length CHECK (char_length(name) <= 250),
	ADD CONSTRAINT check__budget__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');

ALTER TABLE app.envelope
	ADD CONSTRAINT check__envelope__name_not_empty CHECK (name <> ''),
	ADD CONSTRAINT check__envelope__assigned_greater_or_equal_zero CHECK (assigned >= 0),
	ADD CONSTRAINT check__envelope__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');

ALTER TABLE app.envelope_category
	ADD CONSTRAINT check__envelope_category__name_not_empty CHECK (name <> ''),
	ADD CONSTRAINT check__envelope_category__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');

ALTER TABLE app.payee
	ADD CONSTRAINT check__payee__name_not_empty CHECK (name <> ''),
	ADD CONSTRAINT check__payee__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');

ALTER TABLE app.transaction
	ADD CONSTRAINT check__transaction__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');

ALTER TABLE app.transaction_assignment
	ADD CONSTRAINT check__transaction_assignment__inflow_or_outflow_not_both_set CHECK ((inflow = 0 AND outflow > 0) OR (outflow = 0 AND inflow > 0)),
	ADD CONSTRAINT check__transaction_assignment__id_not_empty CHECK (id <> '00000000-0000-0000-0000-000000000000');