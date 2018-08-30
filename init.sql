CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" varchar(150) NOT NULL,
    "ProductVersion" varchar(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "ApiModels" (
    "Id" serial NOT NULL,
    "ModelName" text NULL,
    "IsModelActive" boolean NOT NULL,
    CONSTRAINT "PK_ApiModels" PRIMARY KEY ("Id")
);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20180823051310_initial', '2.1.0-rtm-30799');

