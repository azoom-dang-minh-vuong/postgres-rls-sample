CREATE TABLE IF NOT EXISTS "operating_company" (
  "id" serial PRIMARY KEY NOT NULL,
  "name" varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS "operating_user" (
  "id" serial PRIMARY KEY NOT NULL,
  "operating_company_id" integer NOT NULL,
  "name" varchar(255) NOT NULL
);

ALTER TABLE "operating_user"
ADD CONSTRAINT "operating_user_operating_company_id_fk" FOREIGN KEY ("operating_company_id") REFERENCES "operating_company"("id")
ON DELETE no action
ON UPDATE no action;

-- Enable Row Level Security
ALTER TABLE operating_company ENABLE ROW LEVEL SECURITY;
CREATE POLICY operating_company_isolation_policy ON operating_company
USING (id::TEXT = current_user);

ALTER TABLE operating_user ENABLE ROW LEVEL SECURITY;
CREATE POLICY operating_company_user_isolation_policy ON operating_user
USING (operating_company_id::TEXT = current_user);

-- Create an user with username "2" and password "my_strong_password"
CREATE ROLE "2" NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'my_strong_password';
-- Grant access to the tables
GRANT SELECT ON TABLE operating_company TO "2";
GRANT INSERT, SELECT, UPDATE, DELETE ON TABLE operating_user TO "2";

-- Create 2 Operating Companies
INSERT INTO operating_company ("name")
	VALUES ('Company 1');
INSERT INTO operating_company ("name")
  VALUES ('Company 2');
-- Create 4 Operating Users with random operating_company_id
INSERT INTO operating_user (operating_company_id,"name")
	VALUES (1,'User 1');
INSERT INTO operating_user (operating_company_id,"name")
  VALUES (2,'User 2');
INSERT INTO operating_user (operating_company_id,"name")
  VALUES (1,'User 3');
INSERT INTO operating_user (operating_company_id,"name")
  VALUES (2,'User 4');
