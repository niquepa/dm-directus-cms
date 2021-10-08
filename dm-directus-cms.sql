--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Debian 12.8-1.pgdg110+1)
-- Dumped by pg_dump version 13.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    logo uuid NOT NULL
);


ALTER TABLE public.clients OWNER TO "dm-directus";

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO "dm-directus";

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: clients_translations; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.clients_translations (
    id integer NOT NULL,
    clients_id integer,
    languages_id character varying(255),
    name character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.clients_translations OWNER TO "dm-directus";

--
-- Name: clients_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.clients_translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_translations_id_seq OWNER TO "dm-directus";

--
-- Name: clients_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.clients_translations_id_seq OWNED BY public.clients_translations.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50) NOT NULL,
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text
);


ALTER TABLE public.directus_activity OWNER TO "dm-directus";

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO "dm-directus";

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json
);


ALTER TABLE public.directus_collections OWNER TO "dm-directus";

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_dashboards OWNER TO "dm-directus";

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64)
);


ALTER TABLE public.directus_fields OWNER TO "dm-directus";

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO "dm-directus";

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO "dm-directus";

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO "dm-directus";

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO "dm-directus";

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT 'insert_chart'::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO "dm-directus";

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO "dm-directus";

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO "dm-directus";

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json
);


ALTER TABLE public.directus_presets OWNER TO "dm-directus";

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO "dm-directus";

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO "dm-directus";

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO "dm-directus";

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO "dm-directus";

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO "dm-directus";

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    collection_list json,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO "dm-directus";

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid NOT NULL,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    data json
);


ALTER TABLE public.directus_sessions OWNER TO "dm-directus";

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(10) DEFAULT '#00C897'::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json
);


ALTER TABLE public.directus_settings OWNER TO "dm-directus";

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO "dm-directus";

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(8) DEFAULT 'en-US'::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255)
);


ALTER TABLE public.directus_users OWNER TO "dm-directus";

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url text NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections text NOT NULL
);


ALTER TABLE public.directus_webhooks OWNER TO "dm-directus";

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: dm-directus
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO "dm-directus";

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dm-directus
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: dm-directus
--

CREATE TABLE public.languages (
    code character varying(255) NOT NULL,
    name character varying(255)
);


ALTER TABLE public.languages OWNER TO "dm-directus";

--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: clients_translations id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients_translations ALTER COLUMN id SET DEFAULT nextval('public.clients_translations_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.clients (id, status, sort, user_created, date_created, user_updated, date_updated, logo) FROM stdin;
1	draft	\N	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:22:13.06+00	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-26 03:44:37.915+00	1aecf930-3797-4c07-a86f-d4b07d94115b
\.


--
-- Data for Name: clients_translations; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.clients_translations (id, clients_id, languages_id, name, description) FROM stdin;
1	1	en-US	NYCDOT	\N
2	1	es-ES	Departamento de Transporte	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment) FROM stdin;
2	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:10.976833+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_settings	1	\N
3	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_collections	clients	\N
4	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	1	\N
5	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	2	\N
6	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	3	\N
7	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	4	\N
8	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	5	\N
9	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	6	\N
10	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:38.528645+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	7	\N
11	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:44.858492+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	8	\N
12	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:44.930631+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_collections	clients_translations	\N
13	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:44.930631+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	9	\N
14	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:44.965428+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_collections	languages	\N
15	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:44.965428+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	10	\N
16	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:44.965428+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	11	\N
17	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.057452+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	12	\N
18	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.071954+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	13	\N
19	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	en-US	\N
20	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	de-DE	\N
21	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	fr-FR	\N
22	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	ru-RU	\N
23	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	es-ES	\N
24	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	it-IT	\N
25	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:16:45.236629+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	pt-BR	\N
26	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:19:04.898747+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	14	\N
27	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:19:25.013682+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	14	\N
28	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:20:04.133459+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	15	\N
29	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:21:07.24212+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_fields	8	\N
30	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:21:39.543175+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_files	3aa1559d-7f7f-4f81-b223-9b2e914d25bf	\N
31	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:22:13.057309+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients_translations	1	\N
32	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:22:13.057309+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients_translations	2	\N
33	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:22:13.057309+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients	1	\N
34	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:23:38.309193+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients_translations	1	\N
35	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:23:38.309193+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients_translations	2	\N
36	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:23:38.309193+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients_translations	3	\N
37	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:23:38.309193+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients	1	\N
38	delete	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:24:30.228512+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	de-DE	\N
39	delete	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:24:30.228512+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	fr-FR	\N
40	delete	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:24:30.228512+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	it-IT	\N
41	delete	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:24:30.228512+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	pt-BR	\N
42	delete	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:24:30.228512+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	languages	ru-RU	\N
43	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-26 03:44:35.435502+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_files	1aecf930-3797-4c07-a86f-d4b07d94115b	\N
44	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-26 03:44:37.915404+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	clients	1	\N
45	delete	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-26 03:45:05.747015+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_files	3aa1559d-7f7f-4f81-b223-9b2e914d25bf	\N
47	create	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-09-07 18:58:03.922204+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	16	\N
48	update	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-09-07 18:59:46.986966+00	172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_fields	16	\N
1	login	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-20 16:15:51.690188+00	::ffff:172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.164 Safari/537.36	directus_users	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N
46	login	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-09-07 18:54:13.583789+00	::ffff:172.19.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36	directus_users	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N
49	login	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-10-08 17:04:32.271723+00	::ffff:172.18.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36	directus_users	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields) FROM stdin;
clients	\N	\N	\N	f	f	\N	status	t	archived	draft	sort	all	\N	\N
clients_translations	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N
languages	translate	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group") FROM stdin;
1	clients	id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N
2	clients	status	\N	select-dropdown	{"choices":[{"text":"Published","value":"published"},{"text":"Draft","value":"draft"},{"text":"Archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"background":"#00C897","value":"published"},{"background":"#D3DAE4","value":"draft"},{"background":"#F7971C","value":"archived"}]}	f	f	\N	full	\N	\N	\N	f	\N
3	clients	sort	\N	input	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N
4	clients	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N
5	clients	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N
6	clients	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	\N	half	\N	\N	\N	f	\N
7	clients	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	\N	half	\N	\N	\N	f	\N
9	clients_translations	id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N
10	languages	code	\N	input	{"iconLeft":"vpn_key"}	\N	\N	f	f	\N	half	\N	\N	\N	f	\N
11	languages	name	\N	input	{"iconLeft":"translate"}	\N	\N	f	f	\N	half	\N	\N	\N	f	\N
12	clients_translations	clients_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N
13	clients_translations	languages_id	\N	\N	\N	\N	\N	f	t	\N	full	\N	\N	\N	f	\N
14	clients_translations	name	\N	input	{"trim":true}	raw	\N	f	f	\N	full	[{"language":"en-US","translation":"Name"},{"language":"es-ES","translation":"Nombre"}]	\N	\N	f	\N
15	clients	logo	\N	file-image	\N	image	\N	f	f	\N	full	\N	\N	\N	f	\N
8	clients	translations	translations	translations	{"languageTemplate":"{{name}}","translationsTemplate":"{{name}}"}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N
16	clients_translations	description	\N	input	\N	raw	\N	f	f	\N	full	[{"language":"en-US","translation":"Description"},{"language":"es-ES","translation":"Descripción"}]	\N	\N	f	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
1aecf930-3797-4c07-a86f-d4b07d94115b	local	1aecf930-3797-4c07-a86f-d4b07d94115b..png	dot-logo.png	Dot Logo	image/png	\N	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-07-26 03:44:35.435502+00	\N	2021-07-26 03:44:35.461+00	\N	5577	180	80	\N	\N	\N	\N	\N	{}
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2021-07-20 16:15:18.83976+00
20201029A	Remove System Relations	2021-07-20 16:15:18.848709+00
20201029B	Remove System Collections	2021-07-20 16:15:18.853948+00
20201029C	Remove System Fields	2021-07-20 16:15:18.870024+00
20201105A	Add Cascade System Relations	2021-07-20 16:15:18.929048+00
20201105B	Change Webhook URL Type	2021-07-20 16:15:18.957737+00
20210225A	Add Relations Sort Field	2021-07-20 16:15:18.962284+00
20210304A	Remove Locked Fields	2021-07-20 16:15:18.966502+00
20210312A	Webhooks Collections Text	2021-07-20 16:15:18.971236+00
20210331A	Add Refresh Interval	2021-07-20 16:15:18.974314+00
20210415A	Make Filesize Nullable	2021-07-20 16:15:18.980201+00
20210416A	Add Collections Accountability	2021-07-20 16:15:18.98544+00
20210422A	Remove Files Interface	2021-07-20 16:15:18.988647+00
20210506A	Rename Interfaces	2021-07-20 16:15:19.015738+00
20210510A	Restructure Relations	2021-07-20 16:15:19.05932+00
20210518A	Add Foreign Key Constraints	2021-07-20 16:15:19.076566+00
20210519A	Add System Fk Triggers	2021-07-20 16:15:19.109829+00
20210521A	Add Collections Icon Color	2021-07-20 16:15:19.113624+00
20210608A	Add Deep Clone Config	2021-07-20 16:15:19.117001+00
20210626A	Change Filesize Bigint	2021-07-20 16:15:19.15555+00
20210525A	Add Insights	2021-10-08 16:47:39.5039+00
20210716A	Add Conditions to Fields	2021-10-08 16:47:39.508941+00
20210721A	Add Default Folder	2021-10-08 16:47:39.519945+00
20210802A	Replace Groups	2021-10-08 16:47:39.529707+00
20210803A	Add Required to Fields	2021-10-08 16:47:39.535653+00
20210805A	Update Groups	2021-10-08 16:47:39.539734+00
20210805B	Change Image Metadata Structure	2021-10-08 16:47:39.5475+00
20210811A	Add Geometry Config	2021-10-08 16:47:39.551292+00
20210831A	Remove Limit Column	2021-10-08 16:47:39.561294+00
20210903A	Add Auth Provider	2021-10-08 16:47:39.594854+00
20210907A	Webhooks Collections Not Null	2021-10-08 16:47:39.609066+00
20210910A	Move Module Setup	2021-10-08 16:47:39.616162+00
20210920A	Webhooks URL Not Null	2021-10-08 16:47:39.622247+00
20210927A	Replace Fields Group	2021-10-08 16:47:39.632014+00
20210927B	Replace M2M Interface	2021-10-08 16:47:39.635003+00
20210929A	Rename Login Action	2021-10-08 16:47:39.64193+00
20211007A	Update Presets	2021-10-08 16:47:39.654722+00
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter) FROM stdin;
2	\N	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N	languages	\N	tabular	{"tabular":{"page":1}}	\N	\N	\N
1	\N	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N	clients	\N	tabular	{"tabular":{"page":1}}	\N	\N	\N
3	\N	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N
4	\N	68ae1148-6f78-4ff1-8583-2f317e531bcf	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	clients	user_created	directus_users	\N	\N	\N	\N	\N	nullify
2	clients	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
5	clients	logo	directus_files	\N	\N	\N	\N	\N	nullify
4	clients_translations	clients_id	clients	translations	\N	\N	languages_id	\N	nullify
3	clients_translations	languages_id	languages	\N	\N	\N	clients_id	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	19	languages	en-US	{"code":"en-US","name":"English"}	{"code":"en-US","name":"English"}	\N
2	20	languages	de-DE	{"code":"de-DE","name":"German"}	{"code":"de-DE","name":"German"}	\N
3	21	languages	fr-FR	{"code":"fr-FR","name":"French"}	{"code":"fr-FR","name":"French"}	\N
4	22	languages	ru-RU	{"code":"ru-RU","name":"Russian"}	{"code":"ru-RU","name":"Russian"}	\N
5	23	languages	es-ES	{"code":"es-ES","name":"Spanish"}	{"code":"es-ES","name":"Spanish"}	\N
6	24	languages	it-IT	{"code":"it-IT","name":"Italian"}	{"code":"it-IT","name":"Italian"}	\N
7	25	languages	pt-BR	{"code":"pt-BR","name":"Portuguese"}	{"code":"pt-BR","name":"Portuguese"}	\N
10	33	clients	1	{"logo":{"id":"3aa1559d-7f7f-4f81-b223-9b2e914d25bf"},"translations":[{"languages_id":"en-US","name":"NYCDOT"},{"languages_id":"es-ES","name":"Departamento de Transporte"}],"id":1}	{"logo":{"id":"3aa1559d-7f7f-4f81-b223-9b2e914d25bf"},"translations":[{"languages_id":"en-US","name":"NYCDOT"},{"languages_id":"es-ES","name":"Departamento de Transporte"}],"id":1}	\N
8	31	clients_translations	1	{"languages_id":"en-US","name":"NYCDOT","clients_id":1,"id":1}	{"languages_id":"en-US","name":"NYCDOT","clients_id":1,"id":1}	10
9	32	clients_translations	2	{"languages_id":"es-ES","name":"Departamento de Transporte","clients_id":1,"id":2}	{"languages_id":"es-ES","name":"Departamento de Transporte","clients_id":1,"id":2}	10
14	37	clients	1	{"id":1,"status":"draft","sort":null,"user_created":"68ae1148-6f78-4ff1-8583-2f317e531bcf","date_created":"2021-07-20T16:22:13Z","user_updated":"68ae1148-6f78-4ff1-8583-2f317e531bcf","date_updated":"2021-07-20T16:23:38Z","logo":"3aa1559d-7f7f-4f81-b223-9b2e914d25bf","translations":[1,2,3]}	{"user_updated":"68ae1148-6f78-4ff1-8583-2f317e531bcf","date_updated":"2021-07-20T16:23:38.309Z"}	\N
11	34	clients_translations	1	{"id":1,"clients_id":1,"languages_id":"en-US","name":"NYCDOT"}	{"clients_id":"1"}	14
12	35	clients_translations	2	{"id":2,"clients_id":1,"languages_id":"es-ES","name":"Departamento de Transporte"}	{"clients_id":"1"}	14
13	36	clients_translations	3	{"languages_id":"de-DE","name":"Hallo!","clients_id":"1","id":3}	{"languages_id":"de-DE","name":"Hallo!","clients_id":"1","id":3}	14
15	44	clients	1	{"id":1,"status":"draft","sort":null,"user_created":"68ae1148-6f78-4ff1-8583-2f317e531bcf","date_created":"2021-07-20T16:22:13Z","user_updated":"68ae1148-6f78-4ff1-8583-2f317e531bcf","date_updated":"2021-07-26T03:44:37Z","logo":"1aecf930-3797-4c07-a86f-d4b07d94115b","translations":[1,2]}	{"logo":"1aecf930-3797-4c07-a86f-d4b07d94115b","user_updated":"68ae1148-6f78-4ff1-8583-2f317e531bcf","date_updated":"2021-07-26T03:44:37.915Z"}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, collection_list, admin_access, app_access) FROM stdin;
cd497c24-b1e9-400c-9f09-116aba93b9e8	Admin	supervised_user_circle	\N	\N	f	\N	t	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, data) FROM stdin;
ZzrEiuvdLTTlYwIBuZbeIm9MMLt9UdtQ8D3fDYjJyfCoDqQeJ8UH6W0rjDQXKQlL	68ae1148-6f78-4ff1-8583-2f317e531bcf	2021-10-15 17:04:32.256+00	::ffff:172.18.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36	\N
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar) FROM stdin;
1	Headless - CMS	\N	#00C897	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier) FROM stdin;
68ae1148-6f78-4ff1-8583-2f317e531bcf	\N	\N	carlos@digitalmachine.co	$argon2i$v=19$m=4096,t=3,p=1$sBUyHYMlBpWVM0tLDYjTgQ$sIqNzODDOv/GK/J+waXbmCbwdy4uUHTaNJFS2Pm/k4w	\N	\N	\N	\N	\N	en-US	auto	\N	active	cd497c24-b1e9-400c-9f09-116aba93b9e8	\N	2021-10-08 17:04:32.28+00	/collections	default	\N
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: dm-directus
--

COPY public.languages (code, name) FROM stdin;
en-US	English
es-ES	Spanish
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, true);


--
-- Name: clients_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.clients_translations_id_seq', 3, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 49, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 16, true);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 1, false);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 4, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 5, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 15, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dm-directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: clients_translations clients_translations_name_unique; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients_translations
    ADD CONSTRAINT clients_translations_name_unique UNIQUE (name);


--
-- Name: clients_translations clients_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients_translations
    ADD CONSTRAINT clients_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (code);


--
-- Name: clients clients_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_logo_foreign FOREIGN KEY (logo) REFERENCES public.directus_files(id);


--
-- Name: clients_translations clients_translations_clients_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients_translations
    ADD CONSTRAINT clients_translations_clients_id_foreign FOREIGN KEY (clients_id) REFERENCES public.clients(id) ON DELETE SET NULL;


--
-- Name: clients_translations clients_translations_languages_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients_translations
    ADD CONSTRAINT clients_translations_languages_id_foreign FOREIGN KEY (languages_id) REFERENCES public.languages(code) ON DELETE SET NULL;


--
-- Name: clients clients_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: clients clients_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dm-directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

