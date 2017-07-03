//changes to tables to alter column 'control' to have a
//width of 128


ALTER TABLE "dba"."security_info"
       DELETE FOREIGN KEY "security_info_template";

ALTER TABLE "dba"."security_info"
	DELETE PRIMARY KEY;

ALTER TABLE "dba"."security_template"
	DELETE PRIMARY KEY;

ALTER TABLE "dba"."security_info"
	MODIFY control varchar(128) NOT NULL;

ALTER TABLE "dba"."security_template"
	MODIFY control varchar(128) NOT NULL;
 
ALTER TABLE "dba"."security_info"
        ADD PRIMARY KEY ("application",
       "window",
       "control",
       "user_name");
 
ALTER TABLE "dba"."security_template"
        ADD PRIMARY KEY ("application",
       "window",
       "control");
 
ALTER TABLE "dba"."security_info"
       ADD FOREIGN KEY "security_info_template" ("application",
       "window",
       "control"
       ) REFERENCES "dba"."security_template"
       ON DELETE  CASCADE;
 
