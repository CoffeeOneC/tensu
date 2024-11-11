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

--
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: tensu_master
--

COPY public.branches (title, street, house_number) FROM stdin;
КМ10	Карла Маркса	10/1
О27	Орджоникидзе	27
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: tensu_master
--

COPY public.employees (telegram_id, surname, name, patronymic, branch_title) FROM stdin;
1788676791	Кисадильная	Вера	Помидоровна	КМ10
984827124	Глицинов	Артём	Активович	КМ10
6912128290	Дженинова	Настя	Кимовна	О27
429694193	Гигачадовна	Вика	Сеншивна	О27
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: tensu_master
--

COPY public.schedule (id, employee_id, branch_title, date, start_time, end_time) FROM stdin;
1	1788676791	О27	2025-01-01	07:00:00	14:00:00
2	984827124	КМ10	2025-01-02	07:00:00	14:00:00
3	6912128290	КМ10	2025-01-02	14:00:00	21:00:00
4	429694193	О27	2025-01-02	14:00:00	21:00:00
\.


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tensu_master
--

SELECT pg_catalog.setval('public.schedule_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

