CREATE SCHEMA test_schema;
ALTER SCHEMA test_schema OWNER TO postgres;
CREATE TABLE public.rdbm_history (
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
ALTER TABLE public.rdbm_history OWNER TO postgres;
CREATE SEQUENCE public.rdbm_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.rdbm_history_id_seq OWNER TO postgres;
ALTER SEQUENCE public.rdbm_history_id_seq OWNED BY public.rdbm_history.id;

CREATE TABLE test_schema.test_table (
    id integer NOT NULL,
    test character varying(250)
);
ALTER TABLE test_schema.test_table OWNER TO postgres;
CREATE SEQUENCE test_schema.test_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE test_schema.test_table_id_seq OWNER TO postgres;
ALTER SEQUENCE test_schema.test_table_id_seq OWNED BY test_schema.test_table.id;
ALTER TABLE ONLY public.rdbm_history
    ADD CONSTRAINT rdbm_history_pkey PRIMARY KEY (id);

ALTER TABLE ONLY test_schema.test_table
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (id);
