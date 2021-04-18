--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-15 19:48:28

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
-- TOC entry 200 (class 1259 OID 16916)
-- Name: albums; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    title character varying(40) NOT NULL,
    year integer
);


ALTER TABLE public.albums OWNER TO dz4;

--
-- TOC entry 201 (class 1259 OID 16919)
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO dz4;

--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 201
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- TOC entry 202 (class 1259 OID 16921)
-- Name: collections; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.collections (
    id integer NOT NULL,
    title character varying(40),
    year integer
);


ALTER TABLE public.collections OWNER TO dz4;

--
-- TOC entry 203 (class 1259 OID 16924)
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collections_id_seq OWNER TO dz4;

--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 203
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.collections_id_seq OWNED BY public.collections.id;


--
-- TOC entry 204 (class 1259 OID 16926)
-- Name: genres; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    genre character varying(40) NOT NULL
);


ALTER TABLE public.genres OWNER TO dz4;

--
-- TOC entry 205 (class 1259 OID 16929)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO dz4;

--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 205
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 206 (class 1259 OID 16931)
-- Name: singeralbum; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.singeralbum (
    id integer NOT NULL,
    singer_id integer,
    album_id integer
);


ALTER TABLE public.singeralbum OWNER TO dz4;

--
-- TOC entry 207 (class 1259 OID 16934)
-- Name: singeralbum_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.singeralbum_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.singeralbum_id_seq OWNER TO dz4;

--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 207
-- Name: singeralbum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.singeralbum_id_seq OWNED BY public.singeralbum.id;


--
-- TOC entry 208 (class 1259 OID 16936)
-- Name: singergenre; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.singergenre (
    id integer NOT NULL,
    singer_id integer,
    genre_id integer
);


ALTER TABLE public.singergenre OWNER TO dz4;

--
-- TOC entry 209 (class 1259 OID 16939)
-- Name: singergenre_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.singergenre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.singergenre_id_seq OWNER TO dz4;

--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 209
-- Name: singergenre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.singergenre_id_seq OWNED BY public.singergenre.id;


--
-- TOC entry 215 (class 1259 OID 17025)
-- Name: singers; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.singers (
    id integer NOT NULL,
    singer character varying(40) NOT NULL,
    alias character varying(40)
);


ALTER TABLE public.singers OWNER TO dz4;

--
-- TOC entry 214 (class 1259 OID 17023)
-- Name: singers_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.singers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.singers_id_seq OWNER TO dz4;

--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 214
-- Name: singers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.singers_id_seq OWNED BY public.singers.id;


--
-- TOC entry 210 (class 1259 OID 16946)
-- Name: trackcollection; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.trackcollection (
    id integer NOT NULL,
    track_id integer,
    collection_id integer
);


ALTER TABLE public.trackcollection OWNER TO dz4;

--
-- TOC entry 211 (class 1259 OID 16949)
-- Name: trackcollection_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.trackcollection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackcollection_id_seq OWNER TO dz4;

--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 211
-- Name: trackcollection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.trackcollection_id_seq OWNED BY public.trackcollection.id;


--
-- TOC entry 212 (class 1259 OID 16951)
-- Name: tracks; Type: TABLE; Schema: public; Owner: dz4
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    "time" integer,
    album_id integer
);


ALTER TABLE public.tracks OWNER TO dz4;

--
-- TOC entry 213 (class 1259 OID 16954)
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: dz4
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO dz4;

--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 213
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dz4
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- TOC entry 2892 (class 2604 OID 16956)
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 16957)
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 16958)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 16959)
-- Name: singeralbum id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singeralbum ALTER COLUMN id SET DEFAULT nextval('public.singeralbum_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 16960)
-- Name: singergenre id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singergenre ALTER COLUMN id SET DEFAULT nextval('public.singergenre_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 17028)
-- Name: singers id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singers ALTER COLUMN id SET DEFAULT nextval('public.singers_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 16962)
-- Name: trackcollection id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.trackcollection ALTER COLUMN id SET DEFAULT nextval('public.trackcollection_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 16963)
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- TOC entry 3051 (class 0 OID 16916)
-- Dependencies: 200
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.albums (id, title, year) VALUES (1, 'Nevermind', 1991);
INSERT INTO public.albums (id, title, year) VALUES (2, 'Anarchy in the UK', 1985);
INSERT INTO public.albums (id, title, year) VALUES (3, 'Black Sabbath', 1970);
INSERT INTO public.albums (id, title, year) VALUES (4, 'In Rock', 1970);
INSERT INTO public.albums (id, title, year) VALUES (5, 'The Stooges', 1969);
INSERT INTO public.albums (id, title, year) VALUES (6, 'Goodbye', 1969);
INSERT INTO public.albums (id, title, year) VALUES (7, 'Led Zeppelin', 1967);
INSERT INTO public.albums (id, title, year) VALUES (8, 'London Calling', 1979);


--
-- TOC entry 3053 (class 0 OID 16921)
-- Dependencies: 202
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.collections (id, title, year) VALUES (1, 'The best of rock', 1999);
INSERT INTO public.collections (id, title, year) VALUES (2, 'The best rock collection', 2004);
INSERT INTO public.collections (id, title, year) VALUES (3, 'Rock Legends', 1989);
INSERT INTO public.collections (id, title, year) VALUES (4, 'Legends of Rock', 2008);
INSERT INTO public.collections (id, title, year) VALUES (5, 'Punk Rock Generation', 2007);
INSERT INTO public.collections (id, title, year) VALUES (6, 'Alternative classic rock', 2001);
INSERT INTO public.collections (id, title, year) VALUES (7, 'Alt-Sector', 1998);
INSERT INTO public.collections (id, title, year) VALUES (8, 'Lets Rock', 1996);


--
-- TOC entry 3055 (class 0 OID 16926)
-- Dependencies: 204
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.genres (id, genre) VALUES (1, 'Grunge');
INSERT INTO public.genres (id, genre) VALUES (2, 'Alternative rock');
INSERT INTO public.genres (id, genre) VALUES (3, 'Punk');
INSERT INTO public.genres (id, genre) VALUES (4, 'Heavy metal');
INSERT INTO public.genres (id, genre) VALUES (5, 'Hard rock');
INSERT INTO public.genres (id, genre) VALUES (6, 'Psychedelic rock');
INSERT INTO public.genres (id, genre) VALUES (7, 'Progressive rock');
INSERT INTO public.genres (id, genre) VALUES (8, 'Blues rock');
INSERT INTO public.genres (id, genre) VALUES (9, 'Acid Rock');
INSERT INTO public.genres (id, genre) VALUES (10, 'Folk rock');
INSERT INTO public.genres (id, genre) VALUES (11, 'Rockabilly');
INSERT INTO public.genres (id, genre) VALUES (12, 'Rock-n-roll');
INSERT INTO public.genres (id, genre) VALUES (13, 'Reggae');
INSERT INTO public.genres (id, genre) VALUES (14, 'Post-punk');
INSERT INTO public.genres (id, genre) VALUES (15, 'Funk');


--
-- TOC entry 3057 (class 0 OID 16931)
-- Dependencies: 206
-- Data for Name: singeralbum; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (1, 1, 1);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (2, 2, 2);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (3, 3, 3);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (4, 4, 4);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (5, 5, 5);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (6, 6, 6);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (7, 7, 7);
INSERT INTO public.singeralbum (id, singer_id, album_id) VALUES (8, 8, 8);


--
-- TOC entry 3059 (class 0 OID 16936)
-- Dependencies: 208
-- Data for Name: singergenre; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (1, 1, 1);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (2, 1, 2);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (3, 2, 3);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (4, 3, 4);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (5, 3, 5);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (6, 4, 5);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (7, 4, 4);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (8, 4, 7);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (9, 4, 6);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (10, 5, 3);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (11, 5, 5);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (12, 6, 8);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (13, 6, 5);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (14, 6, 6);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (15, 6, 9);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (16, 7, 5);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (17, 7, 4);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (18, 7, 8);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (19, 7, 10);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (20, 8, 3);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (21, 8, 14);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (22, 8, 13);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (23, 8, 15);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (24, 8, 11);
INSERT INTO public.singergenre (id, singer_id, genre_id) VALUES (25, 8, 12);


--
-- TOC entry 3066 (class 0 OID 17025)
-- Dependencies: 215
-- Data for Name: singers; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.singers (id, singer, alias) VALUES (1, 'Nirvana', 'Kurt Cobain');
INSERT INTO public.singers (id, singer, alias) VALUES (2, 'Sex Pistols ', 'Jonny Rotten');
INSERT INTO public.singers (id, singer, alias) VALUES (3, 'Black Sabbath', 'Ozzy');
INSERT INTO public.singers (id, singer, alias) VALUES (4, 'Deep Purple', 'Ritchie Blackmore');
INSERT INTO public.singers (id, singer, alias) VALUES (5, 'The Stooges', 'Iggy Pop');
INSERT INTO public.singers (id, singer, alias) VALUES (6, 'Cream', 'Eric Clapton');
INSERT INTO public.singers (id, singer, alias) VALUES (7, 'led Zeppelin', 'Robert Plant');
INSERT INTO public.singers (id, singer, alias) VALUES (8, 'The Clash', NULL);


--
-- TOC entry 3061 (class 0 OID 16946)
-- Dependencies: 210
-- Data for Name: trackcollection; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (1, 2, 1);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (2, 15, 1);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (3, 20, 1);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (4, 28, 2);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (5, 17, 2);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (6, 22, 2);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (7, 1, 3);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (8, 28, 3);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (9, 6, 3);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (10, 22, 4);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (11, 3, 4);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (12, 19, 4);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (13, 32, 5);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (14, 25, 5);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (15, 11, 5);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (16, 1, 6);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (17, 9, 6);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (18, 23, 6);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (19, 20, 7);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (20, 30, 7);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (21, 5, 7);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (22, 32, 8);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (23, 12, 8);
INSERT INTO public.trackcollection (id, track_id, collection_id) VALUES (24, 2, 8);


--
-- TOC entry 3063 (class 0 OID 16951)
-- Dependencies: 212
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: dz4
--

INSERT INTO public.tracks (id, name, "time", album_id) VALUES (1, 'Smells Like Teen Spirit', 230, 1);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (2, 'In Bloom', 192, 1);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (3, 'Come as You Are', 187, 1);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (4, 'Breed', 193, 1);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (5, 'Lithium', 202, 1);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (6, 'Anarchy In The U.K', 195, 2);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (7, 'I Wanna Be Me', 211, 2);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (8, 'Seventeen', 225, 2);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (9, 'New York', 162, 2);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (10, 'Submission', 162, 2);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (11, 'Black Sabbath', 376, 3);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (12, 'The Wizard', 264, 3);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (13, 'Behind the Wall of Sleep', 218, 3);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (14, 'N.I.B.', 366, 3);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (15, 'Speed King', 355, 4);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (16, 'Into the Fire', 328, 4);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (17, 'Living Wreck', 427, 4);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (18, 'Hard Lovin Man', 331, 4);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (19, '1969', 192, 5);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (20, 'I Wanna Be Your Dog', 187, 5);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (21, 'We Will Fall', 199, 5);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (22, 'I m So Glad', 243, 6);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (23, 'Politician', 234, 6);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (24, 'Sitting on Top of the World', 362, 6);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (25, 'You Shook Me', 252, 7);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (26, 'Thank You', 199, 7);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (27, 'Good Times Bad Times', 158, 7);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (28, 'London Calling', 228, 8);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (29, 'Brand New Cadillac', 431, 8);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (30, 'Jimmy Jazz', 234, 8);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (31, 'Hateful', 224, 8);
INSERT INTO public.tracks (id, name, "time", album_id) VALUES (32, 'The Guns of Brixton', 189, 8);


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 201
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.albums_id_seq', 8, true);


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 203
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.collections_id_seq', 8, true);


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 205
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.genres_id_seq', 15, true);


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 207
-- Name: singeralbum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.singeralbum_id_seq', 8, true);


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 209
-- Name: singergenre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.singergenre_id_seq', 25, true);


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 214
-- Name: singers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.singers_id_seq', 8, true);


--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 211
-- Name: trackcollection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.trackcollection_id_seq', 24, true);


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 213
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dz4
--

SELECT pg_catalog.setval('public.tracks_id_seq', 32, true);


--
-- TOC entry 2901 (class 2606 OID 16965)
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 16967)
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 16969)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 16971)
-- Name: singeralbum singeralbum_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singeralbum
    ADD CONSTRAINT singeralbum_pkey PRIMARY KEY (id);


--
-- TOC entry 2909 (class 2606 OID 16973)
-- Name: singergenre singergenre_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singergenre
    ADD CONSTRAINT singergenre_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 17030)
-- Name: singers singers_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singers
    ADD CONSTRAINT singers_pkey PRIMARY KEY (id);


--
-- TOC entry 2911 (class 2606 OID 16977)
-- Name: trackcollection trackcollection_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.trackcollection
    ADD CONSTRAINT trackcollection_pkey PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 16979)
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- TOC entry 2916 (class 2606 OID 16980)
-- Name: singeralbum singeralbum_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singeralbum
    ADD CONSTRAINT singeralbum_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- TOC entry 2917 (class 2606 OID 16990)
-- Name: singergenre singergenre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.singergenre
    ADD CONSTRAINT singergenre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- TOC entry 2918 (class 2606 OID 17000)
-- Name: trackcollection trackcollection_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.trackcollection
    ADD CONSTRAINT trackcollection_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- TOC entry 2919 (class 2606 OID 17005)
-- Name: trackcollection trackcollection_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.trackcollection
    ADD CONSTRAINT trackcollection_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.tracks(id);


--
-- TOC entry 2920 (class 2606 OID 17010)
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dz4
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(id);


-- Completed on 2021-04-15 19:48:28

--
-- PostgreSQL database dump complete
--

