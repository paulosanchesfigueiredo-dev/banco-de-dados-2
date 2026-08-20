--
-- PostgreSQL database dump
--

\restrict ydClt2YM0yfcmcxZsaSJbWpMrsEVatNgGDHVLTd6tVsUkt8ZfC8NdU5fwEUBqyB

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome_cliente character varying(100) NOT NULL,
    cpf_cliente character(11) NOT NULL,
    endereco_cliente character varying(200),
    telefone_cliente character varying(20)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: TABLE clientes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.clientes IS 'Cadastro de clientes';


--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: itens_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itens_venda (
    id_venda integer NOT NULL,
    id_produto integer NOT NULL,
    quantidade_venda_item integer NOT NULL,
    valor_venda numeric(10,2) NOT NULL,
    CONSTRAINT itens_venda_quantidade_venda_item_check CHECK ((quantidade_venda_item > 0)),
    CONSTRAINT itens_venda_valor_venda_check CHECK ((valor_venda >= (0)::numeric))
);


ALTER TABLE public.itens_venda OWNER TO postgres;

--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome_produto character varying(100) NOT NULL,
    quantidade_produto_estoque integer NOT NULL,
    data_validade_produto date NOT NULL,
    CONSTRAINT produtos_quantidade_produto_estoque_check CHECK ((quantidade_produto_estoque >= 0))
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: TABLE produtos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.produtos IS 'Cadastro de produtos';


--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    data_venda date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.vendas OWNER TO postgres;

--
-- Name: TABLE vendas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.vendas IS 'Cabeçalho das vendas';


--
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendas_id_seq OWNER TO postgres;

--
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome_cliente, cpf_cliente, endereco_cliente, telefone_cliente) FROM stdin;
\.


--
-- Data for Name: itens_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens_venda (id_venda, id_produto, quantidade_venda_item, valor_venda) FROM stdin;
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome_produto, quantidade_produto_estoque, data_validade_produto) FROM stdin;
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (id, id_cliente, data_venda) FROM stdin;
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 1, false);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 1, false);


--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_id_seq', 1, false);


--
-- Name: clientes clientes_cpf_cliente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_cliente_key UNIQUE (cpf_cliente);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: itens_venda pk_itens_venda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT pk_itens_venda PRIMARY KEY (id_venda, id_produto);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- Name: idx_cliente_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cliente_nome ON public.clientes USING btree (nome_cliente);


--
-- Name: idx_itens_produto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_itens_produto ON public.itens_venda USING btree (id_produto);


--
-- Name: idx_produto_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_produto_nome ON public.produtos USING btree (nome_produto);


--
-- Name: idx_vendas_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vendas_cliente ON public.vendas USING btree (id_cliente);


--
-- Name: itens_venda fk_item_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: itens_venda fk_item_venda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT fk_item_venda FOREIGN KEY (id_venda) REFERENCES public.vendas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: vendas fk_venda_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict ydClt2YM0yfcmcxZsaSJbWpMrsEVatNgGDHVLTd6tVsUkt8ZfC8NdU5fwEUBqyB

