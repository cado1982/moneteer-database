CREATE TABLE identity.roles (
    "id" uuid PRIMARY KEY NOT NULL,
    "name" character varying(256),
    "normalized_name" character varying(256),
    "concurrency_stamp" text
);
CREATE UNIQUE INDEX ix_roles__name ON identity.roles (name);

CREATE TABLE identity.user_roles (
    "user_id" uuid  NOT NULL references identity.users(id) ON DELETE CASCADE,
    "role_id" uuid NOT NULL references identity.roles(id) ON DELETE CASCADE,
    CONSTRAINT "pk__user_roles" PRIMARY KEY ("user_id", "role_id")
);
CREATE INDEX ix_user_roles__role_id ON identity.user_roles (role_id);

CREATE TABLE identity.user_logins (
    "login_provider" character varying(450) NOT NULL,
    "provider_key" character varying(450) NOT NULL,
    "provider_display_name" text,
    "user_id" uuid NOT NULL references identity.users(id) ON DELETE CASCADE,
    CONSTRAINT "pk__user_logins" PRIMARY KEY ("login_provider", "provider_key")
);
CREATE INDEX ix_user_logins__user_id ON identity.user_logins (user_id);

CREATE TABLE identity.role_claims (
    "id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "role_id" uuid NOT NULL references identity.roles(id) ON DELETE CASCADE,
    "claim_type" text,
    "claim_value" text
);
CREATE INDEX ix_role_claims__role_id ON identity.role_claims (role_id);