--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-12-17 13:08:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE tarkastus;
--
-- TOC entry 2947 (class 1262 OID 16546)
-- Name: tarkastus; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tarkastus WITH TEMPLATE = template0 ENCODING = 'WIN1252' LC_COLLATE = 'English_Finland.1252' LC_CTYPE = 'English_Finland.1252';


ALTER DATABASE tarkastus OWNER TO postgres;

\connect tarkastus

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 2947
-- Name: DATABASE tarkastus; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE tarkastus IS 'Tietokantojen hallinnan näyttöihin liittyvä tietokanta, jossa on kuvitteellista sähkötarkastuksiin liittyvää dataa.';


--
-- TOC entry 2440 (class 3456 OID 24680)
-- Name: suomi; Type: COLLATION; Schema: public; Owner: postgres
--

CREATE COLLATION public.suomi (provider = icu, locale = 'fi-FI');


ALTER COLLATION public.suomi OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16601)
-- Name: asiakas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asiakas (
    asiakasnumero integer NOT NULL,
    nimi character varying(50) NOT NULL
);


ALTER TABLE public.asiakas OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16604)
-- Name: asiakas_asiakasnumero_seq_1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asiakas_asiakasnumero_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asiakas_asiakasnumero_seq_1 OWNER TO postgres;

--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 203
-- Name: asiakas_asiakasnumero_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asiakas_asiakasnumero_seq_1 OWNED BY public.asiakas.asiakasnumero;


--
-- TOC entry 204 (class 1259 OID 16606)
-- Name: kaynti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kaynti (
    kaynti_id integer NOT NULL,
    tyontekija_id integer NOT NULL,
    tyomaa_id integer NOT NULL,
    paivays date NOT NULL,
    tyyppikoodi integer NOT NULL
);


ALTER TABLE public.kaynti OWNER TO postgres;

--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE kaynti; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.kaynti IS 'Käyntikerralle annettava yksilöllinen tunniste, laskuri';


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN kaynti.kaynti_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kaynti.kaynti_id IS 'Jokaiselle käynnille automaattisesti annettava id';


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN kaynti.tyontekija_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kaynti.tyontekija_id IS 'Työntekijälle automaattisesti annettava tunniste, laskuri';


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN kaynti.tyomaa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.kaynti.tyomaa_id IS 'Jokaiselle uudelle työmaalle annetaan automaattisesti numero (laskuri)';


--
-- TOC entry 205 (class 1259 OID 16609)
-- Name: tarkastustyyppi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarkastustyyppi (
    tyyppikoodi integer NOT NULL,
    tyyppinimitys character varying(50) NOT NULL
);


ALTER TABLE public.tarkastustyyppi OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16612)
-- Name: tyomaa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tyomaa (
    tyomaa_id integer NOT NULL,
    nimi character varying(50) NOT NULL,
    katuosoite character varying(50) NOT NULL,
    postinumero character varying(20) NOT NULL,
    postitoimipaikka character varying(50) NOT NULL,
    asiakasnumero integer NOT NULL
);


ALTER TABLE public.tyomaa OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE tyomaa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tyomaa IS 'Työmaiden perustiedot';


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN tyomaa.tyomaa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tyomaa.tyomaa_id IS 'Jokaiselle uudelle työmaalle annetaan automaattisesti numero (laskuri)';


--
-- TOC entry 208 (class 1259 OID 16617)
-- Name: tyontekija; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tyontekija (
    tyontekija_id integer NOT NULL,
    etunimi character varying(50) NOT NULL,
    sukunimi character varying(50) NOT NULL
);


ALTER TABLE public.tyontekija OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE tyontekija; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tyontekija IS 'Tässä taulussa on sähköasentajien henkilötiedot';


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN tyontekija.tyontekija_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tyontekija.tyontekija_id IS 'Työntekijälle automaattisesti annettava tunniste, laskuri';


--
-- TOC entry 210 (class 1259 OID 16656)
-- Name: kaynnit_selkokieli; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.kaynnit_selkokieli AS
 SELECT tyomaa.nimi AS "työmaa",
    tarkastustyyppi.tyyppinimitys AS syy,
    kaynti.paivays AS "päiväys",
    (((tyontekija.sukunimi)::text || ' '::text) || (tyontekija.etunimi)::text) AS tarkastaja
   FROM (((public.kaynti
     JOIN public.tyomaa ON ((kaynti.tyomaa_id = tyomaa.tyomaa_id)))
     JOIN public.tarkastustyyppi ON ((kaynti.tyyppikoodi = tarkastustyyppi.tyyppikoodi)))
     JOIN public.tyontekija ON ((kaynti.tyontekija_id = tyontekija.tyontekija_id)))
  ORDER BY kaynti.paivays;


ALTER TABLE public.kaynnit_selkokieli OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16615)
-- Name: tyomaa_tyomaa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tyomaa_tyomaa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tyomaa_tyomaa_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 207
-- Name: tyomaa_tyomaa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tyomaa_tyomaa_id_seq OWNED BY public.tyomaa.tyomaa_id;


--
-- TOC entry 209 (class 1259 OID 16620)
-- Name: tyontekija_tyontekija_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tyontekija_tyontekija_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tyontekija_tyontekija_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 209
-- Name: tyontekija_tyontekija_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tyontekija_tyontekija_id_seq OWNED BY public.tyontekija.tyontekija_id;


--
-- TOC entry 2789 (class 2604 OID 16622)
-- Name: asiakas asiakasnumero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asiakas ALTER COLUMN asiakasnumero SET DEFAULT nextval('public.asiakas_asiakasnumero_seq_1'::regclass);


--
-- TOC entry 2790 (class 2604 OID 16623)
-- Name: tyomaa tyomaa_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyomaa ALTER COLUMN tyomaa_id SET DEFAULT nextval('public.tyomaa_tyomaa_id_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 16624)
-- Name: tyontekija tyontekija_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyontekija ALTER COLUMN tyontekija_id SET DEFAULT nextval('public.tyontekija_tyontekija_id_seq'::regclass);


--
-- TOC entry 2934 (class 0 OID 16601)
-- Dependencies: 202
-- Data for Name: asiakas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (1, 'Mähönen Oy');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (2, 'Suurpää Oyj');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (3, 'Tolkuton Oyj');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (4, 'FoolingYou As');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (5, 'Kuoppa Oy');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (6, 'Scrapped Terrain Ltd');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (7, 'Vipuvarsi ky');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (8, 'V-S Huuhaa Oy');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (9, 'Hot and Hot inc');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (10, 'Matti Möttönen Oy');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (11, 'Autoliike Petos & Vilppi Oy');
INSERT INTO public.asiakas (asiakasnumero, nimi) VALUES (12, 'Virherakentajat Oy');


--
-- TOC entry 2936 (class 0 OID 16606)
-- Dependencies: 204
-- Data for Name: kaynti; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1, 5, 6, '2019-06-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2, 10, 8, '2019-06-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4, 11, 11, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (10, 6, 12, '2019-04-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (11, 3, 3, '2019-01-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (15, 7, 10, '2019-04-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (16, 12, 1, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (19, 6, 1, '2019-02-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (22, 4, 8, '2019-03-31', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (23, 2, 3, '2019-01-23', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (24, 1, 4, '2019-01-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (25, 3, 1, '2019-03-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (26, 6, 6, '2019-03-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (30, 4, 1, '2019-08-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (36, 6, 1, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (40, 4, 9, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (41, 2, 4, '2019-10-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (42, 5, 7, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (49, 7, 2, '2019-11-08', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (53, 1, 5, '2019-02-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (56, 4, 5, '2019-04-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (57, 9, 7, '2019-10-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (59, 9, 7, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (62, 3, 12, '2019-06-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (63, 11, 10, '2019-10-17', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (64, 4, 2, '2019-02-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (66, 5, 6, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (70, 1, 11, '2019-04-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (71, 7, 1, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (74, 9, 12, '2019-03-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (77, 5, 12, '2019-05-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (81, 11, 4, '2019-10-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (86, 10, 8, '2019-02-01', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (87, 3, 5, '2019-05-31', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (89, 5, 6, '2019-01-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (91, 4, 6, '2019-03-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (93, 7, 9, '2019-09-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (96, 5, 5, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (99, 1, 7, '2019-02-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (102, 5, 2, '2019-08-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (103, 1, 5, '2019-06-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (106, 7, 9, '2019-01-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (107, 7, 11, '2019-01-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (108, 6, 3, '2019-09-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (109, 1, 10, '2019-02-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (112, 12, 9, '2019-10-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (115, 12, 8, '2019-02-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (116, 8, 9, '2019-08-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (117, 10, 10, '2019-01-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (118, 9, 11, '2019-03-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (120, 1, 10, '2019-09-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (124, 8, 9, '2019-05-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (129, 4, 1, '2019-10-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (131, 2, 10, '2019-10-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (133, 2, 2, '2019-09-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (134, 2, 6, '2019-08-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (135, 8, 4, '2019-04-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (141, 11, 6, '2019-03-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (144, 8, 5, '2019-01-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (145, 9, 7, '2019-01-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (146, 9, 4, '2019-11-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (151, 7, 12, '2019-06-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (152, 11, 7, '2019-02-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (153, 10, 2, '2019-10-01', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (154, 1, 10, '2019-11-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (161, 11, 10, '2019-09-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (163, 3, 5, '2019-05-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (164, 2, 1, '2019-08-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (166, 1, 4, '2019-10-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (167, 3, 8, '2019-01-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (168, 11, 1, '2019-10-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (173, 8, 5, '2019-11-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (175, 10, 1, '2019-07-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (177, 6, 2, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (179, 8, 2, '2019-02-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (181, 4, 11, '2019-02-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (182, 9, 12, '2019-10-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (183, 5, 11, '2019-03-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (185, 11, 2, '2019-04-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (189, 3, 5, '2019-04-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (193, 12, 5, '2019-11-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (197, 3, 8, '2019-08-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (200, 11, 11, '2019-07-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (202, 3, 2, '2019-06-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (203, 8, 7, '2019-05-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (204, 9, 3, '2019-11-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (206, 1, 2, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (209, 3, 7, '2019-10-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (214, 4, 1, '2019-09-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (221, 3, 10, '2019-03-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (222, 7, 5, '2019-10-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (223, 7, 6, '2019-01-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (224, 2, 8, '2019-11-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (231, 2, 3, '2019-01-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (233, 2, 8, '2019-09-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (234, 3, 11, '2019-01-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (240, 11, 7, '2019-05-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (241, 1, 5, '2019-11-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (242, 2, 6, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (253, 3, 1, '2019-08-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (256, 4, 9, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (259, 2, 6, '2019-06-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (260, 10, 9, '2019-07-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (262, 5, 12, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (263, 12, 10, '2019-09-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (269, 7, 2, '2019-10-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (272, 8, 6, '2019-02-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (277, 10, 8, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (281, 8, 8, '2019-10-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (282, 10, 6, '2019-01-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (284, 7, 3, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (287, 9, 10, '2019-01-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (288, 9, 5, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (289, 2, 2, '2019-07-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (290, 2, 11, '2019-08-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (301, 10, 5, '2019-03-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (302, 2, 8, '2019-08-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (303, 6, 6, '2019-05-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (306, 4, 12, '2019-09-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (308, 7, 2, '2019-02-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (313, 10, 1, '2019-04-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (317, 7, 12, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (323, 6, 11, '2019-04-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (325, 3, 3, '2019-09-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (332, 1, 9, '2019-01-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (346, 7, 11, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (349, 4, 4, '2019-07-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (356, 9, 6, '2019-08-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (364, 3, 2, '2019-09-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (366, 3, 9, '2019-05-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (375, 3, 3, '2019-05-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (377, 8, 2, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (383, 2, 7, '2019-06-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (388, 10, 5, '2019-04-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (389, 7, 3, '2019-01-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (401, 9, 10, '2019-10-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (403, 9, 1, '2019-04-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (404, 2, 1, '2019-07-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (415, 7, 8, '2019-07-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (417, 4, 8, '2019-08-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (421, 6, 8, '2019-09-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (422, 12, 5, '2019-09-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (424, 1, 5, '2019-08-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (426, 11, 5, '2019-05-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (428, 11, 12, '2019-06-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (430, 11, 3, '2019-03-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (433, 10, 11, '2019-01-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (435, 4, 9, '2019-08-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (437, 11, 5, '2019-02-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (448, 8, 1, '2019-03-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (451, 3, 5, '2019-06-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (452, 7, 12, '2019-02-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (459, 3, 10, '2019-02-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (460, 5, 3, '2019-02-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (476, 1, 6, '2019-08-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (477, 2, 4, '2019-09-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (478, 1, 2, '2019-06-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (481, 5, 11, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (483, 7, 12, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (488, 3, 5, '2019-08-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (500, 5, 11, '2019-01-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (501, 9, 11, '2019-03-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (504, 10, 8, '2019-03-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (509, 4, 7, '2019-09-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (510, 2, 11, '2019-02-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (515, 6, 5, '2019-10-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (519, 7, 5, '2019-02-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (523, 6, 1, '2019-04-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (531, 4, 6, '2019-01-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (534, 2, 11, '2019-06-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (544, 5, 4, '2019-03-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (547, 8, 3, '2019-10-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (551, 8, 12, '2019-10-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (556, 8, 7, '2019-09-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (559, 12, 12, '2019-06-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (566, 4, 9, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (572, 1, 8, '2019-09-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (574, 8, 5, '2019-07-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (575, 10, 11, '2019-09-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (576, 6, 9, '2019-06-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (578, 6, 10, '2019-06-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (579, 9, 11, '2019-05-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (584, 11, 5, '2019-10-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (591, 2, 8, '2019-02-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (592, 5, 6, '2019-09-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (593, 11, 1, '2019-04-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (594, 3, 2, '2019-06-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (601, 7, 1, '2019-07-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (604, 7, 9, '2019-02-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (608, 1, 12, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (612, 4, 7, '2019-01-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (614, 11, 5, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (620, 2, 7, '2019-10-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (624, 8, 4, '2019-05-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (625, 6, 9, '2019-09-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (629, 5, 6, '2019-09-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (633, 5, 1, '2019-06-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (636, 12, 9, '2019-06-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (653, 3, 2, '2019-04-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (658, 6, 4, '2019-05-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (670, 3, 4, '2019-02-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (675, 6, 5, '2019-03-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (679, 9, 7, '2019-09-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (682, 3, 1, '2019-01-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (686, 6, 2, '2019-06-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (689, 10, 11, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (694, 9, 4, '2019-07-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (695, 12, 6, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (705, 10, 9, '2019-06-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (707, 10, 7, '2019-01-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (708, 1, 9, '2019-10-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (711, 4, 3, '2019-09-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (712, 4, 2, '2019-06-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (716, 1, 3, '2019-01-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (718, 12, 4, '2019-07-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (719, 11, 2, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (723, 8, 4, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (730, 11, 10, '2019-07-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (734, 7, 9, '2019-06-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (739, 1, 6, '2019-01-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (744, 5, 9, '2019-11-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (747, 10, 9, '2019-08-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (750, 9, 7, '2019-07-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (756, 10, 6, '2019-07-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (757, 12, 8, '2019-03-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (764, 2, 12, '2019-02-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (771, 6, 2, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (774, 12, 6, '2019-03-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (775, 2, 5, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (776, 1, 9, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (781, 11, 7, '2019-10-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (782, 11, 10, '2019-05-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (784, 5, 11, '2019-07-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (786, 10, 4, '2019-09-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (789, 5, 4, '2019-01-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (792, 2, 11, '2019-01-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (797, 8, 8, '2019-11-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (800, 4, 12, '2019-09-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (805, 1, 7, '2019-04-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (807, 3, 9, '2019-10-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (808, 2, 9, '2019-09-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (812, 3, 11, '2019-04-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (813, 2, 5, '2019-09-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (818, 6, 9, '2019-09-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (823, 4, 10, '2019-07-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (825, 1, 6, '2019-05-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (828, 6, 4, '2019-01-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (829, 2, 1, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (837, 5, 11, '2019-10-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (838, 6, 9, '2019-03-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (845, 12, 7, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (846, 6, 4, '2019-07-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (848, 4, 10, '2019-08-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (850, 8, 6, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (853, 11, 2, '2019-10-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (859, 3, 4, '2019-11-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (860, 2, 12, '2019-02-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (861, 10, 1, '2019-11-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (862, 7, 4, '2019-04-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (867, 2, 12, '2019-09-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (868, 11, 8, '2019-05-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (875, 9, 9, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (879, 2, 12, '2019-04-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (883, 6, 3, '2019-05-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (887, 10, 12, '2019-08-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (888, 7, 1, '2019-04-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (892, 1, 11, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (895, 3, 9, '2019-09-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (904, 12, 4, '2019-08-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (906, 3, 10, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (909, 8, 3, '2019-09-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (911, 5, 10, '2019-09-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (912, 2, 5, '2019-08-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (913, 4, 12, '2019-10-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (915, 11, 5, '2019-04-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (917, 4, 11, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (918, 9, 11, '2019-10-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (919, 3, 1, '2019-05-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (921, 7, 9, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (924, 9, 10, '2019-04-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (928, 5, 4, '2019-11-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (931, 2, 2, '2019-08-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (937, 12, 7, '2019-11-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (943, 7, 1, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (944, 11, 12, '2019-07-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (957, 9, 5, '2019-08-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (960, 9, 7, '2019-06-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (963, 5, 1, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (966, 12, 6, '2019-10-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (970, 12, 7, '2019-09-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (973, 2, 6, '2019-04-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (977, 12, 6, '2019-04-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (980, 7, 9, '2019-11-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (982, 8, 6, '2019-08-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (984, 3, 3, '2019-10-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (988, 6, 10, '2019-06-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (989, 2, 6, '2019-06-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (991, 1, 5, '2019-07-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (992, 7, 7, '2019-09-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (994, 7, 4, '2019-08-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (996, 9, 8, '2019-03-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1000, 2, 9, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1002, 12, 6, '2019-07-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1006, 3, 2, '2019-09-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1007, 10, 10, '2019-04-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1012, 4, 10, '2019-09-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1014, 4, 12, '2019-06-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1015, 3, 12, '2019-09-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1018, 7, 7, '2019-02-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1026, 10, 2, '2019-07-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1029, 1, 9, '2019-01-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1034, 4, 10, '2019-08-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1036, 10, 12, '2019-01-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1038, 6, 7, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1039, 9, 6, '2019-04-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1041, 9, 5, '2019-05-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1052, 8, 12, '2019-11-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1061, 7, 5, '2019-06-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1062, 12, 8, '2019-10-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1064, 5, 2, '2019-05-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1065, 2, 6, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1066, 1, 8, '2019-09-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1067, 2, 4, '2019-05-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1076, 4, 8, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1087, 2, 8, '2019-09-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1088, 12, 5, '2019-04-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1090, 11, 6, '2019-11-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1094, 4, 9, '2019-11-01', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1096, 1, 1, '2019-04-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1100, 3, 12, '2019-10-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1101, 10, 10, '2019-01-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1106, 2, 6, '2019-09-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1107, 2, 3, '2019-08-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1108, 12, 2, '2019-09-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1110, 9, 10, '2019-04-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1116, 3, 6, '2019-02-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1117, 4, 11, '2019-09-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1120, 3, 1, '2019-10-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1123, 7, 4, '2019-07-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1124, 4, 1, '2019-02-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1125, 7, 2, '2019-09-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1126, 10, 6, '2019-05-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1127, 12, 2, '2019-07-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1130, 2, 2, '2019-06-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1145, 11, 1, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1146, 9, 10, '2019-05-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1147, 4, 3, '2019-11-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1153, 10, 1, '2019-07-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1154, 9, 2, '2019-10-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1156, 8, 3, '2019-08-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1158, 3, 12, '2019-08-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1161, 8, 6, '2019-01-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1168, 12, 12, '2019-09-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1169, 1, 1, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1170, 11, 9, '2019-08-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1172, 6, 12, '2019-03-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1173, 2, 9, '2019-06-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1174, 8, 3, '2019-11-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1178, 12, 8, '2019-11-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1179, 11, 6, '2019-09-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1180, 9, 2, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1181, 3, 3, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1183, 3, 7, '2019-08-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1184, 3, 10, '2019-06-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1189, 1, 10, '2019-09-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1194, 10, 2, '2019-06-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1201, 7, 10, '2019-02-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1210, 3, 1, '2019-08-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1213, 8, 3, '2019-03-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1215, 5, 9, '2019-09-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1224, 6, 9, '2019-10-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1228, 8, 3, '2019-09-17', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1229, 12, 9, '2019-10-22', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1230, 12, 9, '2019-03-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1234, 2, 3, '2019-01-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1235, 11, 7, '2019-11-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1236, 6, 3, '2019-09-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1239, 3, 11, '2019-07-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1240, 7, 11, '2019-08-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1242, 10, 3, '2019-10-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1246, 8, 4, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1252, 2, 11, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1256, 4, 1, '2019-01-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1260, 7, 8, '2019-03-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1261, 7, 6, '2019-01-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1264, 3, 2, '2019-10-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1265, 8, 2, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1271, 1, 12, '2019-05-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1272, 4, 1, '2019-10-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1275, 4, 10, '2019-02-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1278, 3, 2, '2019-05-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1282, 2, 8, '2019-11-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1291, 1, 7, '2019-02-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1295, 2, 10, '2019-04-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1299, 7, 7, '2019-11-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1304, 12, 3, '2019-07-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1307, 5, 12, '2019-06-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1316, 3, 2, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1321, 7, 6, '2019-06-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1325, 9, 3, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1327, 1, 4, '2019-10-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1331, 1, 8, '2019-09-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1333, 9, 10, '2019-01-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1341, 8, 5, '2019-09-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1342, 10, 7, '2019-04-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1346, 1, 7, '2019-11-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1349, 7, 7, '2019-09-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1350, 8, 11, '2019-10-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1351, 10, 9, '2019-01-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1353, 5, 8, '2019-01-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1357, 8, 7, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1359, 1, 4, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1360, 1, 5, '2019-09-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1365, 3, 3, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1374, 11, 6, '2019-10-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1385, 7, 7, '2019-11-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1386, 12, 2, '2019-05-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1391, 4, 5, '2019-09-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1393, 7, 4, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1396, 1, 4, '2019-05-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1400, 11, 3, '2019-10-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1403, 11, 8, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1415, 5, 12, '2019-10-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1417, 12, 6, '2019-06-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1418, 12, 10, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1419, 6, 9, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1420, 2, 7, '2019-07-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1425, 9, 10, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1431, 4, 6, '2019-05-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1434, 5, 4, '2019-01-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1439, 3, 5, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1441, 1, 5, '2019-10-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1443, 4, 11, '2019-08-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1445, 8, 2, '2019-05-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1450, 4, 6, '2019-08-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1453, 6, 9, '2019-09-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1464, 8, 11, '2019-09-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1467, 8, 8, '2019-03-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1473, 7, 4, '2019-10-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1482, 2, 10, '2019-05-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1486, 12, 3, '2019-08-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1487, 9, 5, '2019-06-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1490, 10, 10, '2019-10-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1492, 5, 11, '2019-08-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1501, 11, 8, '2019-03-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1504, 12, 3, '2019-05-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1505, 10, 6, '2019-07-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1507, 9, 5, '2019-10-22', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1511, 11, 11, '2019-09-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1514, 3, 10, '2019-05-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1518, 10, 9, '2019-10-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1520, 4, 11, '2019-09-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1525, 2, 4, '2019-08-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1528, 5, 6, '2019-02-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1530, 9, 9, '2019-06-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1532, 8, 4, '2019-07-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1535, 9, 1, '2019-08-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1536, 11, 3, '2019-02-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1537, 11, 10, '2019-09-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1540, 1, 12, '2019-03-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1557, 7, 6, '2019-06-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1558, 3, 8, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1560, 6, 10, '2019-09-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1561, 1, 2, '2019-10-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1563, 5, 3, '2019-09-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1569, 9, 6, '2019-01-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1570, 5, 2, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1572, 2, 12, '2019-01-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1573, 5, 8, '2019-10-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1574, 8, 4, '2019-08-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1576, 10, 10, '2019-03-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1581, 7, 4, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1592, 8, 5, '2019-05-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1593, 10, 1, '2019-01-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1596, 7, 1, '2019-11-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1601, 5, 2, '2019-01-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1604, 12, 3, '2019-04-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1606, 2, 11, '2019-07-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1608, 8, 2, '2019-08-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1609, 1, 11, '2019-06-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1610, 9, 2, '2019-09-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1617, 3, 5, '2019-06-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1624, 11, 11, '2019-10-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1625, 1, 4, '2019-06-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1630, 7, 2, '2019-03-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1631, 8, 7, '2019-02-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1632, 10, 7, '2019-09-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1634, 3, 7, '2019-01-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1638, 4, 6, '2019-03-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1643, 9, 6, '2019-11-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1647, 11, 2, '2019-07-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1649, 1, 2, '2019-05-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1653, 5, 12, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1654, 5, 2, '2019-06-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1662, 1, 6, '2019-09-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1665, 10, 5, '2019-08-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1666, 2, 10, '2019-09-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1669, 9, 8, '2019-10-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1678, 6, 9, '2019-11-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1682, 1, 10, '2019-05-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1692, 3, 7, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1698, 9, 3, '2019-09-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1700, 12, 8, '2019-06-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1705, 5, 9, '2019-10-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1713, 11, 6, '2019-08-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1714, 10, 11, '2019-09-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1717, 10, 6, '2019-01-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1721, 11, 2, '2019-11-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1724, 9, 7, '2019-10-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1727, 4, 11, '2019-07-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1729, 2, 9, '2019-01-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1730, 4, 3, '2019-11-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1731, 3, 4, '2019-07-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1734, 6, 3, '2019-11-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1735, 7, 9, '2019-05-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1736, 11, 9, '2019-08-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1739, 5, 10, '2019-03-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1741, 10, 10, '2019-10-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1742, 12, 2, '2019-09-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1750, 5, 8, '2019-11-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1760, 5, 12, '2019-09-01', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1763, 7, 5, '2019-10-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1769, 4, 5, '2019-07-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1772, 2, 10, '2019-10-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1773, 8, 8, '2019-03-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1774, 12, 3, '2019-10-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1776, 4, 3, '2019-11-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1777, 11, 3, '2019-04-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1781, 4, 7, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1782, 10, 2, '2019-04-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1786, 4, 4, '2019-10-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1788, 12, 10, '2019-11-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1789, 9, 12, '2019-11-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1790, 5, 1, '2019-10-29', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1792, 11, 10, '2019-11-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1795, 2, 11, '2019-01-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1796, 2, 2, '2019-03-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1802, 9, 2, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1803, 3, 5, '2019-06-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1806, 6, 11, '2019-05-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1808, 7, 1, '2019-05-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1809, 6, 11, '2019-09-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1810, 9, 7, '2019-09-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1814, 10, 12, '2019-10-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1824, 12, 7, '2019-09-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1830, 7, 6, '2019-09-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1833, 2, 4, '2019-07-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1835, 1, 1, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1837, 1, 12, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1838, 1, 8, '2019-01-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1840, 11, 6, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1841, 3, 4, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1844, 6, 3, '2019-02-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1845, 3, 4, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1851, 11, 6, '2019-09-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1853, 7, 8, '2019-02-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1857, 2, 10, '2019-10-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1859, 5, 3, '2019-09-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1860, 3, 5, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1866, 6, 12, '2019-08-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1867, 5, 10, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1870, 9, 9, '2019-09-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1871, 2, 8, '2019-11-08', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1875, 12, 1, '2019-10-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1885, 1, 9, '2019-09-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1886, 6, 11, '2019-07-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1888, 10, 3, '2019-04-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1891, 4, 12, '2019-07-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1897, 12, 7, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1902, 3, 10, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1905, 3, 1, '2019-02-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1913, 7, 1, '2019-11-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1915, 6, 1, '2019-01-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1916, 1, 4, '2019-10-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1920, 9, 1, '2019-05-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1922, 6, 12, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1926, 9, 12, '2019-09-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1927, 2, 3, '2019-10-29', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1928, 2, 2, '2019-05-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1929, 9, 3, '2019-10-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1932, 12, 4, '2019-09-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1935, 8, 12, '2019-03-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1940, 9, 9, '2019-10-27', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1942, 7, 10, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1943, 5, 6, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1946, 9, 3, '2019-09-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1950, 4, 12, '2019-09-08', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1952, 2, 10, '2019-02-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1960, 11, 6, '2019-11-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1962, 1, 12, '2019-06-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1965, 10, 7, '2019-03-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1966, 6, 8, '2019-10-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1968, 6, 2, '2019-11-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1970, 4, 5, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1973, 5, 12, '2019-01-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1974, 11, 7, '2019-10-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1979, 6, 10, '2019-03-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1980, 2, 4, '2019-08-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1986, 2, 7, '2019-04-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1990, 9, 9, '2019-10-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1991, 9, 12, '2019-09-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1992, 2, 9, '2019-02-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (1999, 10, 8, '2019-11-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2000, 10, 4, '2019-10-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2003, 2, 7, '2019-11-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2005, 3, 3, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2006, 4, 2, '2019-05-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2007, 11, 10, '2019-09-22', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2008, 1, 4, '2019-06-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2012, 6, 11, '2019-10-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2014, 7, 5, '2019-09-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2018, 8, 11, '2019-06-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2019, 10, 6, '2019-05-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2036, 10, 12, '2019-06-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2037, 7, 4, '2019-04-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2042, 5, 10, '2019-07-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2047, 12, 4, '2019-10-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2050, 3, 9, '2019-09-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2052, 6, 7, '2019-02-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2057, 4, 4, '2019-01-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2065, 9, 3, '2019-10-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2067, 6, 10, '2019-05-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2068, 1, 4, '2019-08-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2070, 12, 12, '2019-01-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2072, 8, 1, '2019-10-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2073, 12, 6, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2075, 1, 1, '2019-09-23', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2082, 8, 12, '2019-07-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2093, 3, 5, '2019-09-23', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2095, 12, 2, '2019-08-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2097, 2, 9, '2019-08-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2098, 10, 6, '2019-10-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2103, 10, 12, '2019-10-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2105, 3, 12, '2019-09-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2114, 12, 1, '2019-03-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2120, 5, 7, '2019-03-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2125, 12, 7, '2019-10-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2127, 5, 4, '2019-01-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2129, 8, 10, '2019-08-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2131, 2, 2, '2019-10-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2134, 6, 9, '2019-04-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2137, 12, 10, '2019-09-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2138, 9, 6, '2019-09-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2145, 12, 8, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2150, 12, 12, '2019-01-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2151, 11, 7, '2019-02-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2154, 6, 6, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2157, 6, 5, '2019-09-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2164, 11, 11, '2019-10-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2166, 4, 2, '2019-05-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2170, 1, 9, '2019-02-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2171, 1, 8, '2019-04-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2174, 8, 3, '2019-04-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2186, 6, 12, '2019-06-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2190, 3, 10, '2019-09-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2194, 1, 5, '2019-09-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2196, 2, 2, '2019-03-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2202, 10, 12, '2019-04-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2203, 12, 12, '2019-11-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2204, 11, 12, '2019-04-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2214, 5, 12, '2019-09-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2216, 2, 7, '2019-09-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2220, 4, 6, '2019-10-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2224, 8, 2, '2019-11-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2227, 11, 5, '2019-01-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2228, 6, 9, '2019-04-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2231, 9, 4, '2019-05-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2234, 10, 12, '2019-10-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2238, 11, 1, '2019-01-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2241, 6, 7, '2019-02-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2242, 11, 12, '2019-08-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2247, 11, 11, '2019-05-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2248, 3, 4, '2019-05-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2251, 10, 2, '2019-05-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2255, 1, 10, '2019-02-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2256, 7, 3, '2019-01-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2257, 3, 12, '2019-01-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2258, 3, 3, '2019-02-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2259, 5, 1, '2019-11-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2263, 3, 5, '2019-07-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2268, 11, 10, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2270, 5, 9, '2019-11-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2271, 1, 12, '2019-04-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2277, 8, 6, '2019-08-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2280, 5, 2, '2019-03-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2283, 3, 11, '2019-09-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2284, 5, 1, '2019-10-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2286, 1, 3, '2019-09-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2287, 4, 1, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2295, 8, 6, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2303, 12, 3, '2019-06-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2304, 11, 1, '2019-09-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2315, 4, 9, '2019-04-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2318, 7, 4, '2019-02-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2319, 3, 5, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2334, 11, 4, '2019-04-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2337, 3, 6, '2019-10-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2338, 2, 7, '2019-10-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2342, 6, 10, '2019-11-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2344, 10, 7, '2019-09-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2345, 3, 7, '2019-09-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2346, 9, 11, '2019-08-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2347, 5, 10, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2348, 7, 9, '2019-02-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2351, 12, 7, '2019-07-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2357, 1, 9, '2019-09-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2360, 6, 2, '2019-08-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2363, 3, 6, '2019-05-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2364, 12, 8, '2019-05-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2374, 4, 12, '2019-09-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2378, 5, 2, '2019-03-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2382, 1, 3, '2019-03-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2384, 11, 9, '2019-09-17', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2388, 12, 2, '2019-08-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2390, 7, 7, '2019-03-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2395, 12, 4, '2019-06-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2397, 10, 2, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2400, 7, 2, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2403, 7, 3, '2019-09-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2405, 4, 7, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2408, 5, 8, '2019-02-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2409, 10, 3, '2019-04-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2412, 4, 7, '2019-10-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2413, 11, 11, '2019-08-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2425, 3, 9, '2019-08-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2431, 3, 6, '2019-03-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2437, 11, 2, '2019-01-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2438, 8, 8, '2019-09-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2440, 10, 1, '2019-10-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2441, 10, 9, '2019-08-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2443, 10, 5, '2019-11-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2445, 6, 7, '2019-11-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2447, 11, 8, '2019-01-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2448, 7, 1, '2019-05-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2450, 4, 7, '2019-09-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2451, 9, 5, '2019-09-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2452, 3, 7, '2019-09-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2454, 3, 5, '2019-01-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2457, 1, 11, '2019-07-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2461, 3, 7, '2019-06-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2463, 6, 3, '2019-03-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2464, 6, 3, '2019-02-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2470, 12, 5, '2019-04-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2471, 6, 3, '2019-10-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2478, 1, 5, '2019-02-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2485, 11, 4, '2019-08-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2486, 6, 5, '2019-01-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2487, 12, 8, '2019-11-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2489, 10, 1, '2019-10-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2492, 2, 5, '2019-03-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2493, 7, 8, '2019-03-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2494, 9, 9, '2019-01-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2495, 9, 1, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2496, 6, 7, '2019-06-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2497, 10, 2, '2019-03-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2505, 4, 7, '2019-06-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2507, 5, 11, '2019-11-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2513, 4, 9, '2019-02-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2515, 4, 6, '2019-08-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2525, 3, 12, '2019-06-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2526, 7, 5, '2019-10-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2527, 3, 8, '2019-06-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2528, 6, 9, '2019-09-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2530, 4, 1, '2019-09-27', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2540, 5, 5, '2019-05-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2543, 5, 2, '2019-10-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2548, 5, 2, '2019-07-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2549, 6, 3, '2019-09-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2550, 7, 5, '2019-09-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2553, 4, 10, '2019-09-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2558, 11, 4, '2019-01-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2559, 12, 6, '2019-05-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2562, 11, 9, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2563, 12, 9, '2019-10-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2566, 3, 5, '2019-05-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2568, 6, 2, '2019-07-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2570, 7, 2, '2019-09-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2573, 3, 3, '2019-10-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2574, 8, 1, '2019-10-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2582, 2, 8, '2019-03-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2584, 5, 3, '2019-09-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2587, 4, 2, '2019-03-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2590, 5, 10, '2019-07-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2591, 2, 2, '2019-06-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2593, 10, 1, '2019-07-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2597, 9, 8, '2019-09-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2603, 9, 11, '2019-04-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2606, 2, 12, '2019-09-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2618, 2, 9, '2019-08-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2623, 6, 3, '2019-03-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2631, 12, 9, '2019-10-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2632, 12, 8, '2019-02-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2633, 3, 3, '2019-02-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2636, 1, 4, '2019-04-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2638, 9, 7, '2019-02-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2642, 5, 11, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2643, 7, 2, '2019-10-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2645, 1, 5, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2648, 8, 8, '2019-04-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2652, 8, 12, '2019-06-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2661, 11, 2, '2019-10-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2665, 11, 2, '2019-06-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2671, 8, 2, '2019-05-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2682, 8, 7, '2019-06-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2686, 6, 1, '2019-02-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2688, 1, 9, '2019-05-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2691, 11, 1, '2019-07-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2692, 5, 2, '2019-05-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2696, 2, 6, '2019-04-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2702, 4, 8, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2705, 5, 5, '2019-04-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2708, 4, 2, '2019-10-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2709, 11, 11, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2720, 11, 2, '2019-01-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2727, 7, 5, '2019-07-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2728, 9, 3, '2019-10-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2729, 8, 10, '2019-07-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2733, 5, 7, '2019-11-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2736, 6, 3, '2019-11-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2741, 3, 9, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2744, 12, 5, '2019-06-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2746, 12, 8, '2019-09-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2748, 10, 10, '2019-06-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2754, 8, 8, '2019-03-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2756, 9, 9, '2019-08-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2758, 1, 3, '2019-10-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2761, 2, 2, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2762, 11, 6, '2019-04-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2763, 10, 2, '2019-02-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2764, 6, 7, '2019-02-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2766, 10, 11, '2019-07-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2773, 10, 4, '2019-07-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2781, 10, 6, '2019-08-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2783, 5, 10, '2019-09-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2791, 1, 4, '2019-09-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2793, 7, 11, '2019-01-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2801, 3, 9, '2019-07-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2803, 9, 7, '2019-03-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2810, 5, 8, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2827, 7, 8, '2019-02-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2830, 5, 6, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2834, 5, 3, '2019-03-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2841, 10, 4, '2019-09-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2842, 12, 5, '2019-10-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2845, 10, 4, '2019-01-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2848, 1, 1, '2019-02-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2850, 4, 4, '2019-11-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2851, 1, 6, '2019-09-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2853, 8, 7, '2019-07-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2857, 8, 9, '2019-11-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2866, 8, 4, '2019-09-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2867, 6, 1, '2019-02-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2874, 4, 1, '2019-10-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2879, 2, 12, '2019-02-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2880, 6, 6, '2019-04-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2881, 10, 12, '2019-04-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2884, 2, 5, '2019-07-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2886, 3, 1, '2019-02-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2888, 5, 10, '2019-08-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2894, 12, 12, '2019-06-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2898, 5, 12, '2019-02-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2899, 9, 6, '2019-06-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2903, 10, 6, '2019-04-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2917, 9, 6, '2019-10-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2921, 12, 2, '2019-07-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2922, 8, 1, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2928, 2, 5, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2933, 8, 11, '2019-10-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2937, 1, 2, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2942, 2, 10, '2019-11-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2945, 4, 1, '2019-05-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2948, 1, 9, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2955, 5, 1, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2956, 7, 9, '2019-01-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2959, 4, 9, '2019-05-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2960, 5, 1, '2019-03-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2962, 4, 9, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2964, 12, 11, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2965, 8, 12, '2019-06-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2968, 10, 1, '2019-08-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2971, 7, 10, '2019-01-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2974, 7, 7, '2019-05-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2978, 1, 6, '2019-05-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2980, 1, 4, '2019-08-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2987, 3, 3, '2019-10-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (2990, 7, 11, '2019-07-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3002, 7, 3, '2019-06-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3005, 4, 8, '2019-09-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3006, 7, 1, '2019-01-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3021, 4, 7, '2019-06-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3024, 7, 2, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3029, 12, 6, '2019-04-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3038, 4, 4, '2019-03-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3043, 1, 1, '2019-04-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3052, 4, 2, '2019-10-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3053, 12, 2, '2019-06-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3056, 7, 2, '2019-03-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3062, 1, 5, '2019-04-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3064, 11, 7, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3067, 3, 10, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3069, 4, 10, '2019-01-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3070, 6, 10, '2019-09-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3074, 4, 5, '2019-06-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3082, 1, 10, '2019-03-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3085, 11, 12, '2019-01-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3087, 12, 8, '2019-03-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3090, 12, 7, '2019-07-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3093, 12, 10, '2019-10-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3103, 3, 10, '2019-10-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3107, 9, 1, '2019-06-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3112, 1, 6, '2019-07-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3113, 2, 1, '2019-05-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3116, 12, 7, '2019-05-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3117, 9, 11, '2019-08-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3123, 4, 1, '2019-11-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3124, 4, 4, '2019-11-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3126, 1, 5, '2019-07-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3133, 3, 12, '2019-06-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3135, 9, 6, '2019-05-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3137, 9, 7, '2019-03-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3139, 6, 11, '2019-04-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3151, 11, 12, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3152, 4, 7, '2019-03-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3154, 9, 2, '2019-05-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3157, 7, 1, '2019-03-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3158, 10, 4, '2019-04-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3166, 2, 7, '2019-07-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3167, 5, 10, '2019-09-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3183, 5, 11, '2019-08-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3187, 12, 8, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3190, 1, 2, '2019-09-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3192, 1, 11, '2019-01-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3197, 6, 8, '2019-09-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3198, 10, 12, '2019-10-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3199, 2, 7, '2019-03-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3206, 12, 3, '2019-10-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3212, 9, 3, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3213, 8, 10, '2019-02-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3216, 5, 11, '2019-07-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3218, 9, 9, '2019-01-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3224, 4, 12, '2019-03-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3226, 1, 10, '2019-11-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3232, 8, 7, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3238, 3, 1, '2019-02-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3240, 4, 5, '2019-04-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3245, 8, 11, '2019-06-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3246, 12, 11, '2019-03-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3251, 2, 4, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3256, 7, 8, '2019-03-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3260, 11, 12, '2019-01-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3268, 1, 6, '2019-06-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3273, 10, 9, '2019-01-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3276, 9, 1, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3277, 2, 8, '2019-10-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3278, 3, 11, '2019-08-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3279, 12, 2, '2019-10-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3283, 11, 3, '2019-11-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3284, 1, 7, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3285, 10, 12, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3287, 7, 4, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3288, 9, 6, '2019-04-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3290, 2, 1, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3291, 11, 3, '2019-02-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3295, 3, 8, '2019-07-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3298, 12, 5, '2019-05-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3300, 6, 9, '2019-05-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3308, 9, 8, '2019-07-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3312, 8, 5, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3319, 12, 5, '2019-05-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3320, 5, 12, '2019-10-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3322, 12, 10, '2019-05-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3323, 2, 5, '2019-02-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3324, 7, 5, '2019-10-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3326, 10, 12, '2019-08-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3334, 4, 10, '2019-10-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3336, 10, 9, '2019-08-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3339, 11, 8, '2019-01-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3343, 6, 7, '2019-05-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3345, 2, 1, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3346, 6, 7, '2019-10-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3349, 1, 10, '2019-04-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3351, 11, 6, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3352, 7, 1, '2019-08-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3353, 2, 3, '2019-02-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3358, 2, 7, '2019-05-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3362, 10, 9, '2019-05-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3366, 2, 10, '2019-08-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3371, 6, 4, '2019-04-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3375, 3, 12, '2019-01-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3377, 4, 4, '2019-08-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3380, 12, 2, '2019-02-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3383, 10, 6, '2019-07-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3389, 1, 8, '2019-10-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3392, 10, 2, '2019-06-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3395, 7, 11, '2019-09-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3396, 8, 6, '2019-06-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3401, 6, 12, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3405, 6, 1, '2019-09-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3406, 4, 4, '2019-06-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3411, 9, 1, '2019-05-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3412, 11, 2, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3417, 1, 5, '2019-11-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3422, 2, 8, '2019-08-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3423, 6, 2, '2019-05-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3426, 4, 10, '2019-06-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3441, 4, 5, '2019-06-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3442, 11, 11, '2019-10-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3443, 11, 9, '2019-01-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3445, 11, 5, '2019-04-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3446, 6, 10, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3449, 10, 12, '2019-02-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3463, 6, 12, '2019-07-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3465, 12, 7, '2019-11-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3469, 7, 1, '2019-05-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3475, 12, 4, '2019-06-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3476, 10, 2, '2019-06-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3481, 12, 5, '2019-06-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3482, 2, 12, '2019-08-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3483, 4, 12, '2019-01-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3487, 11, 7, '2019-02-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3493, 3, 10, '2019-11-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3494, 12, 3, '2019-09-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3496, 4, 5, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3499, 1, 9, '2019-09-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3500, 9, 1, '2019-05-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3503, 12, 5, '2019-02-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3509, 8, 1, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3510, 7, 12, '2019-06-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3511, 2, 1, '2019-08-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3512, 8, 5, '2019-07-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3513, 1, 6, '2019-05-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3516, 10, 5, '2019-09-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3519, 9, 2, '2019-03-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3523, 1, 5, '2019-11-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3525, 5, 2, '2019-02-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3528, 4, 11, '2019-08-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3534, 12, 11, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3542, 9, 7, '2019-03-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3548, 9, 10, '2019-04-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3555, 6, 12, '2019-03-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3556, 7, 2, '2019-05-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3560, 10, 10, '2019-04-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3562, 10, 7, '2019-05-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3565, 12, 6, '2019-02-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3566, 1, 10, '2019-01-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3576, 4, 6, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3577, 8, 11, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3579, 4, 1, '2019-10-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3584, 11, 3, '2019-02-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3586, 4, 2, '2019-07-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3587, 3, 9, '2019-04-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3594, 3, 2, '2019-07-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3618, 2, 9, '2019-06-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3622, 3, 6, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3627, 7, 2, '2019-04-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3632, 2, 9, '2019-11-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3634, 2, 8, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3639, 2, 8, '2019-10-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3643, 3, 7, '2019-02-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3645, 8, 11, '2019-09-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3646, 4, 3, '2019-05-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3648, 3, 3, '2019-09-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3649, 7, 9, '2019-07-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3653, 2, 1, '2019-04-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3656, 9, 4, '2019-08-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3659, 11, 10, '2019-11-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3660, 1, 5, '2019-05-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3662, 1, 4, '2019-03-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3670, 12, 7, '2019-08-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3671, 5, 1, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3672, 2, 9, '2019-10-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3682, 3, 3, '2019-11-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3687, 3, 4, '2019-11-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3692, 12, 9, '2019-07-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3693, 11, 7, '2019-04-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3697, 10, 11, '2019-11-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3700, 9, 2, '2019-04-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3701, 4, 10, '2019-04-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3705, 8, 11, '2019-07-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3708, 5, 9, '2019-10-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3710, 9, 12, '2019-08-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3712, 5, 10, '2019-07-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3720, 7, 9, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3725, 10, 8, '2019-04-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3735, 11, 9, '2019-09-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3738, 5, 6, '2019-10-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3740, 10, 4, '2019-05-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3741, 5, 2, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3742, 2, 1, '2019-07-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3743, 9, 8, '2019-08-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3753, 11, 12, '2019-07-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3755, 6, 2, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3756, 4, 5, '2019-03-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3757, 4, 12, '2019-10-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3766, 5, 9, '2019-04-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3767, 4, 5, '2019-08-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3771, 8, 9, '2019-01-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3772, 1, 2, '2019-02-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3778, 3, 6, '2019-10-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3779, 3, 11, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3780, 3, 10, '2019-11-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3793, 3, 4, '2019-02-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3794, 7, 7, '2019-10-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3803, 4, 9, '2019-10-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3809, 1, 7, '2019-10-29', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3812, 11, 1, '2019-04-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3817, 9, 7, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3819, 1, 3, '2019-05-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3820, 10, 1, '2019-01-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3821, 12, 12, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3823, 10, 4, '2019-10-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3835, 9, 4, '2019-04-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3840, 1, 7, '2019-03-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3845, 6, 7, '2019-09-22', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3848, 2, 8, '2019-11-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3855, 3, 5, '2019-07-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3856, 1, 8, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3867, 10, 9, '2019-10-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3871, 3, 2, '2019-04-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3872, 11, 7, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3877, 2, 10, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3878, 12, 7, '2019-11-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3879, 2, 6, '2019-08-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3881, 5, 9, '2019-03-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3882, 11, 10, '2019-02-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3884, 12, 8, '2019-10-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3885, 5, 6, '2019-09-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3896, 5, 8, '2019-06-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3898, 10, 1, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3904, 8, 2, '2019-02-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3905, 5, 9, '2019-02-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3906, 6, 6, '2019-01-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3910, 7, 12, '2019-09-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3916, 2, 11, '2019-03-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3919, 12, 12, '2019-11-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3922, 5, 1, '2019-05-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3926, 1, 1, '2019-10-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3929, 5, 6, '2019-06-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3932, 7, 4, '2019-01-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3935, 3, 4, '2019-10-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3937, 5, 7, '2019-05-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3940, 6, 9, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3947, 12, 7, '2019-10-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3950, 7, 7, '2019-05-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3955, 5, 8, '2019-09-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3966, 10, 7, '2019-08-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3967, 7, 10, '2019-03-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3969, 3, 4, '2019-10-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3973, 6, 10, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3979, 8, 12, '2019-10-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3980, 9, 9, '2019-10-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3981, 9, 7, '2019-08-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3987, 12, 6, '2019-05-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3988, 9, 5, '2019-11-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3989, 10, 7, '2019-10-23', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3990, 4, 4, '2019-10-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3992, 1, 5, '2019-04-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3994, 2, 11, '2019-04-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3995, 9, 8, '2019-09-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (3997, 2, 6, '2019-09-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4003, 7, 2, '2019-08-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4005, 1, 3, '2019-02-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4007, 6, 3, '2019-10-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4013, 1, 12, '2019-09-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4017, 3, 10, '2019-02-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4025, 3, 8, '2019-10-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4026, 4, 3, '2019-07-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4027, 12, 12, '2019-05-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4029, 4, 9, '2019-03-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4035, 9, 10, '2019-07-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4037, 10, 1, '2019-06-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4039, 11, 4, '2019-05-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4045, 1, 3, '2019-05-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4049, 10, 6, '2019-10-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4050, 3, 11, '2019-05-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4054, 11, 8, '2019-05-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4057, 8, 2, '2019-04-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4058, 9, 3, '2019-07-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4061, 2, 3, '2019-08-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4064, 3, 3, '2019-04-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4065, 7, 6, '2019-06-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4066, 2, 1, '2019-04-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4067, 11, 5, '2019-11-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4073, 9, 12, '2019-09-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4078, 1, 7, '2019-01-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4083, 8, 4, '2019-01-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4084, 10, 10, '2019-08-31', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4085, 3, 8, '2019-10-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4086, 9, 10, '2019-01-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4087, 4, 1, '2019-05-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4088, 8, 7, '2019-06-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4089, 7, 2, '2019-07-30', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4091, 11, 3, '2019-01-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4092, 7, 6, '2019-08-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4093, 3, 3, '2019-07-27', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4094, 6, 5, '2019-10-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4095, 12, 10, '2019-09-27', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4096, 10, 3, '2019-08-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4097, 7, 6, '2019-02-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4098, 6, 12, '2019-10-23', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4100, 9, 4, '2019-07-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4101, 3, 8, '2019-03-08', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4102, 6, 6, '2019-04-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4103, 6, 11, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4104, 10, 2, '2019-09-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4105, 12, 7, '2019-05-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4106, 7, 6, '2019-03-13', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4107, 2, 11, '2019-10-01', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4108, 3, 1, '2019-03-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4109, 2, 3, '2019-11-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4110, 4, 6, '2019-04-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4111, 7, 10, '2019-05-14', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4112, 6, 3, '2019-03-28', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4113, 7, 9, '2019-10-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4114, 1, 11, '2019-02-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4115, 7, 7, '2019-09-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4116, 2, 8, '2019-07-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4117, 11, 10, '2019-05-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4119, 9, 12, '2019-09-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4121, 2, 12, '2019-03-26', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4123, 9, 11, '2019-06-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4124, 3, 7, '2019-02-15', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4125, 10, 6, '2019-03-28', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4126, 4, 7, '2019-08-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4127, 12, 8, '2019-05-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4128, 3, 8, '2019-05-30', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4130, 4, 8, '2019-02-18', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4131, 9, 2, '2019-05-31', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4132, 1, 4, '2019-10-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4133, 4, 1, '2019-01-13', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4134, 8, 4, '2019-08-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4135, 3, 11, '2019-06-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4138, 5, 9, '2019-10-17', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4139, 1, 8, '2019-08-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4140, 4, 10, '2019-04-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4141, 1, 3, '2019-03-15', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4142, 11, 12, '2019-09-03', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4143, 4, 10, '2019-08-26', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4144, 10, 2, '2019-01-19', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4146, 12, 12, '2019-09-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4147, 10, 10, '2019-03-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4148, 8, 12, '2019-11-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4149, 4, 9, '2019-09-13', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4150, 4, 4, '2019-11-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4151, 8, 10, '2019-11-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4153, 11, 1, '2019-06-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4155, 5, 9, '2019-07-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4156, 2, 4, '2019-02-17', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4157, 2, 7, '2019-09-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4158, 7, 7, '2019-05-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4159, 2, 7, '2019-03-30', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4160, 4, 11, '2019-03-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4161, 11, 1, '2019-08-12', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4163, 7, 3, '2019-03-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4164, 10, 9, '2019-04-24', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4165, 8, 6, '2019-09-05', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4166, 12, 7, '2019-07-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4167, 7, 6, '2019-08-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4169, 6, 9, '2019-01-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4170, 6, 11, '2019-08-19', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4172, 4, 12, '2019-06-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4173, 8, 4, '2019-05-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4175, 10, 9, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4176, 7, 4, '2019-09-17', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4177, 1, 3, '2019-04-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4179, 1, 6, '2019-01-20', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4180, 10, 12, '2019-04-08', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4181, 11, 8, '2019-11-14', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4182, 2, 1, '2019-09-26', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4183, 10, 7, '2019-03-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4184, 3, 8, '2019-03-23', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4185, 10, 12, '2019-06-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4186, 7, 8, '2019-04-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4187, 4, 12, '2019-02-02', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4188, 11, 6, '2019-03-21', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4189, 1, 7, '2019-11-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4190, 1, 4, '2019-06-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4191, 12, 12, '2019-03-19', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4192, 3, 1, '2019-11-02', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4193, 10, 7, '2019-09-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4194, 5, 11, '2019-05-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4196, 8, 3, '2019-08-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4197, 8, 2, '2019-01-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4198, 7, 12, '2019-03-16', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4199, 9, 2, '2019-04-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4200, 9, 7, '2019-04-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4201, 11, 6, '2019-02-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4202, 11, 12, '2019-06-01', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4203, 8, 4, '2019-08-13', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4204, 6, 10, '2019-02-24', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4206, 12, 2, '2019-09-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4207, 1, 10, '2019-03-24', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4208, 11, 6, '2019-05-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4209, 12, 8, '2019-10-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4210, 5, 6, '2019-11-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4211, 12, 11, '2019-03-12', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4212, 7, 10, '2019-09-15', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4213, 5, 2, '2019-04-27', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4216, 6, 7, '2019-08-22', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4218, 8, 9, '2019-01-31', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4219, 3, 1, '2019-07-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4222, 3, 12, '2019-05-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4224, 3, 11, '2019-03-22', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4225, 12, 6, '2019-02-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4226, 1, 8, '2019-05-10', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4228, 10, 6, '2019-09-05', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4229, 8, 2, '2019-10-10', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4230, 3, 7, '2019-02-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4233, 7, 4, '2019-08-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4234, 3, 11, '2019-03-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4235, 7, 7, '2019-02-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4236, 8, 5, '2019-10-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4239, 7, 12, '2019-03-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4240, 8, 5, '2019-04-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4241, 8, 10, '2019-04-04', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4242, 9, 7, '2019-08-10', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4243, 4, 5, '2019-05-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4244, 7, 6, '2019-04-15', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4245, 5, 6, '2019-10-29', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4247, 7, 5, '2019-07-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4249, 8, 8, '2019-07-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4250, 11, 4, '2019-04-29', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4251, 6, 3, '2019-02-20', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4252, 3, 10, '2019-11-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4254, 8, 2, '2019-05-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4256, 1, 10, '2019-10-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4257, 5, 1, '2019-01-27', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4258, 4, 7, '2019-10-26', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4259, 10, 10, '2019-08-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4260, 11, 6, '2019-07-31', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4261, 2, 11, '2019-06-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4262, 1, 12, '2019-02-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4263, 12, 7, '2019-03-31', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4264, 4, 9, '2019-06-22', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4266, 10, 5, '2019-03-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4267, 7, 2, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4268, 5, 7, '2019-01-08', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4271, 4, 1, '2019-04-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4272, 9, 1, '2019-09-08', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4273, 2, 4, '2019-03-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4274, 8, 1, '2019-07-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4275, 9, 12, '2019-08-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4276, 3, 4, '2019-09-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4278, 12, 6, '2019-05-27', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4279, 11, 2, '2019-08-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4280, 9, 6, '2019-04-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4281, 9, 5, '2019-02-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4282, 1, 11, '2019-01-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4283, 5, 6, '2019-09-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4285, 9, 8, '2019-08-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4286, 7, 4, '2019-03-21', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4287, 8, 1, '2019-09-16', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4290, 7, 3, '2019-07-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4291, 2, 10, '2019-08-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4292, 11, 5, '2019-06-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4294, 2, 6, '2019-01-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4295, 2, 3, '2019-08-27', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4296, 11, 8, '2019-01-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4297, 3, 10, '2019-03-29', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4298, 8, 6, '2019-01-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4299, 3, 11, '2019-07-11', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4300, 9, 3, '2019-03-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4301, 9, 4, '2019-02-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4304, 12, 4, '2019-04-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4305, 4, 12, '2019-10-30', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4306, 12, 2, '2019-04-01', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4307, 10, 10, '2019-06-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4308, 9, 10, '2019-08-29', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4311, 7, 2, '2019-09-01', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4312, 11, 1, '2019-06-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4313, 5, 3, '2019-10-31', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4314, 10, 12, '2019-09-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4315, 9, 2, '2019-05-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4316, 3, 11, '2019-05-06', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4317, 3, 3, '2019-09-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4318, 12, 6, '2019-11-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4319, 10, 9, '2019-09-30', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4323, 12, 11, '2019-03-20', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4325, 2, 7, '2019-06-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4326, 4, 2, '2019-07-02', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4327, 7, 4, '2019-10-08', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4328, 4, 12, '2019-04-24', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4329, 1, 8, '2019-01-14', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4330, 7, 5, '2019-03-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4331, 8, 6, '2019-10-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4332, 10, 6, '2019-10-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4333, 3, 1, '2019-07-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4334, 4, 2, '2019-06-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4335, 6, 12, '2019-04-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4336, 8, 6, '2019-07-18', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4337, 4, 5, '2019-08-06', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4338, 5, 12, '2019-10-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4340, 12, 1, '2019-09-13', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4342, 4, 11, '2019-11-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4343, 10, 7, '2019-03-23', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4344, 10, 12, '2019-03-21', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4345, 4, 9, '2019-03-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4346, 3, 2, '2019-06-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4347, 4, 8, '2019-01-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4348, 5, 6, '2019-05-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4349, 7, 4, '2019-10-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4350, 1, 5, '2019-04-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4352, 10, 5, '2019-02-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4354, 6, 7, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4355, 9, 4, '2019-09-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4356, 4, 11, '2019-10-16', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4358, 10, 8, '2019-06-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4359, 12, 5, '2019-09-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4360, 4, 11, '2019-03-20', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4361, 9, 10, '2019-01-16', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4362, 8, 9, '2019-09-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4363, 9, 10, '2019-09-23', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4364, 3, 3, '2019-07-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4365, 5, 7, '2019-05-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4366, 12, 4, '2019-09-21', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4367, 1, 6, '2019-01-21', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4368, 2, 10, '2019-07-30', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4370, 2, 6, '2019-07-13', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4371, 8, 3, '2019-02-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4373, 2, 11, '2019-01-11', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4374, 10, 4, '2019-09-08', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4375, 2, 10, '2019-06-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4377, 2, 7, '2019-01-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4378, 11, 3, '2019-02-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4380, 12, 5, '2019-03-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4381, 3, 8, '2019-10-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4382, 2, 6, '2019-05-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4383, 1, 4, '2019-04-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4384, 4, 10, '2019-09-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4385, 7, 11, '2019-01-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4388, 1, 4, '2019-02-28', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4390, 6, 6, '2019-05-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4391, 8, 8, '2019-01-08', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4394, 12, 1, '2019-03-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4395, 1, 2, '2019-01-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4396, 1, 11, '2019-11-05', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4397, 12, 10, '2019-09-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4398, 11, 2, '2019-03-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4401, 5, 11, '2019-09-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4402, 8, 2, '2019-08-01', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4404, 7, 12, '2019-06-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4405, 2, 5, '2019-08-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4408, 7, 1, '2019-09-15', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4409, 9, 10, '2019-10-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4410, 7, 8, '2019-01-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4411, 10, 3, '2019-10-11', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4412, 4, 10, '2019-05-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4413, 8, 2, '2019-03-07', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4414, 10, 5, '2019-06-13', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4415, 5, 7, '2019-02-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4416, 6, 2, '2019-01-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4417, 5, 11, '2019-08-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4418, 8, 4, '2019-10-09', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4419, 7, 3, '2019-09-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4422, 7, 12, '2019-02-02', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4424, 2, 6, '2019-03-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4425, 2, 11, '2019-01-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4426, 10, 3, '2019-03-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4428, 9, 3, '2019-11-01', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4429, 4, 7, '2019-08-21', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4430, 9, 7, '2019-08-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4431, 9, 9, '2019-03-24', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4432, 1, 8, '2019-06-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4433, 6, 3, '2019-02-01', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4435, 4, 6, '2019-10-24', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4436, 12, 6, '2019-07-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4438, 7, 4, '2019-01-12', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4439, 9, 8, '2019-07-12', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4440, 2, 8, '2019-01-03', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4441, 5, 9, '2019-04-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4442, 3, 4, '2019-03-01', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4443, 9, 7, '2019-03-19', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4444, 7, 4, '2019-04-27', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4445, 1, 6, '2019-10-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4447, 9, 5, '2019-10-23', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4448, 3, 4, '2019-04-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4449, 7, 1, '2019-07-06', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4450, 3, 10, '2019-11-12', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4451, 11, 4, '2019-06-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4452, 12, 6, '2019-05-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4453, 11, 9, '2019-09-22', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4454, 11, 11, '2019-03-18', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4455, 12, 12, '2019-03-11', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4456, 4, 9, '2019-11-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4457, 10, 10, '2019-09-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4458, 2, 3, '2019-01-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4459, 9, 2, '2019-01-24', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4460, 10, 11, '2019-10-31', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4461, 3, 7, '2019-03-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4462, 12, 12, '2019-04-07', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4463, 9, 11, '2019-09-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4465, 7, 5, '2019-09-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4466, 8, 6, '2019-09-18', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4467, 7, 12, '2019-02-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4470, 1, 6, '2019-01-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4471, 12, 1, '2019-06-26', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4472, 5, 6, '2019-09-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4473, 2, 12, '2019-06-08', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4475, 7, 7, '2019-06-26', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4476, 10, 1, '2019-09-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4478, 9, 1, '2019-10-20', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4479, 3, 12, '2019-08-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4480, 10, 12, '2019-01-25', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4481, 1, 10, '2019-08-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4482, 6, 5, '2019-06-10', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4483, 8, 12, '2019-06-27', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4484, 8, 7, '2019-06-13', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4485, 5, 5, '2019-05-26', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4486, 11, 4, '2019-09-16', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4487, 1, 10, '2019-04-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4488, 6, 9, '2019-09-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4489, 9, 5, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4490, 2, 9, '2019-07-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4491, 7, 12, '2019-10-01', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4492, 9, 5, '2019-08-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4493, 6, 12, '2019-08-25', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4494, 11, 5, '2019-11-02', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4495, 5, 8, '2019-07-07', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4496, 4, 6, '2019-09-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4497, 2, 10, '2019-10-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4498, 7, 4, '2019-10-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4499, 5, 3, '2019-06-22', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4500, 10, 6, '2019-01-20', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4501, 7, 10, '2019-08-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4502, 6, 12, '2019-03-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4503, 5, 11, '2019-05-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4504, 6, 3, '2019-04-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4505, 7, 5, '2019-01-05', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4506, 5, 12, '2019-01-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4507, 6, 2, '2019-07-05', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4508, 7, 8, '2019-06-15', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4509, 9, 5, '2019-08-08', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4510, 11, 5, '2019-05-01', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4511, 3, 2, '2019-03-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4512, 9, 7, '2019-08-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4513, 5, 3, '2019-01-16', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4514, 2, 10, '2019-08-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4515, 7, 6, '2019-03-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4516, 6, 7, '2019-08-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4517, 3, 6, '2019-06-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4518, 1, 1, '2019-02-28', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4519, 7, 10, '2019-07-23', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4520, 3, 9, '2019-06-27', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4521, 3, 8, '2019-05-11', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4522, 6, 3, '2019-10-22', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4523, 9, 10, '2019-06-17', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4524, 7, 6, '2019-06-01', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4525, 6, 12, '2019-05-22', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4528, 5, 6, '2019-09-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4529, 4, 12, '2019-10-29', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4530, 9, 2, '2019-07-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4532, 3, 2, '2019-04-22', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4534, 2, 3, '2019-01-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4535, 3, 1, '2019-03-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4536, 3, 2, '2019-07-21', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4537, 11, 11, '2019-08-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4538, 11, 8, '2019-05-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4539, 11, 8, '2019-05-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4540, 11, 11, '2019-06-20', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4541, 10, 3, '2019-03-25', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4542, 12, 4, '2019-04-25', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4543, 12, 1, '2019-03-18', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4544, 6, 8, '2019-11-06', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4545, 7, 9, '2019-09-11', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4546, 6, 2, '2019-08-12', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4547, 8, 4, '2019-06-03', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4548, 4, 4, '2019-03-07', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4549, 2, 5, '2019-08-15', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4550, 2, 12, '2019-05-19', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4551, 7, 7, '2019-02-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4552, 1, 10, '2019-05-12', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4553, 6, 3, '2019-05-23', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4554, 6, 2, '2019-09-17', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4555, 1, 5, '2019-02-04', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4556, 11, 9, '2019-10-27', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4557, 7, 4, '2019-11-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4558, 2, 9, '2019-10-08', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4559, 4, 1, '2019-10-26', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4560, 9, 3, '2019-03-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4561, 4, 3, '2019-03-10', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4562, 2, 7, '2019-08-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4563, 11, 5, '2019-04-05', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4564, 4, 2, '2019-07-19', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4565, 3, 10, '2019-07-10', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4566, 6, 12, '2019-01-10', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4567, 3, 11, '2019-02-09', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4568, 6, 7, '2019-07-03', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4569, 6, 6, '2019-03-10', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4570, 1, 10, '2019-10-20', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4571, 10, 1, '2019-04-01', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4572, 12, 1, '2019-04-28', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4573, 10, 12, '2019-02-12', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4574, 3, 11, '2019-09-18', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4575, 10, 3, '2019-02-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4576, 11, 4, '2019-08-06', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4577, 6, 11, '2019-03-23', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4578, 1, 4, '2019-09-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4579, 7, 1, '2019-06-16', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4580, 7, 12, '2019-04-05', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4581, 7, 4, '2019-09-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4582, 5, 1, '2019-01-14', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4583, 2, 5, '2019-08-01', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4584, 3, 9, '2019-06-02', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4585, 12, 3, '2019-03-05', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4586, 10, 8, '2019-03-30', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4587, 9, 12, '2019-02-24', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4588, 5, 7, '2019-07-22', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4589, 9, 8, '2019-01-17', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4590, 5, 1, '2019-11-06', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4591, 11, 9, '2019-01-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4592, 7, 3, '2019-03-19', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4593, 9, 4, '2019-05-09', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4594, 10, 9, '2019-10-28', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4595, 11, 3, '2019-09-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4596, 5, 7, '2019-09-19', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4597, 6, 3, '2019-09-30', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4598, 10, 12, '2019-03-02', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4599, 10, 8, '2019-03-06', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4600, 3, 1, '2019-04-22', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4601, 9, 5, '2019-10-31', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4602, 1, 6, '2019-07-14', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4603, 7, 1, '2019-05-14', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4604, 2, 12, '2019-09-15', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4605, 11, 2, '2019-02-23', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4606, 8, 5, '2019-08-11', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4607, 10, 9, '2019-04-05', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4608, 8, 1, '2019-08-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4609, 9, 4, '2019-01-21', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4610, 12, 11, '2019-11-14', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4611, 3, 1, '2019-09-25', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4612, 8, 1, '2019-01-11', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4613, 10, 4, '2019-10-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4614, 2, 12, '2019-07-06', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4615, 11, 7, '2019-07-02', 1);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4616, 4, 6, '2019-01-20', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4617, 5, 1, '2019-03-09', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4618, 1, 12, '2019-09-29', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4619, 10, 11, '2019-08-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4620, 12, 11, '2019-09-19', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4621, 1, 5, '2019-02-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4622, 10, 3, '2019-08-19', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4623, 9, 2, '2019-11-08', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4624, 8, 2, '2019-08-21', 4);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4625, 6, 3, '2019-05-03', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4626, 9, 8, '2019-10-04', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4627, 6, 10, '2019-09-17', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4628, 1, 10, '2019-07-08', 2);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4629, 5, 7, '2019-02-26', 3);
INSERT INTO public.kaynti (kaynti_id, tyontekija_id, tyomaa_id, paivays, tyyppikoodi) VALUES (4630, 12, 7, '2019-07-28', 2);


--
-- TOC entry 2937 (class 0 OID 16609)
-- Dependencies: 205
-- Data for Name: tarkastustyyppi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tarkastustyyppi (tyyppikoodi, tyyppinimitys) VALUES (1, 'Käyttöönottotarkastus');
INSERT INTO public.tarkastustyyppi (tyyppikoodi, tyyppinimitys) VALUES (2, 'Konetarkastus');
INSERT INTO public.tarkastustyyppi (tyyppikoodi, tyyppinimitys) VALUES (3, 'Varmennustarkastus');
INSERT INTO public.tarkastustyyppi (tyyppikoodi, tyyppinimitys) VALUES (4, 'Häiriöselvitys');


--
-- TOC entry 2938 (class 0 OID 16612)
-- Dependencies: 206
-- Data for Name: tyomaa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (1, 'Kohde 1', 'Viertotie 5', '21200', 'Raisio', 1);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (2, 'Kohde 2', 'Kotikatu 3', '21200', 'Raisio', 1);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (3, 'Kohde 3', 'Teollisuuskatu 12', '21200', 'Raisio', 3);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (4, 'Kohde 4', 'Valtatie 5', '21200', 'Raisio', 6);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (5, 'Kohde 5', 'Karjakuja 2', '21200', 'Raisio', 2);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (6, 'Kohde 6', 'Patotie 3', '21200', 'Raisio', 5);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (7, 'Kohde 7', 'Kärrypolku 8', '23100', 'Mynämäki', 8);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (8, 'Kohde 8', 'Jotos 66', '23100', 'Mynämäki', 9);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (9, 'Kohde 9', 'Storgatan 55', '20100', 'Åbo', 2);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (10, 'Kohde 10', 'Viertotie 7', '21200', 'Raisio', 10);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (11, 'Kohde 11', 'Viertotie 4', '21200', 'Raisio', 7);
INSERT INTO public.tyomaa (tyomaa_id, nimi, katuosoite, postinumero, postitoimipaikka, asiakasnumero) VALUES (12, 'Kohde 12', 'Pösilönkaari 22', '20100', 'Turku', 1);


--
-- TOC entry 2940 (class 0 OID 16617)
-- Dependencies: 208
-- Data for Name: tyontekija; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (1, 'Jakke', 'Jäynä');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (2, 'Kunto', 'Kalpa');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (3, 'Taisto', 'Tappara');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (4, 'Pirjo', 'Petruska');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (5, 'Kalle', 'Keihäs');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (6, 'Kaapo', 'Kanuuna');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (7, 'Tauno', 'Tykki');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (8, 'Kauko', 'Kiito');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (9, 'Calle', 'Keckelberg');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (10, 'Ansa', 'Lanka');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (11, 'Assi', 'Kalma');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (12, 'Uolevi', 'Okko');
INSERT INTO public.tyontekija (tyontekija_id, etunimi, sukunimi) VALUES (13, 'Jarkko', 'Jomppa');


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 203
-- Name: asiakas_asiakasnumero_seq_1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asiakas_asiakasnumero_seq_1', 100, true);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 207
-- Name: tyomaa_tyomaa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tyomaa_tyomaa_id_seq', 100, true);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 209
-- Name: tyontekija_tyontekija_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tyontekija_tyontekija_id_seq', 100, true);


--
-- TOC entry 2793 (class 2606 OID 16626)
-- Name: asiakas asiakas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asiakas
    ADD CONSTRAINT asiakas_pk PRIMARY KEY (asiakasnumero);


--
-- TOC entry 2795 (class 2606 OID 16628)
-- Name: kaynti kaynti_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kaynti
    ADD CONSTRAINT kaynti_pk PRIMARY KEY (kaynti_id);


--
-- TOC entry 2797 (class 2606 OID 16630)
-- Name: tarkastustyyppi tarkastustyyppi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarkastustyyppi
    ADD CONSTRAINT tarkastustyyppi_pk PRIMARY KEY (tyyppikoodi);


--
-- TOC entry 2799 (class 2606 OID 16632)
-- Name: tyomaa tyomaa_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyomaa
    ADD CONSTRAINT tyomaa_pk PRIMARY KEY (tyomaa_id);


--
-- TOC entry 2802 (class 2606 OID 16634)
-- Name: tyontekija tyontekija_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyontekija
    ADD CONSTRAINT tyontekija_pk PRIMARY KEY (tyontekija_id);


--
-- TOC entry 2800 (class 1259 OID 16655)
-- Name: sukunimi_ix; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sukunimi_ix ON public.tyontekija USING btree (sukunimi);


--
-- TOC entry 2806 (class 2606 OID 16635)
-- Name: tyomaa asiakas_tyomaa_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tyomaa
    ADD CONSTRAINT asiakas_tyomaa_fk FOREIGN KEY (asiakasnumero) REFERENCES public.asiakas(asiakasnumero);


--
-- TOC entry 2803 (class 2606 OID 16640)
-- Name: kaynti tarkastustyyppi_kaynti_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kaynti
    ADD CONSTRAINT tarkastustyyppi_kaynti_fk FOREIGN KEY (tyyppikoodi) REFERENCES public.tarkastustyyppi(tyyppikoodi);


--
-- TOC entry 2804 (class 2606 OID 16645)
-- Name: kaynti tyomaa_kaynti_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kaynti
    ADD CONSTRAINT tyomaa_kaynti_fk FOREIGN KEY (tyomaa_id) REFERENCES public.tyomaa(tyomaa_id);


--
-- TOC entry 2805 (class 2606 OID 16650)
-- Name: kaynti tyontekija_kaynti_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kaynti
    ADD CONSTRAINT tyontekija_kaynti_fk FOREIGN KEY (tyontekija_id) REFERENCES public.tyontekija(tyontekija_id);


-- Completed on 2019-12-17 13:08:06

--
-- PostgreSQL database dump complete
--

