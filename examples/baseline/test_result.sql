CREATE SCHEMA rumba;
ALTER SCHEMA rumba OWNER TO postgres;
CREATE TABLE rumba.sql_history (
    id integer NOT NULL,
    source character varying(250) NOT NULL,
    target character varying(250),
    source_type character(1) NOT NULL,
    version character varying(80) NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    checksum character varying(80),
    scheduled_on timestamp without time zone,
    script_tag character varying(80),
    catalog character varying(80),
    executed_on timestamp with time zone,
    executed_by character varying(80),
    ok boolean DEFAULT false NOT NULL,
    msg character varying(250),
    took_sec bigint DEFAULT 0 NOT NULL,
    times integer DEFAULT 1 NOT NULL,
    size bigint DEFAULT 0 NOT NULL
);
ALTER TABLE rumba.sql_history OWNER TO postgres;
CREATE SEQUENCE rumba.sql_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE rumba.sql_history_id_seq OWNER TO postgres;
ALTER SEQUENCE rumba.sql_history_id_seq OWNED BY rumba.sql_history.id;
ALTER TABLE ONLY rumba.sql_history
    ADD CONSTRAINT sql_history_pkey PRIMARY KEY (id);
