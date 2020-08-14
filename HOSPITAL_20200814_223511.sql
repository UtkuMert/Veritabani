--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12rc1

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
-- Name: bakiyeazaltma(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.bakiyeazaltma() RETURNS trigger
    LANGUAGE plpgsql
    AS $$     DECLARE BEGIN
NEW."Bakiye"=NEW."Bakiye";
RETURN NEW;

    END;     $$;


ALTER FUNCTION public.bakiyeazaltma() OWNER TO postgres;

--
-- Name: doktorekle(integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doktorekle(doktorid integer, ucret integer, doktorsifre integer, doktorbrans integer) RETURNS text
    LANGUAGE plpgsql
    AS $$     DECLARE 
BEGIN
    insert into "public"."DOKTOR"("doktorid" , "ucret" , "doktorsifre" , "doktorbrans")
    values("doktorid" , "ucret" , "doktorsifre" , "doktorbrans");
    return 'TAMAMLANDI';
END;     $$;


ALTER FUNCTION public.doktorekle(doktorid integer, ucret integer, doktorsifre integer, doktorbrans integer) OWNER TO postgres;

--
-- Name: doktorsil(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doktorsil(doktorid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$	 DECLARE BEGIN
    delete From "DOKTOR" where "doktorId"=doktorid;
	END; 	$$;


ALTER FUNCTION public.doktorsil(doktorid integer) OWNER TO postgres;

--
-- Name: doktorucretarttirma(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doktorucretarttirma() RETURNS trigger
    LANGUAGE plpgsql
    AS $$	 DECLARE BEGIN
    NEW."ucret"=NEW."ucret";
    return new;
END; 	$$;


ALTER FUNCTION public.doktorucretarttirma() OWNER TO postgres;

--
-- Name: hastaArama(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."hastaArama"() RETURNS void
    LANGUAGE plpgsql
    AS $$	 DECLARE BEGIN	END; 	$$;


ALTER FUNCTION public."hastaArama"() OWNER TO postgres;

--
-- Name: hastasil(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hastasil(hastaid integer) RETURNS void
    LANGUAGE plpgsql
    AS $$	 DECLARE BEGIN
    delete From "HASTA" where "Hastaid"=hastaid;
	END; 	$$;


ALTER FUNCTION public.hastasil(hastaid integer) OWNER TO postgres;

--
-- Name: sifreguncelle(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sifreguncelle(sekretersifre integer) RETURNS void
    LANGUAGE plpgsql
    AS $$	 DECLARE BEGIN
    Update "public"."SEKRETER" set "SekreterSifre"=sekretersifre where "Sekreterid"=11;
	END; 	$$;


ALTER FUNCTION public.sifreguncelle(sekretersifre integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BRANS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BRANS" (
    "Bransid" integer NOT NULL,
    "BransAd" character(2044) NOT NULL
);


ALTER TABLE public."BRANS" OWNER TO postgres;

--
-- Name: CALISANLAR; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CALISANLAR" (
    "Calisanid" integer NOT NULL
);


ALTER TABLE public."CALISANLAR" OWNER TO postgres;

--
-- Name: DOKTOR; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DOKTOR" (
    doktorid integer NOT NULL,
    doktorad character(44) DEFAULT 'ABC'::bpchar,
    doktorsoyad character(44),
    ucret integer NOT NULL,
    doktorsifre integer NOT NULL,
    doktorbrans integer NOT NULL
);


ALTER TABLE public."DOKTOR" OWNER TO postgres;

--
-- Name: DUYURU; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DUYURU" (
    "Duyuruid" integer NOT NULL,
    "DuyuruZaman" date NOT NULL
);


ALTER TABLE public."DUYURU" OWNER TO postgres;

--
-- Name: GIRIS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GIRIS" (
    "Girisid" integer NOT NULL,
    "GirisSayfasi" character(2044) NOT NULL
);


ALTER TABLE public."GIRIS" OWNER TO postgres;

--
-- Name: HASTA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HASTA" (
    "Hastaid" integer NOT NULL,
    "HastaAd" character(40) NOT NULL,
    "HastaSoyad" character(44) NOT NULL,
    "HastaTelefonNo" bigint NOT NULL,
    "HastaSifre" integer NOT NULL,
    "HastaCinsiyet" character(10) NOT NULL,
    "Bakiye" integer NOT NULL,
    "HastaTc" bigint[] NOT NULL,
    "TedaviId" integer
);


ALTER TABLE public."HASTA" OWNER TO postgres;

--
-- Name: HASTANE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HASTANE" (
    "Hastaneid" integer NOT NULL,
    "HastaneAd" character(2044) NOT NULL,
    "HastaneWebSayfasi" integer NOT NULL,
    "Hasta" integer NOT NULL,
    "HastaneCalisan" integer NOT NULL
);


ALTER TABLE public."HASTANE" OWNER TO postgres;

--
-- Name: HASTANEWEBSAYFASI; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HASTANEWEBSAYFASI" (
    "Siteid" integer NOT NULL,
    "Duyuru" character(2044) NOT NULL,
    "Sayfa" character(2044) NOT NULL,
    "UyeOl" integer NOT NULL,
    "Giris" integer NOT NULL,
    "Randevu" integer NOT NULL
);


ALTER TABLE public."HASTANEWEBSAYFASI" OWNER TO postgres;

--
-- Name: HEMSIRE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HEMSIRE" (
    "HemsireId" integer NOT NULL,
    "HemsireAd" character(2044) NOT NULL,
    "HemsireSoyad" character(2044) NOT NULL
);


ALTER TABLE public."HEMSIRE" OWNER TO postgres;

--
-- Name: RANDEVU; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RANDEVU" (
    "Randevuid" integer NOT NULL,
    "RandevuTarih" date NOT NULL,
    "RandevuDurum" character(2044) NOT NULL,
    "HastaSikayet" character(2044) NOT NULL,
    "RandevuSaat" interval NOT NULL,
    "hastaId" integer NOT NULL,
    "DoktorId" integer NOT NULL
);


ALTER TABLE public."RANDEVU" OWNER TO postgres;

--
-- Name: SAYFADUYURU; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SAYFADUYURU" (
    "Siteid" character(2044) NOT NULL,
    "Duyuruid" integer NOT NULL
);


ALTER TABLE public."SAYFADUYURU" OWNER TO postgres;

--
-- Name: SEKRETER; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SEKRETER" (
    "Sekreterid" integer NOT NULL,
    "SekreterAd" character(44) NOT NULL,
    "SekreterSoyad" character(44) NOT NULL,
    "SekreterSifre" integer NOT NULL
);


ALTER TABLE public."SEKRETER" OWNER TO postgres;

--
-- Name: TEDAVI; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TEDAVI" (
    "TedaviSekli" character(2044) NOT NULL,
    "TedaviId" integer NOT NULL
);


ALTER TABLE public."TEDAVI" OWNER TO postgres;

--
-- Name: UYEOL; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UYEOL" (
    "UyeOlid" integer NOT NULL,
    "UyeOlSayfasi" character(2044) NOT NULL
);


ALTER TABLE public."UYEOL" OWNER TO postgres;

--
-- Data for Name: BRANS; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."BRANS" VALUES (1, 'Aile Hekimi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ');
INSERT INTO public."BRANS" VALUES (2, 'KBB                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ');
INSERT INTO public."BRANS" VALUES (3, 'Dis hekimi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ');
INSERT INTO public."BRANS" VALUES (4, 'Genel Cerrah                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ');


--
-- Data for Name: CALISANLAR; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: DOKTOR; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."DOKTOR" VALUES (2, 'Yusuf                                       ', 'Yilmaz                                      ', 350, 222, 2);
INSERT INTO public."DOKTOR" VALUES (1, 'Emin Utku                                   ', 'Mert                                        ', 400, 111, 1);


--
-- Data for Name: DUYURU; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: GIRIS; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: HASTA; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HASTA" VALUES (2, 'Ayse                                    ', 'Sert                                        ', 5547845214, 456, 'Kadin     ', 800, '{54789621658}', NULL);
INSERT INTO public."HASTA" VALUES (3, 'Ahmet                                   ', 'Hassan                                      ', 5573652485, 653, 'Erkek     ', 400, '{78692456987}', 1);
INSERT INTO public."HASTA" VALUES (1, 'Serhat                                  ', 'Mert                                        ', 5513659871, 123, 'Erkek     ', 700, '{21549863252}', NULL);


--
-- Data for Name: HASTANE; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: HASTANEWEBSAYFASI; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: HEMSIRE; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."HEMSIRE" VALUES (21, 'Ayse                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 'Seker                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ');
INSERT INTO public."HEMSIRE" VALUES (22, 'Hacer                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 'Mert                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ');


--
-- Data for Name: RANDEVU; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: SAYFADUYURU; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: SEKRETER; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SEKRETER" VALUES (12, 'Arif                                        ', 'Yilmaz                                      ', 12);
INSERT INTO public."SEKRETER" VALUES (11, 'Emin                                        ', 'Mert                                        ', 653);


--
-- Data for Name: TEDAVI; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TEDAVI" VALUES ('Ayakta                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 1);
INSERT INTO public."TEDAVI" VALUES ('Yatili                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 2);


--
-- Data for Name: UYEOL; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: BRANS BRANS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BRANS"
    ADD CONSTRAINT "BRANS_pkey" PRIMARY KEY ("Bransid");


--
-- Name: CALISANLAR CALISANLAR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CALISANLAR"
    ADD CONSTRAINT "CALISANLAR_pkey" PRIMARY KEY ("Calisanid");


--
-- Name: DOKTOR DOKTOR_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOKTOR"
    ADD CONSTRAINT "DOKTOR_pkey" PRIMARY KEY (doktorid);


--
-- Name: DUYURU DUYURU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DUYURU"
    ADD CONSTRAINT "DUYURU_pkey" PRIMARY KEY ("Duyuruid");


--
-- Name: GIRIS GIRIS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GIRIS"
    ADD CONSTRAINT "GIRIS_pkey" PRIMARY KEY ("Girisid");


--
-- Name: HASTANEWEBSAYFASI HASTANEWEBSAYFASI_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "HASTANEWEBSAYFASI_pkey" PRIMARY KEY ("Siteid");


--
-- Name: HASTANE HASTANE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANE"
    ADD CONSTRAINT "HASTANE_pkey" PRIMARY KEY ("Hastaneid");


--
-- Name: HASTA HASTA_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTA"
    ADD CONSTRAINT "HASTA_pkey" PRIMARY KEY ("Hastaid");


--
-- Name: HEMSIRE HEMSIRE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HEMSIRE"
    ADD CONSTRAINT "HEMSIRE_pkey" PRIMARY KEY ("HemsireId");


--
-- Name: RANDEVU RANDEVU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RANDEVU"
    ADD CONSTRAINT "RANDEVU_pkey" PRIMARY KEY ("Randevuid");


--
-- Name: SAYFADUYURU SAYFADUYURU_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SAYFADUYURU"
    ADD CONSTRAINT "SAYFADUYURU_pkey" PRIMARY KEY ("Siteid", "Duyuruid");


--
-- Name: SEKRETER SEKRETER_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SEKRETER"
    ADD CONSTRAINT "SEKRETER_pkey" PRIMARY KEY ("Sekreterid");


--
-- Name: TEDAVI TEDAVI_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TEDAVI"
    ADD CONSTRAINT "TEDAVI_pkey" PRIMARY KEY ("TedaviId");


--
-- Name: UYEOL UYEOL_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UYEOL"
    ADD CONSTRAINT "UYEOL_pkey" PRIMARY KEY ("UyeOlid");


--
-- Name: BRANS unique_BRANS_Bransid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BRANS"
    ADD CONSTRAINT "unique_BRANS_Bransid" UNIQUE ("Bransid");


--
-- Name: CALISANLAR unique_CALISANLAR_Calisanid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CALISANLAR"
    ADD CONSTRAINT "unique_CALISANLAR_Calisanid" UNIQUE ("Calisanid");


--
-- Name: DOKTOR unique_DOKTOR_DoktorBrans; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOKTOR"
    ADD CONSTRAINT "unique_DOKTOR_DoktorBrans" UNIQUE (doktorbrans);


--
-- Name: DOKTOR unique_DOKTOR_Doktorid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOKTOR"
    ADD CONSTRAINT "unique_DOKTOR_Doktorid" UNIQUE (doktorid);


--
-- Name: DUYURU unique_DUYURU_Duyuruid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DUYURU"
    ADD CONSTRAINT "unique_DUYURU_Duyuruid" UNIQUE ("Duyuruid");


--
-- Name: GIRIS unique_GIRIS_Girisid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GIRIS"
    ADD CONSTRAINT "unique_GIRIS_Girisid" UNIQUE ("Girisid");


--
-- Name: HASTANEWEBSAYFASI unique_HASTANEWEBSAYFASI_Giris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "unique_HASTANEWEBSAYFASI_Giris" UNIQUE ("Giris");


--
-- Name: HASTANEWEBSAYFASI unique_HASTANEWEBSAYFASI_Randevu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "unique_HASTANEWEBSAYFASI_Randevu" UNIQUE ("Randevu");


--
-- Name: HASTANEWEBSAYFASI unique_HASTANEWEBSAYFASI_Siteid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "unique_HASTANEWEBSAYFASI_Siteid" UNIQUE ("Siteid");


--
-- Name: HASTANEWEBSAYFASI unique_HASTANEWEBSAYFASI_UyeOl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "unique_HASTANEWEBSAYFASI_UyeOl" UNIQUE ("UyeOl");


--
-- Name: HASTANE unique_HASTANE_HastaneWebSayfasi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANE"
    ADD CONSTRAINT "unique_HASTANE_HastaneWebSayfasi" UNIQUE ("HastaneWebSayfasi");


--
-- Name: HASTANE unique_HASTANE_Hastaneid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANE"
    ADD CONSTRAINT "unique_HASTANE_Hastaneid" UNIQUE ("Hastaneid");


--
-- Name: HASTA unique_HASTA_Hastaid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTA"
    ADD CONSTRAINT "unique_HASTA_Hastaid" UNIQUE ("Hastaid");


--
-- Name: RANDEVU unique_RANDEVU_hastaId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RANDEVU"
    ADD CONSTRAINT "unique_RANDEVU_hastaId" UNIQUE ("hastaId");


--
-- Name: RANDEVU unique_Randevu_Randevuid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RANDEVU"
    ADD CONSTRAINT "unique_Randevu_Randevuid" UNIQUE ("Randevuid");


--
-- Name: SAYFADUYURU unique_SAYFADUYURU_Siteid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SAYFADUYURU"
    ADD CONSTRAINT "unique_SAYFADUYURU_Siteid" UNIQUE ("Siteid");


--
-- Name: SEKRETER unique_SEKRETER_Sekreterid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SEKRETER"
    ADD CONSTRAINT "unique_SEKRETER_Sekreterid" UNIQUE ("Sekreterid");


--
-- Name: UYEOL unique_UYEOL_UyeOlid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UYEOL"
    ADD CONSTRAINT "unique_UYEOL_UyeOlid" UNIQUE ("UyeOlid");


--
-- Name: index_Duyuru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "index_Duyuru" ON public."HASTANEWEBSAYFASI" USING btree ("Duyuru");


--
-- Name: DOKTOR arttirma; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER arttirma BEFORE UPDATE ON public."DOKTOR" FOR EACH ROW EXECUTE FUNCTION public.doktorucretarttirma();


--
-- Name: HASTA azaltma; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER azaltma BEFORE UPDATE ON public."HASTA" FOR EACH ROW EXECUTE FUNCTION public.bakiyeazaltma();


--
-- Name: DOKTOR ucretarttirma; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ucretarttirma BEFORE UPDATE ON public."DOKTOR" FOR EACH ROW EXECUTE FUNCTION public.doktorucretarttirma();


--
-- Name: HASTA ucretazaltma; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER ucretazaltma BEFORE UPDATE ON public."HASTA" FOR EACH ROW EXECUTE FUNCTION public.bakiyeazaltma();


--
-- Name: DOKTOR lnk_BRANS_DOKTOR; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOKTOR"
    ADD CONSTRAINT "lnk_BRANS_DOKTOR" FOREIGN KEY (doktorbrans) REFERENCES public."BRANS"("Bransid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANE lnk_CALISANLAR_HASTANE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANE"
    ADD CONSTRAINT "lnk_CALISANLAR_HASTANE" FOREIGN KEY ("HastaneCalisan") REFERENCES public."CALISANLAR"("Calisanid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CALISANLAR lnk_DOKTOR_CALISANLAR; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CALISANLAR"
    ADD CONSTRAINT "lnk_DOKTOR_CALISANLAR" FOREIGN KEY ("Calisanid") REFERENCES public."DOKTOR"(doktorid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RANDEVU lnk_DOKTOR_RANDEVU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RANDEVU"
    ADD CONSTRAINT "lnk_DOKTOR_RANDEVU" FOREIGN KEY ("DoktorId") REFERENCES public."DOKTOR"(doktorid) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SAYFADUYURU lnk_DUYURU_SAYFADUYURU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SAYFADUYURU"
    ADD CONSTRAINT "lnk_DUYURU_SAYFADUYURU" FOREIGN KEY ("Duyuruid") REFERENCES public."DUYURU"("Duyuruid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANEWEBSAYFASI lnk_GIRIS_HASTANEWEBSAYFASI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "lnk_GIRIS_HASTANEWEBSAYFASI" FOREIGN KEY ("Giris") REFERENCES public."GIRIS"("Girisid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANE lnk_HASTANEWEBSAYFASI_HASTANE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANE"
    ADD CONSTRAINT "lnk_HASTANEWEBSAYFASI_HASTANE" FOREIGN KEY ("HastaneWebSayfasi") REFERENCES public."HASTANEWEBSAYFASI"("Siteid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANE lnk_HASTA_HASTANE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANE"
    ADD CONSTRAINT "lnk_HASTA_HASTANE" FOREIGN KEY ("Hasta") REFERENCES public."HASTA"("Hastaid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: RANDEVU lnk_HASTA_RANDEVU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RANDEVU"
    ADD CONSTRAINT "lnk_HASTA_RANDEVU" FOREIGN KEY ("hastaId") REFERENCES public."HASTA"("Hastaid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CALISANLAR lnk_HEMSIRE_CALISANLAR; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CALISANLAR"
    ADD CONSTRAINT "lnk_HEMSIRE_CALISANLAR" FOREIGN KEY ("Calisanid") REFERENCES public."HEMSIRE"("HemsireId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANEWEBSAYFASI lnk_RANDEVU_HASTANEWEBSAYFASI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "lnk_RANDEVU_HASTANEWEBSAYFASI" FOREIGN KEY ("Randevu") REFERENCES public."RANDEVU"("Randevuid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANEWEBSAYFASI lnk_SAYFADUYURU_HASTANEWEBSAYFASI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "lnk_SAYFADUYURU_HASTANEWEBSAYFASI" FOREIGN KEY ("Duyuru") REFERENCES public."SAYFADUYURU"("Siteid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CALISANLAR lnk_SEKRETER_CALISANLAR; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CALISANLAR"
    ADD CONSTRAINT "lnk_SEKRETER_CALISANLAR" FOREIGN KEY ("Calisanid") REFERENCES public."SEKRETER"("Sekreterid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTA lnk_TEDAVI_HASTA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTA"
    ADD CONSTRAINT "lnk_TEDAVI_HASTA" FOREIGN KEY ("TedaviId") REFERENCES public."TEDAVI"("TedaviId") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: HASTANEWEBSAYFASI lnk_UYEOL_HASTANEWEBSAYFASI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HASTANEWEBSAYFASI"
    ADD CONSTRAINT "lnk_UYEOL_HASTANEWEBSAYFASI" FOREIGN KEY ("UyeOl") REFERENCES public."UYEOL"("UyeOlid") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

