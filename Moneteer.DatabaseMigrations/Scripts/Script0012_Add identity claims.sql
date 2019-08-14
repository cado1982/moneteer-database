CREATE TABLE identity.user_claims (
    "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "user_id" uuid NOT NULL,
    "claim_type" text,
    "claim_value" text,
    CONSTRAINT "fk__user_claims__users__user_id" FOREIGN KEY ("user_id")
        REFERENCES identity."users" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);

CREATE INDEX "ix__user_claims__user_id" ON identity."user_claims" ("user_id");