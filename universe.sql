--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type text,
    number_of_planets integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_active boolean NOT NULL,
    crew_capacity integer,
    construction_cost numeric(10,2)
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy containing Earth.', 'Spiral', 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The largest galaxy in the Local Group.', 'Spiral', 10);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'Famous for its bright nucleus and dust lane.', 'Lenticular', 5);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A classic spiral galaxy interacting with a smaller one.', 'Spiral', 7);
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 'Known for the dark band of absorbing dust in front of its nucleus.', 'Spiral', 4);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'A starburst galaxy in the constellation Ursa Major.', 'Irregular', 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earths only natural satellite.', 4500, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and inner of the two Martian moons.', 4000, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outer of the two Martian moons.', 4000, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The most geologically active object in the solar system.', 4500, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Has a salty liquid water ocean beneath its icy shell.', 4500, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest and most massive moon in the solar system.', 4500, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The most heavily cratered object in the solar system.', 4500, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The only moon known to have a dense atmosphere.', 4500, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Known for its geysers of water ice.', 4500, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Looks a bit like the Death Star.', 4500, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'The second-largest moon of Saturn.', 4500, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'A moon with high cliffs of ice.', 4500, 6);
INSERT INTO public.moon VALUES (13, 'Triton', 'Orbits Neptune in a retrograde direction.', 4500, 8);
INSERT INTO public.moon VALUES (14, 'Proteus', 'One of the darkest objects in the solar system.', 4500, 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 'The brightest of Uranus moons.', 4500, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'The darkest of Uranus large moons.', 4500, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 'The largest moon of Uranus.', 4500, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 'The outermost large moon of Uranus.', 4500, 7);
INSERT INTO public.moon VALUES (19, 'Charon', 'The largest moon of Pluto (or Dwarf Planet 1).', 4500, 9);
INSERT INTO public.moon VALUES (20, 'Styx', 'A tiny, irregularly shaped moon.', 4500, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun.', 0.61, false, true, 4503, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Earths evil twin with a thick atmosphere.', 0.28, false, true, 4503, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only planet known to harbor life.', 0.00, true, true, 4543, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, home to Olympus Mons.', 0.52, false, true, 4603, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system.', 4.20, false, true, 4503, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its prominent ring system.', 8.00, false, true, 4503, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted axis.', 18.00, false, true, 4503, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The most distant planet from the Sun.', 29.00, false, true, 4503, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'A potentially habitable exoplanet.', 4.24, false, true, 4850, 2);
INSERT INTO public.planet VALUES (10, 'Alpheratz Prime', 'A rocky world orbiting a bright star.', 97.00, false, true, 360, 4);
INSERT INTO public.planet VALUES (11, 'Rigel VII', 'A cold world in the Orion system.', 860.00, false, true, 10, 5);
INSERT INTO public.planet VALUES (12, 'Vega Minor', 'A young planet still forming.', 25.00, false, true, 455, 6);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'ISS', true, 7, 150.00);
INSERT INTO public.space_station VALUES (2, 'Tiangong', true, 3, 40.00);
INSERT INTO public.space_station VALUES (3, 'Mir', false, 3, 4.20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'A yellow dwarf star at the center of our solar system.', 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', 4850, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in Earths night sky.', 242, 1);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'The brightest star in the constellation of Andromeda.', 360, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'A red supergiant in the constellation of Orion.', 10, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright blue-white star in the Lyra constellation.', 455, 3);


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
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
