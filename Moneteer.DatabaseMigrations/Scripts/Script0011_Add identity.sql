CREATE SCHEMA IF NOT EXISTS identity;

CREATE TABLE identity.users (
    "id" uuid PRIMARY KEY NOT NULL,
    "user_name" character varying(256),
    "normalized_user_name" character varying(256),
    "email" character varying(256),
    "normalized_email" character varying(256),
    "email_confirmed" boolean NOT NULL,
    "password_hash" text,
    "security_stamp" text,
    "concurrency_stamp" text,
    "phone_number" text,
    "phone_number_confirmed" boolean NOT NULL,
    "two_factor_enabled" boolean NOT NULL,
    "lockout_end" timestamp with time zone,
    "lockout_enabled" boolean NOT NULL,
    "access_failed_count" integer NOT NULL
);

CREATE INDEX ix_users__normalized_email ON identity.users (normalized_email);
CREATE UNIQUE INDEX ix_users__normalized_user_name ON identity.users (normalized_user_name);

ALTER TABLE app.budget 
    ADD CONSTRAINT cs__budget__user_id FOREIGN KEY (user_id) REFERENCES identity.users (id)
        ON DELETE CASCADE;

CREATE TABLE identity.user_tokens (
    "user_id" uuid NOT NULL,
    "login_provider" character varying(450) NOT NULL,
    "name" character varying(450) NOT NULL,
    "value" text,
    CONSTRAINT "pk__user_tokens" PRIMARY KEY ("user_id", "login_provider", "name"),
    CONSTRAINT "fk__user_tokens__users__user_id" FOREIGN KEY ("user_id")
        REFERENCES identity."users" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);

