--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 12.2

-- Started on 2020-06-04 18:41:20 CEST

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
-- TOC entry 3267 (class 0 OID 25301)
-- Dependencies: 204
-- Data for Name: commentaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.commentaire (id, date, heure, contenu, id_utilisateur, id_spot) FROM stdin;
4	2020-04-09	14:13:16	C'est beau mais c'est beaucoup trop haut !	1	2
5	2020-04-09	12:10:29	Un lieu qu'il faut voir à  tout prix !	1	2
\.


--
-- TOC entry 3264 (class 0 OID 25282)
-- Dependencies: 201
-- Data for Name: lieu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lieu (id, ville, codepostal) FROM stdin;
2	Loudervielle	65240
3	Aragnouet	65170
4	Gouaux	31110
1	Vannes	56000
36	Saint Lary	65170
\.


--
-- TOC entry 3273 (class 0 OID 25330)
-- Dependencies: 210
-- Data for Name: longueur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.longueur (id, nom, hauteur, cotation, nbrepoints, id_voie) FROM stdin;
1	Dos du géant	300	8a	30	3
2	Cabanou	150	9a	15	3
3	Depart	20	6a	2	10
4	Gauche	130	7b	5	15
5	Droite	110	7b	5	15
6	Ouest	5	6a	8	16
7	Est	5	6a	8	16
\.


--
-- TOC entry 3278 (class 0 OID 49857)
-- Dependencies: 215
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (id_topo, id_utilisateur, statutreservation, id) FROM stdin;
3	1	close	40
1	2	close	41
\.


--
-- TOC entry 3269 (class 0 OID 25311)
-- Dependencies: 206
-- Data for Name: secteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.secteur (id, nom, description, id_spot) FROM stdin;
1	Brech	Face en granit rose	1
2	Serias	Une belle ligne droite	2
4	Lac	Paroi courte mais abrupte	3
5	Cap de Pales	Secteur facile	3
6	Serres Doumenges	Secteur complexe et roche instable	3
7	Les Sarrous	Secteur idéal pour apprentissage	4
8	Badet	Secteur école	4
13	Privilege	La plus grande descente	2
15	Lac	Vue sur le lac de loudenvielle	26
16	Brech Sud	Secteur facile	27
\.


--
-- TOC entry 3265 (class 0 OID 25291)
-- Dependencies: 202
-- Data for Name: spot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spot (id, nom, tagofficiel, datecreation, id_lieu, id_utilisateur) FROM stdin;
14	Val Louron	f	2020-03-10	2	1
16	Pla d'Adet	f	2020-03-11	36	1
19	Kerinet	t	2020-03-11	1	1
1	Auray	t	2019-12-27	1	2
3	Les Agudes	t	2019-02-26	4	7
2	Peyresourdes	t	2019-02-26	2	6
4	Piau	t	2019-02-24	3	8
15	Espiaube	f	2020-03-10	36	1
26	Germ	f	2020-06-03	2	1
27	Brech	f	2020-06-03	1	1
18	Soum	f	2020-03-11	1	1
\.


--
-- TOC entry 3266 (class 0 OID 25296)
-- Dependencies: 203
-- Data for Name: spot_topo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spot_topo (id_spot, id_topo) FROM stdin;
2	1
2	2
3	3
3	2
15	1
15	3
2	26
4	26
2	39
4	39
16	39
\.


--
-- TOC entry 3262 (class 0 OID 25272)
-- Dependencies: 199
-- Data for Name: topo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.topo (id, nom, description, dateparution, disponibilite, id_utilisateur) FROM stdin;
2	Topo des topos	Ma vision des Pyrénées	2020-04-13	t	1
26	Topo's world	Focus sur les Hautes-Pyrénées	2020-05-02	t	1
39	Martin Topo 	Pour les aventuriers	2020-06-03	t	2
3	Crazy Climber Topo\n	un petit bout de Pyrénées	2020-04-15	t	2
1	Topo Débutant	Spots faciles des Pyrénées\n	2020-04-09	t	1
\.


--
-- TOC entry 3261 (class 0 OID 25264)
-- Dependencies: 198
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id, identifiant, password, droitadministrateur, adressemail) FROM stdin;
1	dupont	$2a$10$NEBNI9iESbSc4P6pkAI/0u.UdC87B7IxwtGjn6gbxmdF3cCSGDUXa	t	toto33@free.fr
2	martin	$2a$10$iwyzxdIyx5mNEnHQ9giLfuH0spGvLD5ysfMftLx.8HO/fueoXJ.vW	f	mart33@free.fr
6	3Etoile	$2a$10$TuzWrfsaeXLZmEwdC51EG.KKCN9aoPKgN2O4.C3pPYj35MA/8iVSG	f	3Etoile@orange.fr
5	Hirmentaz	$2a$10$MNlOQNhKC0DP.66e8ALpQOMZLUWvsO8/pwYM93miysV87cOrBOscW	t	Hirmentaz74@free.fr
7	Bellevarde	$2a$10$2yLVlqSk1/tuyVXn56jvvuDlBgUd/IocaquXier9DapetCp1CiAti	f	bellevarde@bouyges.fr
8	Neouvielle	$2a$10$qH0UGQZn5H8Iou4o.v3cWennXylUpZPVom7I7C769Jjsy29Z0cuBy	f	Neouvielle65@swisscom.ch
10	Lisa	$2a$10$8dz2J6KVqu7ERJgokYWcUeBwWefijgq0Mm5kBQNaLZdD7UInCfryq	f	lisa@orange.fr
11	Tess	$2a$10$2XxzG1dpTTVGC2DIyENS5OpjJIZpyroI6cSFpj7bz2Ns.1ESKcVLy	f	tess@orange.fr
12	Eliot	$2a$10$tjEyktruPHejLlAkSdqo3u.rng7qz8iYRK3OpQFc0J.931EdYG2u6	f	eliot@orange.fr
13	Ingrid	$2a$10$ZC7iAEgQqH0aPW8LCoz8c.ZLNhL8TYWi9XuFYB0a3Sztmc2ho7xsq	f	ingrid@orange.fr
14	milka	$2a$10$Fi2oDdmPdC9MjucXZqoX9.CX4TRFYj/A5JIcasNonsC3D72lLXPaK	f	milka@orange.fr
15	Hermine	$2a$10$y/dHzR2dXLTcBVkQqfSgaOAdosUt4Qb430Bx/sHjZMbxq9dNjrzkO	f	hermine@orange.fr
16	Ulysse	$2a$10$IPkQ4IxY//nqhG6EHyp7yucVtkhNEeMzbg7gtj6kYH.z/fBWMO5Zu	f	ulysse@orange.fr
17	toby	$2a$10$q3uL1g4vDyypZI.ThVSrxOZtWWfi5Gkwxw99mF0VupznqpgD9/DX6	f	toby@orange.fr
18	Helmut	$2a$10$NuMPSlJWHqTMf9A5qqkQY./ElUx.LaxaTXCLrehbnZGiJ/GZ8H8cm	f	helmut@orange.fr
19	Penelope	$2a$10$2itEuIAkHpctbhoppiS0w.VvxbB6cIhSoa0ll23G/JM4gAocf9viG	f	penelope@orange.fr
20	Romain	$2a$10$ghPPGC4OwG/iOm9WTRLjH.rKxBreLO9qWxi6uTSA3sCPgQ2GaVFgq	f	romain@orange.fr
38	paul	$2a$10$7Fbu3nDD2sCYm.DgFJWTA.su46GPfQY.lb/Gzvt/XdCvrdJWsV6ne	f	paul@weclimb.fr
40	durant	$2a$10$yml3oQRHSoJt/fowq9UjgOXRU/Xd6NA7/i.Er52G517/rYWfgtCpm	f	durant33@free.fr
41	alfred	$2a$10$376UQO/v6sdOuxy2bNUbz.3YWd9G09LRcEIHPVxhcrU9sLEquTcs6	f	alfred@free.f
42	Rigobert	$2a$10$ypkaeSyMT2jFR4rWEiXvUOEbt5bM/lEx3kkTyf9lNlpcgV.dEQ0oS	f	Rigobert@free.fr
\.


--
-- TOC entry 3271 (class 0 OID 25322)
-- Dependencies: 208
-- Data for Name: voie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voie (id, nom, hauteur, cotation, nbrepoints, id_secteur) FROM stdin;
1	Combe	200	8a	20	1
2	Flamme	100	7a	10	2
5	Chevriers	50	9c	5	4
6	Prat	130	6a	13	5
7	Père Nère	100	9c	15	6
8	Engaly	300	6a	35	7
9	Soulecou	200	6a	40	8
3	Louron	450	8c	45	2
4	Cimes	275	7a	28	2
10	Slalom	200	6a	5	13
11	SuperG	300	7a	8	13
12	Geant	250	6b	7	13
15	Incarne	240	7b	10	2
17	Est	150	6b	50	16
16	Lac bas	200	6a	15	15
\.


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 213
-- Name: commentaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.commentaire_id_seq', 9, true);


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 200
-- Name: lieu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lieu_id_seq', 43, true);


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 209
-- Name: longueur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.longueur_id_seq', 30, true);


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 216
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 41, true);


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 205
-- Name: secteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.secteur_id_seq', 17, true);


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 212
-- Name: spot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spot_id_seq', 27, true);


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 214
-- Name: topo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topo_id_seq', 39, true);


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 211
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, false);


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 207
-- Name: voie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voie_id_seq', 20, true);


-- Completed on 2020-06-04 18:41:21 CEST

--
-- PostgreSQL database dump complete
--

