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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 929);
INSERT INTO public.games VALUES (2, 3, 398);
INSERT INTO public.games VALUES (3, 4, 825);
INSERT INTO public.games VALUES (4, 4, 285);
INSERT INTO public.games VALUES (5, 3, 63);
INSERT INTO public.games VALUES (6, 3, 832);
INSERT INTO public.games VALUES (7, 3, 304);
INSERT INTO public.games VALUES (8, 6, 435);
INSERT INTO public.games VALUES (9, 6, 633);
INSERT INTO public.games VALUES (10, 7, 809);
INSERT INTO public.games VALUES (11, 7, 261);
INSERT INTO public.games VALUES (12, 6, 928);
INSERT INTO public.games VALUES (13, 6, 882);
INSERT INTO public.games VALUES (14, 6, 724);
INSERT INTO public.games VALUES (15, 8, 27);
INSERT INTO public.games VALUES (16, 8, 662);
INSERT INTO public.games VALUES (17, 9, 375);
INSERT INTO public.games VALUES (18, 9, 42);
INSERT INTO public.games VALUES (19, 8, 278);
INSERT INTO public.games VALUES (20, 8, 566);
INSERT INTO public.games VALUES (21, 8, 685);
INSERT INTO public.games VALUES (22, 5, 1);
INSERT INTO public.games VALUES (23, 5, 4);
INSERT INTO public.games VALUES (24, 10, 268);
INSERT INTO public.games VALUES (25, 10, 648);
INSERT INTO public.games VALUES (26, 11, 815);
INSERT INTO public.games VALUES (27, 11, 687);
INSERT INTO public.games VALUES (28, 10, 688);
INSERT INTO public.games VALUES (29, 10, 896);
INSERT INTO public.games VALUES (30, 10, 918);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1691340714661');
INSERT INTO public.users VALUES (2, 'user_1691340714660');
INSERT INTO public.users VALUES (3, 'user_1691341090456');
INSERT INTO public.users VALUES (4, 'user_1691341090455');
INSERT INTO public.users VALUES (5, 'Art');
INSERT INTO public.users VALUES (6, 'user_1691341242687');
INSERT INTO public.users VALUES (7, 'user_1691341242686');
INSERT INTO public.users VALUES (8, 'user_1691341463373');
INSERT INTO public.users VALUES (9, 'user_1691341463372');
INSERT INTO public.users VALUES (10, 'user_1691341645189');
INSERT INTO public.users VALUES (11, 'user_1691341645188');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

