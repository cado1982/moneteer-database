CREATE TABLE identity."device_codes"
(
    "user_code" character varying(200) PRIMARY KEY NOT NULL,
    "device_code" character varying(200) NOT NULL,
    "subject_id" character varying(200),
    "client_id" character varying(200) NOT NULL,
    "creation_time" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "data" character varying(50000) NOT NULL
);
CREATE UNIQUE INDEX "ix__device_codes__device_code" ON identity."device_codes" ("device_code");
CREATE INDEX "ix__device_codes__expiration" ON identity."device_codes" ("expiration");


CREATE TABLE identity."persisted_grants"
(
    "key" character varying(200) PRIMARY KEY NOT NULL,
    "type" character varying(50) NOT NULL,
    "subject_id" character varying(200),
    "client_id" character varying(200) NOT NULL,
    "creation_time" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "data" character varying(50000) NOT NULL
);
CREATE INDEX "ix__persisted_grants__subject_id__client_id__type__expiration"
    ON identity."persisted_grants" ("subject_id", "client_id", "type", "expiration");