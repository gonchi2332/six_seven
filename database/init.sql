CREATE TABLE "academic_degree" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "external_platform" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "function" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "interface" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "language" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "language_level" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "level" varchar UNIQUE NOT NULL
);

CREATE TABLE "link" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "link" text,
  "label" varchar NOT NULL DEFAULT 'Enlace'
);

CREATE TABLE "profile_picture" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "profile_picture" bytea NOT NULL
);

CREATE TABLE "residence_city" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "residence_country" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "role" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "session_report" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "skill" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar UNIQUE NOT NULL,
  "type" varchar NOT NULL DEFAULT 'soft',
  "canon_name" varchar NOT NULL DEFAULT 'undefined'
);

CREATE TABLE "migrations_history" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "file_name" varchar UNIQUE NOT NULL,
  "created_by" varchar NOT NULL,
  "timestamp" timestamptz NOT NULL DEFAULT now()
);


CREATE TABLE "user" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "password" varchar NOT NULL,
  "state" varchar NOT NULL DEFAULT 'unverified',
  "role_id" int NOT NULL,
  "public_profile_link" text,
  "registration_date" timestamptz NOT NULL DEFAULT now(),
  "names" varchar NOT NULL,
  "first_surname" varchar NOT NULL,
  "main_registration_email" varchar NOT NULL DEFAULT 'undefined',
  "is_new" boolean DEFAULT true,
  "show_name" boolean NOT NULL DEFAULT true,
  "show_contact_email" boolean NOT NULL DEFAULT true,
  "show_phone" boolean NOT NULL DEFAULT true,
  "show_residence" boolean NOT NULL DEFAULT true
);


CREATE TABLE "academic_training" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "name" text NOT NULL,
  "academic_degree_id" int,
  "institution" varchar NOT NULL,
  "visible" boolean NOT NULL DEFAULT true,
  "start_date" date NOT NULL,
  "username" varchar NOT NULL,
  "canon_title" text NOT NULL DEFAULT 'undefined',
  "canon_institution" text NOT NULL DEFAULT 'undefined',
  "education_state" varchar NOT NULL DEFAULT 'Egresado'
);

CREATE TABLE "certificate" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "area" varchar NOT NULL,
  "file" bytea,
  "issue_date" date NOT NULL,
  "username" varchar NOT NULL,
  "visible" boolean NOT NULL DEFAULT true
);

CREATE TABLE "laboral_experience" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "position" varchar NOT NULL,
  "company_name" varchar NOT NULL,
  "description" text,
  "visible" boolean NOT NULL DEFAULT true,
  "start_date" date NOT NULL,
  "end_date" date,
  "username" varchar NOT NULL
);

CREATE TABLE "project" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "topic" varchar,
  "description" text,
  "status" varchar NOT NULL DEFAULT 'in progress',
  "visible" boolean NOT NULL DEFAULT true,
  "username" varchar NOT NULL,
  "name" varchar NOT NULL DEFAULT 'undefined',
  "role" varchar NOT NULL DEFAULT 'undefined',
  "image" bytea
);

CREATE TABLE "password_reset_code" (
  "code" varchar NOT NULL,
  "expires_at" timestamptz NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT now(),
  "username" varchar UNIQUE PRIMARY KEY NOT NULL
);

CREATE TABLE "verification_mail_code" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "username" varchar NOT NULL,
  "code" varchar NOT NULL,
  "expires_at" timestamptz NOT NULL DEFAULT (now() + '00:15:00'::interval),
  "created_at" timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE "session_report_user" (
  "id" SERIAL UNIQUE PRIMARY KEY NOT NULL,
  "action_id" int NOT NULL,
  "registered_date" timestamp NOT NULL DEFAULT now(),
  "username" varchar NOT NULL
);


CREATE TABLE "user_contact_email" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "contact_email" varchar NOT NULL
);

CREATE TABLE "user_phone_number" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "phone_number" varchar NOT NULL
);

CREATE TABLE "user_profile_picture" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "profile_picture_id" int NOT NULL
);

CREATE TABLE "user_registration_email" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "registration_email" varchar NOT NULL
);

CREATE TABLE "user_residence_city" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "residence_city_id" int NOT NULL
);

CREATE TABLE "user_residence_country" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "residence_country_id" int NOT NULL
);

CREATE TABLE "user_second_surname" (
  "username" varchar UNIQUE PRIMARY KEY NOT NULL,
  "second_surname" varchar NOT NULL
);


CREATE TABLE "function_interface" (
  "function_id" int NOT NULL,
  "interface_id" int NOT NULL,
  "active" boolean NOT NULL DEFAULT true,
  PRIMARY KEY ("function_id", "interface_id")
);

CREATE TABLE "laboral_experience_skill" (
  "skill_id" int NOT NULL,
  "experience_id" int NOT NULL,
  PRIMARY KEY ("skill_id", "experience_id")
);

CREATE TABLE "project_link" (
  "project_id" int NOT NULL,
  "link_id" int NOT NULL,
  "visit_count" smallint NOT NULL DEFAULT 0,
  PRIMARY KEY ("project_id", "link_id")
);

CREATE TABLE "project_skill" (
  "skill_id" int NOT NULL,
  "project_id" int NOT NULL,
  PRIMARY KEY ("skill_id", "project_id")
);

CREATE TABLE "role_function" (
  "role_id" int NOT NULL,
  "function_id" int NOT NULL,
  "active" boolean NOT NULL DEFAULT true,
  PRIMARY KEY ("role_id", "function_id")
);

CREATE TABLE "user_language_level" (
  "language_id" int NOT NULL,
  "language_level_id" int NOT NULL,
  "username" varchar NOT NULL,
  PRIMARY KEY ("language_id", "username")
);

CREATE TABLE "user_platform" (
  "external_platform_id" int NOT NULL,
  "link" varchar NOT NULL,
  "visit_count" smallint NOT NULL DEFAULT 0,
  "username" varchar NOT NULL,
  PRIMARY KEY ("username", "external_platform_id")
);

CREATE TABLE "user_skill" (
  "skill_id" int NOT NULL,
  "punctuation" smallint,
  "username" varchar NOT NULL,
  "visible" boolean NOT NULL DEFAULT true,
  PRIMARY KEY ("skill_id", "username")
);


ALTER TABLE "user" ADD CONSTRAINT "User_Has_Role" FOREIGN KEY ("role_id") REFERENCES "role" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "academic_training" ADD CONSTRAINT "Owns" FOREIGN KEY ("academic_degree_id") REFERENCES "academic_degree" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "academic_training" ADD CONSTRAINT "fk_academic_training_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "certificate" ADD CONSTRAINT "fk_certificate_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "laboral_experience" ADD CONSTRAINT "fk_laboral_experience_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "project" ADD CONSTRAINT "fk_project_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "password_reset_code" ADD CONSTRAINT "fk_password_reset_code_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "session_report_user" ADD CONSTRAINT "Generates_1" FOREIGN KEY ("action_id") REFERENCES "session_report" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "session_report_user" ADD CONSTRAINT "fk_session_report_user_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "user_contact_email" ADD CONSTRAINT "user_contact_email_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_phone_number" ADD CONSTRAINT "user_phone_number_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_profile_picture" ADD CONSTRAINT "user_profile_picture_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_profile_picture" ADD CONSTRAINT "user_profile_picture_profile_picture_id_fkey" FOREIGN KEY ("profile_picture_id") REFERENCES "profile_picture" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_registration_email" ADD CONSTRAINT "user_registration_email_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_residence_city" ADD CONSTRAINT "user_residence_city_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_residence_city" ADD CONSTRAINT "user_residence_city_residence_city_id_fkey" FOREIGN KEY ("residence_city_id") REFERENCES "residence_city" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_residence_country" ADD CONSTRAINT "user_residence_country_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_residence_country" ADD CONSTRAINT "user_residence_country_residence_country_id_fkey" FOREIGN KEY ("residence_country_id") REFERENCES "residence_country" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_second_surname" ADD CONSTRAINT "user_maternal_surname_username_fkey" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "function_interface" ADD CONSTRAINT "Dispose_1" FOREIGN KEY ("interface_id") REFERENCES "interface" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "function_interface" ADD CONSTRAINT "Dispose_2" FOREIGN KEY ("function_id") REFERENCES "function" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "laboral_experience_skill" ADD CONSTRAINT "Has" FOREIGN KEY ("experience_id") REFERENCES "laboral_experience" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "laboral_experience_skill" ADD CONSTRAINT "Requires" FOREIGN KEY ("skill_id") REFERENCES "skill" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "project_link" ADD CONSTRAINT "References_1" FOREIGN KEY ("project_id") REFERENCES "project" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "project_link" ADD CONSTRAINT "References_2" FOREIGN KEY ("link_id") REFERENCES "link" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "project_skill" ADD CONSTRAINT "Applies_1" FOREIGN KEY ("project_id") REFERENCES "project" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "project_skill" ADD CONSTRAINT "Applies_2" FOREIGN KEY ("skill_id") REFERENCES "skill" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "role_function" ADD CONSTRAINT "Plays_1" FOREIGN KEY ("role_id") REFERENCES "role" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "role_function" ADD CONSTRAINT "Plays_2" FOREIGN KEY ("function_id") REFERENCES "function" ("id") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "user_language_level" ADD CONSTRAINT "Speaks" FOREIGN KEY ("language_id") REFERENCES "language" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_language_level" ADD CONSTRAINT "User_Language_Level_Has_Level" FOREIGN KEY ("language_level_id") REFERENCES "language_level" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_language_level" ADD CONSTRAINT "fk_user_language_level_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "user_platform" ADD CONSTRAINT "Interacts_2" FOREIGN KEY ("external_platform_id") REFERENCES "external_platform" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_platform" ADD CONSTRAINT "fk_user_platform_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE "user_skill" ADD CONSTRAINT "Masters_2" FOREIGN KEY ("skill_id") REFERENCES "skill" ("id") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "user_skill" ADD CONSTRAINT "fk_user_skill_user" FOREIGN KEY ("username") REFERENCES "user" ("username") DEFERRABLE INITIALLY IMMEDIATE;
