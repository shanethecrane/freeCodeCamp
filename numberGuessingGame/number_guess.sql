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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22),
    games_played integer,
    round_count integer
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1667254417078', 5, 66);
INSERT INTO public.number_guess VALUES ('user_1667254486694', 2, 933);
INSERT INTO public.number_guess VALUES ('user_1667254486695', 5, 74);
INSERT INTO public.number_guess VALUES ('user_1667254514181', 2, 486);
INSERT INTO public.number_guess VALUES ('user_1667254514182', 5, 40);
INSERT INTO public.number_guess VALUES ('user_1667254559602', 2, 12);
INSERT INTO public.number_guess VALUES ('user_1667254559603', 5, 134);
INSERT INTO public.number_guess VALUES ('user_1667254589468', 2, 249);
INSERT INTO public.number_guess VALUES ('user_1667254589469', 5, 86);
INSERT INTO public.number_guess VALUES ('user_1667254596696', 2, 262);
INSERT INTO public.number_guess VALUES ('user_1667254596697', 5, 237);
INSERT INTO public.number_guess VALUES ('user_1667254417077', 3, 9);
INSERT INTO public.number_guess VALUES ('user_1667255163965', 2, 207);
INSERT INTO public.number_guess VALUES ('user_1667255163966', 5, 273);
INSERT INTO public.number_guess VALUES ('user_1667255228421', 2, 217);
INSERT INTO public.number_guess VALUES ('user_1667255228422', 5, 136);
INSERT INTO public.number_guess VALUES ('user_1667255459381', 2, 209);
INSERT INTO public.number_guess VALUES ('user_1667255459382', 5, 191);
INSERT INTO public.number_guess VALUES ('user_1667263900942', 2, 858);
INSERT INTO public.number_guess VALUES ('user_1667263900943', 5, 88);
INSERT INTO public.number_guess VALUES ('user_1667319400158', 2, 367);
INSERT INTO public.number_guess VALUES ('user_1667319400159', 5, 40);
INSERT INTO public.number_guess VALUES ('user_1667405737873', 2, 386);
INSERT INTO public.number_guess VALUES ('user_1667405737874', 5, 32);
INSERT INTO public.number_guess VALUES ('not me', 1, 11);
INSERT INTO public.number_guess VALUES ('user_1667407514648', 2, 179);
INSERT INTO public.number_guess VALUES ('user_1667407514649', 5, 197);
INSERT INTO public.number_guess VALUES ('Steve', 1, 1);
INSERT INTO public.number_guess VALUES ('Billiam', 1, 1);
INSERT INTO public.number_guess VALUES ('Roger', 1, 1);
INSERT INTO public.number_guess VALUES ('Aaron', 1, 1);
INSERT INTO public.number_guess VALUES ('Yancy', 1, 1);
INSERT INTO public.number_guess VALUES ('user_1667407858945', 2, 74);
INSERT INTO public.number_guess VALUES ('user_1667407858946', 5, 171);
INSERT INTO public.number_guess VALUES ('Shane', 8, 1);
INSERT INTO public.number_guess VALUES ('user_1667407984877', 2, 63);
INSERT INTO public.number_guess VALUES ('user_1667407984878', 5, 185);
INSERT INTO public.number_guess VALUES ('user_1667408495781', 2, 42);
INSERT INTO public.number_guess VALUES ('user_1667408495782', 5, 33);
INSERT INTO public.number_guess VALUES ('user_1667408513164', 2, 381);
INSERT INTO public.number_guess VALUES ('user_1667408513165', 5, 325);
INSERT INTO public.number_guess VALUES ('user_1667408527602', 2, 220);
INSERT INTO public.number_guess VALUES ('user_1667408527603', 5, 282);
INSERT INTO public.number_guess VALUES ('user_1667408822391', 2, 39);
INSERT INTO public.number_guess VALUES ('user_1667408822392', 5, 182);
INSERT INTO public.number_guess VALUES ('user_1667408908100', 2, 117);
INSERT INTO public.number_guess VALUES ('user_1667408908101', 5, 95);
INSERT INTO public.number_guess VALUES ('user_1667408914803', 2, 398);
INSERT INTO public.number_guess VALUES ('user_1667408914804', 5, 8);
INSERT INTO public.number_guess VALUES ('user_1667408918950', 2, 295);
INSERT INTO public.number_guess VALUES ('user_1667408918951', 5, 236);


--
-- PostgreSQL database dump complete
--

