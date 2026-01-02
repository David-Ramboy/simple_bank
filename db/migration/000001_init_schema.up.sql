-- ACCOUNTS
CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "owner" varchar(255) NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar(255) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now()
);

-- ENTRIES
CREATE TABLE "entries" (
  "id" bigserial PRIMARY KEY,
  "account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now()
);

-- TRANSFERS
CREATE TABLE "transfers" (
  "id" bigserial PRIMARY KEY,
  "from_account_id" bigint NOT NULL,
  "to_account_id" bigint NOT NULL,
  "amount" bigint NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now()
);

-- INDEXES
CREATE INDEX "accounts_owner_idx" ON "accounts" ("owner");
CREATE INDEX "entries_account_id_idx" ON "entries" ("account_id");
CREATE INDEX "transfers_from_idx" ON "transfers" ("from_account_id");
CREATE INDEX "transfers_to_idx" ON "transfers" ("to_account_id");
CREATE INDEX "transfers_from_to_idx"
ON "transfers" ("from_account_id", "to_account_id");

-- FOREIGN KEYS
ALTER TABLE "entries"
ADD CONSTRAINT "entries_account_fk"
FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers"
ADD CONSTRAINT "transfers_from_fk"
FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers"
ADD CONSTRAINT "transfers_to_fk"
FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");
