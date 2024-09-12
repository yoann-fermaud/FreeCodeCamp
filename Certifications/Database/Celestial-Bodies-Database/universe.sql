--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    distance_from_earth numeric(15,2)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(15,2),
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Comet 1', 'Description of Comet 1', 100000.00);
INSERT INTO public.comet VALUES (2, 'Comet 2', 'Description of Comet 2', 200000.00);
INSERT INTO public.comet VALUES (3, 'Comet 3', 'Description of Comet 3', 300000.00);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy 1', 'Description of Galaxy 1', 1000, 5000.00, true);
INSERT INTO public.galaxy VALUES (2, 'Galaxy 2', 'Description of Galaxy 2', 2000, 6000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Galaxy 3', 'Description of Galaxy 3', 3000, 7000.00, true);
INSERT INTO public.galaxy VALUES (4, 'Galaxy 4', 'Description of Galaxy 4', 4000, 8000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Galaxy 5', 'Description of Galaxy 5', 5000, 9000.00, true);
INSERT INTO public.galaxy VALUES (6, 'Galaxy 6', 'Description of Galaxy 6', 6000, 10000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon 1', 'Description of Moon 1', 1000, 100.00, false, 1);
INSERT INTO public.moon VALUES (2, 'Moon 2', 'Description of Moon 2', 2000, 200.00, true, 2);
INSERT INTO public.moon VALUES (3, 'Moon 3', 'Description of Moon 3', 1500, 150.00, false, 3);
INSERT INTO public.moon VALUES (4, 'Moon 4', 'Description of Moon 4', 3000, 300.00, true, 4);
INSERT INTO public.moon VALUES (5, 'Moon 5', 'Description of Moon 5', 1200, 120.00, true, 5);
INSERT INTO public.moon VALUES (6, 'Moon 6', 'Description of Moon 6', 1800, 180.00, false, 6);
INSERT INTO public.moon VALUES (7, 'Moon 7', 'Description of Moon 7', 1100, 110.00, true, 1);
INSERT INTO public.moon VALUES (8, 'Moon 8', 'Description of Moon 8', 2200, 220.00, false, 2);
INSERT INTO public.moon VALUES (9, 'Moon 9', 'Description of Moon 9', 1300, 130.00, true, 3);
INSERT INTO public.moon VALUES (10, 'Moon 10', 'Description of Moon 10', 2500, 250.00, false, 4);
INSERT INTO public.moon VALUES (11, 'Moon 11', 'Description of Moon 11', 1400, 140.00, true, 5);
INSERT INTO public.moon VALUES (12, 'Moon 12', 'Description of Moon 12', 1600, 160.00, false, 6);
INSERT INTO public.moon VALUES (13, 'Moon 13', 'Description of Moon 13', 1700, 170.00, true, 1);
INSERT INTO public.moon VALUES (14, 'Moon 14', 'Description of Moon 14', 1900, 190.00, false, 2);
INSERT INTO public.moon VALUES (15, 'Moon 15', 'Description of Moon 15', 2000, 200.00, true, 3);
INSERT INTO public.moon VALUES (16, 'Moon 16', 'Description of Moon 16', 2100, 210.00, false, 4);
INSERT INTO public.moon VALUES (17, 'Moon 17', 'Description of Moon 17', 2200, 220.00, true, 5);
INSERT INTO public.moon VALUES (18, 'Moon 18', 'Description of Moon 18', 2300, 230.00, false, 6);
INSERT INTO public.moon VALUES (19, 'Moon 19', 'Description of Moon 19', 2400, 240.00, true, 1);
INSERT INTO public.moon VALUES (20, 'Moon 20', 'Description of Moon 20', 2500, 250.00, false, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet 1', 'Description of Planet 1', 100, 10.00, true, 1);
INSERT INTO public.planet VALUES (2, 'Planet 2', 'Description of Planet 2', 200, 20.00, false, 2);
INSERT INTO public.planet VALUES (3, 'Planet 3', 'Description of Planet 3', 300, 30.00, true, 3);
INSERT INTO public.planet VALUES (4, 'Planet 4', 'Description of Planet 4', 400, 40.00, false, 4);
INSERT INTO public.planet VALUES (5, 'Planet 5', 'Description of Planet 5', 500, 50.00, true, 5);
INSERT INTO public.planet VALUES (6, 'Planet 6', 'Description of Planet 6', 600, 60.00, false, 6);
INSERT INTO public.planet VALUES (7, 'Planet 7', 'Description of Planet 7', 700, 70.00, true, 1);
INSERT INTO public.planet VALUES (8, 'Planet 8', 'Description of Planet 8', 800, 80.00, false, 2);
INSERT INTO public.planet VALUES (9, 'Planet 9', 'Description of Planet 9', 900, 90.00, true, 3);
INSERT INTO public.planet VALUES (10, 'Planet 10', 'Description of Planet 10', 1000, 100.00, false, 4);
INSERT INTO public.planet VALUES (11, 'Planet 11', 'Description of Planet 11', 1100, 110.00, true, 5);
INSERT INTO public.planet VALUES (12, 'Planet 12', 'Description of Planet 12', 1200, 120.00, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star 1', 'Description of Star 1', 500, 1000.00, true, 1);
INSERT INTO public.star VALUES (2, 'Star 2', 'Description of Star 2', 600, 2000.00, false, 2);
INSERT INTO public.star VALUES (3, 'Star 3', 'Description of Star 3', 700, 3000.00, true, 3);
INSERT INTO public.star VALUES (4, 'Star 4', 'Description of Star 4', 800, 4000.00, false, 4);
INSERT INTO public.star VALUES (5, 'Star 5', 'Description of Star 5', 900, 5000.00, true, 5);
INSERT INTO public.star VALUES (6, 'Star 6', 'Description of Star 6', 1000, 6000.00, false, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

