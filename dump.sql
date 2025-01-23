--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: Account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Account" (
    _id text NOT NULL,
    "userId" text NOT NULL,
    "accountId" text NOT NULL,
    "providerId" text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "accessTokenExpiresAt" timestamp(3) without time zone,
    "refreshTokenExpiresAt" timestamp(3) without time zone,
    scope text,
    password text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Account" OWNER TO postgres;

--
-- Name: Session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Session" (
    _id text NOT NULL,
    "userId" text NOT NULL,
    token text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "ipAddress" text,
    "userAgent" text,
    "impersonatedBy" text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Session" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    _id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    "emailVerified" boolean DEFAULT false NOT NULL,
    image text,
    premium boolean DEFAULT false NOT NULL,
    role text DEFAULT 'user'::text NOT NULL,
    banned boolean DEFAULT false NOT NULL,
    "banReason" text,
    "banExpires" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: Verification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Verification" (
    _id text NOT NULL,
    identifier text NOT NULL,
    value text NOT NULL,
    "expiresAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Verification" OWNER TO postgres;

--
-- Data for Name: Account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Account" (_id, "userId", "accountId", "providerId", "accessToken", "refreshToken", "accessTokenExpiresAt", "refreshTokenExpiresAt", scope, password, "createdAt", "updatedAt") FROM stdin;
8BKZfN2iWrbccDDKPFwQWHdkGS3Xl1Tf	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	credential	\N	\N	\N	\N	\N	840da51d882ad5d50cc55603e64f34b2:2ea2a8b22a78c1a84239e342886eef94f02b7d42b70c2849c3f00d17f4fa91794ceba7209a859518fb9b08f69cc9e9d20237ffaa8ae0adb0663771c951e89bf2	2025-01-18 12:34:24.644	2025-01-18 12:34:24.644
VkTKgXYUwHnXVL6pG8GkC4xdNDA5ahyf	a5ZkShIL7NZTj1EAoQKsy1btdIEbhVrr	a5ZkShIL7NZTj1EAoQKsy1btdIEbhVrr	credential	\N	\N	\N	\N	\N	9b92569241cb393deba7388f320c5acc:7bd12e837fd5f0472cf83c73987a9f5cec2bad4c673c89fa17b5a637d94ea896d4b61f7457b10ac435fbfecd0630664d2f4cc5e908c5f2146b7edf000a25ec41	2025-01-18 12:47:08.992	2025-01-18 12:47:08.992
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Session" (_id, "userId", token, "expiresAt", "ipAddress", "userAgent", "impersonatedBy", "createdAt", "updatedAt") FROM stdin;
NnGjaWFpPCerFmVkEhY4hkkppImP0JXW	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	nXA2SjAPMLjdkUmRbElxyht3CWFJaxSC	2025-01-25 12:34:24.649	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-18 12:34:24.649	2025-01-18 12:34:24.649
xR7qYNWew0IehZ596ob2zeQQXhRs3cBj	a5ZkShIL7NZTj1EAoQKsy1btdIEbhVrr	AWa7XG5WV9DsmyJaVUR5Siq8CQCXbOMR	2025-01-25 12:47:08.995	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-18 12:47:08.995	2025-01-18 12:47:08.995
5bthfxHFLumwEVYiUV7gxmcLzjKYaWZ8	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	D92xZVt66Mgh4ghjTKqlteJF1BAVT3N7	2025-01-25 12:55:59.382	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-18 12:55:59.382	2025-01-18 12:55:59.382
FOLJ0KDkM2P7eunSgASb1wzgxUoadKPa	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	s2bn0onzGcVNDe3FgKHIerMVIL04BJNy	2025-01-25 12:56:19.175	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-18 12:56:19.175	2025-01-18 12:56:19.175
kgHblnE1SdopW0RftXcjrsNwBeZoHaoX	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	e9CVMn34HarYNK7cysmfcslShGHtX7Um	2025-01-25 13:00:55.799	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-18 13:00:55.799	2025-01-18 13:00:55.799
MpRWHWtJUXlJurjE8aXaFkO6TILP3qVI	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	Z5sm8Hx5QmkMlgWPUcBccAeerK29bL3d	2025-01-26 01:53:20.459	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-19 01:53:20.46	2025-01-19 01:53:20.46
D7sjrqAJ7Fylf6HxcwVcHZwdqGCY2cou	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	aW0Xi9Hnpez59EADQkq8ic2VwM11h7QS	2025-01-27 05:09:00.139	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-20 05:09:00.14	2025-01-20 05:09:00.14
xRJw5t34htsDngorBlM0yyFONTP7LWwQ	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	m9AgqEEfqzPbNm4h6nEhKbueWkhrbUBi	2025-01-27 05:09:58.342	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-20 05:09:58.344	2025-01-20 05:09:58.344
M6CSQYqTEUqhQHDie6JPqvVHCf2MXIBL	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	Eop7EbpnmSEQ2KWLFoQebZ1hDwMwbIe6	2025-01-27 05:10:19.352	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-20 05:10:19.352	2025-01-20 05:10:19.352
HotoZHf0dP25CoDrJrMwoncqmX4Rz7NE	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	Rw6qvfhsYBhwh34R7UUNQMJKsrQU9gOr	2025-01-27 05:10:39.656	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-20 05:10:39.656	2025-01-20 05:10:39.656
eFv4FZmBSBFLcQVYYQrtdbqCgA8B0XCZ	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	XgMV118A3bhVZXE8Qf707Jp0zFMxCCO4	2025-01-28 09:12:21.824	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 09:12:21.825	2025-01-21 09:12:21.825
O2IBcunv7lCccyr7j0lBMdjZVn3XwpcZ	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	HOIUyHXrXr9HR3hqap0NO4n6tMYRUkgC	2025-01-28 10:16:33.937	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 10:16:33.937	2025-01-21 10:16:33.937
2e6tMKBh6GJj4O2ifFXZEghyXLtC0zrw	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	cL3QdHH3haoiMDY1IBlCYA88gcFOjgZx	2025-01-28 10:52:46.165	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 10:52:46.166	2025-01-21 10:52:46.166
eriKGuk3CDoCvm2WYB3RtJKV6mknXSV0	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	DD0obXBkPYwc9PraNDBKsJWzmOvdftxe	2025-01-28 10:58:48.341	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 10:58:48.341	2025-01-21 10:58:48.341
3efv6qbfFWtIBK82zGJUBZTSVMxAeIzV	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	WtbpicPYkOmbvUpucDzjIMFi2axreF9N	2025-01-28 11:23:16.79	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 11:23:16.79	2025-01-21 11:23:16.79
yO1WTA3eyotPIFgdY9DtChxMrqqLbAdT	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	UALJlz3Vqn39gPbf7lCgLMthureNoMdU	2025-01-28 11:34:22.785	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 11:34:22.785	2025-01-21 11:34:22.785
DppL5bxjsi2YAnl49SppaK2DSYVWF6gU	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	wnZLiCDPjUrUCHrJgsAC9HwKkI5KdChP	2025-01-28 11:37:34.192	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 11:37:34.192	2025-01-21 11:37:34.192
hq2O5XzNUfdOR6v6jU4GbILAh2v4jPFM	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	Kx3le0eWaLunLBIM7BDlfWNmn55ybMcX	2025-01-28 11:56:07.506	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-21 11:56:07.506	2025-01-21 11:56:07.506
1Oet3VcdYu5lOcRdIR9tlemw3AN62gPj	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	ewEEahU0UMT84bgJtr1PapLmd45zimr5	2025-01-29 07:44:58.632	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 07:44:58.633	2025-01-22 07:44:58.633
q6R7vbOUE8aCEtZl4fbErxrQzgSq6Dmo	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	jAZFo7Gu5uyMTfpYsO1xjwaLR5GhBhni	2025-01-29 07:54:43.578	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 07:54:43.578	2025-01-22 07:54:43.578
ystMXEgQnOBEDIyIxEDBFSiueBtQtnDT	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	I807X80glKmdto7dlrsujKhOHcfVgccU	2025-01-29 07:56:19.475	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 07:56:19.475	2025-01-22 07:56:19.475
gxBoyndDwJxCFJQa2EX4TjT34szsqTz5	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	pl1rHqJzjcqAiUsfbaayVc2dMiMaqmBA	2025-01-29 08:05:20.706	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 08:05:20.706	2025-01-22 08:05:20.706
rV2hmGKSAodMcMbnbSdaZdwg4jpYQEv0	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	zFOds4OgIcKyfSjBT9AcAWI3TRNqyNk4	2025-01-29 08:14:58.933	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 08:14:58.933	2025-01-22 08:14:58.933
VefFTd3ND8TeUQORfvStNB6Y4cSubtph	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	v6tt5gGflbSTCl3rg4I8XLnERe3SOE1T	2025-01-29 08:16:13.264	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 08:16:13.265	2025-01-22 08:16:13.265
ghQHKC7pyEncafuSkVqFc0MVZ3zQZOKT	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	ZbYMyJ040Je2O4apW3Gy5UWw5oh8rp4b	2025-01-29 08:22:27.009	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 08:22:27.01	2025-01-22 08:22:27.01
FaWSLI7HY3qOgsem0PxHqpkPAocQel9o	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	TCJJUTfln64yt6EbDXInTUjYa552Fqsa	2025-01-29 08:45:22.479	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 08:45:22.479	2025-01-22 08:45:22.479
hzs7D6cJVO6FVjw5TltfQjWCMv5WxAT4	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	9yVBL5GILyXWxZiK3rNcwbiU92hcLG0Q	2025-01-29 08:46:26.904	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-22 08:46:26.904	2025-01-22 08:46:26.904
hlKneQlRVkLfQh3SPfLxLAlkfIYXEG9K	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	VEqXcPugaYNbaDSuaApaCZapb7qJzr99	2025-01-30 06:16:13.72	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-23 06:16:13.721	2025-01-23 06:16:13.721
zmgg2iuDivOBq7qYujCjuejXmki4CD70	4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	pwxtnmgYbHrXzyG0fxYrCBQ913iDv0ga	2025-01-30 06:28:03.97	::1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36	\N	2025-01-23 06:28:03.971	2025-01-23 06:28:03.971
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (_id, name, email, "emailVerified", image, premium, role, banned, "banReason", "banExpires", "createdAt", "updatedAt") FROM stdin;
4pMyq1eimJk9VDtZ0B53gX51cD4D8aW0	johndoe	johndoe@gmail.com	f	\N	f	user	f	\N	\N	2025-01-18 12:34:23.352	2025-01-18 12:34:23.352
a5ZkShIL7NZTj1EAoQKsy1btdIEbhVrr	juandelacruz	juandelacruz@gmail.com	f	\N	f	user	f	\N	\N	2025-01-18 12:47:07.688	2025-01-18 12:47:07.688
\.


--
-- Data for Name: Verification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Verification" (_id, identifier, value, "expiresAt", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: Account Account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_pkey" PRIMARY KEY (_id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (_id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (_id);


--
-- Name: Verification Verification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Verification"
    ADD CONSTRAINT "Verification_pkey" PRIMARY KEY (_id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Account Account_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Account"
    ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Session Session_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Session"
    ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

