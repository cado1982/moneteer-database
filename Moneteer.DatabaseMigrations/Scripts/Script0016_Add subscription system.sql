ALTER TABLE identity.users 
    ADD COLUMN stripe_id varchar NULL,
    ADD COLUMN subscription_expiry timestamp without time zone NULL,
    ADD COLUMN trial_expiry timestamp without time zone NOT NULL default CURRENT_TIMESTAMP;