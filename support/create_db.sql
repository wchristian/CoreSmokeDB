DROP TABLE IF EXISTS report       CASCADE;
DROP TABLE IF EXISTS config       CASCADE;
DROP TABLE IF EXISTS result       CASCADE;
DROP TABLE IF EXISTS failure      CASCADE;
DROP TABLE IF EXISTS smoke_config CASCADE;

CREATE TABLE smoke_config
           ( id      serial not null  PRIMARY KEY
           , md5     varchar not null UNIQUE
           , config  varchar
           ) ;

CREATE TABLE report
           ( id              serial not null PRIMARY KEY
           , sconfig_id      int REFERENCES smoke_config (id)

-- report
           , duration        int                      -- 35464
           , config_count    int                      -- 32
           , reporter        varchar                  -- 0.035
           , smoke_perl      varchar                  -- 5.10.1
           , smoke_revision  varchar                  -- 1285
           , smoke_version   varchar                  -- 1.44
           , smoker_version  varchar                  -- 0.045
-- id
           , smoke_date      timestamp with time zone not null -- 2011-04-14 21:20:43Z
           , perl_id         varchar not null                  -- "5.14.0"
           , git_id          varchar not null                  -- "b4ffc3db31e268adb50c44bab9b628dc619f1e83"
           , git_describe    varchar not null                  -- 5.13.11-1423-ga4f23763
           , applied_patches varchar                           -- -
--node
           , hostname        varchar not null         -- "smokebox"
           , architecture    varchar not null         -- "ia64"
           , osname          varchar not null         -- "HP-UX"
           , osversion       varchar not null         -- "B.11.31/64"
           , cpu_count       varchar                  -- "1 [2 cores]"
           , cpu_description varchar                  -- "Itanium 2 9100/1710"
           , username        varchar                  -- "tux"
-- build
           , TEST_JOBS       varchar                  -- NULL
           , LC_ALL          varchar                  -- "en_US.utf8"
           , LANG            varchar                  -- NULL
           , manifest_msgs   bytea                    -- "..."
           , compiler_msgs   bytea                    -- "..."
           , skipped_tests   varchar                  -- "..."
           , harness_only    varchar                  -- "1"
           , summary         varchar not null         -- "FAIL(F)"
           , UNIQUE(git_id, smoke_date, duration, hostname, architecture)
           ) ;

CREATE TABLE config
           ( id        serial not null PRIMARY KEY
           , report_id int    not null REFERENCES report (id)
--config
           , arguments varchar not null     -- "-Duse64bitall -DDEBUGGING"
           , parallel  varchar not null     -- "1"
           , debugging varchar not null     -- "1"
           , cc        varchar not null     -- "cc"
           , ccversion varchar not null     -- "B3910B"
           ) ;

CREATE TABLE result
           ( id         serial not null  PRIMARY KEY
           , config_id  int     not null REFERENCES config (id)  -- result
           , io_env     varchar not null       -- "perlio"
           , locale     varchar                -- "nl_NL.utf8"
           , output     varchar not null       -- "..."
           , summary    varchar not null       -- "F"
           , statistics varchar                -- "Files=1802, Tests=349808, .."
           ) ;

CREATE TABLE failure
           ( id        serial not null PRIMARY KEY
           , result_id int not null REFERENCES result (id)
           , testname  varchar not null
           , status    varchar not null
           , extra     varchar
           ) ;
