--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: beer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE beer (
    state_id character varying(120),
    brewery_id integer,
    style character varying(60),
    rating double precision,
    name character varying(120),
    label character varying(300),
    id integer NOT NULL,
    ibu integer,
    abv double precision
);


--
-- Name: beer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE beer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: beer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE beer_id_seq OWNED BY beer.id;


--
-- Name: brewery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE brewery (
    address character varying(120),
    name character varying(120),
    founded double precision,
    label character varying(300),
    brewery_type character varying(60),
    id integer NOT NULL,
    state_id character varying(120)
);


--
-- Name: brewery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE brewery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: brewery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE brewery_id_seq OWNED BY brewery.id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE state (
    abbreviation character varying(120) NOT NULL,
    capital character varying(120),
    name character varying(120),
    media character varying(300),
    flower character varying(120)
);


--
-- Name: ven2beer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ven2beer (
    venue_id integer,
    beer_id integer
);


--
-- Name: ven2brew; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ven2brew (
    brewery_id integer,
    venue_id integer
);


--
-- Name: venue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venue (
    category character varying(90),
    id integer NOT NULL,
    media character varying(300),
    is_public boolean,
    name character varying(120),
    address character varying(120),
    state_id character varying(120)
);


--
-- Name: venue_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: venue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venue_id_seq OWNED BY venue.id;


--
-- Name: beer id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY beer ALTER COLUMN id SET DEFAULT nextval('beer_id_seq'::regclass);


--
-- Name: brewery id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY brewery ALTER COLUMN id SET DEFAULT nextval('brewery_id_seq'::regclass);


--
-- Name: venue id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venue ALTER COLUMN id SET DEFAULT nextval('venue_id_seq'::regclass);


--
-- Data for Name: beer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY beer (state_id, brewery_id, style, rating, name, label, id, ibu, abv) FROM stdin;
NY	259	Lager - Vienna	3.50599999999999978	Brooklyn Lager	https://untappd.akamaized.net/site/beer_logos/beer-3558_fe9a9_sm.jpeg	3558	33	5.20000000000000018
CA	2228	IPA - American	3.54099999999999993	IPA	https://untappd.akamaized.net/site/beer_logos/beer-IPA_8238.jpeg	8238	66	6.79999999999999982
CA	39329	Blonde Ale - Belgian Blonde / Golden	3.65200000000000014	Hellion	https://untappd.akamaized.net/site/beer_logos/beer-Hellion_249566.jpeg	249566	32	8.90000000000000036
OH	69953	IPA - American	3.91500000000000004	Truth	https://untappd.akamaized.net/site/beer_logos/beer-393430_da3ea_sm.jpeg	393430	75	7.20000000000000018
MA	20084	IPA - Imperial / Double	4.39900000000000002	Bright (w/ Citra)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1902736	0	7.79999999999999982
NY	705	IPA - American	3.83899999999999997	Flower Power	https://untappd.akamaized.net/site/beer_logos/beer-4871_61614_sm.jpeg	4871	75	7.5
MA	20827	Pale Ale - American	3.95400000000000018	Whirlpool	https://untappd.akamaized.net/site/beer_logos/beer-607480_bc7fc_sm.jpeg	607480	50	4.5
NY	259	Saison / Farmhouse Ale	3.68299999999999983	Brooklyn Sorachi Ace	https://untappd.akamaized.net/site/beer_logos/beer-8731_8f577_sm.jpeg	8731	34	7.20000000000000018
CA	1142	IPA - American	3.72699999999999987	Beer Camp Golden IPA (2017)	https://untappd.akamaized.net/site/beer_logos/beer-1884514_c138c_sm.jpeg	1884514	50	6.5
CA	208640	Stout - American	3.75800000000000001	Rolling Blackout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1864463	0	7.59999999999999964
PA	1326	Sour - Gose	3.7799999999999998	Kirsch Gose	https://untappd.akamaized.net/site/beer_logos/beer-972795_68cce_sm.jpeg	972795	0	4.70000000000000018
CA	29181	Pale Ale - American	3.53900000000000015	XPA	https://untappd.akamaized.net/site/beer_logos/beer-770385_fc245_sm.jpeg	770385	26	5.59999999999999964
MA	634	Pale Ale - American	3.53100000000000014	Fresh Tracks	https://untappd.akamaized.net/site/beer_logos/beer-1857393_e465f_sm.jpeg	1857393	38	6.20000000000000018
CA	95443	Pale Ale - American	3.41800000000000015	Populous Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-_524194_sm_37ba4feee80a47d310fece1d0aec19.jpeg	524194	45	5.29999999999999982
CA	234937	Golden Ale	3.79700000000000015	Peaches Be Trippin'	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1718376	0	12
GA	1224	IPA - American	3.71899999999999986	Goin' Coastal	https://untappd.akamaized.net/site/beer_logos/beer-1424308_37aa5_sm.jpeg	1424308	60	6.09999999999999964
MA	157	Pale Wheat Ale - American	3.49400000000000022	Samuel Adams Hopscape	https://untappd.akamaized.net/site/beer_logos/beer-1740377_26c23_sm.jpeg	1740377	30	5.5
NC	3082	Witbier	3.57900000000000018	White Zombie Ale	https://untappd.akamaized.net/site/beer_logos/beer-11163_0d8e3_sm.jpeg	11163	5	5.09999999999999964
MA	23335	IPA - American	3.76100000000000012	Ambrewsia IPA	https://untappd.akamaized.net/site/beer_logos/beer-216007_e7bb2_sm.jpeg	216007	93	7
CA	68356	Pale Ale - American	3.91400000000000015	Dymaxion	https://untappd.akamaized.net/site/beer_logos/beer-1967181_2b0d8_sm.jpeg	1967181	40	6.20000000000000018
\N	49	Stout - Irish Dry	3.81400000000000006	Guinness Draught	https://untappd.akamaized.net/site/beer_logos/beer-_4473_8122008947804818c90640a06d83.jpeg	4473	45	4.29999999999999982
CA	5143	IPA - Imperial / Double	4.56099999999999994	Pliny the Elder	https://untappd.akamaized.net/site/beer_logos/beer-4499_dc04a_sm.jpeg	4499	100	8
OR	2531	Stout - Imperial / Double	4.31700000000000017	Black Gold (2004)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	2011640	0	10.5
MA	16871	IPA - American	4.11399999999999988	Brando IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1813723	40	6.79999999999999982
PA	1326	Doppelbock 	3.65899999999999981	St. Victorious	https://untappd.akamaized.net/site/beer_logos/beer-3829_df165_sm.jpeg	3829	0	7.59999999999999964
CA	16185	Stout - Imperial / Double	4.00600000000000023	The Nothing	https://untappd.akamaized.net/site/beer_logos/beer-114599_6fa47_sm.jpeg	114599	0	9.69999999999999929
MA	283519	Red Ale - Irish	3.90300000000000002	Townie 	https://untappd.akamaized.net/site/beer_logos/beer-1692870_86ef3_sm.jpeg	1692870	0	9.40000000000000036
CO	196228	IPA - American	3.77899999999999991	D-Train IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1077607	50	6.5
CA	1498	IPA - Session / India Session Ale	3.83999999999999986	Gravity Check	https://untappd.akamaized.net/site/beer_logos/beer-625450_7143e_sm.jpeg	625450	0	5
MI	908	Stout - American Imperial / Double	4.06299999999999972	Dragon's Milk Reserve: Vanilla Chai	https://untappd.akamaized.net/site/beer_logos/beer-1295873_833f2_sm.jpeg	1295873	30	11
MA	138510	Stout - American	3.7589999999999999	Rock Solid	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1795654	33	5.29999999999999982
NY	15784	Pale Ale - American	3.52700000000000014	Spring Pale Ale w/ Black Tea and Chamomile	https://untappd.akamaized.net/site/beer_logos/beer-1389193_a906d_sm.jpeg	1389193	0	6.70000000000000018
DE	459	IPA - American	3.86399999999999988	Flesh & Blood IPA	https://untappd.akamaized.net/site/beer_logos/beer-1441255_8c757_sm.jpeg	1441255	45	7.5
PA	2583	Stout - Milk / Sweet	3.98600000000000021	Nitro Chocolate Stout	https://untappd.akamaized.net/site/beer_logos/beer-1738821_3e6db_sm.jpeg	1738821	41	7.09999999999999964
CA	78850	Pale Ale - American	3.90600000000000014	Progress Pale Series: Mosaic	https://untappd.akamaized.net/site/beer_logos/beer-587799_8ad56_sm.jpeg	587799	50	6.20000000000000018
NY	1149	Cream Ale	3.56700000000000017	Sweet Action	https://untappd.akamaized.net/site/beer_logos/beer-_10010_sm.jpeg	10010	34	5.20000000000000018
MA	283519	Other	3.70299999999999985	RR23 Rum	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1706805	0	9.80000000000000071
CA	3891	Fruit Beer	3.52099999999999991	Mango Wheat	https://untappd.akamaized.net/site/beer_logos/beer-1383400_ffa3d_sm.jpeg	1383400	25	4.5
MA	2302	IPA - American	3.91400000000000015	Be Hoppy	https://untappd.akamaized.net/site/beer_logos/beer-6929_cc529_sm.jpeg	6929	70	6.5
CO	123311	Stout - American	4.19399999999999995	Sad Panda	https://untappd.akamaized.net/site/beer_logos/beer-660642_c76ad_sm.jpeg	660642	0	7.29999999999999982
NC	57226	IPA - American	3.77700000000000014	Scratch N' Sniff	https://untappd.akamaized.net/site/beer_logos/beer-591429_40839_sm.jpeg	591429	0	4.70000000000000018
IN	8928	Brown Ale - American	3.60599999999999987	Bulldog Brown	https://untappd.akamaized.net/site/beer_logos/beer-372362_bd547_sm.jpeg	372362	28	6.59999999999999964
CA	4339	Lager - American Light	3.36100000000000021	El Sully	https://untappd.akamaized.net/site/beer_logos/beer-491198_649cc_sm.jpeg	491198	13	4.90000000000000036
NY	34872	IPA - Session / India Session Ale	3.53699999999999992	Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-939413_97207_sm.jpeg	939413	42	4.90000000000000036
MA	16871	IPA - Imperial / Double	4.01400000000000023	Contemporary Dance	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1905766	70	8.40000000000000036
MA	16871	Brown Ale - Other	3.72100000000000009	Well of Wisdom	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1955899	0	5.90000000000000036
HI	1988	Golden Ale	3.54000000000000004	Big Wave Golden Ale	https://untappd.akamaized.net/site/beer_logos/beer-9657_429c5_sm.jpeg	9657	5	4.40000000000000036
CA	29	Rye IPA	4.14200000000000035	Nelson	https://untappd.akamaized.net/site/beer_logos/beer-5805_c5824_sm.jpeg	5805	80	7
DE	459	Brown Ale - Other	3.77700000000000014	Indian Brown Dark IPA	https://untappd.akamaized.net/site/beer_logos/beer-4013_42d21_sm.jpeg	4013	50	7.20000000000000018
MI	549	IPA - Session / India Session Ale	3.75800000000000001	All Day IPA	https://untappd.akamaized.net/site/beer_logos/beer-36834_82ca8_sm.jpeg	36834	42	4.70000000000000018
CA	3397	Rye Beer	3.53399999999999981	Rye'd Piper	https://untappd.akamaized.net/site/beer_logos/beer-26615_33732_sm.jpeg	26615	57	5.79999999999999982
CA	609	IPA - Imperial / Double	3.89599999999999991	West Coast IPA (2014-)	https://untappd.akamaized.net/site/beer_logos/beer-646818_228c6_sm.jpeg	646818	95	8.09999999999999964
SC	181813	Sour - Ale	3.79499999999999993	Petite Blanc	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1917240	0	4
VT	812	Pale Ale - American	3.56499999999999995	#9	https://untappd.akamaized.net/site/beer_logos/beer-3776_f8f08_sm.jpeg	3776	20	5.09999999999999964
MO	44	Lager - American Light	2.24699999999999989	Bud Light	https://untappd.akamaized.net/site/beer_logos/beer-3784_0e2c3_sm.jpeg	3784	27	4.20000000000000018
CT	194951	IPA - Imperial / Double	3.92300000000000004	Cloudbreak™ Double IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1974678	0	9
MA	157	Fruit Beer	3.38700000000000001	Samuel Adams Cherry Wheat	https://untappd.akamaized.net/site/beer_logos/beer-SamuelAdamsCherryWheat_4052.jpeg	4052	23	5.29999999999999982
NC	37851	IPA - Imperial / Double	4.16099999999999959	Freak of Nature	https://untappd.akamaized.net/site/beer_logos/beer-504431_6a16b_sm.jpeg	504431	100	8.5
CA	765	Pale Wheat Ale - American	3.86900000000000022	A Little Sumpin' Sumpin' Ale	https://untappd.akamaized.net/site/beer_logos/beer-25796_43b95_sm.jpeg	25796	65	7.5
MA	14088	Lager - IPL (India Pale Lager)	3.79700000000000015	BBC 20th Anniversary	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1965493	0	0
OH	155169	Porter - American	3.95999999999999996	Chief Vanilla Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1573056	36	6.5
VT	801	Altbier	3.45100000000000007	Long Trail Ale	https://untappd.akamaized.net/site/beer_logos/beer-5970_d6700_sm.jpeg	5970	28	5
IN	8928	Pale Ale - American	3.61100000000000021	Rocky Ripple Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-298905_d107a_sm.jpeg	298905	48	6.59999999999999964
CA	2445	IPA - American	3.95900000000000007	Breaking Bud	https://untappd.akamaized.net/site/beer_logos/beer-929842_90f36_sm.jpeg	929842	50	6.5
CA	94	IPA - American	3.88499999999999979	Racer 5 IPA®	https://untappd.akamaized.net/site/beer_logos/beer-BearRepublicRacer5.jpg	1553	75	7.5
VT	801	IPA - American	3.79400000000000004	Limbo IPA	https://untappd.akamaized.net/site/beer_logos/beer-434330_f3f12_sm.jpeg	434330	80	7.59999999999999964
IL	2898	IPA - English	3.54899999999999993	Goose IPA	https://untappd.akamaized.net/site/beer_logos/beer-1353_b23f2_sm.jpeg	1353	55	5.90000000000000036
IN	8928	IPA - Imperial / Double	3.80100000000000016	Centennial Martyr Double IPA	https://untappd.akamaized.net/site/beer_logos/beer-thr3eCentennialMartyr.jpg	35133	92	8
CA	4406	IPA - American	3.58400000000000007	Angel City IPA	https://untappd.akamaized.net/site/beer_logos/beer-176962_7ca74_sm.jpeg	176962	65	6.09999999999999964
WA	202473	Cider	3.69399999999999995	Dark Cherry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1400236	0	6
CA	765	IPA - American	3.81400000000000006	IPA	https://untappd.akamaized.net/site/beer_logos/beer-4509_1ce65_sm.jpeg	4509	46	6.20000000000000018
CA	2340	Hefeweizen	3.52300000000000013	Old World Hefeweizen	https://untappd.akamaized.net/site/beer_logos/beer-14482_90331_sm.jpeg	14482	10	5
MI	908	Stout - American Imperial / Double	4.07099999999999973	Dragon's Milk	https://untappd.akamaized.net/site/beer_logos/beer-123662_39287_sm.jpeg	123662	31	11
MA	23038	IPA - American	4.35599999999999987	Congress Street IPA	https://untappd.akamaized.net/site/beer_logos/beer-467174_92f2b_sm.jpeg	467174	0	7.20000000000000018
MA	23038	Pale Ale - American	4.27299999999999969	Fort Point Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-_361171_sm_7dde0f5422e5b9a093be626eb45ac7.jpeg	361171	0	6.59999999999999964
MA	23038	IPA - Imperial / Double	4.44899999999999984	Vicinity	https://untappd.akamaized.net/site/beer_logos/beer-876082_ea5c1_sm.jpeg	876082	65	8
MA	23038	IPA - Imperial / Double	4.35899999999999999	Mettle	https://untappd.akamaized.net/site/beer_logos/beer-621984_5cb88_sm.jpeg	621984	0	8.40000000000000036
MA	23038	Pale Ale - American	4.44700000000000006	Galaxy Dry Hopped Fort Point Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-523335_b0cd2_sm.jpeg	523335	45	6.59999999999999964
MA	23038	IPA - American	4.31899999999999995	Melcher Street IPA	https://untappd.akamaized.net/site/beer_logos/beer-739290_e948f_sm.jpeg	739290	0	7.20000000000000018
MA	23038	Pale Ale - American	4.50600000000000023	Double Dry Hopped Fort Point Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-415360_3117e_sm.jpeg	415360	0	6.59999999999999964
MA	23038	Pale Ale - American	4.42900000000000027	Mosaic Dry Hopped Fort Point Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-947710_0804a_sm.jpeg	947710	0	6.59999999999999964
MA	23038	IPA - American	4.48200000000000021	Double Dry Hopped Melcher Street	https://untappd.akamaized.net/site/beer_logos/beer-934620_b84fd_sm.jpeg	934620	0	7.29999999999999982
MA	23038	IPA - Imperial / Double	4.39700000000000024	Double Dry Hopped Sleeper Street	https://untappd.akamaized.net/site/beer_logos/beer-974744_a121b_sm.jpeg	974744	0	7.20000000000000018
MA	23038	IPA - American	4.26400000000000023	Scaled	https://untappd.akamaized.net/site/beer_logos/beer-1327152_0078c_sm.jpeg	1327152	0	7
MA	23038	IPA - American	4.55999999999999961	Double Dry Hopped Congress Street IPA	https://untappd.akamaized.net/site/beer_logos/beer-785607_ccd33_sm.jpeg	785607	0	7.20000000000000018
MA	23038	Porter - American	4.06599999999999984	Pot & Kettle	https://untappd.akamaized.net/site/beer_logos/beer-_335433_sm_28ac387d95ca4f2464abeb83647f30.jpeg	335433	0	7.5
MA	23038	IPA - Imperial / Double	4.42100000000000026	Scaled Up	https://untappd.akamaized.net/site/beer_logos/beer-1354443_39e19_sm.jpeg	1354443	0	8
MA	23038	IPA - American	4.20999999999999996	Sleeper Street	https://untappd.akamaized.net/site/beer_logos/beer-630575_01bb8_sm.jpeg	630575	0	7.20000000000000018
MA	23038	IPA - American	4.45300000000000029	Double Dry Hopped Summer Street	https://untappd.akamaized.net/site/beer_logos/beer-1127175_bbe18_sm.jpeg	1127175	0	7.20000000000000018
MA	23038	IPA - Imperial / Double	4.45000000000000018	UPPER CASE	https://untappd.akamaized.net/site/beer_logos/beer-1014360_a3f10_sm.jpeg	1014360	0	9
MA	23038	Stout - American Imperial / Double	4.30799999999999983	PM Dawn	https://untappd.akamaized.net/site/beer_logos/beer-920149_e141a_sm.jpeg	920149	0	9
MA	23038	Stout - American	4.04600000000000026	Secret Stairs	https://untappd.akamaized.net/site/beer_logos/beer-1399429_374af_sm.jpeg	1399429	0	6.5
MA	23038	Pale Ale - American	4.12399999999999967	Launch Beer	https://untappd.akamaized.net/site/beer_logos/beer-1326192_89a44_sm.jpeg	1326192	0	5.70000000000000018
MA	23038	IPA - Imperial / Double	4.48299999999999965	Heavy Mettle	https://untappd.akamaized.net/site/beer_logos/beer-779842_7fc2f_sm.jpeg	779842	0	9.30000000000000071
MA	23038	IPA - Imperial / Double	4.40599999999999969	Dialed In	https://untappd.akamaized.net/site/beer_logos/beer-1474749_18c2c_sm.jpeg	1474749	0	8.5
MA	23038	Pale Wheat Ale - American	4.20300000000000029	Pier	https://untappd.akamaized.net/site/beer_logos/beer-810401_f13ef_sm.jpeg	810401	0	6.70000000000000018
MA	23038	IPA - American	4.26799999999999979	Summer Street	https://untappd.akamaized.net/site/beer_logos/beer-681806_5f09d_sm.jpeg	681806	0	7.20000000000000018
MA	23038	IPA - American	4.28699999999999992	Double Dry Hopped A Street IPA	https://untappd.akamaized.net/site/beer_logos/beer-1782054_d41e0_sm.jpeg	1782054	0	7.20000000000000018
CA	68356	Red Ale - American Amber / Red	3.84200000000000008	Blazing World	https://untappd.akamaized.net/site/beer_logos/beer-384792_1cd33_sm.jpeg	384792	85	6.79999999999999982
CA	68356	Stout - Oatmeal	3.94300000000000006	Black House	https://untappd.akamaized.net/site/beer_logos/beer-384798_44a1a_sm.jpeg	384798	40	5.79999999999999982
CA	68356	Pale Wheat Ale - American	3.80600000000000005	Fortunate Islands	https://untappd.akamaized.net/site/beer_logos/beer-384796_e0b4e_sm.jpeg	384796	46	5
CA	68356	Saison / Farmhouse Ale	3.60499999999999998	Lomaland	https://untappd.akamaized.net/site/beer_logos/beer-384799_27d4c_sm.jpeg	384799	30	5.5
CA	68356	IPA - American	3.99400000000000022	Booming Rollers	https://untappd.akamaized.net/site/beer_logos/beer-659812_18bb0_sm.jpeg	659812	75	6.79999999999999982
CA	68356	IPA - American	4.00999999999999979	City of the Sun	https://untappd.akamaized.net/site/beer_logos/beer-441918_70731_sm.jpeg	441918	85	7.59999999999999964
CA	68356	IPA - American	3.996	Orderville	https://untappd.akamaized.net/site/beer_logos/beer-467236_2dca4_sm.jpeg	467236	75	7.20000000000000018
CA	68356	Stout - Foreign / Export	4.04900000000000038	City of the Dead	https://untappd.akamaized.net/site/beer_logos/beer-958690_2f7ef_sm.jpeg	958690	30	7.5
CA	68356	Pale Ale - American	3.77000000000000002	Oneida	https://untappd.akamaized.net/site/beer_logos/beer-392679_fe50d_sm.jpeg	392679	50	5.79999999999999982
CA	68356	Sour - Gose	3.84299999999999997	Fruitlands (Apricot)	https://untappd.akamaized.net/site/beer_logos/beer-1257854_28c1c_sm.jpeg	1257854	20	4.79999999999999982
CA	68356	Sour - Gose	4.01199999999999957	Fruitlands (Passion Fruit & Guava)	https://untappd.akamaized.net/site/beer_logos/beer-1301712_b4863_sm.jpeg	1301712	17	4.79999999999999982
CA	68356	Rye IPA	3.76900000000000013	Aurora	https://untappd.akamaized.net/site/beer_logos/beer-822873_3158b_sm.jpeg	822873	75	6.70000000000000018
CA	68356	Stout - Imperial Oatmeal	4.16699999999999982	Mega Black House	https://untappd.akamaized.net/site/beer_logos/beer-743646_091f1_sm.jpeg	743646	45	10
CA	68356	Stout - American Imperial / Double	4.05799999999999983	Monsters' Park	https://untappd.akamaized.net/site/beer_logos/beer-580748_e8cc0_sm.jpeg	580748	60	12
CA	68356	Pale Wheat Ale - American	3.90300000000000002	Fortunate Islands w/ Grapefruit Zest	https://untappd.akamaized.net/site/beer_logos/beer-449314_07511_sm.jpeg	449314	46	5
CA	68356	IPA - American	3.91100000000000003	Protocosmos	https://untappd.akamaized.net/site/beer_logos/beer-989574_9ed4b_sm.jpeg	989574	90	7
CA	68356	IPA - Imperial / Double	4.125	Mega Fortunate Islands	https://untappd.akamaized.net/site/beer_logos/beer-1323473_b118b_sm.jpeg	1323473	95	8.5
CA	68356	Saison / Farmhouse Ale	3.67700000000000005	Universal Friend	https://untappd.akamaized.net/site/beer_logos/beer-773033_5baa1_sm.jpeg	773033	0	7.20000000000000018
CA	68356	Sour - Gose	3.91500000000000004	Fruitlands (Sour Cherry)	https://untappd.akamaized.net/site/beer_logos/beer-1212310_f226a_sm.jpeg	1212310	17	4.79999999999999982
CA	68356	Old Ale	4.15500000000000025	Devil's Teeth	https://untappd.akamaized.net/site/beer_logos/beer-939381_1b6b1_sm.jpeg	939381	60	10
CA	68356	Sour - Gose	3.87400000000000011	Fruitlands (Blood Orange & Hibiscus)	https://untappd.akamaized.net/site/beer_logos/beer-1727837_39acb_sm.jpeg	1727837	15	4.79999999999999982
CA	68356	IPA - Imperial / Double	3.97999999999999998	Hooloomooloo	https://untappd.akamaized.net/site/beer_logos/beer-1093255_36c19_sm.jpeg	1093255	80	10
CA	68356	IPA - American	4.06700000000000017	Accumulated Knowledge	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1627134	65	6.20000000000000018
CA	68356	IPA - Imperial / Double	3.91800000000000015	Lost Horizon	https://untappd.akamaized.net/site/beer_logos/beer-510577_ecf33_sm.jpeg	510577	100	8.5
CA	68356	IPA - American	4.01799999999999979	Floating World	https://untappd.akamaized.net/site/beer_logos/beer-1205126_4cb25_sm.jpeg	1205126	75	7.79999999999999982
CA	765	IPA - Imperial / Double	4.00300000000000011	Lagunitas Sucks	https://untappd.akamaized.net/site/beer_logos/beer-285026_242fa_sm.jpeg	285026	63	8
CA	765	IPA - Imperial / Double	3.93100000000000005	Maximus	https://untappd.akamaized.net/site/beer_logos/beer-5771_1adab_sm.jpeg	5771	72	8.19999999999999929
CA	765	Strong Ale - American	3.78399999999999981	Brown Shugga'	https://untappd.akamaized.net/site/beer_logos/beer-4740_f4ee9_sm.jpeg	4740	51	9.69999999999999929
CA	765	IPA - Imperial / Double	3.9700000000000002	Hop Stoopid	https://untappd.akamaized.net/site/beer_logos/beer-5180_c12d7_sm.jpeg	5180	102	8
CA	765	Strong Ale - American	3.88899999999999979	Undercover Investigation Shut-Down Ale	https://untappd.akamaized.net/site/beer_logos/beer-_201_sm_ac8820d05c7b51684b82d73afdff82.jpeg	201	66	9.59999999999999964
CA	765	IPA - Session / India Session Ale	3.70500000000000007	DayTime Fractional IPA	https://untappd.akamaized.net/site/beer_logos/beer-_198572_sm_9ab13c3d5b252a3a6a36dbc95e2f52.jpeg	198572	54	4.65000000000000036
CA	765	Stout - American Imperial / Double	3.82799999999999985	Cappuccino Stout	https://untappd.akamaized.net/site/beer_logos/beer-LagunitasCappuccinoStout.jpg	4472	29	9.09999999999999964
CA	765	Pilsner - Czech	3.48799999999999999	Pils	https://untappd.akamaized.net/site/beer_logos/beer-PILS_6725.jpeg	6725	35	6
CA	765	IPA - Black / Cascadian Dark Ale	3.84399999999999986	Night Time Ale	https://untappd.akamaized.net/site/beer_logos/beer-588286_823cf_sm.jpeg	588286	65	8.19999999999999929
CA	765	Pale Ale - American	3.67099999999999982	New Dogtown Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-NewDogtownPaleAle_6407.jpeg	6407	62	5.90000000000000036
CA	765	Sour - Ale	3.68100000000000005	Aunt Sally	https://untappd.akamaized.net/site/beer_logos/beer-1388167_460df_sm.jpeg	1388167	33	5.70000000000000018
CA	765	Pale Ale - American	3.90799999999999992	Citrusinensis Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-1119569_77911_sm.jpeg	1119569	60	7.70000000000000018
CA	765	Red Ale - American Amber / Red	3.60700000000000021	Censored Rich Copper Ale (aka The Kronik)	https://untappd.akamaized.net/site/beer_logos/beer-lagunitasCensored.jpg	1071	35	6.75
CA	765	IPA - Belgian	3.85099999999999998	A Little Sumpin' Wild Ale	https://untappd.akamaized.net/site/beer_logos/beer-ALittleSumpinWild_6388.jpeg	6388	72	8.80000000000000071
WA	202473	Cider	3.54400000000000004	Chili Pineapple	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1740346	0	5
CA	765	Red Ale - Imperial / Double	3.88600000000000012	Lucky 13 (Mondo Large Red Ale)	https://untappd.akamaized.net/site/beer_logos/beer-Lucky13MondoLargeRedAle_5767.jpeg	5767	77	8.80000000000000071
CA	765	Pale Ale - American	3.875	12th of Never Ale	https://untappd.akamaized.net/site/beer_logos/beer-1613790_b383b_sm.jpeg	1613790	45	5.5
CA	765	Brown Ale - Imperial / Double	3.81499999999999995	Wilco Tango Foxtrot (WTF)	https://untappd.akamaized.net/site/beer_logos/beer-_10718_sm_3c702694d0c019a959088fcede40f4.jpeg	10718	64	7.84999999999999964
CA	765	Pale Ale - American	4.10299999999999976	Born Yesterday Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-783273_5b7e1_sm.jpeg	783273	110	7
CA	765	Pale Ale - American	3.86299999999999999	Equinox	https://untappd.akamaized.net/site/beer_logos/beer-132097_b4597_sm.jpeg	132097	50	8
CA	765	Stout - Russian Imperial	3.92399999999999993	Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-LagunitasImperialStout_1070.jpeg	1070	72	9.90000000000000036
CA	765	Strong Ale - American	3.69899999999999984	The Hairy Eyeball	https://untappd.akamaized.net/site/beer_logos/beer-lagunitasHairyEyeball.jpg	1351	57	9.09999999999999964
CA	765	Stout - American Imperial / Double	4.26199999999999957	High West-ified Imperial Coffee Stout	https://untappd.akamaized.net/site/beer_logos/beer-975619_aea77_sm.jpeg	975619	39	12.1999999999999993
CA	765	Red Ale - Imperial / Double	3.85700000000000021	Imperial Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-ImperialRed_24331.jpeg	24331	54	7.79999999999999982
CA	208640	IPA - American	4.13699999999999957	Unpresidential	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1461330	0	6.70000000000000018
CA	208640	IPA - American	4.18599999999999994	L.A. Like...	https://untappd.akamaized.net/site/beer_logos/beer-1808171_34037_sm.jpeg	1808171	0	6.79999999999999982
CA	208640	IPA - American	3.8450000000000002	ALL CAPS	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1818821	0	6.79999999999999982
CA	208640	IPA - American	4.12800000000000011	Air Quotes	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1743043	0	6.75
CA	208640	Dark Ale	3.72500000000000009	Black Mamba	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1123691	0	7.75
CA	208640	IPA - American	3.85000000000000009	Hunky Dory	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1390012	0	7.45000000000000018
CA	208640	Dark Ale	3.88200000000000012	Black Coffee Mamba	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1215376	0	7.75
CA	208640	IPA - Imperial / Double	3.97599999999999998	Buggin' Out Remix	https://untappd.akamaized.net/site/beer_logos/beer-1936250_ed4dd_sm.jpeg	1936250	0	8.5
CA	208640	Cream Ale	3.27099999999999991	L.A. Crema	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1123520	0	4.20000000000000018
CA	208640	Pale Ale - American	3.57299999999999995	Bleacher Beer	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1198860	0	4.59999999999999964
CA	208640	IPA - Imperial / Double	4.01600000000000001	Mindclouder	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1374983	0	10.0999999999999996
CA	208640	Porter - American	3.871	Skidrokyo	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1685733	0	5.70000000000000018
CA	208640	IPA - American	4.20000000000000018	Butterfly Scratch	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1833644	35	6.40000000000000036
CA	208640	IPA - American	3.83599999999999985	Make Hops Great Again	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1591194	0	7.5
CA	208640	Belgian Dubbel	3.63899999999999979	Biggums	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1250945	0	6.79999999999999982
CA	208640	IPA - American	4.04300000000000015	Super Proper	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1895745	0	7
CA	208640	IPA - American	3.80299999999999994	DTLA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1433815	0	7.09999999999999964
CA	208640	IPA - Imperial / Double	3.95599999999999996	Fast Friends	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1685727	0	8.80000000000000071
CA	208640	IPA - American	4.11899999999999977	'90s R&B	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1924093	0	7
CA	208640	Pale Ale - American	3.97100000000000009	Buggin' Out	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1481889	0	5.29999999999999982
CA	208640	IPA - American	3.58999999999999986	Boyd St. IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1123517	0	7.90000000000000036
CA	208640	IPA - American	3.86900000000000022	Third Term	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1922739	0	6.90000000000000036
CA	208640	Gruit / Ancient Herbed Ale	3.7280000000000002	Koala Food (Füd)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1391149	0	10
CA	208640	Stout - Russian Imperial	4.15700000000000003	Great Uncle George	https://untappd.akamaized.net/site/beer_logos/beer-1583339_3476c_sm.jpeg	1583339	0	13
CA	208640	IPA - American	4.16800000000000015	Most (Def)initely	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1975731	0	6.79999999999999982
CA	2228	IPA - Imperial / Double	3.79000000000000004	Shipwrecked	https://untappd.akamaized.net/site/beer_logos/beer-18693_6c137_sm.jpeg	18693	75	9.25
CA	2228	Stout - Russian Imperial	3.91900000000000004	Dark Seas	https://untappd.akamaized.net/site/beer_logos/beer-77710_ed666_sm.jpeg	77710	75	9.80000000000000071
CA	2228	IPA - Session / India Session Ale	3.32699999999999996	El Conquistador	https://untappd.akamaized.net/site/beer_logos/beer-_331403_sm_74e6a68a8e6957156b420f135be274.jpeg	331403	44	4.79999999999999982
CA	2228	Root Beer	3.58300000000000018	Hard Root Beer	https://untappd.akamaized.net/site/beer_logos/beer-718340_6d95a_sm.jpeg	718340	5	7.5
CA	2228	Hefeweizen	3.4910000000000001	Hefeweizen	https://untappd.akamaized.net/site/beer_logos/beer-8240_f4225_sm.jpeg	8240	15	5.29999999999999982
CA	2228	Kölsch	3.30699999999999994	Blonde Ale	https://untappd.akamaized.net/site/beer_logos/beer-8239_63972_sm.jpeg	8239	20	5
CA	2228	Red Ale - Imperial / Double	3.67399999999999993	Carrack	https://untappd.akamaized.net/site/beer_logos/beer-_378724_sm_0bae3e65a35e4e9cb36f36299621a1.jpeg	378724	75	10.1999999999999993
CA	2228	Altbier	3.40799999999999992	Amber Ale	https://untappd.akamaized.net/site/beer_logos/beer-8237_fdeff_sm.jpeg	8237	43	5
CA	2228	IPA - American	3.67700000000000005	Plunder IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	767202	88	7
CA	2228	Stout - Russian Imperial	4.02299999999999969	Dark Seas (Bourbon-Barrel Aged)	https://untappd.akamaized.net/site/beer_logos/beer-551513_071a8_sm.jpeg	551513	75	11.25
CA	2228	Blonde Ale - Belgian Blonde / Golden	3.31999999999999984	Cortez Gold	https://untappd.akamaized.net/site/beer_logos/beer-641424_eff22_sm.jpeg	641424	0	5
MA	2302	Hefeweizen	3.55500000000000016	Warthog Wheat	https://untappd.akamaized.net/site/beer_logos/beer-1083803_0728f_sm.jpeg	1083803	0	5
CA	2228	Belgian Strong Dark Ale	3.59200000000000008	Holiday Ale	https://untappd.akamaized.net/site/beer_logos/beer-868260_aba25_sm.jpeg	868260	28	8.5
CA	2228	Sour - Berliner Weisse	3.66299999999999981	Maiden Voyage	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1051570	0	6.5
CA	2228	Brown Ale - American	3.43400000000000016	Coconut Brown Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	85382	28	6
CA	2228	IPA - American	3.8969999999999998	Don't Act Like You're Not Impressed IPA	https://untappd.akamaized.net/site/beer_logos/beer-963719_393ce_sm.jpeg	963719	68	7.5
CA	2228	Fruit Beer	3.43199999999999994	Raspberry Wheat	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	735448	15	5.20000000000000018
CA	2228	Dunkelweizen	3.57500000000000018	Dunkelweizen	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	237872	18	5.40000000000000036
CA	2228	IPA - Imperial / Double	3.68699999999999983	Armada Collaboration IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	417827	77	9.25
CA	2228	IPA - American	3.7330000000000001	Coffee IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1170446	66	6.79999999999999982
CA	2228	Stout - Russian Imperial	3.91500000000000004	Peanut Butter Dark Seas	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1187702	75	9.69999999999999929
CA	2228	Pilsner - German	3.33099999999999996	Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-_140050_sm_9c0e6db5c49229ceb37effdcdef9ff.jpeg	140050	40	5
CA	2228	Stout - Russian Imperial	4.08300000000000018	Dark Seas With Espresso Coffee	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1033870	75	9.80000000000000071
CA	2228	Stout - Milk / Sweet	3.81099999999999994	Golden Milk Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1539800	30	4.25
CA	2228	Rye Beer	3.61900000000000022	Zythos Rye	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	729431	0	6.59999999999999964
CA	1498	IPA - American	4.0259999999999998	Just Outstanding IPA	https://untappd.akamaized.net/site/beer_logos/beer-JustOutstandingIPA_6358.jpeg	6358	65	6.79999999999999982
CA	1498	IPA - Imperial / Double	4.45300000000000029	Citra	https://untappd.akamaized.net/site/beer_logos/beer-CitraDIPA_8210.jpeg	8210	80	8
CA	1498	IPA - Imperial / Double	3.94300000000000006	Shuttle Bunny	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	699540	70	8.5
CA	1498	Stout - Imperial Oatmeal	3.95599999999999996	Class V Stout	https://untappd.akamaized.net/site/beer_logos/beer-ClassV_8216.jpeg	8216	0	8.5
CA	1498	IPA - Imperial / Double	4.08000000000000007	Winter Ale	https://untappd.akamaized.net/site/beer_logos/beer-49947_b3b32_sm.jpeg	49947	78	8
CA	1498	Red Ale - Imperial / Double	3.91199999999999992	Dirty Hippie	https://untappd.akamaized.net/site/beer_logos/beer-_142231_sm_39853b7a05f5b620e02b4fc404176c.jpeg	142231	95	8
CA	1498	IPA - Triple	4.17100000000000026	Hop Nookie	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1014315	100	11
CA	1498	Red Ale - American Amber / Red	3.56499999999999995	Sequoia Red	https://untappd.akamaized.net/site/beer_logos/beer-KernRiverSequoiaRed_22608.jpeg	22608	0	5.20000000000000018
CA	1498	Pumpkin / Yam Beer	3.41599999999999993	Pumpkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-PumpkinAle_10958.jpeg	10958	0	6
CA	1498	Pale Ale - American	3.95999999999999996	River Buddy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1708408	56	5.59999999999999964
CA	1498	Blonde Ale	3.43199999999999994	Isabella Blonde	https://untappd.akamaized.net/site/beer_logos/beer-IsabellaBlonde_14738.jpeg	14738	0	4.5
CA	1498	IPA - Imperial / Double	4.16999999999999993	Long Swim	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1418572	80	8.19999999999999929
CA	1498	Stout - Imperial Oatmeal	4.24699999999999989	Class X Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	8204	50	10
CA	1498	IPA - American	3.89299999999999979	Think Tank	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	929964	0	7.59999999999999964
CA	1498	IPA - Black / Cascadian Dark Ale	3.78699999999999992	Black Rock IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	475683	0	6
CA	1498	IPA - American	3.87599999999999989	Think Tank #11	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1792511	55	6.79999999999999982
CA	1498	IPA - American	3.8620000000000001	Think Tank #12	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1891397	0	7.20000000000000018
CA	1498	Porter - American	3.71899999999999986	1310 Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	961983	0	5.29999999999999982
CA	1498	Barleywine - English	3.98399999999999999	Lost In the Wood	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	870360	80	11
CA	1498	Blonde Ale - Belgian Blonde / Golden	3.39500000000000002	Belgian Wit	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	681261	0	4.20000000000000018
CA	1498	Stout - American	3.91900000000000004	Coffee Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	927213	0	5.70000000000000018
CA	1498	Red Ale - Imperial / Double	4.03399999999999981	Double Dirty Hippie	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	646980	80	10
CA	1498	Stout - Other	3.99699999999999989	7th Anniversary Imperial Coffee Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	348256	0	6.79999999999999982
CA	1498	Saison / Farmhouse Ale	3.67399999999999993	Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1002655	0	7
MA	20084	IPA - American	4.58199999999999985	Julius	https://untappd.akamaized.net/site/beer_logos/beer-237985_c70fc_sm.jpeg	237985	72	6.79999999999999982
MA	20084	IPA - American	4.51100000000000012	Green	https://untappd.akamaized.net/site/beer_logos/beer-533174_c2cea_sm.jpeg	533174	90	7.5
MA	20084	IPA - Imperial / Double	4.54600000000000026	Haze	https://untappd.akamaized.net/site/beer_logos/beer-718853_2ceb8_sm.jpeg	718853	90	8.19999999999999929
MA	20084	IPA - American	4.48099999999999987	Alter Ego	https://untappd.akamaized.net/site/beer_logos/beer-1120384_d7268_sm.jpeg	1120384	72	6.79999999999999982
MA	20084	IPA - American	4.28800000000000026	Sap	https://untappd.akamaized.net/site/beer_logos/beer-282634_11a16_sm.jpeg	282634	80	7.29999999999999982
MA	20084	IPA - Imperial / Double	4.56700000000000017	Doppelgänger	https://untappd.akamaized.net/site/beer_logos/beer-1399248_05938_sm.jpeg	1399248	88	8.19999999999999929
MA	20084	IPA - Imperial / Double	4.40299999999999958	Bright	https://untappd.akamaized.net/site/beer_logos/beer-1415115_e6aa9_sm.jpeg	1415115	75	7.79999999999999982
MA	20084	Pale Ale - American	4.29300000000000015	Lights On	https://untappd.akamaized.net/site/beer_logos/beer-1024586_bb734_sm.jpeg	1024586	0	5.59999999999999964
MA	20084	IPA - Imperial / Double	4.71600000000000019	Very Green	https://untappd.akamaized.net/site/beer_logos/beer-689944_ec619_sm.jpeg	689944	0	8.30000000000000071
MA	20084	Stout - Milk / Sweet	4.14200000000000035	That's What She Said	https://untappd.akamaized.net/site/beer_logos/beer-199182_2f3c0_sm.jpeg	199182	28	5.59999999999999964
MA	20084	Stout - Milk / Sweet	4.31200000000000028	Single Shot	https://untappd.akamaized.net/site/beer_logos/beer-1322232_d900d_sm.jpeg	1322232	0	6.40000000000000036
MA	20084	IPA - Imperial / Double	4.73800000000000043	Very Hazy	https://untappd.akamaized.net/site/beer_logos/beer-885563_1e891_sm.jpeg	885563	80	8.59999999999999964
MA	20084	IPA - Imperial / Double	4.76100000000000012	King Julius	https://untappd.akamaized.net/site/beer_logos/beer-273734_d1b0a_sm.jpeg	273734	85	8.19999999999999929
MA	20084	IPA - Imperial / Double	4.70099999999999962	Juice Machine	https://untappd.akamaized.net/site/beer_logos/beer-616287_b3c12_sm.jpeg	616287	70	8.19999999999999929
MA	20084	Stout - American	4.43400000000000016	Double Shot	https://untappd.akamaized.net/site/beer_logos/beer-621649_df704_sm.jpeg	621649	0	7.59999999999999964
MA	20084	IPA - American	4.5129999999999999	In Perpetuity	https://untappd.akamaized.net/site/beer_logos/beer-1230747_4b78d_sm.jpeg	1230747	0	6.70000000000000018
MA	20084	Stout - American Imperial / Double	4.75100000000000033	Good Morning	https://untappd.akamaized.net/site/beer_logos/beer-808915_7e795_sm.jpeg	808915	65	8.40000000000000036
MA	20084	Pale Ale - American	4.20099999999999962	Tornado	https://untappd.akamaized.net/site/beer_logos/beer-375258_cac23_sm.jpeg	375258	0	5.40000000000000036
MA	20084	Red Ale - American Amber / Red	4.07399999999999984	Ma	https://untappd.akamaized.net/site/beer_logos/beer-326856_af90b_sm.jpeg	326856	0	6.79999999999999982
MA	20084	Brown Ale - American	3.96799999999999997	Bear	https://untappd.akamaized.net/site/beer_logos/beer-920228_ba371_sm.jpeg	920228	0	6.40000000000000036
MA	20084	IPA - Imperial / Double	4.72700000000000031	Doubleganger	https://untappd.akamaized.net/site/beer_logos/beer-1856235_cf7b1_sm.jpeg	1856235	0	8.19999999999999929
MA	20084	IPA - American	4.73800000000000043	JJJULIUSSS	https://untappd.akamaized.net/site/beer_logos/beer-1122985_7b69f_sm.jpeg	1122985	75	6.79999999999999982
MA	20084	IPA - Imperial / Double	4.81500000000000039	King JJJuliusss	https://untappd.akamaized.net/site/beer_logos/beer-1616182_8d869_sm.jpeg	1616182	0	8.40000000000000036
MA	20084	Pale Ale - American	4.23299999999999965	Pride & Purpose	https://untappd.akamaized.net/site/beer_logos/beer-1704051_46fcb_sm.jpeg	1704051	0	5.09999999999999964
MA	20084	Stout - Milk / Sweet	4.50900000000000034	All That Is And All That Ever Will Be	https://untappd.akamaized.net/site/beer_logos/beer-1745402_0d956_sm.jpeg	1745402	0	6.5
DE	459	IPA - American	3.89599999999999991	60 Minute IPA	https://untappd.akamaized.net/site/beer_logos/beer-3952_a5c9d_sm.jpeg	3952	60	6
DE	459	IPA - Imperial / Double	4.09499999999999975	90 Minute IPA	https://untappd.akamaized.net/site/beer_logos/beer-8056_948fa_sm.jpeg	8056	90	9
DE	459	Pumpkin / Yam Beer	3.77099999999999991	Punkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-4996_05c91_sm.jpeg	4996	28	7
DE	459	Witbier	3.60599999999999987	Namaste White	https://untappd.akamaized.net/site/beer_logos/beer-dfhNamaste.jpg	6400	20	4.79999999999999982
DE	459	IPA - Imperial / Double	4.30600000000000005	120 Minute IPA	https://untappd.akamaized.net/site/beer_logos/beer-dfh120minuteIPA.jpg	3950	120	18
DE	459	IPA - Imperial / Double	4.08399999999999963	Burton Baton	https://untappd.akamaized.net/site/beer_logos/beer-6105_2da9e_sm.jpeg	6105	70	10
DE	459	Sour - Berliner Weisse	3.5089999999999999	Festina Peche	https://untappd.akamaized.net/site/beer_logos/beer-3963_54433_sm.jpeg	3963	8	4.5
DE	459	IPA - American	3.66900000000000004	Sixty-One	https://untappd.akamaized.net/site/beer_logos/beer-301756_9d9e9_sm.jpeg	301756	50	6.5
DE	459	IPA - American	3.70100000000000007	Aprihop	https://untappd.akamaized.net/site/beer_logos/beer-4665_6fd7f_sm.jpeg	4665	50	7
DE	459	Brown Ale - Imperial / Double	3.97999999999999998	Palo Santo Marron	https://untappd.akamaized.net/site/beer_logos/beer-dfhPaloSantoMarron.jpg	4487	50	12
DE	459	Spiced / Herbed Beer	3.79400000000000004	Midas Touch	https://untappd.akamaized.net/site/beer_logos/beer-dfhMidaTouch.jpg	14172	12	9
DE	459	IPA - American	3.81300000000000017	Romantic Chemistry	https://untappd.akamaized.net/site/beer_logos/beer-1380318_2bfae_sm.jpeg	1380318	40	7.20000000000000018
DE	459	Pilsner - Czech	3.51900000000000013	Piercing Pils	https://untappd.akamaized.net/site/beer_logos/beer-432085_35e38_sm.jpeg	432085	35	6
DE	459	IPA - American	4.0129999999999999	75 Minute IPA	https://untappd.akamaized.net/site/beer_logos/beer-5391_a7988_sm.jpeg	5391	75	7.5
DE	459	Stout - American Imperial / Double	4.06299999999999972	Miles Davis' Bitches Brew	https://untappd.akamaized.net/site/beer_logos/beer-6303_8fc87_sm.jpeg	6303	38	9
DE	459	Belgian Tripel	3.84799999999999986	Beer To Drink Music To	https://untappd.akamaized.net/site/beer_logos/beer-1405166_635f6_sm.jpeg	1405166	30	9
DE	459	Strong Ale - American	3.67200000000000015	Higher Math	https://untappd.akamaized.net/site/beer_logos/beer-1135768_6182d_sm.jpeg	1135768	35	17
DE	459	Stout - American Imperial / Double	4.26199999999999957	World Wide Stout	https://untappd.akamaized.net/site/beer_logos/beer-dfhWWS.jpg	6730	70	18
DE	459	Strong Ale - American	3.88600000000000012	American Beauty	https://untappd.akamaized.net/site/beer_logos/beer-_364477_sm_716f98b89a1df77696fa43a69f4603.jpeg	364477	55	9
DE	459	Pale Ale - American	3.82100000000000017	Pennsylvania Tuxedo	https://untappd.akamaized.net/site/beer_logos/beer-712205_c5e2a_sm.jpeg	712205	50	8.5
DE	459	Sour - Ale	3.80500000000000016	SeaQuench Ale	https://untappd.akamaized.net/site/beer_logos/beer-1452078_33a60_sm.jpeg	1452078	10	4.90000000000000036
DE	459	Belgian Strong Dark Ale	3.74400000000000022	Raison D'Être	https://untappd.akamaized.net/site/beer_logos/beer-dfhRaisonDEtre.jpg	4659	25	8
DE	459	Stout - Imperial / Double	3.83000000000000007	Beer For Breakfast	https://untappd.akamaized.net/site/beer_logos/beer-898893_6426a_sm.jpeg	898893	30	7.40000000000000036
WA	202473	Cider	3.75800000000000001	Thai Ginger	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1185786	0	6
WA	202473	Cider	3.45900000000000007	Original Dry Cider	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1081848	0	6
WA	202473	Cider	3.58099999999999996	Dark Sweet Cherry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1108321	0	6
WA	202473	Cider	3.72500000000000009	Sweet Aged Apple	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1655157	0	6.90000000000000036
WA	202473	Cider	3.89599999999999991	Vanilla Bean	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1801119	0	5
WA	202473	Cider	3.72299999999999986	Smoked Blueberry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1574853	0	6
WA	202473	Cider	3.75099999999999989	Apricot	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1399563	0	6
WA	202473	Cider	3.5	Elder & Oak	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1520646	0	7
WA	202473	Cider	3.90600000000000014	Aged Washington Dessert Apple	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1182975	0	6.90000000000000036
WA	202473	Cider	3.37999999999999989	Green Tea Infused	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1097867	0	6
WA	202473	Cider	3.65799999999999992	Black Cherry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1375429	0	6
WA	202473	Cider	3.64400000000000013	Alder Smoked Apple	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1399929	0	6
WA	202473	Cider	3.7410000000000001	Bittersweet Reserve	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1319947	0	6
WA	202473	Cider	3.05900000000000016	Moroccan Mint Tea	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1671026	0	6
WA	202473	Cider	3.76799999999999979	Cranberry Sour	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1492700	0	6
WA	202473	Cider	3.53299999999999992	Summer Berry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1097859	0	4.5
WA	202473	Cider	3.35499999999999998	Brackish	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1636950	0	6
WA	202473	Cider	3.76200000000000001	Session Berry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1647014	0	4
WA	202473	Cider	3.99400000000000022	Dolgo Crabapple	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1756286	0	6.90000000000000036
WA	202473	Cider	3.91699999999999982	Wabi Sabi	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1474897	9	4
WA	202473	Cider	3.71700000000000008	Blood Orange Tangerine	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1545874	0	6
WA	202473	Cider	3.9009999999999998	Newtown Pippin	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1611888	0	6.5
WA	202473	Cider	4.03300000000000036	Mojito	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1629442	0	6
MA	138510	IPA - American	3.70900000000000007	Dead Nuts	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	899966	66	5.59999999999999964
MA	138510	Porter - Other	3.77099999999999991	Baby-Maker	https://untappd.akamaized.net/site/beer_logos/beer-804634_98ee2_sm.jpeg	804634	28	5.40000000000000036
MA	138510	IPA - Imperial / Double	3.75700000000000012	Stud-Finder	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	934088	87	7.70000000000000018
MA	138510	Lager - American Light	3.8580000000000001	Generosity	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1372641	10	5.79999999999999982
MA	138510	Other	3.51399999999999979	The Common	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	880287	21	4.59999999999999964
MA	138510	IPA - American	4.02400000000000002	4 A.M.	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1713209	84	6.90000000000000036
MA	138510	Saison / Farmhouse Ale	3.621	Rusty Horseshoe	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1026223	25	6
MA	138510	IPA - Black / Cascadian Dark Ale	3.90700000000000003	Eviction Notice	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1903955	86	7.79999999999999982
MA	138510	Altbier	3.62400000000000011	Foreman Special 2	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1896027	34	5.79999999999999982
MA	138510	Barleywine - American	3.77499999999999991	104	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1822477	96	11.5
MA	138510	Lager - Dark	3.61100000000000021	Breweries Use Water?	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1922213	25	4.20000000000000018
MA	138510	Porter - American	3.7370000000000001	Baby-Maker Barrel Aged (Red Wine)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1789838	24	5.40000000000000036
MA	138510	Strong Ale - English	0	Shoes For Louie (Wine Barrel Aged)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1905843	0	0
MA	138510	Stout - American	4.18200000000000038	Sinker (Bourbon Barrel Aged)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1905851	0	0
MA	138510	Stout - Russian Imperial	0	Fifty Two (Wine/Bourbon Barrel Aged)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1905853	0	0
MA	138510	Porter - Other	0	Bourbon Barrel Aged Baby Maker	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1998685	24	5.40000000000000036
FL	303336	Red Ale - Irish	3.54700000000000015	Four Green Fields Irish Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1784776	22	5.5
FL	303336	Blonde Ale	3.61100000000000021	Cross Check Blonde Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1832864	14	5
FL	303336	Witbier	3.57900000000000018	Monks Brew	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1810839	10	5
FL	303336	IPA - International	3.49199999999999999	Four Green Fields Kinnitty Castle Ipa	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1845283	70	6
MA	1545	IPA - English	3.56499999999999995	IPA	https://untappd.akamaized.net/site/beer_logos/beer-IPA_9020.jpeg	9020	73	6.29999999999999982
MA	1545	Porter - English	3.76900000000000013	Porter	https://untappd.akamaized.net/site/beer_logos/beer-Porter_8572.jpeg	8572	0	5.5
MA	1545	Red Ale - American Amber / Red	3.53299999999999992	Spring Hop Ale	https://untappd.akamaized.net/site/beer_logos/beer-SpringHopAle_36903.jpeg	36903	37	5.29999999999999982
MA	1545	Stout - Oatmeal	3.75	Oatmeal Stout	https://untappd.akamaized.net/site/beer_logos/beer-1843260_d664f_sm.jpeg	1843260	0	5.40000000000000036
MA	1545	Golden Ale	3.30299999999999994	Golden Ale	https://untappd.akamaized.net/site/beer_logos/beer-GoldenAle_13081.jpeg	13081	18	4.70000000000000018
MA	1545	Blonde Ale - Belgian Blonde / Golden	3.33800000000000008	Summer	https://untappd.akamaized.net/site/beer_logos/beer-13082_73a01_sm.jpeg	13082	19	3.79999999999999982
MA	1545	IPA - Imperial / Double	3.92200000000000015	Alden	https://untappd.akamaized.net/site/beer_logos/beer-933265_e3189_sm.jpeg	933265	80	8
MA	1545	Pale Ale - English	3.33899999999999997	Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-PaleAle_123817.jpeg	123817	40	4.90000000000000036
MA	1545	Strong Ale - American	3.5950000000000002	Thanksgiving Ale	https://untappd.akamaized.net/site/beer_logos/beer-ThanksgivingAle_8005.jpeg	8005	0	6.70000000000000018
MA	1545	IPA - Session / India Session Ale	3.47299999999999986	Daily Ration	https://untappd.akamaized.net/site/beer_logos/beer-1128536_2d837_sm.jpeg	1128536	0	4.5
MA	1545	IPA - Imperial / Double	3.875	Evolupulin	https://untappd.akamaized.net/site/beer_logos/beer-1503553_73b81_sm.jpeg	1503553	50	8
MA	1545	Stout - Imperial / Double	3.99500000000000011	Standish Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-1230089_a5972_sm.jpeg	1230089	70	9
MA	1545	Brown Ale - American	3.7799999999999998	Hometown Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-1672939_94132_sm.jpeg	1672939	26	5
MA	1545	Pilsner - German	3.69399999999999995	Priscilla	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1513208	40	6
MA	1545	IPA - Session / India Session Ale	3.45900000000000007	Belgian Summer Session	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1549659	0	3.79999999999999982
MA	1545	Pale Ale - American	3.67099999999999982	Fresh Start	https://untappd.akamaized.net/site/beer_logos/beer-1955648_57363_sm.jpeg	1955648	0	5
MA	1545	Brown Ale - American	3.81400000000000006	Cooper's Series Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-1356335_d9d08_sm.jpeg	1356335	36	5.70000000000000018
MA	1545	Belgian Tripel	3.8620000000000001	Bradford	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1934845	30	9
MA	1545	IPA - Imperial / Double	4.00999999999999979	Evolupulin (Batch 3)	https://untappd.akamaized.net/site/beer_logos/beer-1662979_e7c0a_sm.jpeg	1662979	0	8.30000000000000071
MA	1545	IPA - American	3.83400000000000007	Hopflower	https://untappd.akamaized.net/site/beer_logos/beer-1263684_7879b_sm.jpeg	1263684	54	6.70000000000000018
MA	1545	Sour - American Wild Ale	3.87999999999999989	Uncharted	https://untappd.akamaized.net/site/beer_logos/beer-1138487_63841_sm.jpeg	1138487	0	0
MA	1545	IPA - Imperial / Double	3.96899999999999986	Evolupulin (Batch 6)	https://untappd.akamaized.net/site/beer_logos/beer-1904972_dee80_sm.jpeg	1904972	51	8
MA	1545	Porter - Other	3.68599999999999994	Vanilla Bean Porter - Cask	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	522630	0	0
MA	1545	IPA - Session / India Session Ale	3.81599999999999984	Mosaic Citra Session	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1766257	0	5.5
MA	1545	Sour - Gose	3.37999999999999989	Salty Paul	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1810430	0	3
MA	1999	Pale Ale - American	3.46399999999999997	Steel Rail Extra Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-6524_e6873_sm.jpeg	6524	20	5.29999999999999982
MA	1999	Porter - American	3.90899999999999981	Dean's Beans Coffeehouse Porter	https://untappd.akamaized.net/site/beer_logos/beer-8579_b7397_sm.jpeg	8579	36	6.29999999999999982
MA	1999	IPA - English	3.43800000000000017	Lost Sailor India Pale Ale (IPA)	https://untappd.akamaized.net/site/beer_logos/beer-6450_26750_sm.jpeg	6450	40	5.5
MA	1999	Winter Ale	3.59299999999999997	Cabin Fever	https://untappd.akamaized.net/site/beer_logos/beer-8224_a40ce_sm.jpeg	8224	20	6.29999999999999982
MA	1999	Märzen	3.5990000000000002	Oktoberfest Lager	https://untappd.akamaized.net/site/beer_logos/beer-25405_905eb_sm.jpeg	25405	30	7.5
MA	1999	Black & Tan	3.68800000000000017	Shabadoo Black and Tan Ale	https://untappd.akamaized.net/site/beer_logos/beer-15712_e8d2d_sm.jpeg	15712	27	6.29999999999999982
MA	1999	Porter - Other	3.76399999999999979	Drayman's Porter	https://untappd.akamaized.net/site/beer_logos/beer-8530_a4e2e_sm.jpeg	8530	36	6.29999999999999982
MA	1999	Red Ale - American Amber / Red	3.57299999999999995	Hoosac Tunnel Amber Ale	https://untappd.akamaized.net/site/beer_logos/beer-34170_82d9e_sm.jpeg	34170	23	6.29999999999999982
MA	1999	Stout - Russian Imperial	3.82100000000000017	The Russian Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-37061_b9859_sm.jpeg	37061	30	8.69999999999999929
MA	1999	Pilsner - Czech	3.44099999999999984	Busker Czech Style Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-11665_97e2d_sm.jpeg	11665	37	5
MA	1999	Fruit Beer	3.59699999999999998	Farmstand Raspberry Barleywine Style Ale	https://untappd.akamaized.net/site/beer_logos/beer-134392_d0206_sm.jpeg	134392	0	9
MA	1999	Maibock/Helles Bock	3.5169999999999999	Slue's Maibock Lager	https://untappd.akamaized.net/site/beer_logos/beer-32698_a7d40_sm.jpeg	32698	20	7.20000000000000018
MA	1999	Scotch Ale / Wee Heavy	3.69499999999999984	Drookit Scotch Ale	https://untappd.akamaized.net/site/beer_logos/beer-442807_00ce8_sm.jpeg	442807	40	7.90000000000000036
MA	1999	IPA - American	3.70599999999999996	Inhopnito American IPA	https://untappd.akamaized.net/site/beer_logos/beer-1596957_2df49_sm.jpeg	1596957	36	6.20000000000000018
MA	1999	Pale Wheat Ale - American	3.59399999999999986	River Guide Ale	https://untappd.akamaized.net/site/beer_logos/beer-7327_fa7c9_sm.jpeg	7327	18	7
MA	1999	Kölsch	3.3490000000000002	Gold Spike Ale	https://untappd.akamaized.net/site/beer_logos/beer-10480_7fc25_sm.jpeg	10480	17	4.20000000000000018
MA	1999	Hefeweizen	3.49400000000000022	Long Daze Hefeweizen	https://untappd.akamaized.net/site/beer_logos/beer-1163887_b1ce5_sm.jpeg	1163887	13	4.70000000000000018
MA	1999	IPA - Black / Cascadian Dark Ale	3.56899999999999995	Black IPA- Brewer's Series #1	https://untappd.akamaized.net/site/beer_logos/beer-673265_672f9_sm.jpeg	673265	70	5
MA	1999	Strong Ale - American	3.62699999999999978	Imperial Steel Rail	https://untappd.akamaized.net/site/beer_logos/beer-853603_d0929_sm.jpeg	853603	0	9.90000000000000036
MA	1999	IPA - American	3.35899999999999999	SESSION IPA- Brewer's Series #2	https://untappd.akamaized.net/site/beer_logos/beer-746462_68e8f_sm.jpeg	746462	47	4
MA	1999	IPA - American	3.48099999999999987	Blonde IPA - Brewer's Series #3	https://untappd.akamaized.net/site/beer_logos/beer-951135_d9620_sm.jpeg	951135	60	7.40000000000000036
MA	1999	Saison / Farmhouse Ale	3.58800000000000008	Farmhouse IPA - Brewer's Series #4	https://untappd.akamaized.net/site/beer_logos/beer-1075598_f6448_sm.jpeg	1075598	45	6.29999999999999982
MA	1999	Scotch Ale / Wee Heavy	4.0259999999999998	Gude Greg's Wee Heavy Private Reserve Bourbon Barrel Aged Scotch Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	11657	29	8.30000000000000071
MA	1999	Lager - IPL (India Pale Lager)	3.53200000000000003	Brewer's Series #6 IPL	https://untappd.akamaized.net/site/beer_logos/beer-1168830_10eb9_sm.jpeg	1168830	0	0
MA	1999	Porter - Other	3.625	Mount Greylock Porter	https://untappd.akamaized.net/site/beer_logos/beer-912291_c982c_sm.jpeg	912291	0	6.20000000000000018
MA	634	IPA - American	3.52099999999999991	Harpoon IPA	https://untappd.akamaized.net/site/beer_logos/beer-5928_9a6d4_sm.jpeg	5928	42	5.90000000000000036
MA	634	Witbier	3.58599999999999985	UFO White	https://untappd.akamaized.net/site/beer_logos/beer-ufoWhite.jpg	5968	11	4.79999999999999982
MA	634	Pumpkin / Yam Beer	3.57600000000000007	UFO Pumpkin	https://untappd.akamaized.net/site/beer_logos/beer-UFOPumpkin_64417.jpeg	64417	20	5.90000000000000036
MA	634	Winter Warmer	3.55200000000000005	Harpoon Winter Warmer	https://untappd.akamaized.net/site/beer_logos/beer-5425_56ca4_sm.jpeg	5425	23	5.90000000000000036
MA	634	Shandy / Radler	3.39599999999999991	UFO Big Squeeze Shandy	https://untappd.akamaized.net/site/beer_logos/beer-_560908_sm.jpeg	560908	11	4.5
MA	634	Kölsch	3.34399999999999986	Harpoon Summer Beer	https://untappd.akamaized.net/site/beer_logos/beer-_6723_sm_24724ab4a3e2d1e2fcdcf1de66001f.jpeg	6723	22	4.79999999999999982
MA	634	Märzen	3.44499999999999984	Harpoon Octoberfest	https://untappd.akamaized.net/site/beer_logos/beer-6261_d4818_sm.jpeg	6261	30	5.29999999999999982
MA	634	Pale Ale - American	3.69499999999999984	Camp Wannamango	https://untappd.akamaized.net/site/beer_logos/beer-1387105_46b87_sm.jpeg	1387105	22	5
MA	634	IPA - White	3.54400000000000004	The Long Thaw White IPA	https://untappd.akamaized.net/site/beer_logos/beer-_484269_sm_23deaf3dbbcd0d7839dc4676dbde6d.jpeg	484269	45	6.20000000000000018
MA	634	IPA - Imperial / Double	3.83499999999999996	Leviathan IPA	https://untappd.akamaized.net/site/beer_logos/beer-_5834_sm_6830b9868a7b4e71b3fab0af194b2a.jpeg	5834	90	10
MA	634	Hefeweizen	3.45199999999999996	UFO RAZ - Raspberry Ale Zinger	https://untappd.akamaized.net/site/beer_logos/beer-4978_a1f00_sm.jpeg	4978	10	4.79999999999999982
MA	634	Rye IPA	3.59399999999999986	Harpoon Rich & Dan's Rye IPA	https://untappd.akamaized.net/site/beer_logos/beer-_149119_sm_eab15961a8fdec533ee94afd805e3d.jpeg	149119	70	6.90000000000000036
MA	634	IPA - Session / India Session Ale	3.57799999999999985	Take 5 Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-1017330_56e76_sm.jpeg	1017330	43	4.29999999999999982
MA	634	Hefeweizen	3.45800000000000018	UFO Hefeweizen	https://untappd.akamaized.net/site/beer_logos/beer-harpoonUFO.jpg	6721	18	4.79999999999999982
MA	634	Winter Ale	3.35599999999999987	UFO Gingerland	https://untappd.akamaized.net/site/beer_logos/beer-819640_8e32d_sm.jpeg	819640	11	5.20000000000000018
MA	634	Stout - American	3.70000000000000018	Chocolate Stout	https://untappd.akamaized.net/site/beer_logos/beer-_9062_sm_4ebb9f05c919c60b50d8d63ab45a63.jpeg	9062	35	5.90000000000000036
MA	634	Red Ale - American Amber / Red	3.66599999999999993	Flannel Friday	https://untappd.akamaized.net/site/beer_logos/beer-1529271_f6870_sm.jpeg	1529271	35	5.70000000000000018
MA	634	Cider	3.25700000000000012	Harpoon Craft Cider	https://untappd.akamaized.net/site/beer_logos/beer-_7760_sm_fd5051a363a27a32afb34401bffd91.jpeg	7760	0	4.79999999999999982
MA	634	Golden Ale	3.41400000000000015	Sweet Spot	https://untappd.akamaized.net/site/beer_logos/beer-1433829_4c0c5_sm.jpeg	1433829	26	4.79999999999999982
MA	634	IPA - Imperial / Double	3.85000000000000009	Hoppy Adventure	https://untappd.akamaized.net/site/beer_logos/beer-1255285_90d6d_sm.jpeg	1255285	58	7.79999999999999982
MA	634	Stout - Irish Dry	3.59799999999999986	Harpoon Boston Irish Stout	https://untappd.akamaized.net/site/beer_logos/beer-_295076_sm_28ec70028fb0549386661a18258e76.jpeg	295076	30	4.29999999999999982
MA	634	Red Ale - Irish	3.40399999999999991	Harpoon Celtic Red	https://untappd.akamaized.net/site/beer_logos/beer-_5106_sm_eb802cba16825dc5945aceef990590.jpeg	5106	26	5.40000000000000036
MA	634	Lager - Dunkel Munich	3.56499999999999995	Harpoon Dark	https://untappd.akamaized.net/site/beer_logos/beer-Dark_153503.jpeg	153503	35	5.5
MA	634	Cider	3.36100000000000021	Harpoon Pumpkin Cider	https://untappd.akamaized.net/site/beer_logos/beer-PumpkinCider_204818.jpeg	204818	0	4.79999999999999982
VT	801	Altbier	3.55900000000000016	Double Bag	https://untappd.akamaized.net/site/beer_logos/beer-8700_5b0a5_sm.jpeg	8700	39	7.20000000000000018
VT	801	IPA - American	3.70400000000000018	Green Blaze IPA	https://untappd.akamaized.net/site/beer_logos/beer-1442082_3bfde_sm.jpeg	1442082	60	6.5
VT	801	Brown Ale - American	3.45699999999999985	Sick Day	https://untappd.akamaized.net/site/beer_logos/beer-749086_74e92_sm.jpeg	749086	65	6.79999999999999982
VT	801	Witbier	3.46600000000000019	Mostly Cloudy	https://untappd.akamaized.net/site/beer_logos/beer-606226_a9cf0_sm.jpeg	606226	12	4.70000000000000018
VT	801	IPA - Imperial / Double	3.95400000000000018	Space Juice	https://untappd.akamaized.net/site/beer_logos/beer-968109_20a3a_sm.jpeg	968109	82	8.69999999999999929
VT	801	Brown Ale - American	3.39000000000000012	Harvest	https://untappd.akamaized.net/site/beer_logos/beer-6191_9d302_sm.jpeg	6191	18	4.40000000000000036
VT	801	Pumpkin / Yam Beer	3.32399999999999984	Pumpkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-211016_a400e_sm.jpeg	211016	28	5
VT	801	Golden Ale	3.39299999999999979	Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-627402_94f14_sm.jpeg	627402	32	4.29999999999999982
VT	801	Pale Ale - American	3.41999999999999993	Stand Out	https://untappd.akamaized.net/site/beer_logos/beer-936524_cb1b3_sm.jpeg	936524	42	5.20000000000000018
VT	801	Stout - American	3.82299999999999995	Unearthed	https://untappd.akamaized.net/site/beer_logos/beer-1360934_ca1c1_sm.jpeg	1360934	58	7.90000000000000036
VT	801	Sour - Gose	3.63700000000000001	Cranberry Gose	https://untappd.akamaized.net/site/beer_logos/beer-1371506_1c02e_sm.jpeg	1371506	8	5.20000000000000018
VT	801	Pale Wheat Ale - American	3.28500000000000014	Blackbeary Wheat	https://untappd.akamaized.net/site/beer_logos/beer-7702_126fc_sm.jpeg	7702	15	4.20000000000000018
VT	801	IPA - American	3.72699999999999987	Citrus Limbo IPA	https://untappd.akamaized.net/site/beer_logos/beer-1674534_93dbe_sm.jpeg	1674534	80	7.59999999999999964
VT	801	Scottish Ale	3.379	Hibernator	https://untappd.akamaized.net/site/beer_logos/beer-7227_c67ca_sm.jpeg	7227	35	5.79999999999999982
VT	801	IPA - American	3.60899999999999999	Farmhouse Collection American IPA	https://untappd.akamaized.net/site/beer_logos/beer-460447_2a508_sm.jpeg	460447	70	6.40000000000000036
VT	801	Strong Ale - American	3.78600000000000003	Triple Bag	https://untappd.akamaized.net/site/beer_logos/beer-26517_c874c_sm.jpeg	26517	65	11
VT	801	IPA - Session / India Session Ale	3.54599999999999982	Farmhouse Collection Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-460230_6527b_sm.jpeg	460230	40	4.75
VT	801	Other	3.53699999999999992	SMaSH Project #3 Munich/Equinox	https://untappd.akamaized.net/site/beer_logos/beer-1413328_b4a34_sm.jpeg	1413328	35	6.79999999999999982
VT	801	Pilsner - Other	3.64599999999999991	SMaSH Project #1 Pilsner/Galaxy	https://untappd.akamaized.net/site/beer_logos/beer-1104614_67325_sm.jpeg	1104614	40	6.79999999999999982
VT	801	Other	3.86699999999999999	SMaSH Project #4 Golden Promise/Citra	https://untappd.akamaized.net/site/beer_logos/beer-1548305_de0d0_sm.jpeg	1548305	58	6.79999999999999982
VT	801	Other	3.77899999999999991	SMaSH Project #2 Maris Otter/Mosaic	https://untappd.akamaized.net/site/beer_logos/beer-1336369_c8060_sm.jpeg	1336369	52	6.79999999999999982
VT	801	IPA - Black / Cascadian Dark Ale	3.54300000000000015	Farmhouse Ales Series Black Rye IPA	https://untappd.akamaized.net/site/beer_logos/beer-415383_70633_sm.jpeg	415383	48	6.29999999999999982
VT	801	IPA - English	3.60599999999999987	Flyin Ryan IPA	https://untappd.akamaized.net/site/beer_logos/beer-798377_26d65_sm.jpeg	798377	48	6
\N	49	Red Ale - Irish	3.52000000000000002	Smithwick's	https://untappd.akamaized.net/site/beer_logos/beer-13388_02315_sm.jpeg	13388	0	4.5
\N	49	Lager - Euro	3.2669999999999999	Harp Premium Lager	https://untappd.akamaized.net/site/beer_logos/beer-harpLager.jpg	3948	21	4.5
\N	49	Lager - Pale	3.20900000000000007	Guinness Blonde American Lager	https://untappd.akamaized.net/site/beer_logos/beer-733099_13123_sm.jpeg	733099	21	5
\N	49	Red Ale - Irish	3.42700000000000005	Kilkenny	https://untappd.akamaized.net/site/beer_logos/beer-6337_57132_sm.jpeg	6337	0	4.29999999999999982
\N	49	IPA - English	3.05600000000000005	Nitro IPA	https://untappd.akamaized.net/site/beer_logos/beer-1134931_3822c_sm.jpeg	1134931	44	5.79999999999999982
\N	49	Lager - Euro Dark	3.28399999999999981	Guinness Black Lager	https://untappd.akamaized.net/site/beer_logos/beer-GuinnessBlackLager_23125.jpeg	23125	22	4.5
\N	49	Stout - Foreign / Export	3.67899999999999983	Guinness Foreign Extra Stout	https://untappd.akamaized.net/site/beer_logos/beer-1199_0ae42_sm.jpeg	1199	47	7.5
\N	49	Porter - Other	3.6080000000000001	West Indies Porter	https://untappd.akamaized.net/site/beer_logos/beer-800349_9c316_sm.jpeg	800349	50	6
\N	49	Porter - Other	3.31800000000000006	Dublin Porter	https://untappd.akamaized.net/site/beer_logos/beer-800412_f9c91_sm.jpeg	800412	30	3.79999999999999982
\N	49	Pale Ale - English	3.32399999999999984	Smithwick’s Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-SmithwicksPaleAle_139359.jpeg	139359	0	4.5
\N	49	Lager - Pale	3.43699999999999983	Hop House 13 Lager	https://untappd.akamaized.net/site/beer_logos/beer-989661_5680d_sm.jpeg	989661	0	4.09999999999999964
\N	49	Stout - Irish Dry	3.57900000000000018	Guinness Original (Europe)	https://untappd.akamaized.net/site/beer_logos/beer-80574_e898c_sm.jpeg	80574	0	4.20000000000000018
\N	49	Rye Beer	3.47299999999999986	Guinness Rye Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-1725038_7c324_sm.jpeg	1725038	18	5
\N	49	Golden Ale	3.24800000000000022	Guinness Golden Ale	https://untappd.akamaized.net/site/beer_logos/beer-1021213_43378_sm.jpeg	1021213	4	4.5
\N	49	Stout - Foreign / Export	3.72100000000000009	Antwerpen Stout	https://untappd.akamaized.net/site/beer_logos/beer-1737402_449ca_sm.jpeg	1737402	52	8
\N	49	Stout - Foreign / Export	3.52499999999999991	Guinness Special Export	https://untappd.akamaized.net/site/beer_logos/beer-12720_6a35d_sm.jpeg	12720	0	8
\N	49	Winter Ale	3.34799999999999986	Generous Ale	https://untappd.akamaized.net/site/beer_logos/beer-_198381_a4e0d9c88f3f34f0536256e60d46.jpeg	198381	0	5.59999999999999964
\N	49	Winter Ale	3.379	Smithwick's Winter Spirit	https://untappd.akamaized.net/site/beer_logos/beer-459709_e04bd_sm.jpeg	459709	28	4.5
\N	49	Red Ale - Imperial / Double	4.01400000000000023	The 1759	https://untappd.akamaized.net/site/beer_logos/beer-822461_2e9b5_sm.jpeg	822461	57	9
\N	49	Stout - Irish Dry	3.56700000000000017	Guinness Original XX	https://untappd.akamaized.net/site/beer_logos/beer-1103018_773d3_sm.jpeg	1103018	0	4.20000000000000018
\N	49	Blonde Ale	3.37400000000000011	Smithwick's Blonde Brewmaster Edition	https://untappd.akamaized.net/site/beer_logos/beer-912731_5cbf2_sm.jpeg	912731	0	4.09999999999999964
\N	49	Non-Alcoholic	1.91700000000000004	Kaliber	https://untappd.akamaized.net/site/beer_logos/beer-24952_75cf6_sm.jpeg	24952	0	0
\N	49	Witbier	3.50300000000000011	Irish Wheat	https://untappd.akamaized.net/site/beer_logos/beer-1933494_e0f70_sm.jpeg	1933494	0	5.29999999999999982
\N	49	Stout - Milk / Sweet	3.70000000000000018	Guinness Milk Stout	https://untappd.akamaized.net/site/beer_logos/beer-1930386_e6665_sm.jpeg	1930386	0	5
HI	1988	Lager - Pale	3.39100000000000001	Longboard Island Lager	https://untappd.akamaized.net/site/beer_logos/beer-13560_ea574_sm.jpeg	13560	20	4.59999999999999964
HI	1988	IPA - American	3.54499999999999993	Castaway IPA	https://untappd.akamaized.net/site/beer_logos/beer-24589_fbf14_sm.jpeg	24589	65	6
HI	1988	Pale Ale - American	3.46300000000000008	Fire Rock	https://untappd.akamaized.net/site/beer_logos/beer-FireRock_8843.jpeg	8843	35	5.79999999999999982
HI	1988	Brown Ale - American	3.64500000000000002	Koko Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-29489_2ad66_sm.jpeg	29489	28	5.5
HI	1988	Porter - American	3.69399999999999995	Pipeline Porter	https://untappd.akamaized.net/site/beer_logos/beer-8062_72939_sm.jpeg	8062	23	5.29999999999999982
HI	1988	Pale Wheat Ale - American	3.47500000000000009	Wailua Wheat	https://untappd.akamaized.net/site/beer_logos/beer-_4863_sm_e35936a34ddc0c0ed2f40847fedd00.jpeg	4863	15	5.40000000000000036
HI	1988	Spiced / Herbed Beer	3.52800000000000002	Lemongrass Luau	https://untappd.akamaized.net/site/beer_logos/beer-67420_ec90d_sm.jpeg	67420	0	5
HI	1988	Red Ale - American Amber / Red	3.55900000000000016	Lavaman Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-LavamanRedAle_30021.jpeg	30021	30	5.59999999999999964
HI	1988	IPA - American	3.70500000000000007	Hanalei Island IPA	https://untappd.akamaized.net/site/beer_logos/beer-1604713_bf809_sm.jpeg	1604713	40	4.5
HI	1988	Porter - American	3.74699999999999989	Black Sand Porter	https://untappd.akamaized.net/site/beer_logos/beer-1151_31145_sm.jpeg	1151	45	6.5
HI	1988	IPA - American	3.73499999999999988	Kua Bay IPA	https://untappd.akamaized.net/site/beer_logos/beer-760979_8b77d_sm.jpeg	760979	68	7
HI	1988	Blonde Ale	3.35499999999999998	Duke's Blonde Ale	https://untappd.akamaized.net/site/beer_logos/beer-DukesBlondeAle_30866.jpeg	30866	0	5
HI	1988	Hefeweizen	3.68900000000000006	Hula Hefeweizen	https://untappd.akamaized.net/site/beer_logos/beer-46671_8c0a3_sm.jpeg	46671	18	5
HI	1988	Pale Wheat Ale - American	3.39599999999999991	Whale Ale	https://untappd.akamaized.net/site/beer_logos/beer-_498452_sm.jpeg	498452	0	6
HI	1988	Brown Ale - American	3.62300000000000022	Coco Loco Toasted Coconut Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-CocoLocoToastedCoconutBrownAle_11267.jpeg	11267	0	5.20000000000000018
HI	1988	Saison / Farmhouse Ale	3.62300000000000022	Magic Sands	https://untappd.akamaized.net/site/beer_logos/beer-814067_10600_sm.jpeg	814067	18	5.5
HI	1988	Stout - Russian Imperial	3.94399999999999995	Da Grind Buzz Kona Coffee Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-DaGrindBuzzKonaCoffeeImperialStout_23703.jpeg	23703	0	8.5
HI	1988	Red Ale - American Amber / Red	3.61699999999999999	Wela Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-1025666_7dd22_sm.jpeg	1025666	25	5
HI	1988	Stout - Russian Imperial	3.92399999999999993	Vanilla Thrilla	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	208793	0	8
HI	1988	Barleywine - American	3.75499999999999989	Old Blowhole Barley Wine	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	59256	0	12.5
HI	1988	IPA - American	3.79000000000000004	Pacifier IPA	https://untappd.akamaized.net/site/beer_logos/beer-PacifierIPA_58871.jpeg	58871	0	6.79999999999999982
HI	1988	Brown Ale - American	3.71300000000000008	Aina Brown Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1014930	29	5.90000000000000036
HI	1988	Pale Wheat Ale - American	3.58000000000000007	Makani Wheat Ale	https://untappd.akamaized.net/site/beer_logos/beer-1295602_689a9_sm.jpeg	1295602	15	4.5
HI	1988	Red Ale - American Amber / Red	3.72100000000000009	Sail Away	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	409284	50	6.40000000000000036
CA	4339	Fruit Beer	3.49500000000000011	Hell or High Watermelon	https://untappd.akamaized.net/site/beer_logos/beer-7044_70402_sm.jpeg	7044	17	4.90000000000000036
CA	4339	IPA - American	3.78399999999999981	Brew Free! or Die IPA	https://untappd.akamaized.net/site/beer_logos/beer-3985_68c88_sm.jpeg	3985	70	7
CA	4339	IPA - Black / Cascadian Dark Ale	3.74900000000000011	Back in Black	https://untappd.akamaized.net/site/beer_logos/beer-6443_ae5e9_sm.jpeg	6443	65	6.79999999999999982
CA	4339	Winter Ale	3.64500000000000002	Fireside Chat	https://untappd.akamaized.net/site/beer_logos/beer-7468_b8213_sm.jpeg	7468	45	7.90000000000000036
CA	4339	IPA - Session / India Session Ale	3.72299999999999986	Down To Earth	https://untappd.akamaized.net/site/beer_logos/beer-1008678_1be46_sm.jpeg	1008678	42	4.40000000000000036
CA	4339	IPA - Red	3.7589999999999999	Toaster Pastry	https://untappd.akamaized.net/site/beer_logos/beer-1200307_8f2ed_sm.jpeg	1200307	74	7.59999999999999964
CA	4339	IPA - Imperial / Double	3.96899999999999986	Hop Crisis	https://untappd.akamaized.net/site/beer_logos/beer-6911_8bacc_sm.jpeg	6911	94	9.69999999999999929
CA	4339	Saison / Farmhouse Ale	3.48200000000000021	Sneak Attack	https://untappd.akamaized.net/site/beer_logos/beer-244212_90e59_sm.jpeg	244212	38	6.20000000000000018
CA	4339	Belgian Strong Dark Ale	3.81000000000000005	Monk's Blood	https://untappd.akamaized.net/site/beer_logos/beer-10485_c1073_sm.jpeg	10485	34	8.30000000000000071
CA	4339	Barleywine - American	3.79899999999999993	Lower De Boom	https://untappd.akamaized.net/site/beer_logos/beer-_310490_70e6d93ab23e6c7e4237df6c46c1.jpeg	310490	92	11.5
CA	4339	Pumpkin / Yam Beer	3.621	He Said (Belgian-Style Tripel)	https://untappd.akamaized.net/site/beer_logos/beer-_435340_sm_699d3df29934438781c35ab6077fed.jpeg	435340	0	8.19999999999999929
CA	4339	Pumpkin / Yam Beer	3.58400000000000007	He Said (Baltic Porter)	https://untappd.akamaized.net/site/beer_logos/beer-_435314_sm_3a03dd9f1866d6136e69895f86d20e.jpeg	435314	0	8.19999999999999929
CA	4339	Stout - Oyster	3.79700000000000015	Marooned On Hog Island	https://untappd.akamaized.net/site/beer_logos/beer-_271519_ced11db9a186dff12f7e42cf2be2.jpeg	271519	0	7.90000000000000036
CA	4339	IPA - Imperial / Double	3.86500000000000021	Blah Blah Blah IPA	https://untappd.akamaized.net/site/beer_logos/beer-823714_ac2f6_sm.jpeg	823714	65	8
CA	4339	IPA - American	3.88600000000000012	Brew Free! or Die IPA (Blood Orange)	https://untappd.akamaized.net/site/beer_logos/beer-1918666_fa569_sm.jpeg	1918666	70	7
CA	4339	Scotch Ale / Wee Heavy	3.62300000000000022	Kilt By Wildfire	https://untappd.akamaized.net/site/beer_logos/beer-939317_2fef4_sm.jpeg	939317	40	8.5
CA	4339	Spiced / Herbed Beer	3.72199999999999998	El Camino (un)Real	https://untappd.akamaized.net/site/beer_logos/beer-1815376_6f7ed_sm.jpeg	1815376	101	9.5
CA	4339	IPA - American	3.71899999999999986	Gigantes IPA	https://untappd.akamaized.net/site/beer_logos/beer-GigantesIPA_47003.jpeg	47003	65	6.40000000000000036
CA	4339	Stout - American	3.60499999999999998	MCA Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	193054	27	4.70000000000000018
CA	4339	IPA - American	3.75700000000000012	San Leandro Batch 0001	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1150707	68	7
CA	4339	Porter - Other	3.67300000000000004	Almond Milk Porter	https://untappd.akamaized.net/site/beer_logos/beer-510025_14e02_sm.jpeg	510025	40	7.59999999999999964
CA	4339	Pale Ale - American	3.53600000000000003	5-South	https://untappd.akamaized.net/site/beer_logos/beer-5South_31036.jpeg	31036	38	5.70000000000000018
CA	4339	Belgian Tripel	3.64800000000000013	Good Things	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1214166	40	8
CA	4339	Blonde Ale	3.32200000000000006	South Park Blonde	https://untappd.akamaized.net/site/beer_logos/beer-SouthParkBlonde_3978.jpeg	3978	17	5.09999999999999964
PA	2583	Red Ale - Imperial / Double	4.03099999999999969	Nugget Nectar	https://untappd.akamaized.net/site/beer_logos/beer-3757_1b370_sm.jpeg	3757	93	7.5
PA	2583	IPA - American	3.83599999999999985	Perpetual IPA	https://untappd.akamaized.net/site/beer_logos/beer-71016_931ae_sm.jpeg	71016	85	7.5
PA	2583	Belgian Strong Dark Ale	3.8530000000000002	Mad Elf	https://untappd.akamaized.net/site/beer_logos/beer-17568_cc38d_sm.jpeg	17568	15	11
PA	2583	Doppelbock 	3.77000000000000002	Troegenator Doublebock	https://untappd.akamaized.net/site/beer_logos/beer-31961_6d39b_sm.jpeg	31961	25	8.19999999999999929
PA	2583	Red Ale - American Amber / Red	3.5950000000000002	HopBack Amber Ale	https://untappd.akamaized.net/site/beer_logos/beer-9350_1d4a9_sm.jpeg	9350	55	6
PA	2583	IPA - American	3.81899999999999995	Hop Knife	https://untappd.akamaized.net/site/beer_logos/beer-551620_97486_sm.jpeg	551620	87	6.20000000000000018
PA	2583	IPA - American	3.79300000000000015	Blizzard of Hops	https://untappd.akamaized.net/site/beer_logos/beer-533372_e6293_sm.jpeg	533372	80	6.40000000000000036
PA	2583	Hefeweizen	3.52700000000000014	DreamWeaver Wheat	https://untappd.akamaized.net/site/beer_logos/beer-31284_8ffc8_sm.jpeg	31284	15	4.79999999999999982
PA	2583	Stout - American	3.69799999999999995	JavaHead Stout	https://untappd.akamaized.net/site/beer_logos/beer-35651_240fd_sm.jpeg	35651	60	7.5
PA	2583	Pilsner - German	3.41999999999999993	Sunshine Pils	https://untappd.akamaized.net/site/beer_logos/beer-3841_33d3a_sm.jpeg	3841	45	4.5
PA	2583	IPA - Imperial / Double	4.18799999999999972	Nimble Giant	https://untappd.akamaized.net/site/beer_logos/beer-1175576_ba29d_sm.jpeg	1175576	69	9
PA	2583	Pale Ale - American	3.64000000000000012	Solid Sender Ale	https://untappd.akamaized.net/site/beer_logos/beer-1300456_56cfd_sm.jpeg	1300456	45	5.20000000000000018
PA	2583	Belgian Tripel	3.82600000000000007	LaGrave	https://untappd.akamaized.net/site/beer_logos/beer-445874_7b5a5_sm.jpeg	445874	31	8
PA	2583	IPA - American	3.81999999999999984	First Cut 	https://untappd.akamaized.net/site/beer_logos/beer-1933463_cd94e_sm.jpeg	1933463	45	6.20000000000000018
PA	2583	Pumpkin / Yam Beer	3.71300000000000008	Master of Pumpkins	https://untappd.akamaized.net/site/beer_logos/beer-457366_98898_sm.jpeg	457366	30	7.90000000000000036
PA	2583	Porter - American	3.57200000000000006	Dead Reckoning Porter	https://untappd.akamaized.net/site/beer_logos/beer-3750_3dacf_sm.jpeg	3750	53	5.40000000000000036
PA	2583	Belgian Dubbel	3.78500000000000014	Jovial	https://untappd.akamaized.net/site/beer_logos/beer-702361_d6153_sm.jpeg	702361	13	7
PA	2583	Stout - Milk / Sweet	3.88899999999999979	Scratch 212 - Chocolate Stout	https://untappd.akamaized.net/site/beer_logos/beer-1300468_e1588_sm.jpeg	1300468	41	7.09999999999999964
PA	2583	Barleywine - American	3.84799999999999986	Flying Mouflan	https://untappd.akamaized.net/site/beer_logos/beer-troegFlyingMouflen.jpg	5278	100	9.30000000000000071
PA	2583	Sour - Gose	3.60599999999999987	Scratch 235 - Gose	https://untappd.akamaized.net/site/beer_logos/beer-1512453_55c2e_sm.jpeg	1512453	10	4.5
PA	2583	Belgian Strong Dark Ale	3.89000000000000012	Naked Elf	https://untappd.akamaized.net/site/beer_logos/beer-211879_c1e7a_sm.jpeg	211879	17	7.5
PA	2583	Stout - Russian Imperial	3.95999999999999996	Impending Descent	https://untappd.akamaized.net/site/beer_logos/beer-517616_12aec_sm.jpeg	517616	90	9.09999999999999964
PA	2583	Stout - Oatmeal	4.06500000000000039	Scratch 231 - Chocolate Stout (nitro)	https://untappd.akamaized.net/site/beer_logos/beer-1473404_5134e_sm.jpeg	1473404	41	7.09999999999999964
PA	2583	Saison / Farmhouse Ale	3.73799999999999999	Scratch 227 - French Style Saison	https://untappd.akamaized.net/site/beer_logos/beer-1426364_ea74b_sm.jpeg	1426364	18	6.5
NY	259	IPA - English	3.55500000000000016	Brooklyn East IPA	https://untappd.akamaized.net/site/beer_logos/beer-EastIndiaPaleAleIPA_1826.jpeg	1826	47	6.90000000000000036
NY	259	Pale Ale - English	3.46899999999999986	Brooklyn Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-5571_c526e_sm.jpeg	5571	18	5
NY	259	Stout - Russian Imperial	3.85199999999999987	Black Chocolate Stout	https://untappd.akamaized.net/site/beer_logos/beer-37235_5f3d1_sm.jpeg	37235	51	10
NY	259	Brown Ale - American	3.50800000000000001	Brooklyn Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-3557_cf2bf_sm.jpeg	3557	30	5.59999999999999964
NY	259	IPA - Imperial / Double	3.80900000000000016	Brooklyn Blast!	https://untappd.akamaized.net/site/beer_logos/beer-9368_2db3d_sm.jpeg	9368	53	8.40000000000000036
NY	259	Pumpkin / Yam Beer	3.26799999999999979	Post Road Pumpkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-6167_0d74f_sm.jpeg	6167	24	5
NY	259	Märzen	3.49500000000000011	Brooklyn Oktoberfest	https://untappd.akamaized.net/site/beer_logos/beer-6154_8c520_sm.jpeg	6154	25	5.5
NY	259	Winter Ale	3.39000000000000012	Brooklyn Winter Ale	https://untappd.akamaized.net/site/beer_logos/beer-BrooklynBreweryWinterAle.jpg	8326	25	6.09999999999999964
NY	259	Belgian Strong Golden Ale	3.80799999999999983	Brooklyn Local 1	https://untappd.akamaized.net/site/beer_logos/beer-BrooklynBreweryLocal1.jpg	5048	26	9
NY	259	Pale Ale - American	3.34600000000000009	American Ale	https://untappd.akamaized.net/site/beer_logos/beer-41167_3aa78_sm.jpeg	41167	0	4.5
NY	259	Saison / Farmhouse Ale	3.12000000000000011	Brooklyn 1/2 Ale	https://untappd.akamaized.net/site/beer_logos/beer-524677_3a573_sm.jpeg	524677	0	3.39999999999999991
NY	259	IPA - Session / India Session Ale	3.43199999999999994	Scorcher IPA	https://untappd.akamaized.net/site/beer_logos/beer-1124084_a194f_sm.jpeg	1124084	0	4.5
NY	259	Pilsner - Other	3.32699999999999996	Brooklyn Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-6155_67773_sm.jpeg	6155	33	5.09999999999999964
NY	259	Pale Ale - English	3.35999999999999988	Brooklyn Pennant Ale '55	https://untappd.akamaized.net/site/beer_logos/beer-BrooklynBreweryPennant.jpg	6374	24	5
NY	259	Lager - Euro Dark	3.53399999999999981	Insulated Lager	https://untappd.akamaized.net/site/beer_logos/beer-1199375_83c41_sm.jpeg	1199375	0	5.59999999999999964
NY	259	Stout - Irish Dry	3.45500000000000007	Brooklyn Dry Irish Stout	https://untappd.akamaized.net/site/beer_logos/beer-DryIrishStout_40989.jpeg	40989	0	4.70000000000000018
NY	259	Stout - Russian Imperial	4.14100000000000001	Black Ops	https://untappd.akamaized.net/site/beer_logos/beer-BlackOps_28809.jpeg	28809	0	10.5
NY	259	Sour - Ale	3.76100000000000012	Bel Air Sour	https://untappd.akamaized.net/site/beer_logos/beer-1181009_57fa6_sm.jpeg	1181009	0	5.79999999999999982
NY	259	Belgian Strong Dark Ale	3.85700000000000021	Brooklyn Local 2	https://untappd.akamaized.net/site/beer_logos/beer-BrooklynBreweryLocal2.jpg	5375	21	9
NY	259	IPA - American	3.69300000000000006	Defender IPA	https://untappd.akamaized.net/site/beer_logos/beer-1488846_e940b_sm.jpeg	1488846	67	6.70000000000000018
NY	259	Pale Ale - American	3.41900000000000004	Shackmeister Ale	https://untappd.akamaized.net/site/beer_logos/beer-13470_2a601_sm.jpeg	13470	0	4.79999999999999982
NY	259	Pale Wheat Ale - American	3.52899999999999991	Brooklyn Greenmarket Wheat	https://untappd.akamaized.net/site/beer_logos/beer-342498_9bac7_sm.jpeg	342498	0	5
NY	259	Porter - Imperial / Double	4.02400000000000002	Intensified Barrel-Aged Coffee Porter	https://untappd.akamaized.net/site/beer_logos/beer-1215065_c02b6_sm.jpeg	1215065	0	11.8000000000000007
CA	16185	Porter - American	4.01499999999999968	Coffee Porter	https://untappd.akamaized.net/site/beer_logos/beer-718031_444c0_sm.jpeg	718031	0	6
CA	16185	Red Ale - American Amber / Red	3.70199999999999996	Sabre-Toothed Squirrel	https://untappd.akamaized.net/site/beer_logos/beer-135797_93d3e_sm.jpeg	135797	0	7
CA	16185	IPA - American	3.86500000000000021	Hoptonic IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	81731	75	7.29999999999999982
CA	16185	IPA - American	3.9009999999999998	Amarilla Gorilla IPA	https://untappd.akamaized.net/site/beer_logos/beer-295203_90726_sm.jpeg	295203	0	7.79999999999999982
CA	16185	Sour - Ale	4.14499999999999957	Cuddlebug	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1079516	0	4.5
CA	16185	Pilsner - Other	3.38099999999999978	Little Bo Pils	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	172261	0	4.40000000000000036
CA	16185	IPA - American	3.83300000000000018	Grape Ape IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	457066	0	7.09999999999999964
CA	16185	Red Ale - Imperial / Double	3.81099999999999994	California Love	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	567572	0	8.5
CA	16185	Saison / Farmhouse Ale	3.91100000000000003	Kumquat Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	462312	0	6
CA	16185	Sour - Ale	4.28000000000000025	Snugglebug	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1413196	0	4.5
CA	16185	Saison / Farmhouse Ale	3.51399999999999979	L.A. Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	107311	0	5.79999999999999982
CA	16185	Porter - American	3.91500000000000004	Chip Shot Coffee Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	489695	0	6
CA	16185	Barleywine - English	4.14200000000000035	Bourbon Barrel O.E.	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	349911	0	14.0999999999999996
CA	16185	Saison / Farmhouse Ale	3.74900000000000011	Unity	https://untappd.akamaized.net/site/beer_logos/beer-1127925_09407_sm.jpeg	1127925	0	5.29999999999999982
CA	16185	Stout - Imperial / Double	4.29600000000000026	Infinite Wishes	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	945841	0	12
CA	16185	Smoked Beer	3.5299999999999998	Smoked Smaug Lager	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	487235	0	7
CA	16185	IPA - American	3.7280000000000002	Steamfunk Brett IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1076871	0	6.79999999999999982
CA	16185	Sour - Ale	4.10099999999999998	Spittin' & Cussin'	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1358210	0	7.5
CA	16185	Porter - Other	3.82200000000000006	Bloody Knuckle	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	453312	0	6
CA	16185	Golden Ale	3.93900000000000006	Bourbon Barrel Goldie	https://untappd.akamaized.net/site/beer_logos/beer-781838_cde3e_sm.jpeg	781838	0	10.5
CA	16185	Red Ale - American Amber / Red	3.57399999999999984	Hive Five	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	452342	0	7
CA	16185	IPA - Imperial / Double	4.09299999999999997	Death By Hops	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	710317	100	9.40000000000000036
CA	16185	Saison / Farmhouse Ale	3.48200000000000021	Weird Beer	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	238341	0	6.40000000000000036
CA	16185	IPA - American	3.81499999999999995	SteelCraft	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1510432	0	6.79999999999999982
NY	705	Fruit Beer	3.5089999999999999	Apricot Wheat	https://untappd.akamaized.net/site/beer_logos/beer-4868_df8af_sm.jpeg	4868	0	4.90000000000000036
NY	705	Red Ale - American Amber / Red	3.56899999999999995	Cascazilla	https://untappd.akamaized.net/site/beer_logos/beer-4870_7493f_sm.jpeg	4870	0	7
NY	705	Sour - Berliner Weisse	3.28699999999999992	Cayuga Cruiser	https://untappd.akamaized.net/site/beer_logos/beer-627874_4498a_sm.jpeg	627874	0	4.20000000000000018
NY	705	IPA - American	3.49800000000000022	Green Trail	https://untappd.akamaized.net/site/beer_logos/beer-543753_bac0c_sm.jpeg	543753	0	6
NY	705	Stout - Oatmeal	3.71899999999999986	Super Stout	https://untappd.akamaized.net/site/beer_logos/beer-809060_2114e_sm.jpeg	809060	0	4.90000000000000036
NY	705	IPA - Imperial / Double	3.58199999999999985	Excelsior! Anniversary 17	https://untappd.akamaized.net/site/beer_logos/beer-899333_6d637_sm.jpeg	899333	0	8.80000000000000071
NY	705	Brown Ale - English	3.55799999999999983	Nut Brown	https://untappd.akamaized.net/site/beer_logos/beer-4869_618ea_sm.jpeg	4869	0	4.90000000000000036
NY	705	IPA - Imperial / Double	3.94600000000000017	Pacific Gravity	https://untappd.akamaized.net/site/beer_logos/beer-1110477_ff978_sm.jpeg	1110477	80	8.5
NY	705	Pale Wheat Ale - American	3.62000000000000011	Excelsior! White Gold	https://untappd.akamaized.net/site/beer_logos/beer-7756_684a2_sm.jpeg	7756	0	8
NY	705	IPA - Session / India Session Ale	3.61699999999999999	HopKist	https://untappd.akamaized.net/site/beer_logos/beer-1615283_e1f7e_sm.jpeg	1615283	0	4.75
NY	705	Schwarzbier	3.5950000000000002	Midnight Sun	https://untappd.akamaized.net/site/beer_logos/beer-1804307_31807_sm.jpeg	1804307	0	5.5
NY	705	Sour - Berliner Weisse	3.46099999999999985	Raspberry Soiree	https://untappd.akamaized.net/site/beer_logos/beer-1887951_7f3b5_sm.jpeg	1887951	0	4.20000000000000018
NY	705	Porter - Baltic	3.8490000000000002	Excelsior! Anniversary 18	https://untappd.akamaized.net/site/beer_logos/beer-1576811_35f07_sm.jpeg	1576811	25	7
NY	705	Lager - Helles	3.44600000000000017	Hellish Lager	https://untappd.akamaized.net/site/beer_logos/beer-1257898_2508b_sm.jpeg	1257898	0	4.59999999999999964
NY	705	Pilsner - Other	3.44700000000000006	Happy Pils	https://untappd.akamaized.net/site/beer_logos/beer-1238895_2fc1e_sm.jpeg	1238895	0	4.70000000000000018
NY	705	Sour - Berliner Weisse	3.67799999999999994	Excelsior! Cranbretty	https://untappd.akamaized.net/site/beer_logos/beer-545803_1f11f_sm.jpeg	545803	0	4.90000000000000036
NY	705	IPA - American	3.7759999999999998	Grassroots IPA	https://untappd.akamaized.net/site/beer_logos/beer-1154977_18b8c_sm.jpeg	1154977	0	5.5
NY	705	Root Beer	4.12100000000000044	Root Beer Non-Alcoholic Soda	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	135475	0	0
NY	705	Pale Wheat Ale - American	3.97900000000000009	Excelsior! Anniversary 19	https://untappd.akamaized.net/site/beer_logos/beer-1857404_bb257_sm.jpeg	1857404	0	8
NY	705	Ginger Beer	3.90700000000000003	Ginger Beer Non-Alcoholic Soda	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	206015	0	0
NY	705	IPA - Imperial / Double	3.80100000000000016	XIPAA! Naked Pilgrim	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1944127	0	6.40000000000000036
NY	705	IPA - American	4.01400000000000023	Thrusher	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1973888	29	6.40000000000000036
NY	705	Pale Ale - American	3.71300000000000008	Western Denali	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1999528	0	5.20000000000000018
NY	705	Brown Ale - American	3.5	Obi Brown Kenobi	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1986972	31	6.79999999999999982
MA	2302	Pale Ale - American	3.68699999999999983	Bottle Rocket	https://untappd.akamaized.net/site/beer_logos/beer-977008_cf5bf_sm.jpeg	977008	55	5.5
MA	2302	IPA - Imperial / Double	3.97999999999999998	Hopulence	https://untappd.akamaized.net/site/beer_logos/beer-179970_94834_sm.jpeg	179970	120	8.5
MA	2302	Brown Ale - English	3.79199999999999982	Blizzard of '78	https://untappd.akamaized.net/site/beer_logos/beer-1302754_769b6_sm.jpeg	1302754	35	6
MA	2302	Blonde Ale	3.44099999999999984	Blonde Cougar Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-13125_0df86_sm.jpeg	13125	18	5
MA	2302	IPA - Imperial / Double	4.04600000000000026	Buddha's Juice DIPA	https://untappd.akamaized.net/site/beer_logos/beer-271216_7e7c3_sm.jpeg	271216	120	9.5
MA	2302	IPA - American	3.98099999999999987	Be Hoppier	https://untappd.akamaized.net/site/beer_logos/beer-81949_461cd_sm.jpeg	81949	76	8
MA	2302	Pilsner - Other	3.45000000000000018	Punxsutawney Pils	https://untappd.akamaized.net/site/beer_logos/beer-1068702_a2ec0_sm.jpeg	1068702	25	5
MA	2302	Stout - Oatmeal	3.93500000000000005	Sweet Tats	https://untappd.akamaized.net/site/beer_logos/beer-95383_f9500_sm.jpeg	95383	47	9
MA	2302	Pale Ale - American	3.33199999999999985	Seven Hills Session Ale	https://untappd.akamaized.net/site/beer_logos/beer-8489_78524_sm.jpeg	8489	30	4.5
MA	2302	Stout - Russian Imperial	3.97599999999999998	Spies Like Us	https://untappd.akamaized.net/site/beer_logos/beer-1470803_91936_sm.jpeg	1470803	47	10.5
MA	2302	Pumpkin / Yam Beer	3.59699999999999998	Fresh Patch Pumpkin	https://untappd.akamaized.net/site/beer_logos/beer-1224598_75594_sm.jpeg	1224598	18	4.5
MA	2302	Stout - Oatmeal	4.03500000000000014	Norm Chocolate Coconut Stout	https://untappd.akamaized.net/site/beer_logos/beer-_222134_sm_85878136cc3c353e2d2f091b0cb991.jpeg	222134	30	6.79999999999999982
MA	2302	Pumpkin / Yam Beer	3.49800000000000022	Pumpkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-_80921_sm_eefe5be4a20a1e5ff705c8739f632f.jpeg	80921	12	4.29999999999999982
MA	2302	IPA - Triple	4.12899999999999956	Be Hoppiest	https://untappd.akamaized.net/site/beer_logos/beer-1247456_1485e_sm.jpeg	1247456	120	10.8000000000000007
MA	2302	Brown Ale - American	3.56000000000000005	Wintah Ale	https://untappd.akamaized.net/site/beer_logos/beer-_9567_sm_efb6c9e2679f94fe1e2dc536b0735a.jpeg	9567	24	6
MA	2302	Red Ale - Irish	3.4700000000000002	Irish Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-_329017_sm_dc2f3c2786b682501a6a5ed95f6bc5.jpeg	329017	20	5.5
MA	2302	IPA - Triple	4.06500000000000039	Birthday Brew #5	https://untappd.akamaized.net/site/beer_logos/beer-1004545_bd8a4_sm.jpeg	1004545	120	10.6999999999999993
MA	2302	IPA - Imperial / Double	4.01999999999999957	Diner Car	https://untappd.akamaized.net/site/beer_logos/beer-1823423_f4fb9_sm.jpeg	1823423	70	7.70000000000000018
MA	2302	Hefeweizen	3.4740000000000002	Mass Whole	https://untappd.akamaized.net/site/beer_logos/beer-_15292_sm_1f567a8549d623f36f0b40a5615510.jpeg	15292	13	4.90000000000000036
MA	2302	Brown Ale - American	3.68100000000000005	Kola Nut 	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	118747	15	5
MA	2302	Strong Ale - American	3.85199999999999987	Birthday Brew #6	https://untappd.akamaized.net/site/beer_logos/beer-1470578_7ea7e_sm.jpeg	1470578	0	10
MA	2302	Red Ale - American Amber / Red	3.6160000000000001	Ales For ALS: Hoppy Red	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1194944	44	4.59999999999999964
MA	2302	Porter - American	3.8919999999999999	Pro-Am Porter	https://untappd.akamaized.net/site/beer_logos/beer-_48964_sm_976f1377050d74e179e96712d8c95c.jpeg	48964	25	6.79999999999999982
\N	1569	Pilsner - German	3.29800000000000004	Krombacher Pils	https://untappd.akamaized.net/site/beer_logos/beer-Pils_9945.jpeg	9945	0	4.79999999999999982
\N	1569	Hefeweizen	3.48499999999999988	Krombacher Weizen	https://untappd.akamaized.net/site/beer_logos/beer-KrombacherWeizen_11387.jpeg	11387	0	5.29999999999999982
\N	1569	Schwarzbier	3.39100000000000001	Krombacher Dark	https://untappd.akamaized.net/site/beer_logos/beer-KrombacherDark_49132.jpeg	49132	0	4.70000000000000018
\N	1569	Shandy / Radler	2.97199999999999998	Krombacher Radler	https://untappd.akamaized.net/site/beer_logos/beer-Radler_19814.jpeg	19814	0	2.5
\N	1569	Lager - Dunkel Munich	3.31499999999999995	Krombacher Dunkel	https://untappd.akamaized.net/site/beer_logos/beer-153340_922cd_sm.jpeg	153340	0	5
\N	1569	Lager - Helles	3.22699999999999987	Krombacher Hell / Premium Lager	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	579990	0	5
\N	1569	Non-Alcoholic	2.52899999999999991	Krombacher Pils Alkoholfrei	https://untappd.akamaized.net/site/beer_logos/beer-PilsAlkoholfrei_84798.jpeg	84798	0	0.299999999999999989
\N	1569	Kellerbier / Zwickelbier	3.28500000000000014	Krombacher Brautradition: Naturtrübes Kellerbier	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	827818	0	5.09999999999999964
\N	1569	Non-Alcoholic	2.98899999999999988	Krombacher Weizen Alkoholfrei	https://untappd.akamaized.net/site/beer_logos/beer-WeizenAlkoholfrei_84799.jpeg	84799	0	0.400000000000000022
\N	1569	Malt Beer	2.86500000000000021	Vitamalz	https://untappd.akamaized.net/site/beer_logos/beer-289266_d4675_sm.jpeg	289266	0	0
\N	1569	Non-Alcoholic	2.89800000000000013	Krombacher Radler Alkoholfrei	https://untappd.akamaized.net/site/beer_logos/beer-RadlerAlkoholfrei_84800.jpeg	84800	0	0.200000000000000011
\N	1569	Shandy / Radler	2.88499999999999979	Krombacher Weizen-Zitrone Naturtrüb	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1090722	0	2.60000000000000009
\N	1569	Shandy / Radler	2.6419999999999999	Cab Cola & Beer	https://untappd.akamaized.net/site/beer_logos/beer-ColaBeerDragonfruit_159846.jpeg	159846	0	2.5
\N	1569	Dunkelweizen	3.4049999999999998	Krombacher Weizen Dunkel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	361050	0	5.29999999999999982
\N	1569	Shandy / Radler	3.43000000000000016	Krombacher Radler Naturtrüb	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1459556	14	2.5
\N	1569	Non-Alcoholic	2.81099999999999994	Krombacher's Fassbrause Zitrone	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	357029	0	0
\N	1569	Non-Alcoholic	2.89500000000000002	Krombacher Weizen-Zitrone Naturtrüb Alkoholfrei	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1065431	0	0
\N	1569	Kellerbier / Zwickelbier	3.24000000000000021	Krombacher Brautradition: Naturtrübes Dunkel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1910986	0	5
\N	1569	Non-Alcoholic	2.79499999999999993	Krombacher Weizen-Radler Alkoholfrei	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	700603	0	0
\N	1569	Non-Alcoholic	2.75	Krombacher 0,0% Pils	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1958646	0	0
\N	1569	Shandy / Radler	2.74299999999999988	Cab Banana & Beer	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	412381	0	2.5
\N	1569	Kristallweizen 	3.22100000000000009	Krombacher Weizen Kristallklar	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1141178	0	0
\N	1569	Non-Alcoholic	3.17099999999999982	Krombacher Weizen 0,0%	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1995330	0	0
\N	1569	Lager - Dark	3.23799999999999999	Naturtrübes Dunkel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1822558	0	5
\N	1569	Shandy / Radler	0	Cab Lemon & Beer	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	412383	0	2.5
MA	157	Lager - Vienna	3.43000000000000016	Samuel Adams Boston Lager	https://untappd.akamaized.net/site/beer_logos/beer-3914_487c1_sm.jpeg	3914	30	5
MA	157	Märzen	3.60700000000000021	Samuel Adams OctoberFest	https://untappd.akamaized.net/site/beer_logos/beer-3942_dcf0d_sm.jpeg	3942	16	5.29999999999999982
MA	157	Pale Wheat Ale - American	3.38600000000000012	Samuel Adams Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-_3916_sm_2a69f4a012bc330ad111bc2e508cc6.jpeg	3916	7	5.5
MA	157	Lager - Winter	3.43000000000000016	Samuel Adams Winter Lager	https://untappd.akamaized.net/site/beer_logos/beer-3919_7f5f8_sm.jpeg	3919	22	5.59999999999999964
MA	157	Witbier	3.45199999999999996	Samuel Adams Cold Snap	https://untappd.akamaized.net/site/beer_logos/beer-444121_087f6_sm.jpeg	444121	10	5.29999999999999982
MA	157	Shandy / Radler	3.47199999999999998	Samuel Adams Porch Rocker	https://untappd.akamaized.net/site/beer_logos/beer-144918_2b74f_sm.jpeg	144918	8	4.5
MA	157	Witbier	3.37000000000000011	Samuel Adams White Christmas	https://untappd.akamaized.net/site/beer_logos/beer-220198_6473f_sm.jpeg	220198	8	5.79999999999999982
MA	157	Winter Ale	3.37699999999999978	Samuel Adams Old Fezziwig Ale	https://untappd.akamaized.net/site/beer_logos/beer-SamuelAdamsOldFezziwigAle_4050.jpeg	4050	25	5.90000000000000036
MA	157	IPA - Imperial / Double	3.60099999999999998	Samuel Adams Rebel Rouser	https://untappd.akamaized.net/site/beer_logos/beer-812889_2379d_sm.jpeg	812889	85	8.40000000000000036
MA	157	IPA - American	3.47500000000000009	Samuel Adams Rebel Grapefruit IPA	https://untappd.akamaized.net/site/beer_logos/beer-1123051_d30b9_sm.jpeg	1123051	52	6.29999999999999982
MA	157	IPA - White	3.29800000000000004	Samuel Adams Whitewater IPA	https://untappd.akamaized.net/site/beer_logos/beer-_92859_sm_3efcf83e557d2bd2c3aba4f59b5d3c.jpeg	92859	60	5.79999999999999982
MA	157	Bock	3.56700000000000017	Samuel Adams Chocolate Bock	https://untappd.akamaized.net/site/beer_logos/beer-samuelAdamsChocolateBock.jpg	1195	11	5.79999999999999982
MA	157	Pale Ale - Belgian	3.246	Samuel Adams Belgian Session	https://untappd.akamaized.net/site/beer_logos/beer-SamuelAdamsBelgianSession_120273.jpeg	120273	16	4.29999999999999982
MA	157	Pilsner - Czech	3.3530000000000002	Samuel Adams Noble Pils	https://untappd.akamaized.net/site/beer_logos/beer-saNobilePils.jpg	5743	34	4.90000000000000036
MA	157	Kölsch	3.35599999999999987	Samuel Adams Escape Route	https://untappd.akamaized.net/site/beer_logos/beer-_468331_sm_d0e5ea2d08a41324df45837edea5ab.jpeg	468331	30	5
MA	157	Red Ale - Irish	3.35599999999999987	Samuel Adams Irish Red	https://untappd.akamaized.net/site/beer_logos/beer-_4078_sm_4a5fce8d7eeaa849976f4e7656a416.jpeg	4078	25	5.79999999999999982
MA	157	Stout - American Imperial / Double	3.56400000000000006	Samuel Adams Merry Maker Gingerbread Stout	https://untappd.akamaized.net/site/beer_logos/beer-_215565_sm_a4b622d1cdfb800543e8f38f1cd207.jpeg	215565	25	9
MA	157	Lager - IPL (India Pale Lager)	3.45599999999999996	Samuel Adams Double Agent IPL	https://untappd.akamaized.net/site/beer_logos/beer-_259276_5407bcb48935e9c1885ecb731e67.jpeg	259276	43	5
MA	157	Red Ale - American Amber / Red	3.375	Samuel Adams Hoppy Red	https://untappd.akamaized.net/site/beer_logos/beer-763256_e4497_sm.jpeg	763256	44	5.70000000000000018
MA	157	Witbier	3.46200000000000019	Samuel Adams Nitro White Ale	https://untappd.akamaized.net/site/beer_logos/beer-1316853_f9307_sm.jpeg	1316853	15	5.5
MA	157	Pilsner - Other	3.32200000000000006	Samuel Adams Downtime Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-808823_50660_sm.jpeg	808823	30	5
MA	157	Witbier	3.36299999999999999	Samuel Adams White Lantern	https://untappd.akamaized.net/site/beer_logos/beer-_281963_8f0c1e81b20cfd8cd609bd331016.jpeg	281963	10	5.5
MA	157	Stout - American	3.75499999999999989	Samuel Adams Nitro Coffee Stout	https://untappd.akamaized.net/site/beer_logos/beer-1249919_14338_sm.jpeg	1249919	32	5.79999999999999982
CA	234937	Brown Ale - American	4.0259999999999998	Filbert	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1369641	0	6.5
CA	234937	IPA - American	3.69700000000000006	El Mas Guapo	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1500347	0	7.5
CA	234937	Witbier	3.54700000000000015	Cumbersome	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1512101	0	6.29999999999999982
CA	234937	Stout - American	3.72199999999999998	Black Bayou	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1369624	0	7
CA	234937	Pale Ale - American	3.50300000000000011	Cream Cycle	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1369651	0	5.5
CA	234937	IPA - American	3.57900000000000018	Trance Plants IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1390015	134	8.09999999999999964
CA	234937	IPA - Triple	3.84600000000000009	Not Getting Any Younger Triple IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1908806	0	10.5
CA	234937	IPA - Imperial / Double	3.7589999999999999	SumNug	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1369667	0	8.80000000000000071
CA	234937	IPA - Imperial / Double	3.88200000000000012	Melting Faces	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1686956	113	8.80000000000000071
CA	234937	Blonde Ale	3.46499999999999986	Palmdale Poppies	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1369601	0	4.79999999999999982
CA	234937	Brown Ale - American	3.90600000000000014	Filberta	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1541652	0	6.5
CA	234937	Stout - American	3.75499999999999989	Peep Show	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1476979	0	6.90000000000000036
CA	234937	Stout - American Imperial / Double	3.82900000000000018	McJaggery	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1430080	0	9.09999999999999964
CA	234937	Saison / Farmhouse Ale	3.58099999999999996	Secret Pilgrimage	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1500600	0	6.09999999999999964
CA	234937	Porter - Other	3.58800000000000008	Private Line Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1394656	0	8
CA	234937	Fruit Beer	3.44700000000000006	The Boysening	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1460296	0	6.29999999999999982
CA	234937	IPA - American	3.96499999999999986	Hop Goes the Weasel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1573151	0	7.20000000000000018
CA	234937	Saison / Farmhouse Ale	3.6549999999999998	Pour Amour	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1321139	0	5.79999999999999982
CA	234937	Pale Wheat Ale - American	3.27300000000000013	Hitting the Rhubarb	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1605943	0	5.29999999999999982
CA	234937	Pale Ale - American	3.62800000000000011	Soulful Ginger	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1394789	0	6.5
CA	234937	Dark Ale	3.58300000000000018	Loose Moose	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1485044	0	8.5
CA	234937	Stout - Oyster	3.68599999999999994	The Oyster Is My World	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1305535	0	6.29999999999999982
CA	234937	IPA - American	3.70599999999999996	Hops Are A Preservative	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1457827	106	7.20000000000000018
CA	234937	Pale Ale - American	3.56099999999999994	Forbitten Fruit	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1408109	48	6.29999999999999982
NY	15784	Pale Ale - American	3.52899999999999991	Bronx American Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-77455_3e658_sm.jpeg	77455	50	6.29999999999999982
NY	15784	Rye Beer	3.58099999999999996	Bronx Rye Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-214623_980fc_sm.jpeg	214623	58	6.29999999999999982
NY	15784	Pale Ale - American	3.53299999999999992	Bronx Summer Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-374194_c98ca_sm.jpeg	374194	16	5.20000000000000018
NY	15784	IPA - American	3.45100000000000007	Bronx Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-853300_2a26e_sm.jpeg	853300	59	5
NY	15784	IPA - American	3.78100000000000014	No Resolutions	https://untappd.akamaized.net/site/beer_logos/beer-1372403_f378f_sm.jpeg	1372403	50	7.59999999999999964
NY	15784	Pale Ale - Belgian	3.53399999999999981	Bronx Belgian Style Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-326830_6f7e8_sm.jpeg	326830	36	6.70000000000000018
NY	15784	IPA - Black / Cascadian Dark Ale	3.53299999999999992	On The Black	https://untappd.akamaized.net/site/beer_logos/beer-280140_d9593_sm.jpeg	280140	47	5.70000000000000018
NY	15784	Golden Ale	3.30699999999999994	Bronx Banner	https://untappd.akamaized.net/site/beer_logos/beer-1683614_4558f_sm.jpeg	1683614	24	4.79999999999999982
NY	15784	Pale Ale - American	3.52700000000000014	Bronx Winter Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-1276091_07a95_sm.jpeg	1276091	43	6.70000000000000018
NY	15784	Pale Ale - American	3.42099999999999982	Bronx Autumn Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-786252_78b1e_sm.jpeg	786252	48	6.5
NY	15784	IPA - Session / India Session Ale	3.41400000000000015	Slow Your Roll	https://untappd.akamaized.net/site/beer_logos/beer-1739655_734c8_sm.jpeg	1739655	45	4.59999999999999964
NY	15784	Pale Ale - American	3.44499999999999984	Bog Smash	https://untappd.akamaized.net/site/beer_logos/beer-1712757_77c59_sm.jpeg	1712757	35	7
NY	15784	Stout - Milk / Sweet	3.9870000000000001	Uptown Coffee Milk Stout	https://untappd.akamaized.net/site/beer_logos/beer-1368438_eb8d4_sm.jpeg	1368438	36	6.29999999999999982
NY	15784	IPA - Imperial / Double	3.48099999999999987	Name This Beer!	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1798677	0	8.5600000000000005
NY	15784	IPA - White	3.82900000000000018	Boom Boom White IPA	https://untappd.akamaized.net/site/beer_logos/beer-1142230_1c06f_sm.jpeg	1142230	49	8.09999999999999964
NY	15784	Saison / Farmhouse Ale	3.65899999999999981	Say Hey Saison	https://untappd.akamaized.net/site/beer_logos/beer-1526093_93717_sm.jpeg	1526093	30	7.20000000000000018
NY	15784	IPA - White	3.78699999999999992	Red, White & Boom	https://untappd.akamaized.net/site/beer_logos/beer-1663835_158f3_sm.jpeg	1663835	49	8.09999999999999964
NY	15784	Rye Beer	3.83099999999999996	Rye Fidelity	https://untappd.akamaized.net/site/beer_logos/beer-1012518_3da35_sm.jpeg	1012518	85	7.20000000000000018
NY	15784	IPA - American	3.62699999999999978	El Serrano Red IPA	https://untappd.akamaized.net/site/beer_logos/beer-1223174_48e2d_sm.jpeg	1223174	54	9
NY	15784	Pale Ale - American	3.14000000000000012	Dem Apples	https://untappd.akamaized.net/site/beer_logos/beer-1717127_b4237_sm.jpeg	1717127	49	6.5
NY	15784	IPA - International	3.85599999999999987	Ida Rivera's Multicultural IPA	https://untappd.akamaized.net/site/beer_logos/beer-1600402_631da_sm.jpeg	1600402	0	6.5
NY	15784	Pale Ale - American	3.63700000000000001	Red Zinfandel Aged American Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-_238316_sm_eed24ea51aadb5c07d04a69da70e4e.jpeg	238316	50	6.29999999999999982
NY	15784	Rye Beer	3.71899999999999986	Sticky Rye	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1256434	58	6.29999999999999982
NY	15784	Dunkelweizen	3.57100000000000017	Get Rich Or Dinkelweizen	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1435182	38	6.5
CA	95443	IPA - Imperial / Double	3.87300000000000022	Hopulous	https://untappd.akamaized.net/site/beer_logos/beer-645321_abf80_sm.jpeg	645321	90	8.30000000000000071
CA	95443	Red Ale - American Amber / Red	3.57900000000000018	Red Tractor Ale	https://untappd.akamaized.net/site/beer_logos/beer-_535735_sm_95b2d2bfa7c6e27729b5a5cfc1cb8f.jpeg	535735	40	6.79999999999999982
CA	95443	IPA - American	3.6379999999999999	Hop Drama	https://untappd.akamaized.net/site/beer_logos/beer-_567204_sm_f02f8c3b3d6997a613da6d8402f1d6.jpeg	567204	80	6.5
CA	95443	Stout - Oatmeal	3.60499999999999998	Sidewinder Oatmeal Stout	https://untappd.akamaized.net/site/beer_logos/beer-_561076_sm_cb6610b2c36b75f21007ba25fed13d.jpeg	561076	35	5.5
CA	95443	Blonde Ale	3.33899999999999997	Boxcar Blonde	https://untappd.akamaized.net/site/beer_logos/beer-_526959_sm_98855237a05febbad008aa969dcd77.jpeg	526959	20	4.79999999999999982
CA	95443	Fruit Beer	3.31700000000000017	Orange Blossom Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	623569	20	5.09999999999999964
CA	95443	Maibock/Helles Bock	3.58300000000000018	Spring Cleaning	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1071994	0	7.20000000000000018
CA	95443	Altbier	3.46899999999999986	Aftermath	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	929627	0	4.70000000000000018
CA	95443	Stout - Other	4.04000000000000004	Barrel Aged Imperial Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1352315	90	11.5
CA	95443	Hefeweizen	3.54000000000000004	Weizen Waltz	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1020136	15	4.5
CA	95443	Scotch Ale / Wee Heavy	3.7669999999999999	Feats of Strength	https://untappd.akamaized.net/site/beer_logos/beer-898357_e7581_sm.jpeg	898357	15	6.5
CA	95443	Saison / Farmhouse Ale	3.60599999999999987	Harvest Sun	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1243393	45	7.5
CA	95443	Märzen	3.7240000000000002	Festbier	https://untappd.akamaized.net/site/beer_logos/beer-822642_24212_sm.jpeg	822642	20	5.5
CA	95443	Brown Ale - American	3.56599999999999984	Paranuts Brown Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1368598	40	5.29999999999999982
CA	95443	Maibock/Helles Bock	3.5	Summertime	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	707670	0	5.79999999999999982
CA	95443	Porter - American	3.61299999999999999	Katalyst Robust Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	723656	40	6.5
CA	95443	Kristallweizen 	3.33000000000000007	Krystal Weizen	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	623571	20	5.79999999999999982
CA	95443	Winter Ale	3.64299999999999979	Seeds and Spice Harvest Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1300983	40	5.29999999999999982
CA	95443	Red Ale - American Amber / Red	3.9009999999999998	Red Tractor Barrel Aged	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	806502	0	6.79999999999999982
CA	95443	Stout - Imperial / Double	3.92200000000000015	Imperial Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1368638	80	10.5
CA	95443	IPA - Session / India Session Ale	3.46899999999999986	Seize the Day	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1657394	0	0
CA	95443	IPA - American	4.01199999999999957	Immortal Wet Hop IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1797144	70	7.20000000000000018
CA	95443	Brown Ale - English	3.79999999999999982	Nutt Brown Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1321860	0	0
CA	95443	Stout - Imperial / Double	4.08300000000000018	Sneak Preview	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1870466	90	10.5
NC	37851	IPA - American	4.13400000000000034	Pernicious IPA	https://untappd.akamaized.net/site/beer_logos/beer-883318_b7307_sm.jpeg	883318	70	7.29999999999999982
NC	37851	Sour - American Wild Ale	4.16699999999999982	Black Angel	https://untappd.akamaized.net/site/beer_logos/beer-286137_8354a_sm.jpeg	286137	16	6.59999999999999964
NC	37851	Pale Ale - American	3.87599999999999989	Napoleon Complex	https://untappd.akamaized.net/site/beer_logos/beer-319414_10b1a_sm.jpeg	319414	47	5.20000000000000018
NC	37851	Sour - Flanders Red Ale	4.15800000000000036	Oblivion	https://untappd.akamaized.net/site/beer_logos/beer-545336_50658_sm.jpeg	545336	0	8.69999999999999929
NC	37851	Sour - Gose	3.8490000000000002	Tropicmost Passionfruit Gose	https://untappd.akamaized.net/site/beer_logos/beer-1155618_a943b_sm.jpeg	1155618	45	4.09999999999999964
NC	37851	Sour - Ale	4.04399999999999959	Genesis	https://untappd.akamaized.net/site/beer_logos/beer-286069_468be_sm.jpeg	286069	18	6.59999999999999964
NC	37851	Sour - American Wild Ale	4.1509999999999998	Amorous	https://untappd.akamaized.net/site/beer_logos/beer-630877_b5af5_sm.jpeg	630877	0	6.90000000000000036
NC	37851	Golden Ale	3.78299999999999992	Coolcumber	https://untappd.akamaized.net/site/beer_logos/beer-230165_a3cce_sm.jpeg	230165	26	5.5
NC	37851	Stout - Russian Imperial	4.27200000000000024	Dark Age	https://untappd.akamaized.net/site/beer_logos/beer-286139_806a2_sm.jpeg	286139	55	12
NC	37851	IPA - American	3.97599999999999998	Hop Burglar	https://untappd.akamaized.net/site/beer_logos/beer-352842_279db_sm.jpeg	352842	57	7
NC	37851	Blonde Ale - Belgian Blonde / Golden	3.74699999999999989	Lunatic Blonde	https://untappd.akamaized.net/site/beer_logos/beer-274921_75993_sm.jpeg	274921	21	6.5
NC	37851	Sour - Ale	3.875	Serenity	https://untappd.akamaized.net/site/beer_logos/beer-477033_69931_sm.jpeg	477033	16	5.5
NC	37851	Sour - American Wild Ale	4.20300000000000029	Medora	https://untappd.akamaized.net/site/beer_logos/beer-673549_1d58c_sm.jpeg	673549	0	6.59999999999999964
NC	37851	Stout - American Imperial / Double	4.03099999999999969	French Toast Stout	https://untappd.akamaized.net/site/beer_logos/beer-600209_c8d13_sm.jpeg	600209	25	8.80000000000000071
NC	37851	Stout - Milk / Sweet	4.09499999999999975	Milk & Cookies	https://untappd.akamaized.net/site/beer_logos/beer-535667_355d5_sm.jpeg	535667	0	8.5
NC	37851	Sour - Ale	4.13400000000000034	Marina	https://untappd.akamaized.net/site/beer_logos/beer-1440417_f53a9_sm.jpeg	1440417	45	6.5
NC	37851	Pumpkin / Yam Beer	3.86399999999999988	Xibalba	https://untappd.akamaized.net/site/beer_logos/beer-1234386_d33e6_sm.jpeg	1234386	50	8.19999999999999929
NC	37851	Sour - Ale	4.17100000000000026	Recurrant	https://untappd.akamaized.net/site/beer_logos/beer-1076872_2258a_sm.jpeg	1076872	0	7.59999999999999964
NC	37851	Sour - Ale	4.17600000000000016	Silencio	https://untappd.akamaized.net/site/beer_logos/beer-1257338_b2093_sm.jpeg	1257338	30	7.40000000000000036
NC	37851	Saison / Farmhouse Ale	4.04199999999999982	Brettaberry	https://untappd.akamaized.net/site/beer_logos/beer-1164317_8378f_sm.jpeg	1164317	0	5.5
NC	37851	Porter - Other	3.75	Hop Cocoa	https://untappd.akamaized.net/site/beer_logos/beer-1582733_94fc9_sm.jpeg	1582733	0	6.5
NC	37851	IPA - Red	3.83000000000000007	Tyranny Red IPA	https://untappd.akamaized.net/site/beer_logos/beer-1168970_d1a41_sm.jpeg	1168970	55	7
NC	37851	Saison / Farmhouse Ale	3.73799999999999999	Bretticent	https://untappd.akamaized.net/site/beer_logos/beer-660454_f6b46_sm.jpeg	660454	0	6.5
NC	37851	Old Ale	4.06400000000000006	Old Fashioned	https://untappd.akamaized.net/site/beer_logos/beer-862797_51357_sm.jpeg	862797	8	10
CA	94	Rye Beer	3.77499999999999991	Hop Rod Rye™	https://untappd.akamaized.net/site/beer_logos/beer-HopRodRye_1425.jpeg	1425	80	8
CA	94	Red Ale - American Amber / Red	3.58099999999999996	Red Rocket Ale®	https://untappd.akamaized.net/site/beer_logos/beer-RedRocketAle_5569.jpeg	5569	67	6.79999999999999982
CA	94	IPA - Imperial / Double	4.06500000000000039	Café Racer 15™	https://untappd.akamaized.net/site/beer_logos/beer-_30257_sm_3702381d8df3d58ab19be470c36047.jpeg	30257	100	9.75
CA	94	Stout - American Imperial / Double	3.78799999999999981	Big Bear Black Stout	https://untappd.akamaized.net/site/beer_logos/beer-BigBearBlackStout_1557.jpeg	1557	55	8.09999999999999964
CA	94	IPA - Imperial / Double	4.02799999999999958	Apex™	https://untappd.akamaized.net/site/beer_logos/beer-_5795_sm_c4f6d31a35d90f134f193f3aca73f6.jpeg	5795	100	8.25
CA	94	IPA - Imperial / Double	4.01100000000000012	Racer X®	https://untappd.akamaized.net/site/beer_logos/beer-RacerX_2034.jpeg	2034	100	8.30000000000000071
CA	94	Pale Ale - American	3.62400000000000011	Grand Am™	https://untappd.akamaized.net/site/beer_logos/beer-258367_1398c_sm.jpeg	258367	50	6
CA	94	IPA - Imperial / Double	3.86299999999999999	Mach 10™	https://untappd.akamaized.net/site/beer_logos/beer-8113_71f5a_sm.jpeg	8113	100	9.19999999999999929
CA	94	IPA - American	3.89599999999999991	Hop Shovel™	https://untappd.akamaized.net/site/beer_logos/beer-782164_ed0b8_sm.jpeg	782164	100	7.5
CA	94	Sour - Berliner Weisse	3.87999999999999989	Tartare™	https://untappd.akamaized.net/site/beer_logos/beer-_98383_a1117c109ac5dd615dfbba1295dd.jpeg	98383	8	4
CA	94	IPA - Black / Cascadian Dark Ale	3.83800000000000008	Black Racer™	https://untappd.akamaized.net/site/beer_logos/beer-_44137_sm_ee82b6862aa768dfbb845ab0c096f1.jpeg	44137	75	8.09999999999999964
CA	94	Brown Ale - American	3.61100000000000021	Peter Brown Tribute Ale™	https://untappd.akamaized.net/site/beer_logos/beer-PeterBrownTributeAle_9526.jpeg	9526	21	6.29999999999999982
CA	94	IPA - Session / India Session Ale	3.62400000000000011	Pace Car Racer™	https://untappd.akamaized.net/site/beer_logos/beer-1230037_9981f_sm.jpeg	1230037	55	4
CA	94	Pilsner - Other	3.44099999999999984	Double Aught™	https://untappd.akamaized.net/site/beer_logos/beer-55496_68a43_sm.jpeg	55496	15	5
CA	94	Sour - American Wild Ale	3.72699999999999987	Cuvee de Bubba™	https://untappd.akamaized.net/site/beer_logos/beer-_79771_1837f2a8ff92e7f9871420988ff8.jpeg	79771	35	9
CA	94	Pale Ale - American	3.51500000000000012	XP Pale Ale™	https://untappd.akamaized.net/site/beer_logos/beer-XPPaleAle_2391.jpeg	2391	35	5.40000000000000036
CA	94	IPA - Belgian	3.69300000000000006	Crazy Ivan™	https://untappd.akamaized.net/site/beer_logos/beer-_11755_a1864f81163e71c3fd4b58e72931.jpeg	11755	70	7.29999999999999982
CA	94	IPA - American	3.57600000000000007	Rebellion™	https://untappd.akamaized.net/site/beer_logos/beer-_19039_7b5ca7a5bc34fcd213b80889bf08.jpeg	19039	75	6
CA	94	Rye Beer	3.77300000000000013	MerBear Rye IPA™	https://untappd.akamaized.net/site/beer_logos/beer-1424789_d947d_sm.jpeg	1424789	65	7.5
CA	94	Scotch Ale / Wee Heavy	3.58199999999999985	Heritage Ale™	https://untappd.akamaized.net/site/beer_logos/beer-_2026_sm_11b36e5d285e58bbd3a8717a31f0e7.jpeg	2026	17	7.59999999999999964
CA	94	Barleywine - American	3.6339999999999999	Olde Scoutter's Barleywine™	https://untappd.akamaized.net/site/beer_logos/beer-_18753_dd24ed14b5e8d2b867aee27d219a.jpeg	18753	100	10.4000000000000004
CA	94	Lager - American Amber / Red	3.31300000000000017	El Oso™	https://untappd.akamaized.net/site/beer_logos/beer-_28041_d88d3f2fa209725d45760265a606.jpeg	28041	18	4.90000000000000036
CA	94	IPA - American	3.91599999999999993	Churchill's Pale	https://untappd.akamaized.net/site/beer_logos/beer-_455076_sm_c0fce454fb7f79b72900f81ca33ee9.jpeg	455076	100	7.5
CA	94	Pale Ale - Belgian	3.33499999999999996	Cher Ami™	https://untappd.akamaized.net/site/beer_logos/beer-_21114_ca3a77b19ebfe8e1e32b5587fd98.jpeg	21114	16	4.70000000000000018
CO	196228	Stout - Imperial / Double	3.91599999999999993	Night Walker	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1039991	47	9.75
CO	196228	Blonde Ale - Belgian Blonde / Golden	3.7280000000000002	Sugarfoot	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1320625	15	3.5
CO	196228	IPA - American	3.81599999999999984	Hop Colossus	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1040047	70	8
CO	196228	Saison / Farmhouse Ale	3.63700000000000001	Beatrice	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1040048	30	6
CO	196228	Sour - Gose	3.99400000000000022	Birth of Cool	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1246730	10	4.59999999999999964
CO	196228	Sour - Berliner Weisse	4.02799999999999958	Colorado Junction	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1250250	25	4.5
CO	196228	Sour - Ale	3.80699999999999994	Pure Funk	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1226465	20	4.5
CO	196228	Hefeweizen	3.60700000000000021	Lil' Confused	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1431430	0	5.20000000000000018
CO	196228	Stout - Imperial / Double	4.04399999999999959	Night Walker Con Alma	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1077652	47	10.1999999999999993
CO	196228	Old Ale	3.76200000000000001	Syncopation	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1320634	10	8
CO	196228	Pale Wheat Ale - American	3.62400000000000011	Lemon Session	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1172491	15	4.5
CO	196228	Lager - IPL (India Pale Lager)	3.72199999999999998	Lydian	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1455875	0	5
CO	196228	IPA - Imperial / Double	3.93900000000000006	Fortnight In France	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1762221	70	7.70000000000000018
CO	196228	Belgian Dubbel	3.52300000000000013	St. Thomas	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1040042	12	7.79999999999999982
CO	196228	Belgian Tripel	3.91599999999999993	Le Voyage	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1365172	7	6.79999999999999982
CO	196228	Belgian Tripel	3.73499999999999988	Juneteenth Tripel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1129797	0	7.5
CO	196228	Belgian Dubbel	3.71700000000000008	Love Supreme	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1040037	0	0
CO	196228	Sour - Gose	3.90700000000000003	Protocrat	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1502862	10	4.59999999999999964
CO	196228	Belgian Tripel	3.80900000000000016	Tripel Risotto Milanese	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1320632	10	9
CO	196228	Belgian Quad	3.6509999999999998	Giant Steps	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1423774	0	11.1999999999999993
CO	196228	IPA - English	3.6030000000000002	Knuckle Sandwich	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1141257	50	7
CO	196228	IPA - American	3.85099999999999998	Fresh Hop IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1758058	40	6
CO	196228	IPA - Imperial / Double	3.97900000000000009	Goof Baller	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1407572	70	8.80000000000000071
CO	196228	Saison / Farmhouse Ale	3.69200000000000017	Le Sony'r Ra	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1146707	20	4.5
MI	908	Stout - Oatmeal	3.7759999999999998	The Poet	https://untappd.akamaized.net/site/beer_logos/beer-ThePoet_6594.jpeg	6594	40	5.20000000000000018
MI	908	Pumpkin / Yam Beer	3.49400000000000022	Ichabod Ale	https://untappd.akamaized.net/site/beer_logos/beer-IchabodAle_4847.jpeg	4847	0	4.5
MI	908	Brown Ale - American	3.62300000000000022	Cabin Fever Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-CabinFeverBrownAle_4846.jpeg	4846	37	6.5
MI	908	Pale Ale - Belgian	3.5089999999999999	White Hatter	https://untappd.akamaized.net/site/beer_logos/beer-WhiteHatter_144092.jpeg	144092	35	5.20000000000000018
MI	908	IPA - American	3.76900000000000013	Mad Hatter	https://untappd.akamaized.net/site/beer_logos/beer-1064901_19db8_sm.jpeg	1064901	65	7
MI	908	Saison / Farmhouse Ale	3.504	Monkey King	https://untappd.akamaized.net/site/beer_logos/beer-_311159_e886c88a2edfb33d6fe6a7dada7c.jpeg	311159	23	5.59999999999999964
MI	908	Kölsch	3.39900000000000002	Full Circle	https://untappd.akamaized.net/site/beer_logos/beer-NewHollandFullCircle_8079.jpeg	8079	0	4.90000000000000036
MI	908	Stout - American Imperial / Double	4.2240000000000002	Dragon's Milk Reserve: With Coffee & Chocolate	https://untappd.akamaized.net/site/beer_logos/beer-597495_867a8_sm.jpeg	597495	31	11
MI	908	Pale Ale - American	3.47900000000000009	The Carhartt Woodsman	https://untappd.akamaized.net/site/beer_logos/beer-673100_b8e51_sm.jpeg	673100	0	4.40000000000000036
MI	908	IPA - Imperial / Double	3.79899999999999993	Imperial Hatter	https://untappd.akamaized.net/site/beer_logos/beer-ImperialHatter_10358.jpeg	10358	80	10
MI	908	Pale Ale - American	3.48200000000000021	Paleooza	https://untappd.akamaized.net/site/beer_logos/beer-_40913_f797717889349e91d3d1a6e085de.jpeg	40913	0	5.79999999999999982
MI	908	Red Ale - American Amber / Red	3.45999999999999996	Sundog Amber Ale	https://untappd.akamaized.net/site/beer_logos/beer-SundogAmberAle_6378.jpeg	6378	33	4.5
MI	908	Sour - Ale	3.71200000000000019	Incorrigible	https://untappd.akamaized.net/site/beer_logos/beer-_375066_sm_2613890bded4c98b0518ee7aa77efb.jpeg	375066	3	4.5
MI	908	Stout - American Imperial / Double	3.93100000000000005	Dragon's Milk Reserve: With Toasted Chiles	https://untappd.akamaized.net/site/beer_logos/beer-598460_34dc6_sm.jpeg	598460	31	11
MI	908	Stout - American Imperial / Double	3.99800000000000022	Dragon's Milk Reserve: (w/ Raspberries)	https://untappd.akamaized.net/site/beer_logos/beer-915737_916e7_sm.jpeg	915737	31	11
MI	908	IPA - American	3.88200000000000012	Tasmanian Hatter	https://untappd.akamaized.net/site/beer_logos/beer-1093536_ef1be_sm.jpeg	1093536	65	7
MI	908	Sour - American Wild Ale	3.85899999999999999	Blue Sunday Sour	https://untappd.akamaized.net/site/beer_logos/beer-BlueSundaySour_18294.jpeg	18294	18	7
MI	908	Stout - American Imperial / Double	3.99699999999999989	Night Tripper	https://untappd.akamaized.net/site/beer_logos/beer-_269459_355206cfb1422cde2e779d6df2fb.jpeg	269459	45	11.5
MI	908	Stout - Imperial / Double	4.31700000000000017	Dragon's Milk Reserve: Coconut Rum Barrel	https://untappd.akamaized.net/site/beer_logos/beer-1443718_fede4_sm.jpeg	1443718	30	11
MI	908	Pale Ale - American	3.55900000000000016	Hopivore	https://untappd.akamaized.net/site/beer_logos/beer-Hopivore_8525.jpeg	8525	55	6
MI	908	IPA - Imperial / Double	3.93100000000000005	Hoptronix	https://untappd.akamaized.net/site/beer_logos/beer-1766292_dba78_sm.jpeg	1766292	70	9
MI	908	Belgian Tripel	3.73499999999999988	Black Tulip	https://untappd.akamaized.net/site/beer_logos/beer-BlackTulipTrippelAle_3772.jpeg	3772	21	8.80000000000000071
MI	908	IPA - American	3.65899999999999981	Michigan Awesome Hatter	https://untappd.akamaized.net/site/beer_logos/beer-643882_04273_sm.jpeg	643882	50	5.70000000000000018
MI	908	Stout - American Imperial / Double	4.00900000000000034	Dragon's Milk Reserve: Raspberry Lemon	https://untappd.akamaized.net/site/beer_logos/beer-1605758_98939_sm.jpeg	1605758	31	11
CA	39329	IPA - American	3.79700000000000015	Hop-O-Matic	https://untappd.akamaized.net/site/beer_logos/beer-_325867_2a58c7973f6b26db3f19b7a6fc77.jpeg	325867	80	7.09999999999999964
CA	39329	Red Ale - American Amber / Red	3.59299999999999997	Extra Red	https://untappd.akamaized.net/site/beer_logos/beer-ExtraRed_227616.jpeg	227616	59	6.5
CA	39329	Stout - Imperial Oatmeal	3.99299999999999988	Big Deluxe	https://untappd.akamaized.net/site/beer_logos/beer-_249572_d3860f26a5bcdeadc35a5583bfb5.jpeg	249572	86	12.1999999999999993
CA	39329	Witbier	3.45400000000000018	Wit's End	https://untappd.akamaized.net/site/beer_logos/beer-WitsEnd_239199.jpeg	239199	19	4.79999999999999982
CA	39329	Rye Beer	3.70199999999999996	Single Rye IPA (Centennial)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	434161	85	7
CA	39329	IPA - Imperial / Double	3.85999999999999988	Art of Dankness	https://untappd.akamaized.net/site/beer_logos/beer-653834_761a5_sm.jpeg	653834	101	9.19999999999999929
CA	39329	Barleywine - American	3.79099999999999993	Fat Hog	https://untappd.akamaized.net/site/beer_logos/beer-FatHog_249580.jpeg	249580	89	11.5999999999999996
CA	39329	IPA - Session / India Session Ale	3.4910000000000001	Funner	https://untappd.akamaized.net/site/beer_logos/beer-721760_8a442_sm.jpeg	721760	60	4.59999999999999964
CA	39329	Blonde Ale - Belgian Blonde / Golden	3.45400000000000018	Monk's Lunch	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	593894	29	4.5
CA	39329	Brown Ale - American	3.59299999999999997	Love and Malt	https://untappd.akamaized.net/site/beer_logos/beer-863380_62c0e_sm.jpeg	863380	0	5
CA	39329	IPA - American	3.82699999999999996	Single Rye IPA (Mosaic)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	748075	85	7
CA	39329	Stout - Oatmeal	3.53200000000000003	Little Oat (Small Stout)	https://untappd.akamaized.net/site/beer_logos/beer-_292336_5e9306dfb94b960579972e54d898.jpeg	292336	0	4.5
CA	39329	Pale Ale - Belgian	3.32399999999999984	TafelBier	https://untappd.akamaized.net/site/beer_logos/beer-_249534_c588728f87390628eaeb852e773a.jpeg	249534	29	4.5
CA	39329	Rye Beer	3.80399999999999983	Single Rye IPA (El Dorado)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	545419	70	7
CA	39329	Stout - Imperial Oatmeal	4.23200000000000021	Bourbon Barrel Aged Big Deluxe (High West)	https://untappd.akamaized.net/site/beer_logos/beer-_449433_sm_645d662a22280178fc894335b083e4.jpeg	449433	85	12.4000000000000004
CA	39329	Pale Ale - American	3.52800000000000002	Ritual Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1709568	0	5.20000000000000018
CA	39329	Rye Beer	3.79199999999999982	Single Rye IPA (Citra)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	574213	85	7
CA	39329	IPA - American	3.60999999999999988	Single Rye IPA (Lemondrop)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	1110878	86	7
CA	39329	Rye Beer	3.86799999999999988	Single Rye IPA (Eureka, formally exp. 05256)	https://untappd.akamaized.net/site/beer_logos/beer-672720_85e02_sm.jpeg	672720	85	7
CA	39329	Rye Beer	3.89999999999999991	Single Rye IPA (Idaho 7)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	1464971	85	7
CA	39329	IPA - American	3.58199999999999985	Single Rye IPA (Jarrylo)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	818472	85	7
CA	39329	Rye Beer	3.76500000000000012	Single Rye IPA (Equinox)	https://untappd.akamaized.net/site/beer_logos/beer-_434161_sm_cca4ce02f968b3b69f63eb9239b711.jpeg	1189962	85	7
CA	39329	Stout - Imperial Oatmeal	4.10299999999999976	Big Deluxe (Nitro)	https://untappd.akamaized.net/site/beer_logos/beer-_319820_4d20e12acbad156d2eb22f76eb05.jpeg	319820	86	12.1999999999999993
CA	39329	IPA - American	3.9009999999999998	Single Rye IPA (Amarillo)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1322909	86	7
IL	2898	Pale Wheat Ale - American	3.45100000000000007	312 Urban Wheat Ale	https://untappd.akamaized.net/site/beer_logos/beer-5925_cec82_sm.jpeg	5925	18	4.20000000000000018
IL	2898	Stout - American Imperial / Double	4.43599999999999994	Bourbon County Brand Stout	https://untappd.akamaized.net/site/beer_logos/beer-8343_f9b52_sm.jpeg	8343	60	15
IL	2898	English Bitter	3.41900000000000004	Honkers Ale	https://untappd.akamaized.net/site/beer_logos/beer-6469_f21a0_sm.jpeg	6469	30	4.29999999999999982
IL	2898	Pale Ale - Belgian	3.74000000000000021	Matilda	https://untappd.akamaized.net/site/beer_logos/beer-372_7ff05_sm.jpeg	372	26	7
IL	2898	Saison / Farmhouse Ale	3.78900000000000015	Sofie	https://untappd.akamaized.net/site/beer_logos/beer-6807_c6456_sm.jpeg	6807	20	6.5
IL	2898	Pale Ale - American	3.4870000000000001	Green Line Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-12943_9c9e3_sm.jpeg	12943	30	5.40000000000000036
IL	2898	Pale Ale - American	3.49199999999999999	Ten Hills Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-488376_cd0ac_sm.jpeg	488376	48	6.20000000000000018
IL	2898	Pilsner - Other	3.44399999999999995	Four Star Pils	https://untappd.akamaized.net/site/beer_logos/beer-1241711_81511_sm.jpeg	1241711	44	5.09999999999999964
IL	2898	Märzen	3.54199999999999982	Oktoberfest	https://untappd.akamaized.net/site/beer_logos/beer-424275_88885_sm.jpeg	424275	17	6.40000000000000036
IL	2898	Kölsch	3.42200000000000015	Summertime	https://untappd.akamaized.net/site/beer_logos/beer-1935_9f47f_sm.jpeg	1935	20	5.09999999999999964
IL	2898	Barleywine - English	4.34199999999999964	Bourbon County Brand Barleywine	https://untappd.akamaized.net/site/beer_logos/beer-298426_d31a1_sm.jpeg	298426	60	13.5999999999999996
IL	2898	IPA - Session / India Session Ale	3.40399999999999991	Endless IPA	https://untappd.akamaized.net/site/beer_logos/beer-_496699_sm.jpeg	496699	35	5
IL	2898	IPA - Imperial / Double	3.84600000000000009	The Illinois	https://untappd.akamaized.net/site/beer_logos/beer-371941_72a31_sm.jpeg	371941	95	9
IL	2898	Brown Ale - English	3.51399999999999979	Winter Ale	https://untappd.akamaized.net/site/beer_logos/beer-1285313_7945b_sm.jpeg	1285313	25	5.29999999999999982
IL	2898	Stout - American Imperial / Double	4.56400000000000006	Bourbon County Brand Coffee Stout	https://untappd.akamaized.net/site/beer_logos/beer-5817_68211_sm.jpeg	5817	60	13.4000000000000004
IL	2898	Stout - American Imperial / Double	3.68100000000000005	The Muddy	https://untappd.akamaized.net/site/beer_logos/beer-735140_69524_sm.jpeg	735140	32	9
IL	2898	Winter Ale	3.34799999999999986	Festivity Ale	https://untappd.akamaized.net/site/beer_logos/beer-762126_0ea81_sm.jpeg	762126	50	7.70000000000000018
IL	2898	Pale Ale - American	3.4780000000000002	Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-470413_8e10d_sm.jpeg	470413	33	5
IL	2898	IPA - American	3.48499999999999988	Rambler IPA	https://untappd.akamaized.net/site/beer_logos/beer-496706_ff29a_sm.jpeg	496706	65	6.70000000000000018
IL	2898	Sour - American Wild Ale	3.90200000000000014	Lolita	https://untappd.akamaized.net/site/beer_logos/beer-13529_96ba4_sm.jpeg	13529	32	8.69999999999999929
IL	2898	Red Ale - American Amber / Red	3.40899999999999981	Autumn Ale	https://untappd.akamaized.net/site/beer_logos/beer-457504_e7de1_sm.jpeg	457504	65	6.70000000000000018
IL	2898	Stout - American Imperial / Double	4.52099999999999991	Bourbon County Brand Regal Rye Stout	https://untappd.akamaized.net/site/beer_logos/beer-1181379_8339b_sm.jpeg	1181379	60	13.1999999999999993
IL	2898	Belgian Tripel	3.69700000000000006	The Ogden	https://untappd.akamaized.net/site/beer_logos/beer-556976_8ca77_sm.jpeg	556976	0	9
IL	2898	Saison / Farmhouse Ale	3.62400000000000011	Pepe Nero	https://untappd.akamaized.net/site/beer_logos/beer-PepeNero_24847.jpeg	24847	30	6.40000000000000036
PA	1326	IPA - American	3.69300000000000006	HopDevil IPA	https://untappd.akamaized.net/site/beer_logos/beer-3832_a612e_sm.jpeg	3832	50	6.70000000000000018
PA	1326	Belgian Tripel	3.78799999999999981	Golden Monkey	https://untappd.akamaized.net/site/beer_logos/beer-3787_3bf47_sm.jpeg	3787	25	9.5
PA	1326	IPA - Imperial / Double	3.9780000000000002	DirtWolf Double IPA	https://untappd.akamaized.net/site/beer_logos/beer-424316_8d995_sm.jpeg	424316	65	8.69999999999999929
PA	1326	Golden Ale	3.45699999999999985	Summer Love	https://untappd.akamaized.net/site/beer_logos/beer-18545_7bc75_sm.jpeg	18545	25	5.20000000000000018
PA	1326	Pilsner - German	3.47500000000000009	Prima Pils	https://untappd.akamaized.net/site/beer_logos/beer-3820_425c8_sm.jpeg	3820	0	5.29999999999999982
PA	1326	Pale Ale - American	3.56700000000000017	Headwaters Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-26414_44f0b_sm.jpeg	26414	0	5.20000000000000018
PA	1326	IPA - Imperial / Double	3.92099999999999982	Hop Ranch	https://untappd.akamaized.net/site/beer_logos/beer-523469_a2a27_sm.jpeg	523469	80	9
PA	1326	Stout - American Imperial / Double	3.75199999999999978	Storm King	https://untappd.akamaized.net/site/beer_logos/beer-3830_83a96_sm.jpeg	3830	95	9.09999999999999964
PA	1326	Festbier	3.46399999999999997	Festbier	https://untappd.akamaized.net/site/beer_logos/beer-3825_53b7c_sm.jpeg	3825	20	5.59999999999999964
PA	1326	Sour - American Wild Ale	3.96200000000000019	Sour Monkey	https://untappd.akamaized.net/site/beer_logos/beer-1046722_0a795_sm.jpeg	1046722	25	9.5
PA	1326	IPA - American	3.65600000000000014	Vital IPA	https://untappd.akamaized.net/site/beer_logos/beer-1204285_86843_sm.jpeg	1204285	0	6.5
PA	1326	Hefeweizen	3.43599999999999994	Winter Cheers	https://untappd.akamaized.net/site/beer_logos/beer-424296_31207_sm.jpeg	424296	0	6.70000000000000018
PA	1326	Weizenbock	3.61900000000000022	Moonglow Weizenbock	https://untappd.akamaized.net/site/beer_logos/beer-3827_7df35_sm.jpeg	3827	0	8.69999999999999929
PA	1326	IPA - Imperial / Double	3.81000000000000005	Hop Wallop	https://untappd.akamaized.net/site/beer_logos/beer-3826_b8aee_sm.jpeg	3826	90	8.5
PA	1326	IPA - American	3.84200000000000008	Harvest Ale	https://untappd.akamaized.net/site/beer_logos/beer-505734_ffb19_sm.jpeg	505734	75	6.5
PA	1326	Saison / Farmhouse Ale	3.29700000000000015	Swing Session Saison	https://untappd.akamaized.net/site/beer_logos/beer-303267_7acae_sm.jpeg	303267	0	4.5
PA	1326	Belgian Quad	3.91100000000000003	V Twelve	https://untappd.akamaized.net/site/beer_logos/beer-3831_d14c8_sm.jpeg	3831	0	12
PA	1326	IPA - Session / India Session Ale	3.47900000000000009	Anniversary 19 Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-897551_ba146_sm.jpeg	897551	40	4.5
PA	1326	Saison / Farmhouse Ale	3.53200000000000003	Helios	https://untappd.akamaized.net/site/beer_logos/beer-5219_d9991_sm.jpeg	5219	0	7.5
PA	1326	Sour - American Wild Ale	3.629	Wild Devil	https://untappd.akamaized.net/site/beer_logos/beer-5218_226c3_sm.jpeg	5218	0	6.70000000000000018
PA	1326	Lager - Helles	3.44600000000000017	Victory Helles Lager	https://untappd.akamaized.net/site/beer_logos/beer-3821_c0899_sm.jpeg	3821	0	4.79999999999999982
PA	1326	Stout - Irish Dry	3.40600000000000014	Donnybrook Stout	https://untappd.akamaized.net/site/beer_logos/beer-8533_5d9bd_sm.jpeg	8533	0	3.70000000000000018
PA	1326	IPA - American	3.69399999999999995	21st Birthday IPA	https://untappd.akamaized.net/site/beer_logos/beer-1770068_209d6_sm.jpeg	1770068	80	6.09999999999999964
PA	1326	Hefeweizen	3.57500000000000018	Mad King's Weiss	https://untappd.akamaized.net/site/beer_logos/beer-13765_37fff_sm.jpeg	13765	10	6.20000000000000018
CA	3891	California Common	3.50599999999999978	Anchor Steam Beer	https://untappd.akamaized.net/site/beer_logos/beer-6204_8c95d_sm.jpeg	6204	35	4.79999999999999982
CA	3891	IPA - American	3.496	Liberty Ale	https://untappd.akamaized.net/site/beer_logos/beer-AnchorLibertyAle.jpg	5173	47	5.90000000000000036
CA	3891	IPA - American	3.4830000000000001	Anchor IPA	https://untappd.akamaized.net/site/beer_logos/beer-_517772_sm_b79da93aff526bc2e6daeb19b31661.jpeg	517772	65	6.5
CA	3891	Lager - Pale	3.3969999999999998	Anchor California Lager	https://untappd.akamaized.net/site/beer_logos/beer-_305204_b89247d2b37f4cde5e9d5de7e8bc.jpeg	305204	0	4.90000000000000036
CA	3891	Porter - American	3.58999999999999986	Anchor Porter	https://untappd.akamaized.net/site/beer_logos/beer-AnchorPorter_2240.jpeg	2240	0	5.59999999999999964
CA	3891	Red Ale - American Amber / Red	3.36100000000000021	BigLeaf Maple Autumn Red	https://untappd.akamaized.net/site/beer_logos/beer-_389226_sm_c232e4c7e9fe36a8c604c6451a645e.jpeg	389226	0	6
CA	3891	IPA - American	3.59799999999999986	Go West! IPA™	https://untappd.akamaized.net/site/beer_logos/beer-1379870_e6446_sm.jpeg	1379870	75	6.70000000000000018
CA	3891	Pale Wheat Ale - American	3.30299999999999994	Anchor Summer Beer	https://untappd.akamaized.net/site/beer_logos/beer-AnchorSummerBeer_2229.jpeg	2229	0	4.5
CA	3891	Barleywine - English	3.67099999999999982	Old Foghorn	https://untappd.akamaized.net/site/beer_logos/beer-OldFoghorn_13244.jpeg	13244	52	10
CA	3891	Brown Ale - American	3.51399999999999979	Brekle's Brown	https://untappd.akamaized.net/site/beer_logos/beer-BreklesBrown_31133.jpeg	31133	0	6
CA	3891	Saison / Farmhouse Ale	3.45299999999999985	Anchor Saison Spring Ale	https://untappd.akamaized.net/site/beer_logos/beer-_551806_sm.jpeg	551806	32	7.20000000000000018
CA	3891	California Common	3.56899999999999995	Brotherhood Steam Beer	https://untappd.akamaized.net/site/beer_logos/beer-664479_91288_sm.jpeg	664479	0	5.59999999999999964
CA	3891	Winter Ale	3.44899999999999984	Winter Wheat	https://untappd.akamaized.net/site/beer_logos/beer-827444_1ce5d_sm.jpeg	827444	0	7
CA	3891	Pale Wheat Ale - American	3.37000000000000011	Anchor Summer Wheat	https://untappd.akamaized.net/site/beer_logos/beer-1032231_2b48b_sm.jpeg	1032231	0	4.5
CA	3891	Lager - Pale	3.29999999999999982	Meyer Lemon Lager	https://untappd.akamaized.net/site/beer_logos/beer-1167330_27372_sm.jpeg	1167330	50	4.5
CA	3891	California Common	3.60199999999999987	Dry-Hopped Steam Beer	https://untappd.akamaized.net/site/beer_logos/beer-1664563_8d840_sm.jpeg	1664563	50	5.40000000000000036
CA	3891	Bock	3.40700000000000003	Anchor Bock Beer	https://untappd.akamaized.net/site/beer_logos/beer-AnchorBockBeer_181.jpeg	181	0	5.5
CA	3891	Stout - Imperial / Double	3.76500000000000012	Argonaut Series Flying Cloud San Francisco Stout	https://untappd.akamaized.net/site/beer_logos/beer-976651_81860_sm.jpeg	976651	0	7.40000000000000036
CA	3891	IPA - Imperial / Double	3.70699999999999985	Double Liberty IPA	https://untappd.akamaized.net/site/beer_logos/beer-1040848_f13d9_sm.jpeg	1040848	90	8.19999999999999929
CA	3891	Saison / Farmhouse Ale	3.5259999999999998	Zymaster Series No. 4 Fort Ross Farmhouse Ale	https://untappd.akamaized.net/site/beer_logos/beer-_369506_sm_d0f58159f7274e5026e95e811928dd.jpeg	369506	0	7.20000000000000018
CA	3891	IPA - American	3.67300000000000004	Odeprot IPA	https://untappd.akamaized.net/site/beer_logos/beer-1691795_b01d8_sm.jpeg	1691795	80	8.19999999999999929
OR	2531	Lager - Vienna	3.46200000000000019	Limited Edition Lager: LTD 05	https://untappd.akamaized.net/site/beer_logos/beer-28543_36299_sm.jpeg	28543	0	5.59999999999999964
CA	3891	Pale Wheat Ale - American	3.36100000000000021	Anchor Wheat Beer	https://untappd.akamaized.net/site/beer_logos/beer-_389229_sm_4ab67bd1b7118b81caa8fb00ae087e.jpeg	389229	0	5.59999999999999964
CA	3891	Pale Ale - American	3.53299999999999992	Zymaster Series No. 6 Saaremaa Island Ale	https://untappd.akamaized.net/site/beer_logos/beer-612206_ae1bc_sm.jpeg	612206	40	6
CA	3891	IPA - American	3.54300000000000015	Zymaster Series No. 7 Potrero Hill Sour Mash IPA	https://untappd.akamaized.net/site/beer_logos/beer-855452_bfce8_sm.jpeg	855452	0	7
MI	549	Stout - Oatmeal	4.18599999999999994	Breakfast Stout	https://untappd.akamaized.net/site/beer_logos/beer-961501_7fce9_sm.jpeg	4589	60	8.30000000000000071
MI	549	IPA - American	3.80600000000000005	Centennial IPA	https://untappd.akamaized.net/site/beer_logos/beer-1456_a771f_sm.jpeg	1456	65	7.20000000000000018
MI	549	Scottish Ale	3.80100000000000016	Dirty Bastard	https://untappd.akamaized.net/site/beer_logos/beer-1013_bac4c_sm.jpeg	1013	50	8.5
MI	549	Porter - American	3.90300000000000002	Porter	https://untappd.akamaized.net/site/beer_logos/beer-FounersDarkRichSexy.jpg	9346	45	6.5
MI	549	Scotch Ale / Wee Heavy	4.17999999999999972	Backwoods Bastard	https://untappd.akamaized.net/site/beer_logos/beer-6830_66eb0_sm.jpeg	6830	50	11.1999999999999993
MI	549	Fruit Beer	3.73899999999999988	Rübæus	https://untappd.akamaized.net/site/beer_logos/beer-4590_94f44_sm.jpeg	4590	15	5.70000000000000018
MI	549	Stout - American Imperial / Double	4.52700000000000014	Kentucky Breakfast Stout (KBS)	https://untappd.akamaized.net/site/beer_logos/beer-FoundersKBS.jpg	9681	70	12.4000000000000004
MI	549	Pale Ale - American	3.82399999999999984	Mosaic Promise	https://untappd.akamaized.net/site/beer_logos/beer-421386_2ac47_sm.jpeg	421386	50	5.5
MI	549	IPA - Imperial / Double	3.99500000000000011	Double Trouble	https://untappd.akamaized.net/site/beer_logos/beer-FoundersDoubleTrouble.jpg	5437	86	9.40000000000000036
MI	549	Stout - Russian Imperial	4.07699999999999996	Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-4586_b40d4_sm.jpeg	4586	75	10.5
MI	549	Rye IPA	3.78900000000000015	Red's Rye IPA	https://untappd.akamaized.net/site/beer_logos/beer-FounderRedRyePA.jpg	4594	70	6.59999999999999964
MI	549	IPA - American	3.79599999999999982	Azacca IPA	https://untappd.akamaized.net/site/beer_logos/beer-1005604_c864e_sm.jpeg	1005604	70	7
MI	549	IPA - Triple	3.97299999999999986	Devil Dancer	https://untappd.akamaized.net/site/beer_logos/beer-FoundersDevilDancer.jpg	4593	112	12
MI	549	IPA - Imperial / Double Black	3.85000000000000009	Dark Penance	https://untappd.akamaized.net/site/beer_logos/beer-732903_46050_sm.jpeg	732903	100	8.90000000000000036
MI	549	Pale Ale - American	3.54400000000000004	Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-22011_e3873_sm.jpeg	22011	35	5.40000000000000036
MI	549	Old Ale	3.84600000000000009	Curmudgeon	https://untappd.akamaized.net/site/beer_logos/beer-FoundersOldComudgen.jpg	42128	50	9.80000000000000071
MI	549	IPA - American	3.97599999999999998	Harvest Ale	https://untappd.akamaized.net/site/beer_logos/beer-FoundersHarvestAle.jpg	7009	70	7.59999999999999964
MI	549	IPA - Red	4.01400000000000023	reDANKulous	https://untappd.akamaized.net/site/beer_logos/beer-1136293_09cf7_sm.jpeg	1136293	90	9.5
MI	549	Stout - Oatmeal	3.79499999999999993	Nitro Oatmeal Stout	https://untappd.akamaized.net/site/beer_logos/beer-_8928_sm_06d6866cf0f948cbdec1fe0f1b98f6.jpeg	8928	38	4.5
MI	549	Brown Ale - Imperial / Double	4.12600000000000033	Sumatra Mountain Brown	https://untappd.akamaized.net/site/beer_logos/beer-15739_cfd48_sm.jpeg	15739	40	9
MI	549	Rye Beer	3.75099999999999989	Black Rye	https://untappd.akamaized.net/site/beer_logos/beer-4588_754da_sm.jpeg	4588	78	7.5
MI	549	Fruit Beer	3.64900000000000002	Mango Magnifico	https://untappd.akamaized.net/site/beer_logos/beer-406766_22479_sm.jpeg	406766	0	10
MI	549	IPA - Black / Cascadian Dark Ale	4.11399999999999988	Project PAM	https://untappd.akamaized.net/site/beer_logos/beer-1239071_c3236_sm.jpeg	1239071	55	10.8000000000000007
MI	549	Stout - American Imperial / Double	3.84600000000000009	Lizard of Koz	https://untappd.akamaized.net/site/beer_logos/beer-1052528_bbde5_sm.jpeg	1052528	40	10.5
OR	2531	Lager - Pale	3.35999999999999988	Session Premium Lager	https://untappd.akamaized.net/site/beer_logos/beer-428_d3b8d_sm.jpeg	428	18	5.09999999999999964
OR	2531	IPA - American	3.41999999999999993	Classic IPA	https://untappd.akamaized.net/site/beer_logos/beer-7994_551af_sm.jpeg	7994	60	6
OR	2531	Red Ale - American Amber / Red	3.47900000000000009	Amber Ale	https://untappd.akamaized.net/site/beer_logos/beer-3465_bd046_sm.jpeg	3465	31	6
OR	2531	Lager - Dark	3.52700000000000014	Session Black Lager	https://untappd.akamaized.net/site/beer_logos/beer-6681_263ee_sm.jpeg	6681	22	5.40000000000000036
OR	2531	Winter Ale	3.45299999999999985	Wassail	https://untappd.akamaized.net/site/beer_logos/beer-3357_32b3a_sm.jpeg	3357	56	7.20000000000000018
OR	2531	IPA - Session / India Session Ale	3.3450000000000002	Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-883635_4a4cc_sm.jpeg	883635	47	5.09999999999999964
OR	2531	Pilsner - Other	3.47199999999999998	Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-754909_05f10_sm.jpeg	754909	60	6
OR	2531	Lager - Vienna	3.44200000000000017	Session Fest	https://untappd.akamaized.net/site/beer_logos/beer-SessionFest_59174.jpeg	59174	26	6.20000000000000018
OR	2531	Pale Wheat Ale - American	3.66699999999999982	Blood Orange Wheat Ale	https://untappd.akamaized.net/site/beer_logos/beer-1462856_b8d5b_sm.jpeg	1462856	30	5.20000000000000018
OR	2531	Winter Warmer	3.56999999999999984	Wreck the Halls	https://untappd.akamaized.net/site/beer_logos/beer-7689_e22ad_sm.jpeg	7689	0	6.5
OR	2531	IPA - American	3.68400000000000016	Hop Pursuit IPA	https://untappd.akamaized.net/site/beer_logos/beer-1476282_71595_sm.jpeg	1476282	65	6.5
OR	2531	Extra Special / Strong Bitter	3.45900000000000007	Extra Special Bitter	https://untappd.akamaized.net/site/beer_logos/beer-335878_f7d55_sm.jpeg	335878	35	6.5
OR	2531	Bock	3.64400000000000013	Limited Edition Lager: LTD 06	https://untappd.akamaized.net/site/beer_logos/beer-38932_e4bff_sm.jpeg	38932	34	7
OR	2531	Brown Ale - American	3.49900000000000011	Brown	https://untappd.akamaized.net/site/beer_logos/beer-280833_62a35_sm.jpeg	280833	0	6
OR	2531	Pilsner - German	3.53399999999999981	26th Anniversary Cascade Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-_387504_sm_1d04b9882043836602930176f92d23.jpeg	387504	60	6.40000000000000036
OR	2531	Pale Ale - American	3.30200000000000005	Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-3370_d30fb_sm.jpeg	3370	30	5.40000000000000036
OR	2531	Cream Ale	3.45400000000000018	Session Cream Ale	https://untappd.akamaized.net/site/beer_logos/beer-941892_c2bce_sm.jpeg	941892	26	5.40000000000000036
OR	2531	IPA - American	3.72299999999999986	IPApaya	https://untappd.akamaized.net/site/beer_logos/beer-1827553_aba3b_sm.jpeg	1827553	58	6.20000000000000018
OR	2531	Lager - Pale	3.40200000000000014	Limited Edition Lager: LTD 04	https://untappd.akamaized.net/site/beer_logos/beer-25789_589fc_sm.jpeg	25789	45	7
OR	2531	IPA - American	3.81999999999999984	Slipknot IPA (Brewmasters Reserve)	https://untappd.akamaized.net/site/beer_logos/beer-830_892f0_sm.jpeg	830	80	7
OR	2531	Hefeweizen	3.53200000000000003	Session Wheat	https://untappd.akamaized.net/site/beer_logos/beer-1373664_3a465_sm.jpeg	1373664	24	5.40000000000000036
OR	2531	Sour - Berliner Weisse	3.38700000000000001	Chris's Summer Delight Berliner Weisse	https://untappd.akamaized.net/site/beer_logos/beer-BerlinerWeissChrisSummerDelightBrewersShare_196689.jpeg	196689	0	4
OR	2531	Porter - Imperial / Double	3.90300000000000002	Top Sail Bourbon Barrel	https://untappd.akamaized.net/site/beer_logos/beer-TopsailBourbonPorter_9281.jpeg	9281	0	9.5
OR	2531	Pilsner - Czech	3.38600000000000012	Limited Edition Lager: LTD 03	https://untappd.akamaized.net/site/beer_logos/beer-11003_07073_sm.jpeg	11003	0	5.59999999999999964
NY	34872	Pale Ale - English	3.47100000000000009	Driftwood Ale	https://untappd.akamaized.net/site/beer_logos/beer-203344_13242_sm.jpeg	203344	49	6
NY	34872	Blonde Ale	3.49800000000000022	Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-371893_bd6f1_sm.jpeg	371893	28	5.59999999999999964
NY	34872	Blonde Ale	3.44899999999999984	Hop Blonde	https://untappd.akamaized.net/site/beer_logos/beer-483171_0aab0_sm.jpeg	483171	0	5
NY	34872	Red Ale - Irish	3.53299999999999992	Arrowhead Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-323542_25cd2_sm.jpeg	323542	23	5
NY	34872	IPA - American	3.80600000000000005	Wave Chaser IPA	https://untappd.akamaized.net/site/beer_logos/beer-1691967_21ac1_sm.jpeg	1691967	0	6.40000000000000036
NY	34872	IPA - American	3.47599999999999998	OffLand IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	412072	63	6.40000000000000036
NY	34872	IPA - Session / India Session Ale	3.74800000000000022	Watermelon Session Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1532158	26	4.90000000000000036
NY	34872	Stout - American	3.69700000000000006	Guardsman Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	583585	5	5
NY	34872	Pale Ale - American	3.80100000000000016	Truth Serum	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1306884	40	5.59999999999999964
NY	34872	Brown Ale - American	3.51799999999999979	Eastbound Brown Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	249610	28	5.70000000000000018
NY	34872	Pale Ale - American	3.43100000000000005	Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	227596	0	5.5
NY	34872	Hefeweizen	3.60099999999999998	Helmsman Hefeweizen	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	217998	0	5
NY	34872	Pumpkin / Yam Beer	3.8450000000000002	Pumptauk	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1260594	0	0
NY	34872	Porter - Other	3.48099999999999987	Fishing Vessel Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	203349	0	6.40000000000000036
NY	34872	Witbier	3.68800000000000017	Belgian Wit	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1614754	0	6.40000000000000036
NY	34872	IPA - Imperial / Double	3.82200000000000006	Double IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1516422	0	7.59999999999999964
NY	34872	Pale Ale - American	3.55699999999999994	Evan's Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1183733	80	5.40000000000000036
NY	34872	Stout - Other	3.78399999999999981	Bay Scallop Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1346065	0	5.29999999999999982
NY	34872	Red Ale - Imperial / Double	3.86299999999999999	Imperial Red Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1435508	47	6.79999999999999982
NY	34872	Rye Beer	3.45500000000000007	Rye'T Coast Rye Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1335739	42	5.59999999999999964
NY	34872	Red Ale - Irish	3.32699999999999996	Irish Red Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1454192	0	0
NY	34872	Pale Ale - American	4.00999999999999979	Bronze Time Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1658295	0	5.40000000000000036
NY	34872	IPA - Session / India Session Ale	3.64100000000000001	Double Up	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1780265	0	4.90000000000000036
NY	34872	IPA - American	3.56899999999999995	IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1612294	0	0
MA	16871	IPA - American	3.4049999999999998	Spyhopper IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1061541	0	5.70000000000000018
MA	16871	Pale Ale - American	3.29199999999999982	Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	6628	32	4.79999999999999982
MA	16871	Pale Ale - English	3.34399999999999986	Dunster Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	385122	40	5.29999999999999982
MA	16871	Pumpkin / Yam Beer	3.871	Pumpkin Spice Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	7696	0	5
MA	16871	Red Ale - American Amber / Red	3.66500000000000004	Harvest Spice Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	7200	15	5.09999999999999964
MA	16871	Stout - Other	3.44600000000000017	Bow Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	360706	20	6.20000000000000018
MA	16871	Blonde Ale	3.31999999999999984	Brattle Blonde Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	708396	0	4.5
MA	16871	IPA - English	3.39800000000000013	Good Hope IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	318124	59	7
MA	16871	IPA - Imperial / Double	3.46499999999999986	HOPpopotamus	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	53806	0	8.69999999999999929
MA	16871	IPA - American	3.49800000000000022	Arrow IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	346935	65	8
MA	16871	Saison / Farmhouse Ale	3.36900000000000022	Garden Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	334757	21	4
MA	16871	Kölsch	3.27300000000000013	Kolsch	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	45332	0	5.5
MA	16871	Stout - Other	3.71600000000000019	Cold Fusion Coffee Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	961728	0	5.5
MA	16871	Stout - Other	3.89299999999999979	Creamy McStout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	47311	0	0
MA	16871	Märzen	3.37599999999999989	Oktoberfest	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	6421	0	5.5
MA	16871	Golden Ale	3.34299999999999997	Cool As A Cucumber Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	682275	0	6.09999999999999964
MA	16871	Red Ale - American Amber / Red	3.29499999999999993	Amber Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	7330	0	0
MA	16871	Lager - American Light	3.13200000000000012	Brattle Lager	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	346929	0	0
MA	16871	Saison / Farmhouse Ale	3.39299999999999979	Lazy Daisy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1144842	0	5
MA	16871	Stout - Russian Imperial	3.73600000000000021	Big Ivan Russian Imperial Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	331692	0	9.09999999999999964
MA	16871	IPA - American	3.42600000000000016	Skyhopper	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1160380	0	5.70000000000000018
MA	16871	IPA - Imperial / Double	3.6339999999999999	Smile Bus	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1448211	0	8.09999999999999964
MA	16871	Red Ale - Irish	3.23499999999999988	Holiday Red Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	113203	0	0
MA	16871	IPA - American	3.43900000000000006	Unlucky IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	47450	0	0
NC	57226	IPA - American	3.73499999999999988	Over The Edge IPA	https://untappd.akamaized.net/site/beer_logos/beer-499141_fc15e_sm.jpeg	499141	65	6.90000000000000036
NC	57226	Pale Ale - American	3.44399999999999995	Pre-Game Session Ale	https://untappd.akamaized.net/site/beer_logos/beer-499205_f3287_sm.jpeg	499205	0	4.25
NC	57226	Pale Wheat Ale - American	3.59299999999999997	Ginger Wheat	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	531107	0	5.09999999999999964
NC	57226	Red Ale - American Amber / Red	3.56999999999999984	Hospitali-Tea	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	653374	0	5.59999999999999964
NC	57226	Stout - Other	3.62699999999999978	SB Stout	https://untappd.akamaized.net/site/beer_logos/beer-651039_d68b8_sm.jpeg	651039	40	6.5
NC	57226	Porter - Other	3.75099999999999989	Tele-porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	500273	0	6.70000000000000018
NC	57226	IPA - Imperial / Double	3.90300000000000002	Vehopciraptor	https://untappd.akamaized.net/site/beer_logos/beer-501865_05a96_sm.jpeg	501865	90	9.90000000000000036
NC	57226	Brown Ale - American	3.6419999999999999	Brown Ryed Girl	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1274243	0	5.5
NC	57226	Pale Ale - American	3.43900000000000006	Head First	https://untappd.akamaized.net/site/beer_logos/beer-499328_52adc_sm.jpeg	499328	35	5.59999999999999964
NC	57226	Stout - Russian Imperial	4.03300000000000036	Dirty Commie Heathen	https://untappd.akamaized.net/site/beer_logos/beer-568875_75bff_sm.jpeg	568875	50	12.4000000000000004
NC	57226	Pale Wheat Ale - American	3.45900000000000007	No Shame	https://untappd.akamaized.net/site/beer_logos/beer-499317_31e02_sm.jpeg	499317	13	5.09999999999999964
NC	57226	IPA - American	3.53399999999999981	Let's Get Tropical	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	718851	25	5.79999999999999982
NC	57226	Spiced / Herbed Beer	3.6379999999999999	La Jornada Del Escorpion En Fuego Hacia La Casa Del Chupacabra Muerto	https://untappd.akamaized.net/site/beer_logos/beer-859317_5b7b0_sm.jpeg	859317	0	10.0999999999999996
NC	57226	Saison / Farmhouse Ale	3.69600000000000017	Kitten Snuggles	https://untappd.akamaized.net/site/beer_logos/beer-1544246_b2ec8_sm.jpeg	1544246	35	9
NC	57226	Belgian Quad	3.754	Raisin The Roof	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	568876	0	10.5
NC	57226	Brown Ale - Imperial / Double	3.91800000000000015	Bound For Carolina	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1501892	50	8.69999999999999929
NC	57226	Sour - Gose	3.84200000000000008	Bright Ass Tank Top	https://untappd.akamaized.net/site/beer_logos/beer-1713368_db0eb_sm.jpeg	1713368	0	4.09999999999999964
NC	57226	Stout - Russian Imperial	3.8879999999999999	Krash The Kremlin	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	568874	0	12.5
NC	57226	Spiced / Herbed Beer	3.64500000000000002	El Corazón Que Sangra Morado	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1298008	0	9
NC	57226	Sour - Ale	3.56499999999999995	Rise Against Clowns	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1275084	0	6.59999999999999964
NC	57226	Stout - American	3.67799999999999994	Venture American Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1912167	0	6.5
NC	57226	IPA - Black / Cascadian Dark Ale	3.621	Chasing the Dragon	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	919044	0	6.20000000000000018
NC	57226	Scottish Ale	3.63600000000000012	Battle O the Shirts	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	986797	0	7.70000000000000018
NC	57226	Stout - American	3.78900000000000015	Dos AKs	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1803552	0	9.19999999999999929
CA	78850	IPA - American	3.93000000000000016	Institution IPA	https://untappd.akamaized.net/site/beer_logos/beer-441449_6d85c_sm.jpeg	441449	90	7.5
CA	78850	Brown Ale - American	3.80500000000000016	Restraint	https://untappd.akamaized.net/site/beer_logos/beer-441447_f85c4_sm.jpeg	441447	34	6
CA	78850	IPA - American	3.87199999999999989	White Walls	https://untappd.akamaized.net/site/beer_logos/beer-636114_7a696_sm.jpeg	636114	70	6.70000000000000018
CA	78850	Red Ale - American Amber / Red	3.61799999999999988	Sedation	https://untappd.akamaized.net/site/beer_logos/beer-441448_25544_sm.jpeg	441448	22	4
CA	78850	Stout - Oatmeal	4.00900000000000034	Frantic	https://untappd.akamaized.net/site/beer_logos/beer-600672_586bc_sm.jpeg	600672	36	7
CA	78850	IPA - Imperial / Double	4.09400000000000031	Disarray	https://untappd.akamaized.net/site/beer_logos/beer-497483_f8077_sm.jpeg	497483	100	10.0999999999999996
CA	78850	Stout - Imperial / Double	4.36000000000000032	Scary Dairy	https://untappd.akamaized.net/site/beer_logos/beer-1074716_5cdb3_sm.jpeg	1074716	56	8.80000000000000071
CA	78850	Stout - Other	4.20699999999999985	Dissonance	https://untappd.akamaized.net/site/beer_logos/beer-933513_0734a_sm.jpeg	933513	22	5.70000000000000018
CA	78850	Porter - Other	3.78900000000000015	Ratched	https://untappd.akamaized.net/site/beer_logos/beer-461549_87712_sm.jpeg	461549	37	6.70000000000000018
CA	78850	Red Ale - Imperial / Double	3.93199999999999994	Relapse	https://untappd.akamaized.net/site/beer_logos/beer-544213_51e6e_sm.jpeg	544213	65	8.5
CA	78850	Rye Beer	3.7799999999999998	Reverie	https://untappd.akamaized.net/site/beer_logos/beer-725558_de676_sm.jpeg	725558	36	5.40000000000000036
CA	78850	Pale Ale - American	3.83899999999999997	Progress Pale Series: Simcoe	https://untappd.akamaized.net/site/beer_logos/beer-472997_3a471_sm.jpeg	472997	50	6.20000000000000018
CA	78850	IPA - Imperial / Double	4.08399999999999963	Virtue	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1161578	100	9.5
CA	78850	IPA - American	3.86900000000000022	Coherence	https://untappd.akamaized.net/site/beer_logos/beer-576903_c100f_sm.jpeg	576903	52	5.5
CA	78850	Brown Ale - Imperial / Double	4.21199999999999974	Imperial Restraint	https://untappd.akamaized.net/site/beer_logos/beer-826147_3de70_sm.jpeg	826147	80	10.0999999999999996
CA	78850	IPA - Triple	4.16699999999999982	The Surgeon	https://untappd.akamaized.net/site/beer_logos/beer-968397_fac49_sm.jpeg	968397	100	11.5999999999999996
CA	78850	Porter - Other	3.69700000000000006	The Flue	https://untappd.akamaized.net/site/beer_logos/beer-681960_f161c_sm.jpeg	681960	30	6.20000000000000018
CA	78850	Pale Ale - American	3.96099999999999985	Progress Pale Series: Citra	https://untappd.akamaized.net/site/beer_logos/beer-538842_7ff2e_sm.jpeg	538842	50	6.20000000000000018
CA	78850	Golden Ale	3.69700000000000006	Clarity	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1481455	0	4.70000000000000018
CA	78850	Pale Ale - American	3.83899999999999997	Progress Pale Series: Centennial	https://untappd.akamaized.net/site/beer_logos/beer-959640_3435d_sm.jpeg	959640	50	6.20000000000000018
CA	78850	IPA - Imperial / Double	4.13900000000000023	Unit 28	https://untappd.akamaized.net/site/beer_logos/beer-913803_e1b8b_sm.jpeg	913803	100	8.69999999999999929
CA	78850	IPA - American	4.21600000000000019	3rd Anniversary IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1780680	0	7.79999999999999982
CA	78850	Brown Ale - American	3.97599999999999998	Pumpkin Restraint	https://untappd.akamaized.net/site/beer_logos/beer-491403_1ae53_sm.jpeg	491403	37	6
CA	78850	IPA - American	4.02500000000000036	Elation	https://untappd.akamaized.net/site/beer_logos/beer-977599_2665e_sm.jpeg	977599	85	7.20000000000000018
VT	812	IPA - American	3.40600000000000014	Electric Peel	https://untappd.akamaized.net/site/beer_logos/beer-808818_8f489_sm.jpeg	808818	65	6.20000000000000018
VT	812	Pumpkin / Yam Beer	3.39500000000000002	Wilhelm Scream	https://untappd.akamaized.net/site/beer_logos/beer-646035_2ec8a_sm.jpeg	646035	20	5.40000000000000036
VT	812	Pale Wheat Ale - American	3.39299999999999979	Elder Betty	https://untappd.akamaized.net/site/beer_logos/beer-120276_9ce67_sm.jpeg	120276	13	5.5
VT	812	Pale Wheat Ale - American	3.375	Stealin' Time	https://untappd.akamaized.net/site/beer_logos/beer-971879_f2214_sm.jpeg	971879	20	5.5
VT	812	Golden Ale	3.25800000000000001	Single Chair	https://untappd.akamaized.net/site/beer_logos/beer-4158_e0ff5_sm.jpeg	4158	17	5
VT	812	Hefeweizen	3.37199999999999989	Circus Boy	https://untappd.akamaized.net/site/beer_logos/beer-4154_9adc5_sm.jpeg	4154	15	4.5
VT	812	Stout - American	3.52800000000000002	Heart of Darkness	https://untappd.akamaized.net/site/beer_logos/beer-77065_9dc3b_sm.jpeg	77065	30	5.70000000000000018
VT	812	IPA - American	3.42700000000000005	Encore	https://untappd.akamaized.net/site/beer_logos/beer-6899_ccbb7_sm.jpeg	6899	45	6.40000000000000036
VT	812	IPA - American	3.4700000000000002	hI.P.A.	https://untappd.akamaized.net/site/beer_logos/beer-3949_de77d_sm.jpeg	3949	70	6.70000000000000018
VT	812	IPA - Session / India Session Ale	3.43699999999999983	Low Key	https://untappd.akamaized.net/site/beer_logos/beer-1360935_1af62_sm.jpeg	1360935	40	4.5
VT	812	IPA - English	3.38099999999999978	Blind Faith	https://untappd.akamaized.net/site/beer_logos/beer-10281_9baa2_sm.jpeg	10281	60	6.20000000000000018
VT	812	Red Ale - American Amber / Red	3.38200000000000012	Vamplifier	https://untappd.akamaized.net/site/beer_logos/beer-1648567_8d949_sm.jpeg	1648567	60	5.20000000000000018
VT	812	Stout - Other	3.54599999999999982	Winter Mingle	https://untappd.akamaized.net/site/beer_logos/beer-1241003_31e35_sm.jpeg	1241003	30	5.79999999999999982
VT	812	Rye Beer	3.38899999999999979	Ticket To Rye	https://untappd.akamaized.net/site/beer_logos/beer-289207_3f3ad_sm.jpeg	289207	80	7.09999999999999964
VT	812	IPA - American	3.45800000000000018	S.M.A.S.H. Hits Vol. 1	https://untappd.akamaized.net/site/beer_logos/beer-1390654_d1c6d_sm.jpeg	1390654	45	5.5
VT	812	Pale Wheat Ale - American	3.22900000000000009	Hocus Pocus	https://untappd.akamaized.net/site/beer_logos/beer-1_d4bd9_sm.jpeg	1	13	4.5
VT	812	IPA - Black / Cascadian Dark Ale	3.39000000000000012	Demo	https://untappd.akamaized.net/site/beer_logos/beer-22683_16871_sm.jpeg	22683	45	6
VT	812	Red Ale - Irish	3.4049999999999998	Bob's First 	https://untappd.akamaized.net/site/beer_logos/beer-1145757_3ee85_sm.jpeg	1145757	20	4.59999999999999964
VT	812	Scotch Ale / Wee Heavy	3.33099999999999996	Jinx	https://untappd.akamaized.net/site/beer_logos/beer-4160_9f6f6_sm.jpeg	4160	0	6.90000000000000036
VT	812	IPA - Imperial / Double	3.63099999999999978	Big Hundo	https://untappd.akamaized.net/site/beer_logos/beer-573262_3efe0_sm.jpeg	573262	100	9
VT	812	IPA - American	3.39800000000000013	Hi #9	https://untappd.akamaized.net/site/beer_logos/beer-754415_cdf72_sm.jpeg	754415	55	5.90000000000000036
VT	812	IPA - American	3.56099999999999994	S.M.A.S.H. Hits Vol. 2	https://untappd.akamaized.net/site/beer_logos/beer-1683234_f7f92_sm.jpeg	1683234	58	5.5
VT	812	Pale Ale - American	3.42300000000000004	Odd Notion - Poppy Agave Ale (Summer 2016)	https://untappd.akamaized.net/site/beer_logos/beer-1473631_da904_sm.jpeg	1473631	26	5
VT	812	Stout - Other	3.69200000000000017	Feast of Fools	https://untappd.akamaized.net/site/beer_logos/beer-4161_df023_sm.jpeg	4161	28	6
CA	2445	IPA - Triple	4.14100000000000001	Simtra Triple IPA	https://untappd.akamaized.net/site/beer_logos/beer-SimtraTrippleIPA_93848.jpeg	93848	131	11.25
CA	2445	IPA - Imperial / Double	3.95800000000000018	Hoptologist DIPA	https://untappd.akamaized.net/site/beer_logos/beer-HoptologistDIPA_81914.jpeg	81914	102	9
CA	2445	IPA - Imperial / Double	4.03599999999999959	Lupulin River	https://untappd.akamaized.net/site/beer_logos/beer-976130_d7723_sm.jpeg	976130	76	8
CA	2445	Pale Ale - American	3.8490000000000002	Citra Extra Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-CitraPaleAle_79957.jpeg	79957	45	7
CA	2445	IPA - Triple	4.08399999999999963	Hop-Trio	https://untappd.akamaized.net/site/beer_logos/beer-381294_b32cc_sm.jpeg	381294	122	11.0999999999999996
CA	2445	IPA - Triple	4.00699999999999967	Hop Shortage	https://untappd.akamaized.net/site/beer_logos/beer-HopShortageTripleIPA_213489.jpeg	213489	133	11.3000000000000007
CA	2445	IPA - Imperial / Double Black	3.91800000000000015	Midnight Hoppyness	https://untappd.akamaized.net/site/beer_logos/beer-_269505_sm_84d0d34395c99519ce4f4a11384922.jpeg	269505	100	9.5
CA	2445	Porter - American	3.76600000000000001	Tanilla	https://untappd.akamaized.net/site/beer_logos/beer-TanillaPorter_33206.jpeg	33206	30	6.29999999999999982
CA	2445	IPA - Triple	3.98399999999999999	Hop-de-Ranged	https://untappd.akamaized.net/site/beer_logos/beer-313396_200e7_sm.jpeg	313396	138	14.5
CA	2445	IPA - Imperial / Double	3.9740000000000002	Big Sipper	https://untappd.akamaized.net/site/beer_logos/beer-1454015_efbf6_sm.jpeg	1454015	65	8
CA	2445	Porter - Imperial / Double	3.9009999999999998	Imperial Tanilla	https://untappd.akamaized.net/site/beer_logos/beer-ImperialTanilla_88534.jpeg	88534	0	10
CA	2445	Stout - Milk / Sweet	3.94700000000000006	Stoutella	https://untappd.akamaized.net/site/beer_logos/beer-1352478_3711e_sm.jpeg	1352478	35	6
CA	2445	IPA - American	3.77800000000000002	Batch No: 138 IPA	https://untappd.akamaized.net/site/beer_logos/beer-_286605_b922c11f43846c227b3039a0f0fe.jpeg	286605	75	7.5
CA	29181	Kölsch	3.53399999999999981	326 Kolsch	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1103741	0	4.59999999999999964
CA	2445	IPA - Belgian	3.8450000000000002	Belgo Hoptologist DIPA	https://untappd.akamaized.net/site/beer_logos/beer-_303117_2f9d250a18f96e8646889e2d3c5e.jpeg	303117	102	9
CA	2445	IPA - American	3.94899999999999984	Deep Dish	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1530044	50	6.40000000000000036
CA	2445	Red Ale - Imperial / Double	3.7410000000000001	McCarthy's Bane Imperial Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-ImperialRedAle_205035.jpeg	205035	80	8
CA	2445	IPA - American	3.79499999999999993	Aviator C-4	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1354794	64	7
CA	2445	IPA - American	3.87300000000000022	Galaxy on Fire	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1795233	45	6.5
CA	2445	IPA - Triple	4.05799999999999983	Hoparillo	https://untappd.akamaized.net/site/beer_logos/beer-1603286_512a4_sm.jpeg	1603286	122	11.0999999999999996
CA	2445	IPA - Triple	4.01900000000000013	Hop Surplus	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1309254	96	10
CA	2445	Stout - Imperial / Double	3.95000000000000018	Dark Side Belgian Imperial Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1738344	76	11
CA	2445	Witbier	3.43800000000000017	Wet Wittee	https://untappd.akamaized.net/site/beer_logos/beer-742849_e1572_sm.jpeg	742849	16	5.29999999999999982
CA	2445	Pale Ale - American	3.68199999999999994	Northeast Auburn Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-1827298_c5b99_sm.jpeg	1827298	40	4.5
CA	2445	IPA - American	3.8969999999999998	Man Juice IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1453695	69	6.5
MA	14088	Lager - IPL (India Pale Lager)	3.84399999999999986	Hoponius Union	https://untappd.akamaized.net/site/beer_logos/beer-69959_74a6e_sm.jpeg	69959	65	6.5
MA	14088	Smoked Beer	3.73799999999999999	Smoke & Dagger	https://untappd.akamaized.net/site/beer_logos/beer-71833_8120d_sm.jpeg	71833	25	5.79999999999999982
MA	14088	Lager - IPL (India Pale Lager)	3.93599999999999994	Kiwi Rising	https://untappd.akamaized.net/site/beer_logos/beer-99558_693a6_sm.jpeg	99558	105	8.5
MA	14088	Lager - IPL (India Pale Lager)	3.9049999999999998	Mass Rising	https://untappd.akamaized.net/site/beer_logos/beer-445956_4ec10_sm.jpeg	445956	100	8
MA	14088	Lager - Helles	3.56700000000000017	House Lager	https://untappd.akamaized.net/site/beer_logos/beer-938789_91d8d_sm.jpeg	938789	18	5.40000000000000036
MA	14088	Lager - Pale	3.49699999999999989	Leisure Time	https://untappd.akamaized.net/site/beer_logos/beer-179162_704d8_sm.jpeg	179162	15	4.79999999999999982
MA	14088	Lager - IPL (India Pale Lager)	4.00100000000000033	Excess IPL	https://untappd.akamaized.net/site/beer_logos/beer-1048978_4ce3b_sm.jpeg	1048978	80	7.20000000000000018
MA	14088	Lager - IPL (India Pale Lager)	3.7370000000000001	Calyptra	https://untappd.akamaized.net/site/beer_logos/beer-642932_a38e0_sm.jpeg	642932	45	4.90000000000000036
MA	14088	Märzen	3.629	Copper Legend	https://untappd.akamaized.net/site/beer_logos/beer-76462_67539_sm.jpeg	76462	22	5.70000000000000018
MA	14088	Lager - Pale	3.46099999999999985	Jabby Brau	https://untappd.akamaized.net/site/beer_logos/beer-100558_a2b88_sm.jpeg	100558	20	4.5
MA	14088	Porter - Baltic	4.11899999999999977	Bourbon Barrel-Aged Framinghammer	https://untappd.akamaized.net/site/beer_logos/beer-155749_e6e4b_sm.jpeg	155749	55	10
MA	14088	Porter - Baltic	3.97299999999999986	Framinghammer	https://untappd.akamaized.net/site/beer_logos/beer-126598_6c28c_sm.jpeg	126598	55	10
MA	14088	Pilsner - Other	3.52000000000000002	Sunny Ridge Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-560420_efaa3_sm.jpeg	560420	35	5.09999999999999964
MA	14088	Porter - Baltic	4.13699999999999957	Coffee Barrel-Aged Framinghammer	https://untappd.akamaized.net/site/beer_logos/beer-573910_51297_sm.jpeg	573910	55	10
MA	14088	Lager - IPL (India Pale Lager)	3.59799999999999986	Lashes Lager	https://untappd.akamaized.net/site/beer_logos/beer-272009_976f1_sm.jpeg	272009	50	6.79999999999999982
MA	14088	Porter - Baltic	3.93199999999999994	Peanut Butter & Jelly Barrel-Aged Framinghammer	https://untappd.akamaized.net/site/beer_logos/beer-614335_0e5d3_sm.jpeg	614335	55	10
MA	14088	Lager - Dunkel Munich	3.57900000000000018	Red Tape Lager	https://untappd.akamaized.net/site/beer_logos/beer-66236_98a52_sm.jpeg	66236	25	5
MA	14088	Rauchbier	3.57799999999999985	Fire In The Ham	https://untappd.akamaized.net/site/beer_logos/beer-242853_2bd56_sm.jpeg	242853	20	5.40000000000000036
MA	14088	Porter - Baltic	4.24399999999999977	Cocoa-Nut Barrel-Aged Framinghammer	https://untappd.akamaized.net/site/beer_logos/beer-600565_b25d8_sm.jpeg	600565	55	10
MA	14088	Lager - Dortmunder / Export	3.87699999999999978	Beer Geek Helles	https://untappd.akamaized.net/site/beer_logos/beer-1633630_6c019_sm.jpeg	1633630	0	4.90000000000000036
MA	14088	Doppelbock 	3.75099999999999989	Saxonator	https://untappd.akamaized.net/site/beer_logos/beer-108751_2db1d_sm.jpeg	108751	25	9
MA	14088	Lager - IPL (India Pale Lager)	4.00800000000000001	TrIPL	https://untappd.akamaized.net/site/beer_logos/beer-897834_70cd6_sm.jpeg	897834	100	10
MA	14088	Maibock/Helles Bock	3.65700000000000003	Maibock Hurts Like Helles	https://untappd.akamaized.net/site/beer_logos/beer-180363_66ea4_sm.jpeg	180363	25	6.5
MA	14088	Sour - Berliner Weisse	3.46399999999999997	Berliner Style Lager	https://untappd.akamaized.net/site/beer_logos/beer-746439_e1401_sm.jpeg	746439	0	3.5
MA	14088	Pumpkin / Yam Beer	3.6379999999999999	Pumpkin Crop Lager	https://untappd.akamaized.net/site/beer_logos/beer-257373_d3a9c_sm.jpeg	257373	10	5.5
CA	29181	Witbier	3.54000000000000004	Wit	https://untappd.akamaized.net/site/beer_logos/beer-727967_5eec2_sm.jpeg	727967	16	5.29999999999999982
CA	29181	Porter - Other	3.96200000000000019	(PCH) Pale Chocolate Heaven	https://untappd.akamaized.net/site/beer_logos/beer-858639_added_sm.jpeg	858639	22	6
CA	29181	IPA - American	3.71700000000000008	Inclined IPA	https://untappd.akamaized.net/site/beer_logos/beer-1132373_594eb_sm.jpeg	1132373	70	7.09999999999999964
CA	29181	Blonde Ale	3.43000000000000016	310 Blonde Ale	https://untappd.akamaized.net/site/beer_logos/beer-1082351_f2cfb_sm.jpeg	1082351	12	4.79999999999999982
CA	29181	IPA - Imperial / Double	4.04399999999999959	Head In the Clouds Juicy Double IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1746443	0	8.5
CA	29181	Kölsch	3.54999999999999982	Cucumber Kolsch	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1132278	14	5
CA	29181	Porter - Other	3.94300000000000006	Breakfast Beer	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1737868	0	4.90000000000000036
CA	29181	Pale Ale - American	3.61699999999999999	Blanco Bronco Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1766894	0	6.5
CA	29181	Spiced / Herbed Beer	3.68100000000000005	Chili Pepper XPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	858751	28	5.59999999999999964
CA	29181	IPA - American	3.85099999999999998	Hazy Does It!	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1889669	0	6.90000000000000036
CA	29181	Stout - Imperial / Double	3.73899999999999988	Surf Ninja	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1857521	0	10.3000000000000007
CA	29181	IPA - American	3.92300000000000004	There Will Be Juice	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1988024	0	7.70000000000000018
CA	29181	Porter - Other	4.04100000000000037	Santa Monica Golden Milk Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1787042	0	6
CA	29181	Pale Ale - American	3.54199999999999982	Chile Pepper Pale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1841349	0	5.70000000000000018
CA	29181	Porter - Other	3.82799999999999985	Calumet Bourbon Barrel PCH	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1865793	0	8
CA	29181	California Common	3.37199999999999989	California Blonde Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1239642	0	4.79999999999999982
CA	29181	Old Ale	4.06599999999999984	Brewer's Envy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1827245	0	10.5
CA	29181	Porter - Other	3.83300000000000018	Buffalo Trace Bourbon Barrel PCH	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1935810	0	8
CA	29181	Pale Wheat Ale - American	3.67899999999999983	Santa Monica Brew Works Witbier Belgian Wheat Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1677919	0	5.20000000000000018
CA	29181	Stout - Imperial / Double	4.09999999999999964	Imperial Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1133414	0	9
CA	29181	IPA - American	3.56300000000000017	Santa Monica Rotator Ipa	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1828845	65	6
CA	29181	Kölsch	3.43299999999999983	Feel Good Hit of the Summer	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1608668	0	4.90000000000000036
CA	29181	Pale Ale - New Zealand	3.65399999999999991	NZ Wakatu Session Experimental Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1788992	0	4.59999999999999964
CT	194951	IPA - American	3.80500000000000016	SUBduction™ IPA	https://untappd.akamaized.net/site/beer_logos/beer-1042763_85f7c_sm.jpeg	1042763	62	6.5
CT	194951	Stout - Other	3.97699999999999987	Libation Propaganda™ Coffee Stout	https://untappd.akamaized.net/site/beer_logos/beer-1056439_2001b_sm.jpeg	1056439	31	5.5
CT	194951	Red Ale - American Amber / Red	3.66500000000000004	Lonesome Boatman™ Ale	https://untappd.akamaized.net/site/beer_logos/beer-1031978_10d02_sm.jpeg	1031978	25	5.20000000000000018
CT	194951	IPA - Imperial / Double	3.98600000000000021	Hoppy Beerday	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1488139	0	8.90000000000000036
CT	194951	Porter - Other	3.78799999999999981	Firelands Smoked Cherry Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1307851	20	5.59999999999999964
CT	194951	Hefeweizen	3.70000000000000018	Outerweiss Hefeweizen	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1105879	7	5.09999999999999964
CT	194951	IPA - Imperial / Double	3.95699999999999985	Punching the Ocean	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1344028	0	8.69999999999999929
CT	194951	IPA - Session / India Session Ale	3.60000000000000009	Trail Magic Session IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1145091	43	4.79999999999999982
CT	194951	Pale Ale - American	3.76399999999999979	Ninja Trail Green Tea Pale Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1537949	30	5.40000000000000036
CT	194951	Saison / Farmhouse Ale	3.65899999999999981	Royal Sea Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1049718	20	5.79999999999999982
CT	194951	Pale Ale - American	3.64599999999999991	The Academy GPA (German Pale Ale)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1095335	30	6.20000000000000018
CT	194951	Lager - Pale	3.74199999999999999	Swell East Coast Lager	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1065421	40	5.90000000000000036
CT	194951	IPA - Black / Cascadian Dark Ale	3.80600000000000005	In the Black IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1281305	0	7.79999999999999982
CT	194951	Sour - Gose	3.69700000000000006	Pink Boots Orange Hibiscus Gose	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1490483	10	3.70000000000000018
CT	194951	IPA - Imperial / Double	3.93599999999999994	Barrel Aged Synapse Lapse	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1488140	0	9
CT	194951	Stout - Oyster	3.84100000000000019	Noank Smack	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1414052	15	5.79999999999999982
CT	194951	Weizenbock	3.76100000000000012	Stealing Sunsets Weizenbock	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1352447	8	8.30000000000000071
CT	194951	IPA - Session / India Session Ale	3.72699999999999987	Underway Session IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1623010	45	4.5
CT	194951	Saison / Farmhouse Ale	3.66400000000000015	Saison De Groton	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1663796	12	4.70000000000000018
CT	194951	Sour - Berliner Weisse	3.50300000000000011	In the Bluff Berliner Weisse	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1161313	3	3.70000000000000018
CT	194951	IPA - American	3.69300000000000006	Woods Devil India Brown Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1363382	0	0
CT	194951	IPA - Imperial / Double	4.04800000000000004	Making Waves	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1732231	0	9.19999999999999929
CT	194951	IPA - Imperial / Double	3.89599999999999991	Look Ma No Floaties	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1822451	0	8.40000000000000036
CT	194951	Bière de Garde	3.63899999999999979	Out Cold Blonde Bière De Garde	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1951975	16	8.59999999999999964
CT	194951	Porter - Baltic	4.08300000000000018	Southern Love	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1803356	15	7.79999999999999982
NC	3082	IPA - American	3.44799999999999995	Firewater IPA	https://untappd.akamaized.net/site/beer_logos/beer-11134_188ae_sm.jpeg	11134	64	6
NC	3082	Brown Ale - American	3.65799999999999992	Peanut Butter Jelly Time	https://untappd.akamaized.net/site/beer_logos/beer-994048_6cc63_sm.jpeg	994048	0	5.70000000000000018
NC	3082	Cream Ale	3.49699999999999989	Farmer Ted's Cream Ale	https://untappd.akamaized.net/site/beer_logos/beer-9544_2c829_sm.jpeg	9544	7	6
NC	3082	Pale Ale - American	3.54800000000000004	Mother Trucker Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-33358_d9132_sm.jpeg	33358	51	5
NC	3082	IPA - Red	3.68000000000000016	RED-iculous Red IPA	https://untappd.akamaized.net/site/beer_logos/beer-545889_f2de5_sm.jpeg	545889	58	6
NC	3082	Pumpkin / Yam Beer	3.63600000000000012	King Don's Pumpkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-79106_6e24d_sm.jpeg	79106	0	5.5
NC	3082	Porter - American	3.64599999999999991	King Coconut Porter	https://untappd.akamaized.net/site/beer_logos/beer-48681_b4c12_sm.jpeg	48681	35	5.20000000000000018
NC	3082	Brown Ale - English	3.62400000000000011	Brown Bear Ale	https://untappd.akamaized.net/site/beer_logos/beer-29695_5c7c3_sm.jpeg	29695	35	5.20000000000000018
NC	3082	IPA - Session / India Session Ale	3.64599999999999991	Astral Bootie Beer	https://untappd.akamaized.net/site/beer_logos/beer-1134066_20b51_sm.jpeg	1134066	40	4.5
NC	3082	Winter Ale	3.54300000000000015	King Winterbolt Winter Ale	https://untappd.akamaized.net/site/beer_logos/beer-503096_10aaf_sm.jpeg	503096	50	7
NC	3082	Saison / Farmhouse Ale	3.55200000000000005	Le Sexxxy Saison	https://untappd.akamaized.net/site/beer_logos/beer-46974_ae789_sm.jpeg	46974	35	7.59999999999999964
NC	3082	Scotch Ale / Wee Heavy	3.67099999999999982	Hooligan Scotch Ale	https://untappd.akamaized.net/site/beer_logos/beer-_109032_sm_888598aa6c71502091d5e127b36911.jpeg	109032	45	8
NC	3082	Red Ale - Irish	3.54300000000000015	Revenuers Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-11147_ac999_sm.jpeg	11147	23	5.20000000000000018
NC	3082	Stout - American	3.63200000000000012	Black Dome Stout	https://untappd.akamaized.net/site/beer_logos/beer-326315_88539_sm.jpeg	326315	0	6
NC	3082	IPA - Session / India Session Ale	3.57600000000000007	The Nose Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-458790_ba5c5_sm.jpeg	458790	35	4.75
NC	3082	IPA - American	3.84699999999999998	CLT IPA	https://untappd.akamaized.net/site/beer_logos/beer-1923819_d96d0_sm.jpeg	1923819	80	7.20000000000000018
NC	3082	IPA - American	3.63899999999999979	Pyranha Brown IPA	https://untappd.akamaized.net/site/beer_logos/beer-911411_345b6_sm.jpeg	911411	55	6
NC	3082	Cream Ale	3.45999999999999996	Farmer Ted Light With Lime	https://untappd.akamaized.net/site/beer_logos/beer-1519749_9e671_sm.jpeg	1519749	0	4.5
NC	3082	Pilsner - German	3.5259999999999998	ENO Hoppy Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-1473423_1e62b_sm.jpeg	1473423	37	4.90000000000000036
NC	3082	Stout - Other	3.72100000000000009	Hyper Monkey Java Stout	https://untappd.akamaized.net/site/beer_logos/beer-37526_42947_sm.jpeg	37526	0	6
NC	3082	IPA - Imperial / Double	3.81000000000000005	Brewtal Double IPA	https://untappd.akamaized.net/site/beer_logos/beer-597353_0c02d_sm.jpeg	597353	0	8.80000000000000071
NC	3082	Hefeweizen	3.50199999999999978	Queen Winterkill	https://untappd.akamaized.net/site/beer_logos/beer-1017758_fe87f_sm.jpeg	1017758	28	4.5
NC	3082	Pale Ale - American	3.35199999999999987	Mac's Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-_419638_sm_6a0b74fae00da4e43488040906bc89.jpeg	419638	0	4.75
NC	3082	IPA - Imperial / Double	3.70400000000000018	Hammer Factor Double IPA	https://untappd.akamaized.net/site/beer_logos/beer-1410891_fb09c_sm.jpeg	1410891	85	8.5
CA	5143	IPA - American	4.19700000000000006	Blind Pig IPA	https://untappd.akamaized.net/site/beer_logos/beer-russianriverBlindPig.jpg	4041	70	6.09999999999999964
CA	5143	Belgian Strong Golden Ale	3.95500000000000007	Damnation	https://untappd.akamaized.net/site/beer_logos/beer-_4498_ae18d965b35376df84cc17db0c6b.jpeg	4498	0	7.75
CA	5143	Sour - American Wild Ale	4.32599999999999962	Supplication	https://untappd.akamaized.net/site/beer_logos/beer-_5775_24cced3f110d437eebeaf0935f1f.jpeg	5775	0	7.75
CA	5143	Sour - American Wild Ale	4.35400000000000009	Consecration	https://untappd.akamaized.net/site/beer_logos/beer-Consecration_6908.jpeg	6908	0	10
CA	5143	Sour - American Wild Ale	4.24399999999999977	Temptation	https://untappd.akamaized.net/site/beer_logos/beer-russianRiverTemptation.jpg	6541	0	7.5
CA	5143	IPA - Triple	4.69200000000000017	Pliny the Younger	https://untappd.akamaized.net/site/beer_logos/beer-_28331_sm.jpeg	28331	90	10.25
CA	5143	Pale Ale - American	4.00800000000000001	Row 2, Hill 56	https://untappd.akamaized.net/site/beer_logos/beer-Row2Hill56_120888.jpeg	120888	65	5.79999999999999982
CA	5143	Sour - American Wild Ale	4.12999999999999989	Sanctification	https://untappd.akamaized.net/site/beer_logos/beer-russianRiverSanctification.jpg	8381	0	6.75
CA	5143	Blonde Ale - Belgian Blonde / Golden	3.75700000000000012	Redemption	https://untappd.akamaized.net/site/beer_logos/beer-russianRiverRedemption.jpg	6434	0	5.15000000000000036
CA	5143	Belgian Strong Dark Ale	3.89299999999999979	Salvation	https://untappd.akamaized.net/site/beer_logos/beer-russianRiverSalvation.jpg	10781	0	9.5
CA	5143	Bière de Garde	3.60199999999999987	Perdition	https://untappd.akamaized.net/site/beer_logos/beer-russianRiverPerdition.jpg	10769	3	6.09999999999999964
CA	5143	Stout - Irish Dry	3.47699999999999987	OVL Stout	https://untappd.akamaized.net/site/beer_logos/beer-_4501_sm_1e1af0a620a6c1ad7f8878e4df4aaa.jpeg	4501	0	4
CA	5143	Pilsner - Other	3.47299999999999986	STS Pils	https://untappd.akamaized.net/site/beer_logos/beer-748369_37d18_sm.jpeg	748369	33	5.29999999999999982
CA	5143	Pale Ale - American	3.82399999999999984	Happy Hops	https://untappd.akamaized.net/site/beer_logos/beer-HappyHops_39187.jpeg	39187	0	5.79999999999999982
CA	5143	Blonde Ale	3.36900000000000022	Aud Blonde	https://untappd.akamaized.net/site/beer_logos/beer-AudBlonde_4502.jpeg	4502	0	4.5
CA	5143	Pale Ale - American	3.81700000000000017	Dribble Belt	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	574587	0	4.5
CA	5143	Blonde Ale	3.62000000000000011	Defenestration	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	39846	0	7.25
CA	5143	Sour - American Wild Ale	4.50100000000000033	Beatification	https://untappd.akamaized.net/site/beer_logos/beer-Beatification_13150.jpeg	13150	0	6
CA	5143	Porter - American	3.68800000000000017	Porter	https://untappd.akamaized.net/site/beer_logos/beer-8487_13436_sm.jpeg	8487	0	5.75
CA	5143	Saison / Farmhouse Ale	3.56800000000000006	Erudition	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	45834	0	6.5
CA	5143	Porter - Imperial / Double	4.03000000000000025	Shadow of a Doubt	https://untappd.akamaized.net/site/beer_logos/beer-_323564_sm_c7742a9b96a2f81cf39e4b1c6e29ad.jpeg	323564	0	9.85999999999999943
CA	5143	Belgian Dubbel	3.6549999999999998	Benediction	https://untappd.akamaized.net/site/beer_logos/beer-Benediction_39224.jpeg	39224	0	6.75
CA	5143	Belgian Strong Dark Ale	3.70000000000000018	Rejection	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	18682	0	6.09999999999999964
CA	5143	Witbier	3.51399999999999979	Little White Lie	https://untappd.akamaized.net/site/beer_logos/beer-_10777_89144b032f56a52a976d5b537dbd.jpeg	10777	0	4.79999999999999982
CA	29	IPA - American	4.00600000000000023	Duet	https://untappd.akamaized.net/site/beer_logos/beer-5804_f90b2_sm.jpeg	5804	45	7
CA	29	IPA - Session / India Session Ale	3.88499999999999979	Hoppy Birthday	https://untappd.akamaized.net/site/beer_logos/beer-6451_8848b_sm.jpeg	6451	60	5.25
CA	29	IPA - Imperial / Double	4.05799999999999983	Pure Hoppiness	https://untappd.akamaized.net/site/beer_logos/beer-1256_109d6_sm.jpeg	1256	61	8
CA	29	IPA - American	3.98600000000000021	Windows Up	https://untappd.akamaized.net/site/beer_logos/beer-1706096_ebdb3_sm.jpeg	1706096	70	7
CA	29	Spiced / Herbed Beer	3.54199999999999982	Mandarin Nectar	https://untappd.akamaized.net/site/beer_logos/beer-27949_bea65_sm.jpeg	27949	6	6.5
CA	29	Pale Wheat Ale - American	3.66599999999999993	Willy Vanilly	https://untappd.akamaized.net/site/beer_logos/beer-26703_8cb6e_sm.jpeg	26703	0	5.5
CA	29	Stout - Other	3.64100000000000001	Captain Stout	https://untappd.akamaized.net/site/beer_logos/beer-CaptainStout_6311.jpeg	6311	0	6
CA	29	Pale Ale - American	3.51900000000000013	Alpine Ale	https://untappd.akamaized.net/site/beer_logos/beer-AlpineAle_11433.jpeg	11433	32	5.5
CA	29	Red Ale - Irish	3.58000000000000007	McIlhenney's Irish Red	https://untappd.akamaized.net/site/beer_logos/beer-McIlhenneysIrishRed_24506.jpeg	24506	13	6
CA	29	IPA - Triple	4.39299999999999979	Exponential Hoppiness	https://untappd.akamaized.net/site/beer_logos/beer-ExponentialHoppiness_9661.jpeg	9661	100	11
CA	29	IPA - Imperial / Double	4.36300000000000043	Bad Boy	https://untappd.akamaized.net/site/beer_logos/beer-7885_1c3c8_sm.jpeg	7885	0	9
CA	29	IPA - Imperial / Double	4.45199999999999996	Keene Idea	https://untappd.akamaized.net/site/beer_logos/beer-212837_b349c_sm.jpeg	212837	0	8.88000000000000078
CA	29	IPA - American	4.17600000000000016	HFS	https://untappd.akamaized.net/site/beer_logos/beer-892558_b47d8_sm.jpeg	892558	0	6.5
CA	29	IPA - American	4.07699999999999996	Singled Out w/ Mosaic	https://untappd.akamaized.net/site/beer_logos/beer-1450630_c55f8_sm.jpeg	1450630	0	6
CA	29	Stout - American Imperial / Double	4.13100000000000023	Odin's Raven	https://untappd.akamaized.net/site/beer_logos/beer-15307_1d23a_sm.jpeg	15307	0	11
CA	29	Rye Beer	3.77700000000000014	Rye'der On the Storm	https://untappd.akamaized.net/site/beer_logos/beer-1238580_0e268_sm.jpeg	1238580	0	6
CA	29	Pale Wheat Ale - American	3.34200000000000008	Willy	https://untappd.akamaized.net/site/beer_logos/beer-17516_ffe61_sm.jpeg	17516	0	4.90000000000000036
CA	29	Rye IPA	3.93800000000000017	Not Nelson	https://untappd.akamaized.net/site/beer_logos/beer-1521319_28a98_sm.jpeg	1521319	0	7
CA	29	Barleywine - American	4.5	Great	https://untappd.akamaized.net/site/beer_logos/beer-Great_10349.jpeg	10349	0	14
CA	29	IPA - Black / Cascadian Dark Ale	3.95100000000000007	Ugly	https://untappd.akamaized.net/site/beer_logos/beer-11422_36fd2_sm.jpeg	11422	0	7.5
CA	29	Pale Ale - American	3.96200000000000019	San Diego Surprise	https://untappd.akamaized.net/site/beer_logos/beer-695641_ad7e4_sm.jpeg	695641	0	5.5
CA	29	Pale Ale - American	4.03599999999999959	Baby Face	https://untappd.akamaized.net/site/beer_logos/beer-650853_2556e_sm.jpeg	650853	0	4.70000000000000018
CA	29	Lambic - Other	3.64500000000000002	Chez Monieux	https://untappd.akamaized.net/site/beer_logos/beer-ChezMonieux_35171.jpeg	35171	0	5.79999999999999982
CA	29	Stout - American Imperial / Double	4.21799999999999997	Odin's Raven (Bourbon Barrel Aged)	https://untappd.akamaized.net/site/beer_logos/beer-85197_71878_sm.jpeg	85197	0	11
OH	155169	IPA - American	3.60599999999999987	Flash Point	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	808611	50	6.70000000000000018
OH	155169	Red Ale - Irish	3.53799999999999981	Code 3	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	802432	18	5.20000000000000018
OH	155169	Blonde Ale	3.46099999999999985	Pin Up Girl	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	802419	15	5
OH	155169	Porter - Other	3.66500000000000004	Probie Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	808609	36	6.5
OH	155169	Fruit Beer	3.51100000000000012	Maltese Cross	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1233579	15	5
OH	155169	Sour - Gose	3.18299999999999983	Hoser Gose	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	835654	15	5
OH	155169	Stout - Russian Imperial	3.71899999999999986	Stand Pipe Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	931088	54	9
OH	155169	Red Ale - American Amber / Red	3.60199999999999987	Brush Fire	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1170889	28	8.5
OH	155169	Pale Ale - American	3.6160000000000001	50 Dalmatians	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1243454	35	5.70000000000000018
OH	155169	IPA - Imperial / Double	3.74900000000000011	Engine 103	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1205577	103	8.90000000000000036
OH	155169	Rye Beer	3.56700000000000017	High Ryes	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1010175	18	5.20000000000000018
OH	155169	Brown Ale - American	3.6379999999999999	Nutty Pyro	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1074312	0	5.59999999999999964
OH	155169	Winter Ale	3.54300000000000015	Winter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	877630	28	7.5
OH	155169	Blonde Ale	3.54899999999999993	Burning Bush	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1112522	15	5
OH	155169	Bock	3.65700000000000003	Bock Drop & Roll	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1446047	22	6.79999999999999982
OH	155169	Old Ale	3.81800000000000006	Barrel Aged Old Flame	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1435558	0	8.90000000000000036
OH	155169	Old Ale	3.62199999999999989	Old Flame	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1253710	45	7.40000000000000036
OH	155169	Witbier	3.56999999999999984	Infrared	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1253714	15	5
OH	155169	Red Ale - American Amber / Red	3.78200000000000003	Brush Fire Blended Bourbon & Cabernet Barrel Aged	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1207761	0	8.5
OH	155169	Red Ale - American Amber / Red	3.80399999999999983	Code 3 Barrel Aged	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1327014	18	6.20000000000000018
OH	155169	Pale Wheat Ale - American	3.53200000000000003	Blood Orange Wheat Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1242662	0	0
OH	155169	Porter - Other	3.53699999999999992	Barrel Aged Probie Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1878456	72	7.70000000000000018
OH	155169	IPA - American	3.68100000000000005	Barrel Aged Flashpoint	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1646481	72	6.70000000000000018
OH	155169	IPA - American	3.66400000000000015	Bourbon Barrel Aged Flash Point	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1697148	0	6.70000000000000018
CA	2340	IPA - Imperial / Double	4.03500000000000014	Knuckle Sandwich	https://untappd.akamaized.net/site/beer_logos/beer-8058_d04c7_sm.jpeg	8058	88	10
CA	2340	Rye IPA	3.57900000000000018	Rustic Rye IPA	https://untappd.akamaized.net/site/beer_logos/beer-8595_44757_sm.jpeg	8595	91	6.09999999999999964
CA	2340	Pale Ale - American	3.52700000000000014	Palomino Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-23343_1e6e9_sm.jpeg	23343	18	5.5
CA	2340	IPA - American	3.82299999999999995	Far Out IPA	https://untappd.akamaized.net/site/beer_logos/beer-136663_187f4_sm.jpeg	136663	81	7
CA	2340	Stout - Other	3.69099999999999984	Black Phoenix	https://untappd.akamaized.net/site/beer_logos/beer-8538_e3cb1_sm.jpeg	8538	37	6.70000000000000018
CA	2340	Blonde Ale - Belgian Blonde / Golden	3.71300000000000008	Golden Chaos	https://untappd.akamaized.net/site/beer_logos/beer-14396_fa040_sm.jpeg	14396	28	8.5
CA	2340	Red Ale - American Amber / Red	3.62999999999999989	Rocco Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-41389_d8fc4_sm.jpeg	41389	36	7.09999999999999964
CA	2340	Porter - American	3.35400000000000009	Mint Chocolate Porter	https://untappd.akamaized.net/site/beer_logos/beer-11130_05d86_sm.jpeg	11130	15	6.09999999999999964
CA	2340	Pumpkin / Yam Beer	3.43999999999999995	Pumpkin Ale	https://untappd.akamaized.net/site/beer_logos/beer-12845_db688_sm.jpeg	12845	18	6.09999999999999964
CA	2340	Spiced / Herbed Beer	3.4780000000000002	Mountain Meadow	https://untappd.akamaized.net/site/beer_logos/beer-129831_c3cdd_sm.jpeg	129831	18	5.5
CA	2340	Strong Ale - American	3.6419999999999999	Dr. Tongue	https://untappd.akamaized.net/site/beer_logos/beer-29741_d00a3_sm.jpeg	29741	100	7.70000000000000018
CA	2340	IPA - American	3.70000000000000018	Lupulin Thrill	https://untappd.akamaized.net/site/beer_logos/beer-121676_407f1_sm.jpeg	121676	100	7.70000000000000018
CA	2340	IPA - American	3.69099999999999984	SoCo IPA	https://untappd.akamaized.net/site/beer_logos/beer-13929_a0fbf_sm.jpeg	13929	90	7
CA	2340	Pale Ale - American	3.67899999999999983	Tropical Thunder	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	202305	29	6.40000000000000036
CA	2340	Barleywine - American	3.80100000000000016	Galaxian Barleywine	https://untappd.akamaized.net/site/beer_logos/beer-124235_4d9e9_sm.jpeg	124235	100	11
CA	2340	IPA - American	3.6160000000000001	Sucker Punch	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	549070	88	5.5
CA	2340	Witbier	3.45100000000000007	Lemongrass White	https://untappd.akamaized.net/site/beer_logos/beer-392915_51601_sm.jpeg	392915	10	5.29999999999999982
CA	2340	Scotch Ale / Wee Heavy	3.58700000000000019	Ugly Molly	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	601057	31	7.20000000000000018
CA	2340	Belgian Dubbel	3.51100000000000012	Plum Riot	https://untappd.akamaized.net/site/beer_logos/beer-26433_90535_sm.jpeg	26433	11	7.79999999999999982
CA	2340	Porter - Other	3.44499999999999984	Blackstrap Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	8517	30	5.59999999999999964
CA	2340	IPA - Triple	3.93299999999999983	Mouth Menace	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1436695	0	11.5999999999999996
CA	2340	Red Ale - Imperial / Double	3.93999999999999995	Hop Monster	https://untappd.akamaized.net/site/beer_logos/beer-_437464_sm_da1a06b129d1382687a197b78cf396.jpeg	437464	0	8
CA	2340	IPA - American	3.57299999999999995	Amerige IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	347531	0	7
CA	2340	Brown Ale - American	3.47100000000000009	Breaking Rad	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	323203	0	5
MA	23335	IPA - Imperial / Double	4.00699999999999967	Hoppiness Is A Warm Pun	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	883377	100	8.19999999999999929
MA	23335	IPA - Imperial / Double	3.99400000000000022	The Little Brother	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	934405	115	8.5
MA	23335	IPA - Imperial / Double	3.83400000000000007	Good Sense	https://untappd.akamaized.net/site/beer_logos/beer-1122472_4565f_sm.jpeg	1122472	85	8
MA	23335	Porter - Other	3.73600000000000021	Total Eclipse	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	282978	22	6
MA	23335	IPA - American	3.84799999999999986	Garden of Grass	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1188060	70	7.40000000000000036
MA	23335	Lager - Pale	3.25300000000000011	Stray Dog Lager	https://untappd.akamaized.net/site/beer_logos/beer-StrayDogLager_127025.jpeg	127025	0	4.5
MA	23335	IPA - Imperial / Double	4.01799999999999979	Trial By Combat	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1934510	90	8
MA	23335	IPA - American	3.94600000000000017	Art & Industry	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1853820	60	7
MA	23335	Lager - IPL (India Pale Lager)	3.94200000000000017	Hop Essence Series: Mosaic	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	611758	90	8
MA	23335	Stout - American	3.87300000000000022	Near & Dear	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1341323	20	8
MA	23335	Saison / Farmhouse Ale	3.57500000000000018	Soleil	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	441985	0	7
MA	23335	IPA - American	3.7719999999999998	Hop Essence Series: Simcoe	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	621405	0	7
MA	23335	IPA - Imperial / Double	3.71899999999999986	Corduroy Cowboy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1992212	90	8.40000000000000036
MA	23335	IPA - American	4.07200000000000006	C_lvin	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1780932	0	7
MA	23335	Pilsner - Czech	3.41000000000000014	Jan	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1049564	25	4.59999999999999964
MA	23335	IPA - American	3.90899999999999981	Hop Essence: Galaxy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	823450	0	7.5
MA	23335	Pale Ale - American	3.71399999999999997	Hop Essence Series: Mandarina Bavaria	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	673358	45	6
MA	23335	IPA - Black / Cascadian Dark Ale	3.69799999999999995	Hop Essence Series: Centennial	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	466246	0	8
MA	23335	Maibock/Helles Bock	3.70199999999999996	Hop Essence Series: Motueka	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	528441	100	8.30000000000000071
MA	23335	Pale Ale - American	3.57799999999999985	Hop Essence Series: Hallertau Blanc	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	778828	45	6
MA	23335	IPA - White	3.47199999999999998	Hop Essence Series: HBC342	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	545604	58	7.5
MA	23335	Blonde Ale	3.51200000000000001	James	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	402388	0	5.40000000000000036
MA	23335	IPA - American	3.91699999999999982	Hop Essence Series: Galaxy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	829793	65	7.5
MA	23335	IPA - Session / India Session Ale	3.68199999999999994	Cock-a-doodle Brew	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	995217	0	0
MO	44	Lager - North American Adjunct	2.51900000000000013	Budweiser	https://untappd.akamaized.net/site/beer_logos/beer-3783_b208c_sm.jpeg	3783	12	5
MO	44	Lager - American Light	2.35400000000000009	Michelob ULTRA	https://untappd.akamaized.net/site/beer_logos/beer-6655_ea1d1_sm.jpeg	6655	10	4.20000000000000018
MO	44	Lager - American Light	2.56899999999999995	Bud Light Lime	https://untappd.akamaized.net/site/beer_logos/beer-6341_50b91_sm.jpeg	6341	0	4.20000000000000018
MO	44	Lager - American Light	2.29000000000000004	Busch Light	https://untappd.akamaized.net/site/beer_logos/beer-7018_afab3_sm.jpeg	7018	0	4.09999999999999964
MO	44	Lager - American Light	2.34600000000000009	Bud Light Platinum	https://untappd.akamaized.net/site/beer_logos/beer-96975_05c7c_sm.jpeg	96975	0	6
MO	44	Lager - American Light	2.00199999999999978	Natural Light	https://untappd.akamaized.net/site/beer_logos/beer-3947_fb0a7_sm.jpeg	3947	0	4.20000000000000018
MO	44	Bock	3.03900000000000015	Michelob AmberBock	https://untappd.akamaized.net/site/beer_logos/beer-6375_60cb9_sm.jpeg	6375	19	5.09999999999999964
MO	44	Lager - North American Adjunct	2.32200000000000006	Busch Beer	https://untappd.akamaized.net/site/beer_logos/beer-7377_6690a_sm.jpeg	7377	0	4.29999999999999982
MO	44	Lager - American Light	2.31999999999999984	Budweiser Select	https://untappd.akamaized.net/site/beer_logos/beer-3785_abeec_sm.jpeg	3785	0	4.29999999999999982
MO	44	Fruit Beer	3.10899999999999999	Wild Blue	https://untappd.akamaized.net/site/beer_logos/beer-3976_81ce7_sm.jpeg	3976	0	8
MO	44	Lager - American Amber / Red	2.71499999999999986	Budweiser Black Crown	https://untappd.akamaized.net/site/beer_logos/beer-271436_a3b11_sm.jpeg	271436	0	6
MO	44	Red Ale - American Amber / Red	3.14100000000000001	ZiegenBock Amber	https://untappd.akamaized.net/site/beer_logos/beer-4514_9ef4f_sm.jpeg	4514	0	4.90000000000000036
MO	44	Lager - American Light	2.72900000000000009	Michelob Golden Draft Light	https://untappd.akamaized.net/site/beer_logos/beer-6752_a0c32_sm.jpeg	6752	0	4.09999999999999964
MO	44	Fruit Beer	2.41699999999999982	Bud Light Lime Lime-A-Rita	https://untappd.akamaized.net/site/beer_logos/beer-142903_f9d6f_sm.jpeg	142903	0	8
MO	44	Cider	3.09399999999999986	Johnny Appleseed	https://untappd.akamaized.net/site/beer_logos/beer-586941_276ae_sm.jpeg	586941	0	5.5
MO	44	Fruit Beer	2.52499999999999991	Bud Light Lime Straw-Ber-Rita	https://untappd.akamaized.net/site/beer_logos/beer-311058_d602b_sm.jpeg	311058	22	8
MO	44	Lager - North American Adjunct	1.67999999999999994	Natural Ice	https://untappd.akamaized.net/site/beer_logos/beer-3946_c6101_sm.jpeg	3946	0	5.90000000000000036
MO	44	Gluten-Free	2.41400000000000015	Redbridge	https://untappd.akamaized.net/site/beer_logos/beer-4953_f442f_sm.jpeg	4953	0	4
MO	44	Lager - North American Adjunct	1.98100000000000009	Bud Ice	https://untappd.akamaized.net/site/beer_logos/beer-11666_837ba_sm.jpeg	11666	0	5.5
MO	44	Lager - American Light	2.32399999999999984	Michelob Light	https://untappd.akamaized.net/site/beer_logos/beer-7054_3f965_sm.jpeg	7054	0	4.09999999999999964
MO	44	Lager - American Light	1.79400000000000004	Budweiser Select 55	https://untappd.akamaized.net/site/beer_logos/beer-6124_5bd35_sm.jpeg	6124	0	3.20000000000000018
MO	44	Fruit Beer	2.71200000000000019	Bud Light Lime Mang-O-Rita	https://untappd.akamaized.net/site/beer_logos/beer-528915_0c697_sm.jpeg	528915	0	8
MO	44	Lager - American Amber / Red	2.81000000000000005	Busch Signature Copper Lager	https://untappd.akamaized.net/site/beer_logos/beer-561578_4bced_sm.jpeg	561578	0	5.70000000000000018
MO	44	Fruit Beer	2.7280000000000002	Bud Light Lime Raz-Ber-Rita	https://untappd.akamaized.net/site/beer_logos/beer-528918_797cd_sm.jpeg	528918	0	8
CO	123311	IPA - American	3.72199999999999998	NoCO IPA 	https://untappd.akamaized.net/site/beer_logos/beer-651153_3e540_sm.jpeg	651153	0	7.40000000000000036
CO	123311	Brown Ale - American	3.66800000000000015	Whistle Blast Honey Brown	https://untappd.akamaized.net/site/beer_logos/beer-660653_e8db2_sm.jpeg	660653	0	6.29999999999999982
CO	123311	Pale Ale - American	3.67300000000000004	Picnic Rock Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-673279_07203_sm.jpeg	673279	0	6
CO	123311	IPA - Imperial / Double	3.8450000000000002	Agitated Aardvark	https://untappd.akamaized.net/site/beer_logos/beer-733483_fe3ff_sm.jpeg	733483	0	8.19999999999999929
CO	123311	Red Ale - Irish	3.65700000000000003	H&D Fire Captain Irish Red Ale	https://untappd.akamaized.net/site/beer_logos/beer-760212_66d14_sm.jpeg	760212	0	6.70000000000000018
CO	123311	Blonde Ale	3.62599999999999989	Almost Summer Ale	https://untappd.akamaized.net/site/beer_logos/beer-651091_86990_sm.jpeg	651091	0	5.09999999999999964
CO	123311	Stout - Other	3.73200000000000021	H&D Dark Chocolate Stout	https://untappd.akamaized.net/site/beer_logos/beer-651108_15870_sm.jpeg	651108	0	6.79999999999999982
CO	123311	Spiced / Herbed Beer	3.9780000000000002	H&D Snug	https://untappd.akamaized.net/site/beer_logos/beer-870007_5e0fa_sm.jpeg	870007	0	8.19999999999999929
CO	123311	Kölsch	3.5169999999999999	Fort Kölnz Keller Kölsch Style Ale	https://untappd.akamaized.net/site/beer_logos/beer-816968_a0ae8_sm.jpeg	816968	0	5.20000000000000018
CO	123311	IPA - American	3.95299999999999985	Maracuyá IPA	https://untappd.akamaized.net/site/beer_logos/beer-660614_0d866_sm.jpeg	660614	0	7.90000000000000036
CO	123311	Sour - Berliner Weisse	3.64900000000000002	Sage Adweisse	https://untappd.akamaized.net/site/beer_logos/beer-916000_ec7e6_sm.jpeg	916000	0	3
CO	123311	Porter - Other	3.95900000000000007	Scottish Tradesman Coconut Porter	https://untappd.akamaized.net/site/beer_logos/beer-904001_e18f9_sm.jpeg	904001	0	9.5
CO	123311	Porter - Other	4.14900000000000002	Rum Barrel Aged Coconut Porter	https://untappd.akamaized.net/site/beer_logos/beer-1024044_19919_sm.jpeg	1024044	0	9
CO	123311	Kölsch	3.72599999999999998	Curious Cricket Cucumber Basil Kolsch	https://untappd.akamaized.net/site/beer_logos/beer-1193627_24e98_sm.jpeg	1193627	0	4.79999999999999982
CO	123311	Golden Ale	3.75300000000000011	Morgan's Savvy Golden Peach Ale	https://untappd.akamaized.net/site/beer_logos/beer-781162_87278_sm.jpeg	781162	0	5.40000000000000036
CO	123311	Sour - Ale	3.78200000000000003	Ruby Throated Red Kettle Sour	https://untappd.akamaized.net/site/beer_logos/beer-1696844_5128e_sm.jpeg	1696844	0	4.20000000000000018
CO	123311	Cream Ale	3.80200000000000005	N+1 Imperial Cream Ale	https://untappd.akamaized.net/site/beer_logos/beer-1524602_276cf_sm.jpeg	1524602	0	8.5
CO	123311	Sour - Berliner Weisse	3.69700000000000006	Rhubarb Tart	https://untappd.akamaized.net/site/beer_logos/beer-1908541_68a2b_sm.jpeg	1908541	0	4.20000000000000018
CO	123311	Stout - American	3.54999999999999982	Harold's Day Out Stout	https://untappd.akamaized.net/site/beer_logos/beer-1346334_1a3c6_sm.jpeg	1346334	0	4.59999999999999964
CO	123311	Pale Ale - American	3.78900000000000015	Bounty of the Bine 2016	https://untappd.akamaized.net/site/beer_logos/beer-1760758_0eccf_sm.jpeg	1760758	0	5.59999999999999964
CO	123311	IPA - Imperial / Double	3.87699999999999978	FMR Double Red IPA	https://untappd.akamaized.net/site/beer_logos/beer-1014547_1f992_sm.jpeg	1014547	0	8.09999999999999964
CO	123311	IPA - Session / India Session Ale	3.48099999999999987	Belma Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-1604238_f17ef_sm.jpeg	1604238	0	4.29999999999999982
CO	123311	English Mild Ale	3.62599999999999989	Total Genie ESB	https://untappd.akamaized.net/site/beer_logos/beer-1113073_15b76_sm.jpeg	1113073	0	4.70000000000000018
CO	123311	IPA - White	3.59399999999999986	BTW White IPA	https://untappd.akamaized.net/site/beer_logos/beer-1667300_2260b_sm.jpeg	1667300	0	5.79999999999999982
SC	181813	Saison / Farmhouse Ale	3.81800000000000006	Brand New Eyes	https://untappd.akamaized.net/site/beer_logos/beer-950479_ac005_sm.jpeg	950479	32	5.5
SC	181813	Saison / Farmhouse Ale	3.78500000000000014	RumbleFish	https://untappd.akamaized.net/site/beer_logos/beer-1059497_ca0d3_sm.jpeg	1059497	40	6.79999999999999982
SC	181813	Saison / Farmhouse Ale	3.81000000000000005	Rustic Sunday	https://untappd.akamaized.net/site/beer_logos/beer-1036070_a73ff_sm.jpeg	1036070	32	6.5
SC	181813	Sour - American Wild Ale	4.01600000000000001	Paper Airplanes	https://untappd.akamaized.net/site/beer_logos/beer-1517448_dd2e5_sm.jpeg	1517448	25	6
SC	181813	Sour - Gose	3.79099999999999993	Rhubarb Gose	https://untappd.akamaized.net/site/beer_logos/beer-1004594_515c6_sm.jpeg	1004594	12	4.59999999999999964
SC	181813	Sour - American Wild Ale	4.06500000000000039	False Face - Sour Stout	https://untappd.akamaized.net/site/beer_logos/beer-1467612_ac3b1_sm.jpeg	1467612	24	5.79999999999999982
SC	181813	Sour - American Wild Ale	3.87599999999999989	Sour Pumpkin	https://untappd.akamaized.net/site/beer_logos/beer-1241067_44a49_sm.jpeg	1241067	0	7.5
SC	181813	IPA - American	3.83400000000000007	Touch of Grey - Collab W/River Rat	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1521194	54	6.40000000000000036
SC	181813	IPA - Imperial / Double	4.10099999999999998	1320 Hampton Ave	https://untappd.akamaized.net/site/beer_logos/beer-1353335_f6072_sm.jpeg	1353335	90	9.5
SC	181813	Sour - Gose	3.85199999999999987	Ginger Pear Gose	https://untappd.akamaized.net/site/beer_logos/beer-1549495_2658d_sm.jpeg	1549495	0	5.29999999999999982
SC	181813	Saison / Farmhouse Ale	3.63700000000000001	Parachutes - 2015	https://untappd.akamaized.net/site/beer_logos/beer-1188049_8a3de_sm.jpeg	1188049	22	7
SC	181813	Saison / Farmhouse Ale	3.4780000000000002	Carrot Ginger Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1804723	0	5.5
SC	181813	IPA - American	3.71799999999999997	Strawberry IPA	https://untappd.akamaized.net/site/beer_logos/beer-1614743_81987_sm.jpeg	1614743	60	6.20000000000000018
SC	181813	IPA - American	3.95900000000000007	SideWinder IPA	https://untappd.akamaized.net/site/beer_logos/beer-1480327_cf49d_sm.jpeg	1480327	65	6.79999999999999982
SC	181813	Sour - American Wild Ale	4.10099999999999998	Skin & Bone	https://untappd.akamaized.net/site/beer_logos/beer-1380461_86595_sm.jpeg	1380461	33	5.79999999999999982
SC	181813	Stout - Milk / Sweet	3.93199999999999994	Show Me Your Udders	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1867239	0	4.70000000000000018
SC	181813	Sour - Ale	4.03000000000000025	American Sour: Black Currant Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1644898	0	6.79999999999999982
SC	181813	Sour - Ale	3.90700000000000003	Apricot D'or	https://untappd.akamaized.net/site/beer_logos/beer-1574378_19491_sm.jpeg	1574378	0	4.29999999999999982
SC	181813	Stout - Imperial / Double	3.98399999999999999	Wolves In the Piano	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1866835	36	11
SC	181813	Saison / Farmhouse Ale	3.81199999999999983	Juniper Saison	https://untappd.akamaized.net/site/beer_logos/beer-1516734_c904b_sm.jpeg	1516734	30	5
SC	181813	Sour - Ale	3.94600000000000017	Sour IPA - Collab 2 With Thomas Creek	https://untappd.akamaized.net/site/beer_logos/beer-1353333_12255_sm.jpeg	1353333	35	6
SC	181813	Sour - Berliner Weisse	3.79599999999999982	Peach Berliner Weisse - Collab With Thomas Creek	https://untappd.akamaized.net/site/beer_logos/beer-1204837_6f91d_sm.jpeg	1204837	3	5
SC	181813	Saison / Farmhouse Ale	3.76500000000000012	Carolyn - Coffee Hibiscus Saison	https://untappd.akamaized.net/site/beer_logos/beer-1467581_b570a_sm.jpeg	1467581	30	5.5
SC	181813	Sour - Ale	3.92799999999999994	Blackberry D'or	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1714165	0	4.29999999999999982
SC	181813	Sour - Ale	4.02899999999999991	Biggie Mango	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1794864	0	4.5
CA	4406	Pilsner - Other	3.25999999999999979	Angel City Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-508253_715ba_sm.jpeg	508253	40	5.59999999999999964
CA	4406	Witbier	3.37400000000000011	Angel City Wit	https://untappd.akamaized.net/site/beer_logos/beer-176961_8e9fd_sm.jpeg	176961	13	4.90000000000000036
CA	4406	Stout - Other	3.66199999999999992	White Nite	https://untappd.akamaized.net/site/beer_logos/beer-349831_7a6fb_sm.jpeg	349831	0	4.29999999999999982
CA	4406	IPA - Session / India Session Ale	3.51500000000000012	Social IPA	https://untappd.akamaized.net/site/beer_logos/beer-815933_8d8c3_sm.jpeg	815933	55	4.40000000000000036
CA	4406	Pale Wheat Ale - American	3.30699999999999994	Angel City West Coast Wheat	https://untappd.akamaized.net/site/beer_logos/beer-563031_c18d0_sm.jpeg	563031	28	4.59999999999999964
CA	4406	Lager - Pale	3.50099999999999989	Angel City Lager	https://untappd.akamaized.net/site/beer_logos/beer-1278833_65b0d_sm.jpeg	1278833	25	4.79999999999999982
CA	4406	Märzen	3.45000000000000018	Oktoberfest	https://untappd.akamaized.net/site/beer_logos/beer-360325_ca79d_sm.jpeg	360325	20	6
CA	4406	Sour - Berliner Weisse	3.32900000000000018	Berliner Weisse	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	324263	0	3.29999999999999982
CA	4406	Porter - American	3.53299999999999992	Winter Vanilla Porter	https://untappd.akamaized.net/site/beer_logos/beer-290054_978e1_sm.jpeg	290054	30	6.5
CA	4406	Lager - Pale	3.17499999999999982	Marilyn	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	813492	0	4.79999999999999982
CA	4406	Red Ale - American Amber / Red	3.33400000000000007	Amber	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	331091	0	4.59999999999999964
CA	4406	IPA - American	3.46499999999999986	All Night IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	395084	0	4.40000000000000036
CA	4406	Spiced / Herbed Beer	3.21300000000000008	Srirachelada Original	https://untappd.akamaized.net/site/beer_logos/beer-1157719_52eb4_sm.jpeg	1157719	0	4.09999999999999964
CA	4406	Barleywine - American	3.54499999999999993	Belligerent Bloke	https://untappd.akamaized.net/site/beer_logos/beer-381972_0add4_sm.jpeg	381972	0	10.5999999999999996
CA	4406	Pale Wheat Ale - American	3.33199999999999985	Tart Cherry Imperial Wheat	https://untappd.akamaized.net/site/beer_logos/beer-669203_07ff7_sm.jpeg	669203	30	8.09999999999999964
CA	4406	Rye Beer	3.69600000000000017	Dark Rye Lager - Bourbon Barrel Aged	https://untappd.akamaized.net/site/beer_logos/beer-489148_17a32_sm.jpeg	489148	0	11
CA	4406	IPA - Imperial / Double	3.85400000000000009	Double IPA	https://untappd.akamaized.net/site/beer_logos/beer-1273726_9e794_sm.jpeg	1273726	70	8.59999999999999964
CA	4406	Lager - Dark	3.65200000000000014	Black Lager	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1441879	0	4.79999999999999982
CA	4406	Rye Beer	3.89000000000000012	Dark Rye Lager - Brandy Barrel Aged	https://untappd.akamaized.net/site/beer_logos/beer-489150_1c179_sm.jpeg	489150	34	11
CA	4406	Blonde Ale	3.42700000000000005	Avocado Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	438498	0	4.5
CA	4406	Stout - Other	3.63300000000000001	Orange and Cocoa Stout	https://untappd.akamaized.net/site/beer_logos/beer-989548_13d7a_sm.jpeg	989548	0	5.90000000000000036
CA	4406	Sour - Gose	3.6549999999999998	Salted Caramel Gose	https://untappd.akamaized.net/site/beer_logos/beer-1517662_f9754_sm.jpeg	1517662	10	4.29999999999999982
CA	4406	IPA - Black / Cascadian Dark Ale	3.68299999999999983	Number of the Yeast	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1296566	66	6.66000000000000014
CA	4406	Spiced / Herbed Beer	3.18100000000000005	Srirachelada Spicy	https://untappd.akamaized.net/site/beer_logos/beer-1217017_c7717_sm.jpeg	1217017	0	4
OH	69953	Blonde Ale	3.52499999999999991	Cougar	https://untappd.akamaized.net/site/beer_logos/beer-393437_7eeb4_sm.jpeg	393437	20	4.79999999999999982
OH	69953	IPA - Session / India Session Ale	3.71600000000000019	Zen	https://untappd.akamaized.net/site/beer_logos/beer-485789_c7f6a_sm.jpeg	485789	45	4.79999999999999982
OH	69953	Pale Ale - American	3.78900000000000015	Pure Fury	https://untappd.akamaized.net/site/beer_logos/beer-557214_c2f9e_sm.jpeg	557214	42	5.70000000000000018
OH	69953	Lager - Red	3.629	Hustle	https://untappd.akamaized.net/site/beer_logos/beer-629053_3b4c3_sm.jpeg	629053	17	4.79999999999999982
OH	69953	Porter - American	3.74199999999999999	Panther	https://untappd.akamaized.net/site/beer_logos/beer-467692_22cba_sm.jpeg	467692	28	5.79999999999999982
OH	69953	Red Ale - American Amber / Red	3.60000000000000009	Dad	https://untappd.akamaized.net/site/beer_logos/beer-509027_e86f4_sm.jpeg	509027	45	6
OH	69953	Märzen	3.60899999999999999	Franz	https://untappd.akamaized.net/site/beer_logos/beer-454961_19bcd_sm.jpeg	454961	20	5.40000000000000036
OH	69953	Sour - Gose	3.68400000000000016	Peach Dodo	https://untappd.akamaized.net/site/beer_logos/beer-1238398_f90b5_sm.jpeg	1238398	12	4.40000000000000036
OH	69953	IPA - Imperial / Double	4.12300000000000022	Saber Tooth Tiger	https://untappd.akamaized.net/site/beer_logos/beer-420647_e670d_sm.jpeg	420647	95	8.90000000000000036
OH	69953	Rye IPA	3.87699999999999978	Streaker	https://untappd.akamaized.net/site/beer_logos/beer-1145083_fa503_sm.jpeg	1145083	60	6
OH	69953	Pale Ale - Belgian	3.68000000000000016	Fiction	https://untappd.akamaized.net/site/beer_logos/beer-435978_3ffbc_sm.jpeg	435978	40	6
OH	69953	Pilsner - Other	3.51799999999999979	Puma	https://untappd.akamaized.net/site/beer_logos/beer-721294_abec0_sm.jpeg	721294	40	5.20000000000000018
OH	69953	Pale Ale - American	3.75499999999999989	Crash	https://untappd.akamaized.net/site/beer_logos/beer-1508987_d8c0c_sm.jpeg	1508987	44	5.40000000000000036
OH	69953	Pale Ale - American	3.80500000000000016	Mosaic	https://untappd.akamaized.net/site/beer_logos/beer-915895_33878_sm.jpeg	915895	45	5.59999999999999964
OH	69953	Cider	3.60700000000000021	Cidergeist Semi Dry	https://untappd.akamaized.net/site/beer_logos/beer-1173527_63f88_sm.jpeg	1173527	0	6.20000000000000018
OH	69953	Stout - Russian Imperial	3.97900000000000009	Ink	https://untappd.akamaized.net/site/beer_logos/beer-555916_ceda8_sm.jpeg	555916	57	10
OH	69953	Cider	3.45299999999999985	Cidergeist Dry Hopped	https://untappd.akamaized.net/site/beer_logos/beer-1173532_25ec8_sm.jpeg	1173532	0	6.20000000000000018
OH	69953	Pale Ale - American	3.7410000000000001	Andromeda	https://untappd.akamaized.net/site/beer_logos/beer-896685_fe33a_sm.jpeg	896685	48	5.70000000000000018
OH	69953	Scottish Ale	3.80600000000000005	Emergency Malt Kit	https://untappd.akamaized.net/site/beer_logos/beer-1814594_7fd85_sm.jpeg	1814594	22	7
OH	69953	IPA - Triple	4.08000000000000007	Stryker	https://untappd.akamaized.net/site/beer_logos/beer-1075847_be039_sm.jpeg	1075847	100	10.6999999999999993
OH	69953	Sour - Ale	3.89800000000000013	Trips	https://untappd.akamaized.net/site/beer_logos/beer-1614156_57086_sm.jpeg	1614156	12	7.5
OH	69953	English Mild Ale	3.52000000000000002	Uncle	https://untappd.akamaized.net/site/beer_logos/beer-393439_89889_sm.jpeg	393439	17	3.79999999999999982
OH	69953	Stout - Imperial / Double	4.0259999999999998	Cafe Ink	https://untappd.akamaized.net/site/beer_logos/beer-939748_edf6a_sm.jpeg	939748	57	10
OH	69953	IPA - Imperial / Double	3.97500000000000009	Knowledge	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1961590	98	8.5
CA	3397	Gruit / Ancient Herbed Ale	3.4870000000000001	Golden State of Mind	https://untappd.akamaized.net/site/beer_logos/beer-40078_86fda_sm.jpeg	40078	0	4.40000000000000036
CA	3397	IPA - Session / India Session Ale	3.42200000000000015	Uncle Jesse	https://untappd.akamaized.net/site/beer_logos/beer-42266_c468a_sm.jpeg	42266	42	4.40000000000000036
CA	3397	IPA - American	3.6469999999999998	East Bay IPA	https://untappd.akamaized.net/site/beer_logos/beer-69154_43539_sm.jpeg	69154	100	7.75
CA	3397	Gruit / Ancient Herbed Ale	3.6080000000000001	Cherry Kush	https://untappd.akamaized.net/site/beer_logos/beer-203705_1d13d_sm.jpeg	203705	0	4
CA	3397	Saison / Farmhouse Ale	3.58199999999999985	La Niña Fresa	https://untappd.akamaized.net/site/beer_logos/beer-674686_513f6_sm.jpeg	674686	0	4.75
CA	3397	Sour - Ale	3.79300000000000015	Pink Drank	https://untappd.akamaized.net/site/beer_logos/beer-197258_54a45_sm.jpeg	197258	0	6
CA	3397	Sour - Berliner Weisse	3.67799999999999994	East Bayliner Weisse	https://untappd.akamaized.net/site/beer_logos/beer-391976_36fc2_sm.jpeg	391976	0	4.5
CA	3397	Kölsch	3.55299999999999994	Beast Oakland	https://untappd.akamaized.net/site/beer_logos/beer-1227156_cc2de_sm.jpeg	1227156	0	4.5
CA	3397	Brown Ale - American	3.54999999999999982	Spring Fling	https://untappd.akamaized.net/site/beer_logos/beer-39880_46d71_sm.jpeg	39880	0	6.5
CA	3397	Pale Wheat Ale - American	3.66400000000000015	House Burmese Ale (with Burma Superstar)	https://untappd.akamaized.net/site/beer_logos/beer-510273_1666a_sm.jpeg	510273	0	4.25
CA	3397	Rye Beer	3.96899999999999986	Dueling Pipers	https://untappd.akamaized.net/site/beer_logos/beer-257782_e5154_sm.jpeg	257782	0	10.5
CA	3397	Sour - American Wild Ale	3.70999999999999996	Aussie Kiss	https://untappd.akamaized.net/site/beer_logos/beer-1399956_e8f93_sm.jpeg	1399956	0	6
CA	3397	Kölsch	3.7669999999999999	Fruitvale Grind	https://untappd.akamaized.net/site/beer_logos/beer-1705509_0507f_sm.jpeg	1705509	0	4.20000000000000018
CA	3397	Sour - American Wild Ale	3.95199999999999996	Protect Ya Nectarine	https://untappd.akamaized.net/site/beer_logos/beer-1912635_50246_sm.jpeg	1912635	0	4.75
CA	3397	Sour - Ale	3.71200000000000019	Kiwi As	https://untappd.akamaized.net/site/beer_logos/beer-1808319_3788b_sm.jpeg	1808319	0	6
CA	3397	Sour - Gose	3.83800000000000008	Gose Ride The Whip	https://untappd.akamaized.net/site/beer_logos/beer-1898387_e307e_sm.jpeg	1898387	0	4.40000000000000036
CA	3397	Brown Ale - American	3.81999999999999984	Nitro Derby	https://untappd.akamaized.net/site/beer_logos/beer-1424477_b716f_sm.jpeg	1424477	0	6
CA	3397	Other	3.05399999999999983	SMASH Tart	https://untappd.akamaized.net/site/beer_logos/beer-1571052_cb4fd_sm.jpeg	1571052	64	6.5
CA	3397	IPA - American	3.56400000000000006	Fruitvale Bomber	https://untappd.akamaized.net/site/beer_logos/beer-1658883_bba76_sm.jpeg	1658883	0	6.29999999999999982
CA	3397	Wheat Wine	3.31300000000000017	Weisse Edict	https://untappd.akamaized.net/site/beer_logos/beer-1389259_8967b_sm.jpeg	1389259	0	9
CA	3397	IPA - Imperial / Double	3.68500000000000005	Need To Please	https://untappd.akamaized.net/site/beer_logos/beer-1946562_29cfa_sm.jpeg	1946562	90	9
CA	3397	Red Ale - American Amber / Red	3.59399999999999986	Wham, Glam, Thank You Fam!	https://untappd.akamaized.net/site/beer_logos/beer-1659381_173ad_sm.jpeg	1659381	30	6.29999999999999982
CA	3397	Gruit / Ancient Herbed Ale	3.60899999999999999	Raw Ale	https://untappd.akamaized.net/site/beer_logos/beer-1926053_fd5f1_sm.jpeg	1926053	0	5.59999999999999964
CA	3397	Porter - American	3.9870000000000001	Nine Lives Porter	https://untappd.akamaized.net/site/beer_logos/beer-1867490_35dc9_sm.jpeg	1867490	0	6.90000000000000036
GA	1224	Pale Ale - American	3.62300000000000022	420 Extra Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-5912_11c77_sm.jpeg	5912	41	5.70000000000000018
GA	1224	IPA - American	3.70199999999999996	IPA	https://untappd.akamaized.net/site/beer_logos/beer-7053_4f710_sm.jpeg	7053	61	6.29999999999999982
GA	1224	Fruit Beer	3.5219999999999998	Blue	https://untappd.akamaized.net/site/beer_logos/beer-4511_cb442_sm.jpeg	4511	7	4.59999999999999964
GA	1224	Brown Ale - American	3.6120000000000001	Hash Brown	https://untappd.akamaized.net/site/beer_logos/beer-1189084_43ef1_sm.jpeg	1189084	60	6.20000000000000018
GA	1224	Brown Ale - American	3.53900000000000015	Georgia Brown	https://untappd.akamaized.net/site/beer_logos/beer-sweetwaterGeorgiaBrown.jpg	4512	30	5.79999999999999982
GA	1224	IPA - Session / India Session Ale	3.70100000000000007	Hash Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-1414175_0b829_sm.jpeg	1414175	55	4.20000000000000018
GA	1224	Hefeweizen	3.41299999999999981	Waterkeeper	https://untappd.akamaized.net/site/beer_logos/beer-45291_be7e4_sm.jpeg	45291	15	5
GA	1224	IPA - White	3.621	Whiplash White IPA	https://untappd.akamaized.net/site/beer_logos/beer-503159_9f4fb_sm.jpeg	503159	55	6.20000000000000018
GA	1224	Rye IPA	3.64800000000000013	LowRYEder IPA	https://untappd.akamaized.net/site/beer_logos/beer-LowRYEder_118420.jpeg	118420	45	6.20000000000000018
GA	1224	Pilsner - Other	3.31400000000000006	Road Trip	https://untappd.akamaized.net/site/beer_logos/beer-sweetwaterRoadTrip.jpg	29308	53	5.20000000000000018
GA	1224	Stout - American Imperial / Double	3.76200000000000001	Happy Ending	https://untappd.akamaized.net/site/beer_logos/beer-13985_fc8c2_sm.jpeg	13985	69	9
GA	1224	Winter Warmer	3.60199999999999987	Festive Ale	https://untappd.akamaized.net/site/beer_logos/beer-_256711_f55903f19d7a86a335cb51055fca.jpeg	256711	23	8.09999999999999964
GA	1224	IPA - American	3.71099999999999985	Squeeze Box	https://untappd.akamaized.net/site/beer_logos/beer-1790099_da674_sm.jpeg	1790099	45	6.09999999999999964
GA	1224	Pale Wheat Ale - American	3.54800000000000004	Grass Monkey	https://untappd.akamaized.net/site/beer_logos/beer-1920723_fc00b_sm.jpeg	1920723	35	5.40000000000000036
GA	1224	Red Ale - American Amber / Red	3.32500000000000018	Spinnerbait	https://untappd.akamaized.net/site/beer_logos/beer-822038_09f02_sm.jpeg	822038	25	6
GA	1224	Sour - American Wild Ale	3.75599999999999978	The Pit & The Pendulum	https://untappd.akamaized.net/site/beer_logos/beer-1148035_e78bc_sm.jpeg	1148035	30	8.30000000000000071
GA	1224	Smoked Beer	3.67700000000000005	Pulled Porter (Dank Tank)	https://untappd.akamaized.net/site/beer_logos/beer-1394476_edeaa_sm.jpeg	1394476	27	7.70000000000000018
GA	1224	Stout - American Imperial / Double	4.01799999999999979	Bourbon Barrel Aged Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-1251355_a1991_sm.jpeg	1251355	70	11.1999999999999993
GA	1224	IPA - Imperial / Double	3.91100000000000003	420 Fest Double IPA	https://untappd.akamaized.net/site/beer_logos/beer-1022125_7a0c4_sm.jpeg	1022125	85	8
GA	1224	Sour - Farmhouse IPA	3.78100000000000014	Smokey and the Brett (Dank Tank)	https://untappd.akamaized.net/site/beer_logos/beer-1708777_6909a_sm.jpeg	1708777	55	7.29999999999999982
GA	1224	IPA - American	3.92899999999999983	Second Helping IPA	https://untappd.akamaized.net/site/beer_logos/beer-503207_e4ba2_sm.jpeg	503207	69	7.40000000000000036
GA	1224	Belgian Tripel	3.83599999999999985	18 Belgian-Style Tripel Ale	https://untappd.akamaized.net/site/beer_logos/beer-971296_c16f6_sm.jpeg	971296	70	10
GA	1224	Red Ale - Imperial / Double	3.754	Red Hot Mama (Dank Tank)	https://untappd.akamaized.net/site/beer_logos/beer-_461285_sm_f4bf07a30df61978ff82778321af09.jpeg	461285	82	8.59999999999999964
GA	1224	IPA - Imperial / Double Black	3.89900000000000002	Some Strange (Dank Tank)	https://untappd.akamaized.net/site/beer_logos/beer-_270365_sm_4bcf0441af4ae080746f4f91969c5b.jpeg	270365	0	10
MA	20827	IPA - American	4.00600000000000023	Santilli	https://untappd.akamaized.net/site/beer_logos/beer-1092172_8287d_sm.jpeg	1092172	0	6
MA	20827	IPA - Imperial / Double	4.05499999999999972	The 87	https://untappd.akamaized.net/site/beer_logos/beer-1015921_3b931_sm.jpeg	1015921	0	8
MA	20827	Porter - Other	4.06400000000000006	Awake	https://untappd.akamaized.net/site/beer_logos/beer-1237637_070a1_sm.jpeg	1237637	0	6.70000000000000018
MA	20827	Pale Ale - Belgian	3.75300000000000011	Trifecta	https://untappd.akamaized.net/site/beer_logos/beer-119875_9ede6_sm.jpeg	119875	0	6.70000000000000018
MA	20827	Hefeweizen	3.78600000000000003	Furth	https://untappd.akamaized.net/site/beer_logos/beer-1153917_775cb_sm.jpeg	1153917	0	5.5
MA	20827	Sour - Berliner Weisse	4.03300000000000036	Ever Weisse	https://untappd.akamaized.net/site/beer_logos/beer-226507_8b03c_sm.jpeg	226507	0	3.29999999999999982
MA	20827	IPA - American	4.10599999999999987	One Hop This Time: Citra	https://untappd.akamaized.net/site/beer_logos/beer-1671664_3d28b_sm.jpeg	1671664	0	6
MA	20827	Rye Beer	3.64100000000000001	Viva Habanera	https://untappd.akamaized.net/site/beer_logos/beer-166609_7239f_sm.jpeg	166609	0	6.90000000000000036
MA	20827	Sour - Berliner Weisse	3.90799999999999992	Mainer Weisse	https://untappd.akamaized.net/site/beer_logos/beer-265855_0582e_sm.jpeg	265855	0	5.5
MA	20827	Porter - American	4.07399999999999984	Bean Porter	https://untappd.akamaized.net/site/beer_logos/beer-517487_af151_sm.jpeg	517487	0	6.5
MA	20827	Sour - Gose	3.85899999999999999	Harborside	https://untappd.akamaized.net/site/beer_logos/beer-687047_57a6a_sm.jpeg	687047	0	3.60000000000000009
MA	20827	Pilsner - German	3.59699999999999998	Pfaffenheck	https://untappd.akamaized.net/site/beer_logos/beer-780237_43b46_sm.jpeg	780237	0	5.20000000000000018
MA	20827	Fruit Beer	3.80200000000000005	Maracuya	https://untappd.akamaized.net/site/beer_logos/beer-1102807_7c7bc_sm.jpeg	1102807	0	6.90000000000000036
MA	20827	Sour - Berliner Weisse	3.8879999999999999	Cape Codder Weisse	https://untappd.akamaized.net/site/beer_logos/beer-295425_0b3a2_sm.jpeg	295425	0	5.5
MA	20827	IPA - American	4.04000000000000004	One Hop This Time: Simcoe	https://untappd.akamaized.net/site/beer_logos/beer-1702928_49db9_sm.jpeg	1702928	0	6
MA	20827	Saison / Farmhouse Ale	3.74900000000000011	Belafonte	https://untappd.akamaized.net/site/beer_logos/beer-1041537_13da4_sm.jpeg	1041537	0	6.29999999999999982
MA	20827	IPA - American	3.94499999999999984	One Hop This Time: Vic Secret	https://untappd.akamaized.net/site/beer_logos/beer-1232648_43246_sm.jpeg	1232648	0	6
MA	20827	Stout - Milk / Sweet	4.16999999999999993	El Lechedor	https://untappd.akamaized.net/site/beer_logos/beer-628067_e540b_sm.jpeg	628067	0	7.20000000000000018
MA	20827	Stout - Other	3.69399999999999995	Taza Stout	https://untappd.akamaized.net/site/beer_logos/beer-112367_f2061_sm.jpeg	112367	0	7
MA	20827	Sour - Ale	3.84600000000000009	Aloha Weisse	https://untappd.akamaized.net/site/beer_logos/beer-1810358_733e4_sm.jpeg	1810358	0	5.59999999999999964
MA	20827	Sour - Ale	4.07200000000000006	Bramble Weisse	https://untappd.akamaized.net/site/beer_logos/beer-1626023_a1296_sm.jpeg	1626023	0	5
MA	20827	Pale Ale - American	4.04800000000000004	Annie Oatley	https://untappd.akamaized.net/site/beer_logos/beer-1842916_0c3eb_sm.jpeg	1842916	0	5.40000000000000036
MA	20827	IPA - American	3.96499999999999986	One Hop This Time: Topaz	https://untappd.akamaized.net/site/beer_logos/beer-1519560_e6f46_sm.jpeg	1519560	0	5.79999999999999982
MA	20827	IPA - American	3.94899999999999984	One Hop This Time: Amarillo	https://untappd.akamaized.net/site/beer_logos/beer-1910973_bf48a_sm.jpeg	1910973	0	6
IN	8928	IPA - American	3.61299999999999999	Golden Zoe	https://untappd.akamaized.net/site/beer_logos/beer-thr3eGoldenZoe.jpg	23688	82	6.79999999999999982
IN	8928	Fruit Beer	3.4740000000000002	Two Lucy's Blackberry Wheat	https://untappd.akamaized.net/site/beer_logos/beer-thr3eTwoLucys.jpg	35146	16	6
IN	8928	Porter - American	3.82799999999999985	Hubbard & Cravens Porter	https://untappd.akamaized.net/site/beer_logos/beer-thr3eHubbardPorter.jpg	35138	23	6
IN	8928	Blonde Ale	3.40200000000000014	Snow Bunny Blonde	https://untappd.akamaized.net/site/beer_logos/beer-thr3eSnowBunny.jpg	44229	16	5.5
IN	8928	Brown Ale - American	3.62599999999999989	@Brewhouse Brown #AwesomeSauce	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	194843	0	6.5
IN	8928	Märzen	3.67700000000000005	Antonius 1742 Oktoberfest	https://untappd.akamaized.net/site/beer_logos/beer-84277_19ab1_sm.jpeg	84277	0	5.40000000000000036
IN	8928	IPA - American	3.59200000000000008	Daddys Juice Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-584047_3d252_sm.jpeg	584047	42	4.79999999999999982
IN	8928	Doppelbock 	3.67600000000000016	Hot For Teacher	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	496499	21	8.59999999999999964
IN	8928	Weizenbock	3.48899999999999988	Mount Crumpet Christmas Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	108642	0	7.5
IN	8928	Saison / Farmhouse Ale	3.61699999999999999	Agrarian Queen Farm House Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1109662	20	6.20000000000000018
IN	8928	IPA - Imperial / Double	4.04300000000000015	Alumnus 20th Anniversary Double IPA	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1614006	103	9.69999999999999929
IN	8928	Saison / Farmhouse Ale	3.56400000000000006	Two Sisters Carolina Saison	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	153989	0	5
IN	8928	Stout - American Imperial / Double	3.76500000000000012	King Solomon Imperial Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	24510	0	8
IN	8928	Porter - Other	3.78900000000000015	Schweddy Ball-Tic Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	292490	40	7.59999999999999964
IN	8928	Belgian Tripel	3.8839999999999999	Big Rock Candy Tripel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1899369	20	10.3000000000000007
IN	8928	IPA - American	3.6549999999999998	Amateur Hour	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	686516	70	7
IN	8928	Porter - American	3.8620000000000001	Hubbard & Cravens Coffee Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1369418	0	0
IN	8928	Lager - Japanese Rice	3.37699999999999978	Cobra Kai Japanese Rice Lager	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	732057	25	6
IN	8928	Lager - Dark	3.6379999999999999	Sumatra Rat Monkey Blood	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1764856	25	4.79999999999999982
IN	8928	IPA - American	3.80900000000000016	Citrus Maximums	https://untappd.akamaized.net/site/beer_logos/beer-1199612_e5433_sm.jpeg	1199612	75	7
IN	8928	Golden Ale	3.73799999999999999	Moka Coka Chocolate Golden Ale	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1933478	35	6.70000000000000018
IN	8928	Sour - Berliner Weisse	3.10000000000000009	Beginner Weisse	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1154078	0	3.5
CA	609	IPA - American	3.7629999999999999	Soul Style	https://untappd.akamaized.net/site/beer_logos/beer-795543_20de4_sm.jpeg	795543	75	6.5
CA	609	IPA - Imperial / Double	4.00800000000000001	Palate Wrecker	https://untappd.akamaized.net/site/beer_logos/beer-14590_e43dc_sm.jpeg	14590	149	9.5
CA	609	IPA - Triple	3.9049999999999998	Green Bullet	https://untappd.akamaized.net/site/beer_logos/beer-798088_7a629_sm.jpeg	798088	100	10.0999999999999996
CA	609	IPA - Belgian	3.78299999999999992	Le Freak	https://untappd.akamaized.net/site/beer_logos/beer-4965_d99f3_sm.jpeg	4965	101	9.19999999999999929
CA	609	Stout - American Imperial / Double	3.84399999999999986	Double Stout	https://untappd.akamaized.net/site/beer_logos/beer-6755_edcaa_sm.jpeg	6755	45	8.80000000000000071
CA	609	Fruit Beer	3.64000000000000012	Passion Fruit Kicker	https://untappd.akamaized.net/site/beer_logos/beer-1130373_e0de6_sm.jpeg	1130373	5	5.5
CA	609	Rye IPA	3.85700000000000021	Road Warrior	https://untappd.akamaized.net/site/beer_logos/beer-567502_d3ee1_sm.jpeg	567502	80	9
CA	609	IPA - American	3.67700000000000005	Tangerine Soul Style IPA	https://untappd.akamaized.net/site/beer_logos/beer-998286_4163a_sm.jpeg	998286	75	6.5
CA	609	IPA - Session / India Session Ale	3.70599999999999996	Citra Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-7370_04262_sm.jpeg	7370	65	4.5
CA	609	IPA - Imperial / Double	3.92099999999999982	Imperial IPA	https://untappd.akamaized.net/site/beer_logos/beer-690295_fa78e_sm.jpeg	4862	101	9
CA	609	Pale Ale - American	3.64500000000000002	30th Street Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-6308_8fad4_sm.jpeg	6308	45	6
CA	609	IPA - Session / India Session Ale	3.53200000000000003	Jibe Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-795522_43d96_sm.jpeg	795522	65	4
CA	609	Porter - Baltic	3.99199999999999999	Cosmic Ristretto	https://untappd.akamaized.net/site/beer_logos/beer-1386944_cf187_sm.jpeg	1386944	45	8.19999999999999929
CA	609	Pale Ale - Belgian	3.49299999999999988	Rayon Vert	https://untappd.akamaized.net/site/beer_logos/beer-95236_5c23c_sm.jpeg	95236	32	7
CA	609	Saison / Farmhouse Ale	3.45800000000000018	Saison Diego	https://untappd.akamaized.net/site/beer_logos/beer-SanDiegoSaison_55966.jpeg	55966	20	5
CA	609	IPA - Session / India Session Ale	3.58199999999999985	Mosaic Session IPA	https://untappd.akamaized.net/site/beer_logos/beer-902884_4ed7b_sm.jpeg	902884	65	4.5
CA	609	IPA - American	3.93599999999999994	Hand Shake IPA	https://untappd.akamaized.net/site/beer_logos/beer-1162111_61c87_sm.jpeg	1162111	55	7
CA	609	Pale Ale - American	3.55699999999999994	Cedar Plank Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-259434_251ca_sm.jpeg	259434	44	6
CA	609	Pale Ale - New Zealand	3.57500000000000018	Pacific Gem Single Hop Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-1008091_1333a_sm.jpeg	1008091	40	5.5
CA	609	IPA - Black / Cascadian Dark Ale	3.81300000000000017	Hop Odyssey Black IPA	https://untappd.akamaized.net/site/beer_logos/beer-306636_4ccd4_sm.jpeg	306636	85	7.20000000000000018
CA	609	IPA - American	3.78699999999999992	Hop Odyssey Symposium IPA	https://untappd.akamaized.net/site/beer_logos/beer-419832_c1f7b_sm.jpeg	419832	75	7
CA	609	Stout - Imperial / Double	3.89299999999999979	Dia De Los Serranos	https://untappd.akamaized.net/site/beer_logos/beer-1382541_6d7e2_sm.jpeg	1382541	45	8.80000000000000071
CA	609	Kellerbier / Zwickelbier	3.46099999999999985	Sea to Sea	https://untappd.akamaized.net/site/beer_logos/beer-1502883_9ff99_sm.jpeg	1502883	23	4
CA	609	IPA - American	3.754	Treasure Chest	https://untappd.akamaized.net/site/beer_logos/beer-56523_24488_sm.jpeg	56523	65	5.70000000000000018
CA	1142	Pale Ale - American	3.66000000000000014	Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-6284_6ddce_sm.jpeg	6284	38	5.59999999999999964
CA	1142	IPA - American	3.7629999999999999	Torpedo Extra IPA	https://untappd.akamaized.net/site/beer_logos/beer-4997_fe560_sm.jpeg	4997	65	7.20000000000000018
CA	1142	IPA - American	3.79499999999999993	Hop Hunter IPA	https://untappd.akamaized.net/site/beer_logos/beer-568188_36653_sm.jpeg	568188	60	6.20000000000000018
CA	1142	IPA - American	3.7629999999999999	Celebration Ale	https://untappd.akamaized.net/site/beer_logos/beer-16630_3170b_sm.jpeg	16630	65	6.79999999999999982
CA	1142	Sour - Gose	3.51200000000000001	Otra Vez	https://untappd.akamaized.net/site/beer_logos/beer-1211126_86c2e_sm.jpeg	1211126	5	4.5
CA	1142	Pilsner - German	3.42300000000000004	Nooner Pilsner	https://untappd.akamaized.net/site/beer_logos/beer-913150_b0c1c_sm.jpeg	913150	38	5.20000000000000018
CA	1142	IPA - American	3.7759999999999998	Beer Camp Tropical IPA (2016)	https://untappd.akamaized.net/site/beer_logos/beer-1370712_e8610_sm.jpeg	1370712	55	6.5
CA	1142	Hefeweizen	3.55699999999999994	Kellerweis	https://untappd.akamaized.net/site/beer_logos/beer-sierraNevadaKellerweis.jpg	5374	15	4.79999999999999982
CA	1142	IPA - Imperial / Double	3.98200000000000021	Hoptimum	https://untappd.akamaized.net/site/beer_logos/beer-_11810_sm_f65bf093fdef1ea1fb16ea28605048.jpeg	11810	100	10.4000000000000004
CA	1142	Stout - American Imperial / Double	3.98600000000000021	Narwhal Imperial Stout	https://untappd.akamaized.net/site/beer_logos/beer-263666_cf1b2_sm.jpeg	263666	60	10.1999999999999993
CA	1142	Porter - American	3.56499999999999995	Porter	https://untappd.akamaized.net/site/beer_logos/beer-Porter_7847.jpeg	7847	32	5.59999999999999964
CA	1142	Brown Ale - American	3.52800000000000002	Tumbler Autumn Brown Ale	https://untappd.akamaized.net/site/beer_logos/beer-Tumbler_5960.jpeg	5960	37	5.5
CA	1142	Märzen	3.70900000000000007	Oktoberfest - Mahrs Bräu (2016)	https://untappd.akamaized.net/site/beer_logos/beer-1652995_9eb7a_sm.jpeg	1652995	30	6
CA	1142	Stout - Other	3.7330000000000001	Coffee Stout	https://untappd.akamaized.net/site/beer_logos/beer-812149_524e4_sm.jpeg	812149	53	6.20000000000000018
CA	1142	IPA - Black / Cascadian Dark Ale	3.59100000000000019	Blindfold	https://untappd.akamaized.net/site/beer_logos/beer-_188377_sm.jpeg	188377	70	6.79999999999999982
CA	1142	IPA - White	3.3879999999999999	Snow Wit White IPA	https://untappd.akamaized.net/site/beer_logos/beer-551807_f1b51_sm.jpeg	551807	40	5.70000000000000018
CA	1142	Pilsner - Czech	3.45199999999999996	Summerfest	https://untappd.akamaized.net/site/beer_logos/beer-_156196_sm_ee20fc2139af4bf69f158721f89856.jpeg	156196	28	5
CA	1142	Pale Ale - American	3.51399999999999979	Sidecar Orange Pale Ale	https://untappd.akamaized.net/site/beer_logos/beer-1695697_ccc11_sm.jpeg	1695697	35	5.29999999999999982
CA	1142	Barleywine - American	3.74400000000000022	Bigfoot	https://untappd.akamaized.net/site/beer_logos/beer-sierraNevadaBigfoot.jpg	20951	90	9.59999999999999964
CA	1142	IPA - American	3.77899999999999991	Northern Hemisphere Harvest Wet Hop Ale	https://untappd.akamaized.net/site/beer_logos/beer-_6565_b18fe98972487e645d2b56ed444a.jpeg	6565	67	6.70000000000000018
CA	1142	IPA - American	3.68800000000000017	Tropical Torpedo	https://untappd.akamaized.net/site/beer_logos/beer-1741133_0a236_sm.jpeg	1741133	55	6.70000000000000018
CA	1142	Belgian Quad	3.92799999999999994	Ovila Abbey Quad (w/ Plums)	https://untappd.akamaized.net/site/beer_logos/beer-_295276_7e6448b792ca098810d1deb93aa6.jpeg	295276	21	10.1999999999999993
CA	1142	Lager - Vienna	3.48200000000000021	Vienna Lager	https://untappd.akamaized.net/site/beer_logos/beer-75093_b1e84_sm.jpeg	75093	28	5.29999999999999982
CA	1142	Pale Ale - American	3.55200000000000005	Chico King	https://untappd.akamaized.net/site/beer_logos/beer-642734_080b3_sm.jpeg	642734	45	6.5
CA	1142	Stout - American	3.58000000000000007	Stout	https://untappd.akamaized.net/site/beer_logos/beer-_6201_a9cbaa272cbad8a2756b48e5fdba.jpeg	6201	50	5.79999999999999982
NY	1149	IPA - Imperial / Double	4.00600000000000023	Resin	https://untappd.akamaized.net/site/beer_logos/beer-_117064_sm.jpeg	117064	103	9.09999999999999964
NY	1149	IPA - American	3.7759999999999998	Bengali	https://untappd.akamaized.net/site/beer_logos/beer-691381_ccb87_sm.jpeg	691381	69	6.5
NY	1149	Pilsner - German	3.47199999999999998	The Crisp	https://untappd.akamaized.net/site/beer_logos/beer-_11517_sm.jpeg	11517	44	5.40000000000000036
NY	1149	Red Ale - Imperial / Double	3.77499999999999991	Global Warmer	https://untappd.akamaized.net/site/beer_logos/beer-_447370_sm.jpeg	447370	70	7
NY	1149	IPA - Triple	4.07899999999999974	Hi-Res	https://untappd.akamaized.net/site/beer_logos/beer-937703_abf14_sm.jpeg	937703	115	10.5
NY	1149	IPA - Imperial / Double	4.06899999999999995	Puff	https://untappd.akamaized.net/site/beer_logos/beer-1558435_b1ad6_sm.jpeg	1558435	108	9.80000000000000071
NY	1149	Kristallweizen 	3.43100000000000005	Apollo	https://untappd.akamaized.net/site/beer_logos/beer-_32905_sm.jpeg	32905	11	5.20000000000000018
NY	1149	Porter - Baltic	3.99000000000000021	3Beans	https://untappd.akamaized.net/site/beer_logos/beer-_283424_sm.jpeg	283424	85	10
NY	1149	Cream Ale	3.67499999999999982	C.R.E.A.M.	https://untappd.akamaized.net/site/beer_logos/beer-1391321_d682c_sm.jpeg	1391321	25	7.20000000000000018
NY	1149	Porter - Imperial / Double	4.00600000000000023	5BEANS	https://untappd.akamaized.net/site/beer_logos/beer-1774276_1d56a_sm.jpeg	1774276	38	10
NY	1149	Sour - Gose	3.54499999999999993	Jammer	https://untappd.akamaized.net/site/beer_logos/beer-1477872_f037e_sm.jpeg	1477872	12	4
NY	1149	Rye Beer	3.59399999999999986	Righteous Ale	https://untappd.akamaized.net/site/beer_logos/beer-_22737_sm.jpeg	22737	57	6.29999999999999982
NY	1149	Stout - American	3.64800000000000013	Diesel	https://untappd.akamaized.net/site/beer_logos/beer-_20400_sm.jpeg	20400	69	6.29999999999999982
NY	1149	Porter - Other	3.5129999999999999	Beast Mode	https://untappd.akamaized.net/site/beer_logos/beer-937697_a3602_sm.jpeg	937697	44	6.40000000000000036
NY	1149	Shandy / Radler	2.99699999999999989	Rad	https://untappd.akamaized.net/site/beer_logos/beer-646034_a757a_sm.jpeg	646034	7	3.20000000000000018
NY	1149	Brown Ale - American	3.56300000000000017	Brownstone	https://untappd.akamaized.net/site/beer_logos/beer-_11237_sm.jpeg	11237	45	6
NY	1149	Lager - IPL (India Pale Lager)	3.74699999999999989	Tesla	https://untappd.akamaized.net/site/beer_logos/beer-1686323_34b87_sm.jpeg	1686323	49	7.09999999999999964
NY	1149	Saison / Farmhouse Ale	3.53799999999999981	Seison	https://untappd.akamaized.net/site/beer_logos/beer-593516_6b422_sm.jpeg	593516	0	6.59999999999999964
NY	1149	Porter - American	3.871	Gorilla Warfare	https://untappd.akamaized.net/site/beer_logos/beer-_13460_sm.jpeg	13460	52	7
NY	1149	Stout - Oatmeal	3.68100000000000005	Otis	https://untappd.akamaized.net/site/beer_logos/beer-_9579_sm.jpeg	9579	39	6.09999999999999964
NY	1149	Sour - Berliner Weisse	3.7759999999999998	Lil' Raspy	https://untappd.akamaized.net/site/beer_logos/beer-1162490_952c0_sm.jpeg	1162490	0	4.70000000000000018
NY	1149	IPA - American	3.54300000000000015	Spice of Life: Nugget	https://untappd.akamaized.net/site/beer_logos/beer-SpiceofLifeNugget_66896.jpeg	66896	0	5.70000000000000018
NY	1149	Strong Ale - American	3.78500000000000014	Double Sweet Action	https://untappd.akamaized.net/site/beer_logos/beer-16218_fba88_sm.jpeg	16218	75	9.80000000000000071
NY	1149	Stout - American Imperial / Double	4.03599999999999959	Bolshoi!	https://untappd.akamaized.net/site/beer_logos/beer-Bolshoi_36906.jpeg	36906	124	12.4000000000000004
MA	283519	Pilsner - Other	3.875	Sunny & 79°	https://untappd.akamaized.net/site/beer_logos/beer-1643520_d6b71_sm.jpeg	1643520	0	7
MA	283519	Rye Beer	3.66000000000000014	RR #23	https://untappd.akamaized.net/site/beer_logos/beer-1695362_8040d_sm.jpeg	1695362	0	9
MA	283519	Stout - American	4.00399999999999956	Adeline	https://untappd.akamaized.net/site/beer_logos/beer-1952126_feb0d_sm.jpeg	1952126	0	8.69999999999999929
MA	283519	Red Ale - Irish	4.02200000000000024	Townie (Rum Barrel Aged)	https://untappd.akamaized.net/site/beer_logos/beer-1824598_812b3_sm.jpeg	1824598	0	9
MA	283519	Pilsner - Other	3.83800000000000008	Sunny + 79 (1 Mos Tequila)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1749727	0	7.40000000000000036
MA	283519	Brown Ale - Other	3.85000000000000009	Barrel House Z Red Rye Ale (Whiskey Barrel)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1713377	0	10
MA	283519	Pilsner - Other	3.91800000000000015	Sunny & 79 Chardonnay Barrel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1718601	0	7.20000000000000018
MA	283519	Pilsner - Other	3.79000000000000004	Sunny And 79 Cider Barrel	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1740470	0	0
MA	283519	Red Ale - Irish	3.87000000000000011	Townie Strong (ITB)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1758996	0	8.09999999999999964
MA	283519	Dunkelweizen	3.7629999999999999	Lucky Too XL	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1750244	0	8.90000000000000036
MA	283519	Stout - American Imperial / Double	4.02700000000000014	Crye Baby	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1853810	0	9
MA	283519	Belgian Strong Golden Ale	3.62000000000000011	Five Halos	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1955757	0	8.80000000000000071
MA	283519	Red Ale - American Amber / Red	4.01700000000000035	Jane Rae's	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1689336	0	6.5
MA	283519	Stout - American	3.78399999999999981	Dry Dock | Dry Stout	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1878659	0	6
MA	283519	Porter - Imperial / Double	3.9780000000000002	Highland Porter	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1702741	0	9.40000000000000036
MA	283519	Red Ale - Other	3.44499999999999984	Red Rye Ale #23 Jamaican Rum Aged	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1834532	0	10.4000000000000004
MA	283519	Rye Beer	3.85099999999999998	Warrior ITB	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1905965	0	6.29999999999999982
MA	283519	Pilsner - Other	3.74199999999999999	Sunny & 79 1-mos Rum	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1753947	0	8.40000000000000036
MA	283519	Red Ale - Imperial / Double	4.12899999999999956	RR#23 Bully Boy Whiskey	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1796206	0	9.80000000000000071
MA	283519	Pilsner - Other	3.68800000000000017	Sunny & 79° Ginned Pils (Rum Barrel)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1776788	0	8.30000000000000071
MA	283519	Old Ale	4.23599999999999977	Olde Grumpy	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1874469	40	10.1999999999999993
MA	283519	Stout - Imperial / Double	4.22599999999999998	Magnificent Seven	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1784236	0	9.80000000000000071
MA	283519	Stout - Other	4.27400000000000002	Cbc Nitro Stout (rum)	https://untappd.akamaized.net/site/assets/images/temp/badge-beer-default.png	1830440	0	9.69999999999999929
\.


--
-- Name: beer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('beer_id_seq', 1, false);


--
-- Data for Name: brewery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY brewery (address, name, founded, label, brewery_type, id, state_id) FROM stdin;
369 Congress St, Boston, MA	Trillium Brewing Company	1893.10813657409994	https://untappd.akamaized.net/site/brewery_logos/brewery-trillium_23038.jpeg	Micro Brewery	23038	MA
3725 Greenwood St, San Diego, CA	Modern Times Beer	1382.84466435190006	https://untappd.akamaized.net/site/brewery_logos/brewery-68356_982b4.jpeg	Micro Brewery	68356	CA
1280 North McDowell Boulevard, Petaluma, CA	Lagunitas Brewing Company	2373.86326388889984	https://untappd.akamaized.net/site/brewery_logos/brewery-765_b53eb.jpeg	Micro Brewery	765	CA
416 Boyd St, Los Angeles, CA	Mumford Brewing	661.139340277779979	https://untappd.akamaized.net/site/brewery_logos/brewery-208640_08226.jpeg	Micro Brewery	208640	CA
1441 L Street, San Diego, CA	Mission Brewery	2336.10403935190016	https://untappd.akamaized.net/site/brewery_logos/brewery-MissionBrewery_2228.jpeg	Micro Brewery	2228	CA
13415 Sierra Way, Kernville, CA	Kern River Brewing Company	2369.92255787039994	https://untappd.akamaized.net/site/brewery_logos/brewery-KernRiverBrewingCompany_1498.jpeg	Micro Brewery	1498	CA
160 East Hill Rd, Monson, MA	Tree House Brewing Company	1941.84531250000009	https://untappd.akamaized.net/site/brewery_logos/brewery-treehousebrewingcompany_20084.jpeg	Micro Brewery	20084	MA
6 Cannery Village Blvd, Milton, DE	Dogfish Head Craft Brewery	2391.0139814815002	https://untappd.akamaized.net/site/brewery_logos/brewery-459_b3e4d.jpeg	Micro Brewery	459	DE
, Woodinville, WA	Locust Cider	694.798703703699971	https://untappd.akamaized.net/site/brewery_logos/brewery-202473_9fc01.jpeg	Cidery / Meadery	202473	WA
100 State St, Building 122, Ludlow, MA	Iron Duke Brewing	1017.97685185190005	https://untappd.akamaized.net/site/brewery_logos/brewery-138510_96381.jpeg	Micro Brewery	138510	MA
205 W Platt St, Tampa, FL	Four Green Fields	165.989525462959989	https://untappd.akamaized.net/site/assets/images/temp/badge-brewery-default.png	Bar / Restaurant / Store	303336	FL
12 Resnik Road, Plymouth, MA	Mayflower Brewing Company	2366.05179398149994	https://untappd.akamaized.net/site/brewery_logos/brewery-1545_23e1b.jpeg	Micro Brewery	1545	MA
12 Railroad St, South Deerfield, MA	Berkshire Brewing Company (B.B.C.)	2366.95872685189988	https://untappd.akamaized.net/site/brewery_logos/brewery-1999_13081.jpeg	Micro Brewery	1999	MA
306 Northern Avenue, Boston, MA	Harpoon Brewery	2377.91805555559995	https://untappd.akamaized.net/site/brewery_logos/brewery-634_e25b4.jpeg	Micro Brewery	634	MA
5520 Route 4, Bridgewater Corners, VT	Long Trail Brewing Company	2376.03586805560008	https://untappd.akamaized.net/site/brewery_logos/brewery-801_0ac25.jpeg	Micro Brewery	801	VT
St James's Gate, Dublin 8, 	Guinness	2390.85968749999984	https://untappd.akamaized.net/site/brewery_logos/brewery-49_a03fc.jpeg	Macro Brewery	49	\N
7192 Kalanianaole Highway, Kailua-Kona, HI	Kona Brewing Company	2391.11136574069997	https://untappd.akamaized.net/site/brewery_logos/brewery-konabrewingcompany_1988.jpeg	Micro Brewery	1988	HI
563 2nd St, San Francisco, CA	21st Amendment Brewery	2372.90704861109998	https://untappd.akamaized.net/site/brewery_logos/brewery-4339_203d1.jpeg	Micro Brewery	4339	CA
200 E Hersheypark Dr, Hershey PA 17033, Hershey, PA	Tröegs Independent Brewing	2360.96751157410017	https://untappd.akamaized.net/site/brewery_logos/brewery-2583_bfb6f.jpeg	Micro Brewery	2583	PA
79 North 11th Street, Brooklyn, NY	Brooklyn Brewery	2379.79130787040003	https://untappd.akamaized.net/site/brewery_logos/brewery-BrooklynBrewery_259.jpeg	Micro Brewery	259	NY
1901 Del Amo Blvd, Torrance, CA	Smog City Brewing	2018.83776620370008	https://untappd.akamaized.net/site/brewery_logos/brewery-SmogCity_16185.jpeg	Micro Brewery	16185	CA
122 Ithaca Beer Dr, Ithaca, NY	Ithaca Beer Company	2366.02626157409986	https://untappd.akamaized.net/site/brewery_logos/brewery-705_f05a6.jpeg	Macro Brewery	705	NY
72 Shrewsbury St, Worcester, MA	Wormtown Brewery	2349.00517361109996	https://untappd.akamaized.net/site/brewery_logos/brewery-2302_17efc.jpeg	Micro Brewery	2302	MA
Hagener Str. 261, Kreuztal, 	Krombacher Gruppe	2363.13006944439985	https://untappd.akamaized.net/site/brewery_logos/brewery-KrombacherPrivatbrauereiKreuztal_1569.jpeg	Macro Brewery	1569	\N
30 Germania St, Boston, MA	Boston Beer Company	2390.95695601850002	https://untappd.akamaized.net/site/brewery_logos/brewery-157_6a2d2.jpeg	Micro Brewery	157	MA
40242 La Quinta LN #101, Palmdale, CA	Transplants Brewing Company	514.050543981480018	https://untappd.akamaized.net/site/brewery_logos/brewery-234937_311b0.jpeg	Micro Brewery	234937	CA
856 E 136th Street, Bronx, NY	The Bronx Brewery 	2035.08037037040003	https://untappd.akamaized.net/site/brewery_logos/brewery-15784_6b495.jpeg	Micro Brewery	15784	NY
3397 Mission Inn Ave, Riverside, CA	Heroes Restaurant & Brewery	1214.79177083330001	https://untappd.akamaized.net/site/brewery_logos/brewery-HeroesRestaurantBrewery_95443_e9db8.jpeg	Brew Pub	95443	CA
91 Biltmore Ave., Asheville, NC	Wicked Weed Brewing	1684.97837962960011	https://untappd.akamaized.net/site/brewery_logos/brewery-37851_5617e.jpeg	Micro Brewery	37851	NC
345 Healdsburg Ave, Healdsburg, CA	Bear Republic Brewing Co.	2376.88791666670022	https://untappd.akamaized.net/site/brewery_logos/brewery-bearrepublicbrewingco_94.jpeg	Micro Brewery	94	CA
2736 Welton St, Denver, CO	Spangalang Brewery	727.959560185189957	https://untappd.akamaized.net/site/brewery_logos/brewery-196228_60dbc.jpeg	Micro Brewery	196228	CO
66 East 8th Street, Holland, MI	New Holland Brewing Company	2369.94556712960002	https://untappd.akamaized.net/site/brewery_logos/brewery-NewHollandBrewingCompany_908.jpeg	Micro Brewery	908	MI
1315 Research Drive, Redlands, CA	Ritual Brewing Company	1668.99956018519993	https://untappd.akamaized.net/site/brewery_logos/brewery-39329_fe617.jpeg	Micro Brewery	39329	CA
1800 West Fulton St, Chicago, IL	Goose Island Beer Co.	2377.9932407407	https://untappd.akamaized.net/site/brewery_logos/brewery-2898_7ee53.jpeg	Macro Brewery	2898	IL
420 Acorn Lane, Downingtown, PA	Victory Brewing Company	2370.74671296299994	https://untappd.akamaized.net/site/brewery_logos/brewery-1326_6ca88.jpeg	Micro Brewery	1326	PA
1705 Mariposa Street, San Francisco, CA	Anchor Brewing Company	2372.83736111110011	https://untappd.akamaized.net/site/brewery_logos/brewery-AnchorBrewingCompany_3891.jpeg	Micro Brewery	3891	CA
235 Grandville Ave SW, Grand Rapids, MI	Founders Brewing Co.	2369.95049768519993	https://untappd.akamaized.net/site/brewery_logos/brewery-foundersbrewingcompany_549.jpeg	Micro Brewery	549	MI
506 Columbia Street, Hood River, OR	Full Sail Brewing Company	2372.76461805559984	https://untappd.akamaized.net/site/brewery_logos/brewery-2531_d4f7a.jpeg	Micro Brewery	2531	OR
62 S Erie Ave, Montauk, NY	Montauk Brewing Company	1718.21570601849999	https://untappd.akamaized.net/site/brewery_logos/brewery-34872_da71c.jpeg	Micro Brewery	34872	NY
33 Dunster Street, Cambridge, MA	John Harvard's Brew House	2368.15568287040014	https://untappd.akamaized.net/site/brewery_logos/brewery-johnharvardsbrewhouse_16871.jpeg	Brew Pub	16871	MA
1327 S. Mint St., Charlotte, NC	The Unknown Brewing Co.	1481.99291666670001	https://untappd.akamaized.net/site/brewery_logos/brewery-TheUnknownBrewingCo_57226_b967e.jpeg	Micro Brewery	57226	NC
438 Calle San Pablo, Unit i, Camarillo, CA	Institution Ale Company	1314.71784722219991	https://untappd.akamaized.net/site/brewery_logos/brewery-78850_5bcd4.jpeg	Micro Brewery	78850	CA
5 Bartlett Bay Rd, South Burlington, VT	Magic Hat Brewing Company	2375.88806712960013	https://untappd.akamaized.net/site/brewery_logos/brewery-812_78347.jpeg	Micro Brewery	812	VT
13395 New Airport Road, Suite H, Auburn, CA	Knee Deep Brewing Company	2334.7018981481001	https://untappd.akamaized.net/site/brewery_logos/brewery-kneedeepbrewingcompany_2445.jpeg	Micro Brewery	2445	CA
100 Clinton Street, Framingham, MA	Jack's Abby	2083.14645833329996	https://untappd.akamaized.net/site/brewery_logos/brewery-14088_cf45e.jpeg	Micro Brewery	14088	MA
1920 Colorado Ave, Santa Monica, CA	Santa Monica Brew Works	1803.83064814809995	https://untappd.akamaized.net/site/brewery_logos/brewery-29181_c354b.jpeg	Micro Brewery	29181	CA
266 Bridge Street, Unit 3, Groton, CT	Outer Light Brewing Company	733.230057870370047	https://untappd.akamaized.net/site/brewery_logos/brewery-194951_744bd.jpeg	Micro Brewery	194951	CT
212 South Green Street, Morganton, NC	Catawba Brewing Co.	2330.38812499999995	https://untappd.akamaized.net/site/brewery_logos/brewery-catawbavalleybrewingcompany_3082.jpeg	Micro Brewery	3082	NC
725 4th Street, Santa Rosa, CA	Russian River Brewing Company	2373.46178240739982	https://untappd.akamaized.net/site/brewery_logos/brewery-russianRiver.jpg	Micro Brewery	5143	CA
2351 Alpine Blvd, Alpine, CA	Alpine Beer Company	2370.93537037040005	https://untappd.akamaized.net/site/brewery_logos/brewery-29_19acf.jpeg	Micro Brewery	29	CA
237 W Main St, Williamsburg, OH	Old Firehouse Brewery	942.157256944439951	https://untappd.akamaized.net/site/brewery_logos/brewery-155169_0473a.jpeg	Micro Brewery	155169	OH
401 S Richman Ave, Fullerton, CA	Bootlegger's Brewery	2338.97650462960019	https://untappd.akamaized.net/site/brewery_logos/brewery-2340_6fe0b.jpeg	Micro Brewery	2340	CA
c/o Paper City Brewery Co., Inc., Northampton, MA	Brewmaster Jack	1888.02428240740005	https://untappd.akamaized.net/site/brewery_logos/brewery-23335_1221a.jpeg	Micro Brewery	23335	MA
1 Busch Place, St. Louis, MO	Anheuser-Busch	2389.93037037039994	https://untappd.akamaized.net/site/brewery_logos/brewery-44_d96b6.jpeg	Macro Brewery	44	MO
124 Racquette Drive, Fort Collins, CO	Horse & Dragon Brewing Company	1083.21589120370004	https://untappd.akamaized.net/site/brewery_logos/brewery-123311_eec40.jpeg	Micro Brewery	123311	CO
, Greenville, SC	Birds Fly South Ale Project	800.236053240740034	https://untappd.akamaized.net/site/brewery_logos/brewery-181813_e52c5.jpeg	Micro Brewery	181813	SC
216 S Alameda St, Los Angeles, CA	Angel City Brewery	2284.42045138889989	https://untappd.akamaized.net/site/brewery_logos/brewery-4406_d4196.jpeg	Micro Brewery	4406	CA
1910 Elm Street, Cincinnati, OH	Rhinegeist Brewery	1376.14592592589997	https://untappd.akamaized.net/site/brewery_logos/brewery-69953_9bf4b.jpeg	Micro Brewery	69953	OH
3096 E. 10th St., Oakland, CA	Ale Industries	2313.95254629630017	https://untappd.akamaized.net/site/brewery_logos/brewery-3397_8bb26.jpeg	Micro Brewery	3397	CA
195 Ottley Drive Northeast, Atlanta, GA	SweetWater Brewing Company 	2379.12745370370021	https://untappd.akamaized.net/site/brewery_logos/brewery-1224_960f1.jpeg	Micro Brewery	1224	GA
87 Santilli Hwy, Everett, MA	Night Shift Brewing	1928.97071759260007	https://untappd.akamaized.net/site/brewery_logos/brewery-20827_647a8.jpeg	Micro Brewery	20827	MA
1021 Broad Ripple Ave, Indianapolis, IN	Thr3e Wise Men Brewing Co.	2274.10646990739997	https://untappd.akamaized.net/site/brewery_logos/brewery-Thr3eWiseMenBrewingCompany_8928.jpeg	Micro Brewery	8928	IN
6550 Mira Mesa Blvd., San Diego, CA	Green Flash Brewing Company	2377.14958333330014	https://untappd.akamaized.net/site/brewery_logos/brewery-609_22ae7.jpeg	Micro Brewery	609	CA
1075 E 20th St, Chico, CA	Sierra Nevada Brewing Co.	2376.95724537039996	https://untappd.akamaized.net/site/brewery_logos/brewery-1142_f241d.jpeg	Micro Brewery	1142	CA
40 Van Dyke Street, Brooklyn, NY	Sixpoint Brewery	2369.52158564809997	https://untappd.akamaized.net/site/brewery_logos/brewery-SixpointBrewery_1149.jpeg	Micro Brewery	1149	NY
95 Woodrock Rd, Weymouth, MA	Barrel House Z	265.253680555559981	https://untappd.akamaized.net/site/brewery_logos/brewery-283519_2cd94.jpeg	Micro Brewery	283519	MA
\.


--
-- Name: brewery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('brewery_id_seq', 1, false);


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: -
--

COPY state (abbreviation, capital, name, media, flower) FROM stdin;
AL	Montgomery	Alabama	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Alabama.svg/300px-Flag_of_Alabama.svg.png	Camellia
AK	Juneau	Alaska	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Flag_of_Alaska.svg/286px-Flag_of_Alaska.svg.png	Forget-me-not
AS	Phoenix	Arizona	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Flag_of_Arizona.svg/300px-Flag_of_Arizona.svg.png	Saguaro cactus blossom
AR	Little Rock	Arkansas	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Flag_of_Arkansas.svg/300px-Flag_of_Arkansas.svg.png	Apple blossom
CA	Sacramento	California	https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_California.svg/300px-Flag_of_California.svg.png	California poppy
CO	Denver	Colorado	https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Flag_of_Colorado.svg/300px-Flag_of_Colorado.svg.png	Rocky Mountain columbine
CT	Hartford	Connecticut	https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Flag_of_Connecticut.svg/259px-Flag_of_Connecticut.svg.png	Mountain laurel
DE	Dover	Delaware	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Flag_of_Delaware.svg/300px-Flag_of_Delaware.svg.png	Peach blossom
FL	Tallahassee	Florida	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Flag_of_Florida.svg/300px-Flag_of_Florida.svg.png	Orange blossom
GA	Atlanta	Georgia	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Flag_of_Georgia_%28U.S._state%29.svg/320px-Flag_of_Georgia_%28U.S._state%29.svg.png	Cherokee rose
HI	Honolulu	Hawaii	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Flag_of_Hawaii.svg/400px-Flag_of_Hawaii.svg.png	Hawaiian hibiscus
ID	Boise	Idaho	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_Idaho.svg/254px-Flag_of_Idaho.svg.png	Syringa
IL	Springfield	Illinois	https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_Illinois.svg/334px-Flag_of_Illinois.svg.png	Violet
IN	Indianapolis	Indiana	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Flag_of_Indiana.svg/300px-Flag_of_Indiana.svg.png	Peony
IA	Des Moines	Iowa	https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Iowa.svg/292px-Flag_of_Iowa.svg.png	Wild prairie rose
KS	Topeka	Kansas	https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Flag_of_Kansas.svg/334px-Flag_of_Kansas.svg.png	Sunflower
KY	Frankfort	Kentucky	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Flag_of_Kentucky.svg/380px-Flag_of_Kentucky.svg.png	Goldenrod
LA	Baton Rouge	Louisiana	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Flag_of_Louisiana.svg/315px-Flag_of_Louisiana.svg.png	Magnolia
ME	Augusta	Maine	https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Flag_of_Maine.svg/300px-Flag_of_Maine.svg.png	White pine cone and tassel
MD	Annapolis	Maryland	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Flag_of_Maryland.svg/300px-Flag_of_Maryland.svg.png	Black-eyed susan
MA	Boston	Massachusetts	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_Massachusetts.svg/334px-Flag_of_Massachusetts.svg.png	Mayflower
MI	Lansing	Michigan	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Flag_of_Michigan.svg/300px-Flag_of_Michigan.svg.png	Apple blossom
MN	Saint Paul	Minnesota	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Minnesota.svg/315px-Flag_of_Minnesota.svg.png	Pink and White lady's slipper
MS	Jackson	Mississippi	https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Flag_of_Mississippi.svg/300px-Flag_of_Mississippi.svg.png	Magnolia
MO	Jefferson City	Missouri	https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Flag_of_Missouri.svg/343px-Flag_of_Missouri.svg.png	Hawthorn
MT	Helena	Montana	https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_Montana.svg/300px-Flag_of_Montana.svg.png	Bitterroot
NE	Lincoln	Nebraska	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Flag_of_Nebraska.svg/334px-Flag_of_Nebraska.svg.png	Goldenrod
NV	Carson City	Nevada	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Flag_of_Nevada.svg/300px-Flag_of_Nevada.svg.png	Sagebrush
NH	Concord	New Hampshire	https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Flag_of_New_Hampshire.svg/300px-Flag_of_New_Hampshire.svg.png	Purple lilac
NJ	Trenton	New Jersey	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Flag_of_New_Jersey.svg/300px-Flag_of_New_Jersey.svg.png	Violet
NM	Santa Fe	New Mexico	https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_New_Mexico.svg/300px-Flag_of_New_Mexico.svg.png	Yucca flower
NY	Albany	New York	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_New_York.svg/400px-Flag_of_New_York.svg.png	Rose
NC	Raleigh	North Carolina	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Flag_of_North_Carolina.svg/300px-Flag_of_North_Carolina.svg.png	Flowering dogwood
ND	Bismarck	North Dakota	https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Flag_of_North_Dakota.svg/256px-Flag_of_North_Dakota.svg.png	Wild prairie rose
OH	Columbus	Ohio	https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Flag_of_Ohio.svg/325px-Flag_of_Ohio.svg.png	Scarlet carnation
OK	Oklahoma City	Oklahoma	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Flag_of_Oklahoma.svg/300px-Flag_of_Oklahoma.svg.png	Oklahoma rose
OR	Salem	Oregon	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Flag_of_Oregon.svg/334px-Flag_of_Oregon.svg.png	Oregon grape
PA	Harrisburg	Pennsylvania	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Flag_of_Pennsylvania.svg/300px-Flag_of_Pennsylvania.svg.png	Mountain laurel
RI	Providence	Rhode Island	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_Rhode_Island.svg/218px-Flag_of_Rhode_Island.svg.png	Violet
SC	Columbia	South Carolina	https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Flag_of_South_Carolina.svg/300px-Flag_of_South_Carolina.svg.png	Yellow jessamine
SD	Pierre	South Dakota	https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_South_Dakota.svg/320px-Flag_of_South_Dakota.svg.png	Pasque flower
TN	Nashville	Tennessee	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Flag_of_Tennessee.svg/334px-Flag_of_Tennessee.svg.png	Iris
TX	Austin	Texas	https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Flag_of_Texas.svg/300px-Flag_of_Texas.svg.png	Bluebonnet
UT	Salt Lake City	Utah	https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Flag_of_Utah_%28enhanced_variant%29.svg/334px-Flag_of_Utah_%28enhanced_variant%29.svg.png	Sego lily
VT	Montpelier	Vermont	https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Flag_of_Vermont.svg/334px-Flag_of_Vermont.svg.png	Red clover
VA	Richmond	Virgina	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Flag_of_Virginia.svg/292px-Flag_of_Virginia.svg.png	American dogwood
WA	Olympia	Washington	https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Flag_of_Washington.svg/337px-Flag_of_Washington.svg.png	Coast rhododendron
WV	Charleston	West Virgina	https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Flag_of_West_Virginia.svg/380px-Flag_of_West_Virginia.svg.png	Rhododendron
WI	Madison	Wisconsin	https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Flag_of_Wisconsin.svg/300px-Flag_of_Wisconsin.svg.png	Wood violet
WY	Cheyenne	Wyoming	https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_Wyoming.svg/286px-Flag_of_Wyoming.svg.png	Indian paintbrush
\.


--
-- Data for Name: ven2beer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ven2beer (venue_id, beer_id) FROM stdin;
22	1902736
7	8731
7	4013
7	434330
72	1383400
72	1353
72	770385
10	25796
10	6929
10	4509
14	9657
14	1795654
14	491198
15	114599
15	1864463
15	1967181
81	4052
81	1740377
81	3776
82	26615
82	14482
82	249566
83	972795
83	1917240
83	591429
20	8238
21	4871
21	1738821
21	1857393
86	587799
25	1718376
25	625450
25	1400236
89	524194
89	646818
89	3784
79	1077607
79	2011640
79	660642
93	939413
93	1389193
97	939413
98	504431
98	929842
98	216007
113	1974678
113	1295873
113	5805
101	5970
101	1884514
101	3829
103	10010
103	11163
103	1424308
40	1740377
112	176962
106	35133
106	298905
106	372362
111	4499
99	1706805
99	607480
99	1692870
104	1573056
104	4473
104	393430
91	4473
91	3558
91	1740377
55	1813723
55	1955899
55	1905766
57	1441255
57	123662
57	1965493
60	1553
60	36834
\.


--
-- Data for Name: ven2brew; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ven2brew (brewery_id, venue_id) FROM stdin;
20084	22
259	7
459	7
801	7
3891	72
2898	72
29181	72
765	10
2302	10
765	10
1988	14
138510	14
4339	14
16185	15
208640	15
68356	15
157	81
157	81
812	81
3397	82
2340	82
39329	82
1326	83
181813	83
57226	83
2228	20
705	21
2583	21
634	21
78850	86
234937	25
1498	25
202473	25
95443	89
609	89
44	89
196228	79
2531	79
123311	79
34872	93
15784	93
34872	97
37851	98
2445	98
23335	98
194951	113
908	113
29	113
801	101
1142	101
1326	101
1149	103
3082	103
1224	103
157	40
4406	112
8928	106
8928	106
8928	106
5143	111
283519	99
20827	99
283519	99
155169	104
49	104
69953	104
49	91
259	91
157	91
16871	55
16871	55
16871	55
459	57
908	57
14088	57
94	60
549	60
\.


--
-- Data for Name: venue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY venue (category, id, media, is_public, name, address, state_id) FROM stdin;
Mexican Restaurant	6	https://untappd.akamaized.net/photo/2016_08_25/903644606c381723486b7bc34135430b_raw.jpeg	t	El Nopal	10426 National Blvd, Los Angeles, CA	CA
Hotel	7	https://untappd.akamaized.net/photo/2017_04_01/44ba60270c1c6b5cb763ccaf83caa746_raw.jpg	t	Springfield Marriott	2 Boland Way, Springfield, MA	MA
Hockey Arena	10	https://untappd.akamaized.net/photo/2017_04_01/049590f461ccc18a9594b10d23947813_raw.jpeg	t	MassMutual Center	1277 Main St, Springfield, MA	MA
American Restaurant	14	https://untappd.akamaized.net/photo/2017_04_02/85c41af936ab06ee96222ec2f88cc1cc_raw.jpeg	t	Lattitude 	1338 Memorial Ave, West Springfield, MA	MA
Café	15	https://untappd.akamaized.net/photo/2017_03_17/545c4fe554d57137fa968444dfe3fec0_raw.jpg	t	The Overland	3601 Overland Ave, Los Angeles, CA	CA
Shopping Mall	20	https://untappd.akamaized.net/photo/2017_02_27/37357d4c7fd2d90cb76c8025064a0e5c_raw.jpg	f	Third Street Promenade	3rd St., Santa Monica, CA	CA
Wings Joint	21	https://untappd.akamaized.net/photo/2017_04_04/694298f6b47ae19649189c1238c416f7_raw.jpeg	t	Buffalo Wild Wings	703 Poquonock Ave, Windsor, CT	CT
Building	22	https://untappd.akamaized.net/photo/2016_07_13/7c3d3dfa7fdc5017e2f063278b040f45_raw.jpeg	f	Tower Square	1500 Main St, Springfield, MA	MA
Bar	25	https://untappd.akamaized.net/photo/2017_04_03/ef534ef02e38392eb3edb36d09a28ed6_raw.jpg	t	West 4th and Jane 	1432 4th St, Unit A, Santa Monica, CA	CA
Office	35	https://untappd.akamaized.net/photo/2017_03_11/32ae555ea4c0dbf2606a867fdb0fbaae_raw.jpg	f	Apple Inc.	1 Infinite Loop, Cupertino, CA	CA
Japanese Restaurant	40	https://untappd.akamaized.net/photo/2017_01_22/b75d56123b5aab182d067b6866a01557_raw.jpg	t	Samba Steak & Sushi House	1138 Worcester Rd, Framingham, MA	MA
Brewery	55	https://untappd.akamaized.net/photo/2017_04_02/f00124ef3111e615d7088a01f41301f0_raw.jpg	f	John Harvard's	1 Worcester Rd, Framingham, MA	MA
Pub	57	https://untappd.akamaized.net/photo/2017_04_03/86504a658fa290fa8c98929ba859d86a_raw.jpg	t	The British Beer Company	120 Worcester Rd, Framingham, MA	MA
Caribbean Restaurant	60	https://untappd.akamaized.net/photo/2017_04_02/cd0ac29767f47b4532cf0d73247e38e5_raw.jpeg	t	Cha Cha Chicken	1906 Ocean Ave, Santa Monica, CA	CA
Pub	72	https://untappd.akamaized.net/photo/2017_03_31/2276134a89aa71ade545e7d92f443c3a_raw.jpg	t	The Britannia Pub	318 Santa Monica Blvd, Santa Monica, CA	CA
Pub	79	https://untappd.akamaized.net/photo/2017_04_04/78e2a9a14f09e0e5ca02f07b14a07faf_raw.jpeg	t	Falling Rock Tap House	1919 Blake St, Denver, CO	CO
Bar	81	https://untappd.akamaized.net/photo/2017_03_25/3b655b1c8d50d021a6ef8e74ce869621_raw.jpg	t	Salty Dog Bar and Restaurant	7509 3rd Ave, Brooklyn, NY	NY
Pub	82	https://untappd.akamaized.net/photo/2014_12_06/1069536f588868586bbece800436d7a8_raw.jpg	t	Avocadoville	, , CA	CA
Pizza Place	83	https://untappd.akamaized.net/photo/2017_04_04/4575195f6e4e16441ee95c88d28d1777_raw.jpeg	t	Barley's Taproom & Pizzeria	25 W Washington St, Greenville, SC	SC
Pizza Place	86	https://untappd.akamaized.net/photo/2016_12_30/9e1627f2d4843454165696563611be0c_raw.jpeg	t	Toppers Pizza Place	520 Arneill Rd, Camarillo, CA	CA
New American Restaurant	89	https://untappd.akamaized.net/photo/2017_03_25/fc1b49bfe7ce2387e10e037f7d81d46e_raw.jpeg	t	Joe's Tavern	124 W Commonwealth Ave, Fullerton, CA	CA
Pub	91	https://untappd.akamaized.net/photo/2017_03_18/d097600a92510dee5c1af8d08ccea0fe_raw.jpg	t	Eamonn's Bar & Grill	9 E 45th St, New York, NY	NY
Sports Bar	93	https://untappd.akamaized.net/photo/2017_03_16/30ab586c522026e34021728a46177c90_raw.jpg	t	The Dram Shop	339 9th St, Brooklyn, NY	NY
Pub	97	https://untappd.akamaized.net/photo/2017_03_24/dfb6f00d475a330c5a13f5d46851cd14_raw.jpg	t	Lillie's Union Square	13 E 17th St, New York, NY	NY
Bar	98	https://untappd.akamaized.net/photo/2017_04_04/4162b074185dd55347bde70ec845df88_raw.jpeg	t	Rose Alley Ale House	94 Front St, New Bedford, MA	MA
Restaurant	99	https://untappd.akamaized.net/photo/2017_03_25/a69a36e970f051220ff4d3253df9cc16_raw.jpg	t	Alma Nove	22 Shipyard Dr, Hingham, MA	MA
Bar	101	https://untappd.akamaized.net/photo/2017_03_25/8c6886dfd160697149932c7a4b9f8cf6_raw.jpg	t	Bean Post Pub	7525 5th Ave, Brooklyn, NY	NY
Pizza Place	103	https://untappd.akamaized.net/photo/2017_04_04/628cadc2c7f0c3b6a2df07d121ae242b_raw.jpg	f	Mellow Mushroom	1 Augusta St, Greenville, SC	SC
Wings Joint	104	https://untappd.akamaized.net/photo/2016_12_10/c436fea0e5de71c24ded4bdcb0122fc5_raw.jpg	t	Buffalo Wild Wings	175 Rivers Edge, Milford, OH	OH
Sports Bar	106	https://untappd.akamaized.net/photo/2017_04_03/3e4e202de552c401c0c9f1c92af013bd_raw.jpg	t	Scotty's Brewhouse	302 N Walnut St, Bloomington, IN	IN
Whisky Bar	111	https://untappd.akamaized.net/photo/2017_04_04/f8d129874a60dfb2580cfc62c21ee90e_raw.jpeg	t	The Daily Pint	2310 Pico Blvd, Santa Monica, CA	CA
Tex-Mex Restaurant	112	https://untappd.akamaized.net/photo/2017_03_18/81799c3db6c37ddc9a3d483c63b858b9_raw.jpeg	t	Chili's Grill & Bar	1411 W Katella Ave, Orange, CA	CA
Pub	113	https://untappd.akamaized.net/photo/2017_04_04/1b01b46fdbe96377b58711346a680676_raw.jpeg	t	 Eli Cannon's	695 Main St, Middletown, CT	CT
\.


--
-- Name: venue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('venue_id_seq', 1, false);


--
-- Name: beer beer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY beer
    ADD CONSTRAINT beer_pkey PRIMARY KEY (id);


--
-- Name: brewery brewery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brewery
    ADD CONSTRAINT brewery_pkey PRIMARY KEY (id);


--
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY state
    ADD CONSTRAINT state_pkey PRIMARY KEY (abbreviation);


--
-- Name: venue venue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venue
    ADD CONSTRAINT venue_pkey PRIMARY KEY (id);


--
-- Name: ix_beer_label; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_beer_label ON beer USING btree (label);


--
-- Name: ix_beer_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_beer_name ON beer USING btree (name);


--
-- Name: ix_beer_style; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_beer_style ON beer USING btree (style);


--
-- Name: ix_brewery_address; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_brewery_address ON brewery USING btree (address);


--
-- Name: ix_brewery_brewery_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_brewery_brewery_type ON brewery USING btree (brewery_type);


--
-- Name: ix_brewery_founded; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_brewery_founded ON brewery USING btree (founded);


--
-- Name: ix_brewery_label; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_brewery_label ON brewery USING btree (label);


--
-- Name: ix_brewery_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_brewery_name ON brewery USING btree (name);


--
-- Name: ix_state_abbreviation; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_state_abbreviation ON state USING btree (abbreviation);


--
-- Name: ix_state_capital; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_state_capital ON state USING btree (capital);


--
-- Name: ix_state_flower; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_state_flower ON state USING btree (flower);


--
-- Name: ix_state_media; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_state_media ON state USING btree (media);


--
-- Name: ix_state_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX ix_state_name ON state USING btree (name);


--
-- Name: ix_venue_address; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_venue_address ON venue USING btree (address);


--
-- Name: ix_venue_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_venue_category ON venue USING btree (category);


--
-- Name: ix_venue_media; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_venue_media ON venue USING btree (media);


--
-- Name: ix_venue_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ix_venue_name ON venue USING btree (name);


--
-- Name: beer beer_brewery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY beer
    ADD CONSTRAINT beer_brewery_id_fkey FOREIGN KEY (brewery_id) REFERENCES brewery(id);


--
-- Name: beer beer_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY beer
    ADD CONSTRAINT beer_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(abbreviation);


--
-- Name: brewery brewery_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY brewery
    ADD CONSTRAINT brewery_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(abbreviation);


--
-- Name: ven2beer ven2beer_beer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ven2beer
    ADD CONSTRAINT ven2beer_beer_id_fkey FOREIGN KEY (beer_id) REFERENCES beer(id);


--
-- Name: ven2beer ven2beer_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ven2beer
    ADD CONSTRAINT ven2beer_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES venue(id);


--
-- Name: ven2brew ven2brew_brewery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ven2brew
    ADD CONSTRAINT ven2brew_brewery_id_fkey FOREIGN KEY (brewery_id) REFERENCES brewery(id);


--
-- Name: ven2brew ven2brew_venue_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ven2brew
    ADD CONSTRAINT ven2brew_venue_id_fkey FOREIGN KEY (venue_id) REFERENCES venue(id);


--
-- Name: venue venue_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venue
    ADD CONSTRAINT venue_state_id_fkey FOREIGN KEY (state_id) REFERENCES state(abbreviation);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

