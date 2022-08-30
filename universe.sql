--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: blackholes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackholes (
    blackholes_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.blackholes OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(60) NOT NULL,
    description text,
    type character varying(255),
    galaxy_id integer NOT NULL,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    made_of_cheese boolean,
    distance_from_planet integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    has_water boolean NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    age_in_millions_of_years numeric,
    type character varying(1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Data for Name: blackholes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackholes VALUES (1, 'Sagittarius A*', 1);
INSERT INTO public.blackholes VALUES (2, 'Sagittarius B*', 1);
INSERT INTO public.blackholes VALUES (3, 'Sagittarius C*', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Our Galaxy', 'Spiral', 1, true);
INSERT INTO public.galaxy VALUES ('Andromeda', 'The Andromeda Galaxy', 'Spiral', 2, false);
INSERT INTO public.galaxy VALUES ('Sombrero Galaxy', 'The Sombrero Galaxy', 'Unknown', 3, false);
INSERT INTO public.galaxy VALUES ('Messier51A', 'Whirlpool Galaxy', 'Spiral', 4, false);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', '2nd closest galaxy to the milky way', 'IRR', 5, false);
INSERT INTO public.galaxy VALUES ('Virgo Stellar Stream', '3rd closest galaxy to the milky way', 'Spheroidal', 6, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, true, 238900);
INSERT INTO public.moon VALUES ('Miranda', 2, 5, false, 1692);
INSERT INTO public.moon VALUES ('Triton', 3, 9, true, 354850);
INSERT INTO public.moon VALUES ('Titania', 4, 5, true, 123469);
INSERT INTO public.moon VALUES ('Oberon', 5, 5, false, 59424);
INSERT INTO public.moon VALUES ('Ariel', 6, 5, false, 59424);
INSERT INTO public.moon VALUES ('Puck', 7, 5, false, 59424);
INSERT INTO public.moon VALUES ('Sycorax', 8, 5, false, 94922);
INSERT INTO public.moon VALUES ('Desdemona', 9, 3, false, 592852);
INSERT INTO public.moon VALUES ('Setebos', 10, 6, true, 10000000);
INSERT INTO public.moon VALUES ('Perdita', 11, 6, true, 24942);
INSERT INTO public.moon VALUES ('Cudi', 12, 1, true, 5952203);
INSERT INTO public.moon VALUES ('Trinculo', 13, 4, true, 586291);
INSERT INTO public.moon VALUES ('Caliban', 14, 8, true, 586291);
INSERT INTO public.moon VALUES ('Umbriel', 15, 9, true, 50224);
INSERT INTO public.moon VALUES ('Burnham', 16, 10, true, 9992);
INSERT INTO public.moon VALUES ('Elune', 17, 11, true, 20520);
INSERT INTO public.moon VALUES ('Blue Child', 18, 11, false, 500000);
INSERT INTO public.moon VALUES ('Onomapoe', 19, 12, false, 559200);
INSERT INTO public.moon VALUES ('Olympus', 20, 2, false, 559200);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'PA-99-N2', true, 2, 2);
INSERT INTO public.planet VALUES (3, 'keppler-452b', false, 1, 3);
INSERT INTO public.planet VALUES (4, 'Venus', false, 1, 3);
INSERT INTO public.planet VALUES (5, 'Uranus', true, 1, 1);
INSERT INTO public.planet VALUES (6, 'Mars', true, 1, 1);
INSERT INTO public.planet VALUES (7, 'JUPITER', true, 1, 1);
INSERT INTO public.planet VALUES (8, 'mercury', false, 1, 1);
INSERT INTO public.planet VALUES (9, 'Saturn', false, 1, 1);
INSERT INTO public.planet VALUES (10, 'Makemake', false, 1, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 1, 1);
INSERT INTO public.planet VALUES (12, 'Eris', true, 1, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4603, '1');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 10, 'M');
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 60, 'B');
INSERT INTO public.star VALUES (4, 'Eta Corvi', 3, 1000, 'F');
INSERT INTO public.star VALUES (5, 'Groombridge 34', 2, 2, '1');
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, 'B');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: blackholes blackholes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackholes
    ADD CONSTRAINT blackholes_name_key UNIQUE (name);


--
-- Name: blackholes blackholes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackholes
    ADD CONSTRAINT blackholes_pkey PRIMARY KEY (blackholes_id);


--
-- Name: star constraint_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constraint_name UNIQUE (star_id);


--
-- Name: planet constraint_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT constraint_unique UNIQUE (planet_id);


--
-- Name: galaxy gal_name__unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT gal_name__unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet fk_closest_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_closest_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

