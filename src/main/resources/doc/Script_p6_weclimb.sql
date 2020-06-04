--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.2

-- Started on 2020-06-03 13:55:05 CEST

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

--
-- TOC entry 211 (class 1259 OID 41650)
-- Name: commentaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.commentaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commentaire_id_seq OWNER TO postgres;

SET default_tablespace = '';

--
-- TOC entry 202 (class 1259 OID 25301)
-- Name: commentaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.commentaire (
    id integer DEFAULT nextval('public.commentaire_id_seq'::regclass) NOT NULL,
    date date NOT NULL,
    heure time without time zone NOT NULL,
    contenu character varying NOT NULL,
    id_utilisateur integer NOT NULL,
    id_spot integer NOT NULL
);


ALTER TABLE public.commentaire OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25282)
-- Name: lieu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lieu (
    id integer NOT NULL,
    ville character varying NOT NULL,
    codepostal integer NOT NULL
);


ALTER TABLE public.lieu OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25280)
-- Name: lieu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lieu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lieu_id_seq OWNER TO postgres;

--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 198
-- Name: lieu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lieu_id_seq OWNED BY public.lieu.id;


--
-- TOC entry 208 (class 1259 OID 25330)
-- Name: longueur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.longueur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    hauteur integer NOT NULL,
    cotation character varying(10) NOT NULL,
    nbrepoints integer NOT NULL,
    id_voie integer NOT NULL
);


ALTER TABLE public.longueur OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25328)
-- Name: longueur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.longueur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.longueur_id_seq OWNER TO postgres;

--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 207
-- Name: longueur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.longueur_id_seq OWNED BY public.longueur.id;


--
-- TOC entry 214 (class 1259 OID 49917)
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49857)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id_topo integer NOT NULL,
    id_utilisateur integer NOT NULL,
    statutreservation character varying NOT NULL,
    id integer DEFAULT nextval('public.reservation_id_seq'::regclass) NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25311)
-- Name: secteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secteur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    description character varying NOT NULL,
    id_spot integer NOT NULL
);


ALTER TABLE public.secteur OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25309)
-- Name: secteur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.secteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secteur_id_seq OWNER TO postgres;

--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 203
-- Name: secteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.secteur_id_seq OWNED BY public.secteur.id;


--
-- TOC entry 210 (class 1259 OID 33457)
-- Name: spot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spot_id_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25291)
-- Name: spot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spot (
    id integer DEFAULT nextval('public.spot_id_seq'::regclass) NOT NULL,
    nom character varying(100) NOT NULL,
    tagofficiel boolean NOT NULL,
    datecreation date NOT NULL,
    id_lieu integer NOT NULL,
    id_utilisateur integer NOT NULL
);


ALTER TABLE public.spot OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25296)
-- Name: spot_topo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spot_topo (
    id_spot integer NOT NULL,
    id_topo integer NOT NULL
);


ALTER TABLE public.spot_topo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49840)
-- Name: topo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topo_id_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25272)
-- Name: topo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topo (
    id integer DEFAULT nextval('public.topo_id_seq'::regclass) NOT NULL,
    nom character varying NOT NULL,
    description character varying NOT NULL,
    dateparution date NOT NULL,
    disponibilite boolean NOT NULL,
    id_utilisateur integer NOT NULL
);


ALTER TABLE public.topo OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 25264)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id integer DEFAULT nextval('public.lieu_id_seq'::regclass) NOT NULL,
    identifiant character varying NOT NULL,
    password character varying NOT NULL,
    droitadministrateur boolean NOT NULL,
    adressemail character varying NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33454)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25322)
-- Name: voie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voie (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    hauteur integer NOT NULL,
    cotation character varying(10) NOT NULL,
    nbrepoints integer NOT NULL,
    id_secteur integer NOT NULL
);


ALTER TABLE public.voie OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25320)
-- Name: voie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voie_id_seq OWNER TO postgres;

--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 205
-- Name: voie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voie_id_seq OWNED BY public.voie.id;


--
-- TOC entry 3097 (class 2604 OID 25285)
-- Name: lieu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lieu ALTER COLUMN id SET DEFAULT nextval('public.lieu_id_seq'::regclass);


--
-- TOC entry 3102 (class 2604 OID 25333)
-- Name: longueur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.longueur ALTER COLUMN id SET DEFAULT nextval('public.longueur_id_seq'::regclass);


--
-- TOC entry 3100 (class 2604 OID 25314)
-- Name: secteur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secteur ALTER COLUMN id SET DEFAULT nextval('public.secteur_id_seq'::regclass);


--
-- TOC entry 3101 (class 2604 OID 25325)
-- Name: voie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie ALTER COLUMN id SET DEFAULT nextval('public.voie_id_seq'::regclass);


--
-- TOC entry 3115 (class 2606 OID 25308)
-- Name: commentaire commentaire_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT commentaire_pk PRIMARY KEY (id);


--
-- TOC entry 3109 (class 2606 OID 25290)
-- Name: lieu lieu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lieu
    ADD CONSTRAINT lieu_pk PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 25335)
-- Name: longueur longueur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.longueur
    ADD CONSTRAINT longueur_pk PRIMARY KEY (id);


--
-- TOC entry 3125 (class 2606 OID 49920)
-- Name: reservation reservation_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pk PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 25319)
-- Name: secteur secteur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secteur
    ADD CONSTRAINT secteur_pk PRIMARY KEY (id);


--
-- TOC entry 3111 (class 2606 OID 25295)
-- Name: spot spot_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot
    ADD CONSTRAINT spot_pk PRIMARY KEY (id);


--
-- TOC entry 3113 (class 2606 OID 25300)
-- Name: spot_topo spot_topo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_topo
    ADD CONSTRAINT spot_topo_pk PRIMARY KEY (id_spot, id_topo);


--
-- TOC entry 3107 (class 2606 OID 25279)
-- Name: topo topo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT topo_pk PRIMARY KEY (id);


--
-- TOC entry 3105 (class 2606 OID 25271)
-- Name: utilisateur utilisateur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id);


--
-- TOC entry 3119 (class 2606 OID 25327)
-- Name: voie voie_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie
    ADD CONSTRAINT voie_pk PRIMARY KEY (id);


--
-- TOC entry 3122 (class 1259 OID 49898)
-- Name: fki_topo_reservation_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_topo_reservation_fk ON public.reservation USING btree (id_topo);


--
-- TOC entry 3123 (class 1259 OID 49904)
-- Name: fki_utilisateur_reservation_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_utilisateur_reservation_fk ON public.reservation USING btree (id_utilisateur);


--
-- TOC entry 3128 (class 2606 OID 25356)
-- Name: spot lieu_spot_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot
    ADD CONSTRAINT lieu_spot_fk FOREIGN KEY (id_lieu) REFERENCES public.lieu(id);


--
-- TOC entry 3134 (class 2606 OID 25376)
-- Name: voie secteur_voie_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voie
    ADD CONSTRAINT secteur_voie_fk FOREIGN KEY (id_secteur) REFERENCES public.secteur(id);


--
-- TOC entry 3132 (class 2606 OID 25366)
-- Name: commentaire spot_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT spot_commentaire_fk FOREIGN KEY (id_spot) REFERENCES public.spot(id);


--
-- TOC entry 3130 (class 2606 OID 25371)
-- Name: spot_topo spot_lignetopo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_topo
    ADD CONSTRAINT spot_lignetopo_fk FOREIGN KEY (id_spot) REFERENCES public.spot(id);


--
-- TOC entry 3133 (class 2606 OID 25361)
-- Name: secteur spot_secteur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secteur
    ADD CONSTRAINT spot_secteur_fk FOREIGN KEY (id_spot) REFERENCES public.spot(id);


--
-- TOC entry 3129 (class 2606 OID 25351)
-- Name: spot_topo topo_lignetopo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot_topo
    ADD CONSTRAINT topo_lignetopo_fk FOREIGN KEY (id_topo) REFERENCES public.topo(id);


--
-- TOC entry 3136 (class 2606 OID 49893)
-- Name: reservation topo_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT topo_reservation_fk FOREIGN KEY (id_topo) REFERENCES public.topo(id);


--
-- TOC entry 3131 (class 2606 OID 25341)
-- Name: commentaire utilisateur_commentaire_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.commentaire
    ADD CONSTRAINT utilisateur_commentaire_fk FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3137 (class 2606 OID 49907)
-- Name: reservation utilisateur_reservation_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT utilisateur_reservation_fk FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3127 (class 2606 OID 25346)
-- Name: spot utilisateur_spot_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spot
    ADD CONSTRAINT utilisateur_spot_fk FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3126 (class 2606 OID 25336)
-- Name: topo utilisateur_topo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topo
    ADD CONSTRAINT utilisateur_topo_fk FOREIGN KEY (id_utilisateur) REFERENCES public.utilisateur(id);


--
-- TOC entry 3135 (class 2606 OID 25381)
-- Name: longueur voie_longueur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.longueur
    ADD CONSTRAINT voie_longueur_fk FOREIGN KEY (id_voie) REFERENCES public.voie(id);


-- Completed on 2020-06-03 13:55:07 CEST

--
-- PostgreSQL database dump complete
--

