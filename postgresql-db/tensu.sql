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
-- Name: branches; Type: TABLE; Schema: public; Owner: tensu_master
--

CREATE TABLE public.branches (
    title character varying(8) NOT NULL,
    street character varying(50) NOT NULL,
    house_number character varying(8) NOT NULL
);


ALTER TABLE public.branches OWNER TO tensu_master;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: tensu_master
--

CREATE TABLE public.employees (
    telegram_id bigint NOT NULL,
    surname character varying(25) NOT NULL,
    name character varying(25) NOT NULL,
    patronymic character varying(25),
    branch_title character varying(8) NOT NULL
);


ALTER TABLE public.employees OWNER TO tensu_master;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: tensu_master
--

CREATE TABLE public.schedule (
    id integer NOT NULL,
    employee_id bigint NOT NULL,
    branch_title character varying(8) NOT NULL,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL
);


ALTER TABLE public.schedule OWNER TO tensu_master;

--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: tensu_master
--

CREATE SEQUENCE public.schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedule_id_seq OWNER TO tensu_master;

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tensu_master
--

ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;


--
-- Name: schedule id; Type: DEFAULT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (title);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (telegram_id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: schedule fk_branch; Type: FK CONSTRAINT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fk_branch FOREIGN KEY (branch_title) REFERENCES public.branches(title);


--
-- Name: employees fk_branch; Type: FK CONSTRAINT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_branch FOREIGN KEY (branch_title) REFERENCES public.branches(title);


--
-- Name: schedule fk_employee; Type: FK CONSTRAINT; Schema: public; Owner: tensu_master
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES public.employees(telegram_id);


--
-- PostgreSQL database dump complete
--

