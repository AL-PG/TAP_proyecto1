PGDMP                      |            consultorio    16.3    16.3 '               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24614    consultorio    DATABASE     ~   CREATE DATABASE consultorio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE consultorio;
                postgres    false            �            1259    24623    citas    TABLE     �   CREATE TABLE public.citas (
    "idCita" integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    "descripción" text NOT NULL,
    extra text,
    "idPaciente" integer NOT NULL,
    "idMedico" integer NOT NULL
);
    DROP TABLE public.citas;
       public         heap    postgres    false            �            1259    24622    citas_idCita_seq    SEQUENCE     �   CREATE SEQUENCE public."citas_idCita_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."citas_idCita_seq";
       public          postgres    false    216                       0    0    citas_idCita_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."citas_idCita_seq" OWNED BY public.citas."idCita";
          public          postgres    false    215            �            1259    24632    expedienteMedico    TABLE     �   CREATE TABLE public."expedienteMedico" (
    "idExpediente" integer NOT NULL,
    alergias text[],
    operaciones text[],
    "medicamentoActual" text[],
    padecimientos text[],
    "idPaciente" integer NOT NULL,
    "idMedico" integer NOT NULL
);
 &   DROP TABLE public."expedienteMedico";
       public         heap    postgres    false            �            1259    24631 !   expedienteMedico_idExpediente_seq    SEQUENCE     �   CREATE SEQUENCE public."expedienteMedico_idExpediente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."expedienteMedico_idExpediente_seq";
       public          postgres    false    218                       0    0 !   expedienteMedico_idExpediente_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."expedienteMedico_idExpediente_seq" OWNED BY public."expedienteMedico"."idExpediente";
          public          postgres    false    217            �            1259    24650    medico    TABLE     �   CREATE TABLE public.medico (
    "idMedico" integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellidos character varying(20) NOT NULL,
    "teléfono" character varying(10) NOT NULL,
    rfc character varying(13) NOT NULL
);
    DROP TABLE public.medico;
       public         heap    postgres    false            �            1259    24649    medico_idMedico_seq    SEQUENCE     �   CREATE SEQUENCE public."medico_idMedico_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."medico_idMedico_seq";
       public          postgres    false    222                       0    0    medico_idMedico_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."medico_idMedico_seq" OWNED BY public.medico."idMedico";
          public          postgres    false    221            �            1259    24641    paciente    TABLE     �  CREATE TABLE public.paciente (
    "idPaciente" integer NOT NULL,
    nombre character varying(20) NOT NULL,
    apellidos character varying(20) NOT NULL,
    "teléfono" character varying(10) NOT NULL,
    curp character varying(18) NOT NULL,
    "fechaNac" date NOT NULL,
    "estadoCivil" character varying(10) NOT NULL,
    correo character varying(20)[] NOT NULL,
    "fechaAlta" date NOT NULL
);
    DROP TABLE public.paciente;
       public         heap    postgres    false            �            1259    24640    paciente_idPaciente_seq    SEQUENCE     �   CREATE SEQUENCE public."paciente_idPaciente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."paciente_idPaciente_seq";
       public          postgres    false    220                       0    0    paciente_idPaciente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."paciente_idPaciente_seq" OWNED BY public.paciente."idPaciente";
          public          postgres    false    219            _           2604    24635    expedienteMedico idExpediente    DEFAULT     �   ALTER TABLE ONLY public."expedienteMedico" ALTER COLUMN "idExpediente" SET DEFAULT nextval('public."expedienteMedico_idExpediente_seq"'::regclass);
 P   ALTER TABLE public."expedienteMedico" ALTER COLUMN "idExpediente" DROP DEFAULT;
       public          postgres    false    218    217    218            a           2604    24653    medico idMedico    DEFAULT     v   ALTER TABLE ONLY public.medico ALTER COLUMN "idMedico" SET DEFAULT nextval('public."medico_idMedico_seq"'::regclass);
 @   ALTER TABLE public.medico ALTER COLUMN "idMedico" DROP DEFAULT;
       public          postgres    false    221    222    222            `           2604    24644    paciente idPaciente    DEFAULT     ~   ALTER TABLE ONLY public.paciente ALTER COLUMN "idPaciente" SET DEFAULT nextval('public."paciente_idPaciente_seq"'::regclass);
 D   ALTER TABLE public.paciente ALTER COLUMN "idPaciente" DROP DEFAULT;
       public          postgres    false    220    219    220                      0    24623    citas 
   TABLE DATA           g   COPY public.citas ("idCita", fecha, hora, "descripción", extra, "idPaciente", "idMedico") FROM stdin;
    public          postgres    false    216   0                 0    24632    expedienteMedico 
   TABLE DATA           �   COPY public."expedienteMedico" ("idExpediente", alergias, operaciones, "medicamentoActual", padecimientos, "idPaciente", "idMedico") FROM stdin;
    public          postgres    false    218   -0                 0    24650    medico 
   TABLE DATA           Q   COPY public.medico ("idMedico", nombre, apellidos, "teléfono", rfc) FROM stdin;
    public          postgres    false    222   J0                 0    24641    paciente 
   TABLE DATA           �   COPY public.paciente ("idPaciente", nombre, apellidos, "teléfono", curp, "fechaNac", "estadoCivil", correo, "fechaAlta") FROM stdin;
    public          postgres    false    220   g0                  0    0    citas_idCita_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."citas_idCita_seq"', 1, false);
          public          postgres    false    215                       0    0 !   expedienteMedico_idExpediente_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."expedienteMedico_idExpediente_seq"', 1, false);
          public          postgres    false    217                       0    0    medico_idMedico_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."medico_idMedico_seq"', 1, false);
          public          postgres    false    221                       0    0    paciente_idPaciente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."paciente_idPaciente_seq"', 1, false);
          public          postgres    false    219            c           2606    24630    citas citas_idCita_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT "citas_idCita_pk" PRIMARY KEY ("idCita");
 A   ALTER TABLE ONLY public.citas DROP CONSTRAINT "citas_idCita_pk";
       public            postgres    false    216            g           2606    24639 1   expedienteMedico expedienteMedico_idExpediente_pk 
   CONSTRAINT        ALTER TABLE ONLY public."expedienteMedico"
    ADD CONSTRAINT "expedienteMedico_idExpediente_pk" PRIMARY KEY ("idExpediente");
 _   ALTER TABLE ONLY public."expedienteMedico" DROP CONSTRAINT "expedienteMedico_idExpediente_pk";
       public            postgres    false    218            m           2606    24655    medico medico_idMedico_pk 
   CONSTRAINT     a   ALTER TABLE ONLY public.medico
    ADD CONSTRAINT "medico_idMedico_pk" PRIMARY KEY ("idMedico");
 E   ALTER TABLE ONLY public.medico DROP CONSTRAINT "medico_idMedico_pk";
       public            postgres    false    222            k           2606    24648    paciente paciente_idPaciente_pk 
   CONSTRAINT     i   ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT "paciente_idPaciente_pk" PRIMARY KEY ("idPaciente");
 K   ALTER TABLE ONLY public.paciente DROP CONSTRAINT "paciente_idPaciente_pk";
       public            postgres    false    220            d           1259    24687    fki_citas_idMedico_fk    INDEX     O   CREATE INDEX "fki_citas_idMedico_fk" ON public.citas USING btree ("idMedico");
 +   DROP INDEX public."fki_citas_idMedico_fk";
       public            postgres    false    216            e           1259    24681    fki_citas_idPaciente_fk    INDEX     S   CREATE INDEX "fki_citas_idPaciente_fk" ON public.citas USING btree ("idPaciente");
 -   DROP INDEX public."fki_citas_idPaciente_fk";
       public            postgres    false    216            h           1259    24693     fki_expedienteMedico_idMedico_fk    INDEX     g   CREATE INDEX "fki_expedienteMedico_idMedico_fk" ON public."expedienteMedico" USING btree ("idMedico");
 6   DROP INDEX public."fki_expedienteMedico_idMedico_fk";
       public            postgres    false    218            i           1259    24699 "   fki_expedienteMedico_idPaciente_fk    INDEX     k   CREATE INDEX "fki_expedienteMedico_idPaciente_fk" ON public."expedienteMedico" USING btree ("idPaciente");
 8   DROP INDEX public."fki_expedienteMedico_idPaciente_fk";
       public            postgres    false    218            n           2606    24682    citas citas_idMedico_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT "citas_idMedico_fk" FOREIGN KEY ("idMedico") REFERENCES public.medico("idMedico");
 C   ALTER TABLE ONLY public.citas DROP CONSTRAINT "citas_idMedico_fk";
       public          postgres    false    216    222    4717            o           2606    24676    citas citas_idPaciente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT "citas_idPaciente_fk" FOREIGN KEY ("idPaciente") REFERENCES public.paciente("idPaciente");
 E   ALTER TABLE ONLY public.citas DROP CONSTRAINT "citas_idPaciente_fk";
       public          postgres    false    216    220    4715            p           2606    24688 -   expedienteMedico expedienteMedico_idMedico_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."expedienteMedico"
    ADD CONSTRAINT "expedienteMedico_idMedico_fk" FOREIGN KEY ("idMedico") REFERENCES public.medico("idMedico");
 [   ALTER TABLE ONLY public."expedienteMedico" DROP CONSTRAINT "expedienteMedico_idMedico_fk";
       public          postgres    false    218    222    4717            q           2606    24694 /   expedienteMedico expedienteMedico_idPaciente_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public."expedienteMedico"
    ADD CONSTRAINT "expedienteMedico_idPaciente_fk" FOREIGN KEY ("idPaciente") REFERENCES public.paciente("idPaciente");
 ]   ALTER TABLE ONLY public."expedienteMedico" DROP CONSTRAINT "expedienteMedico_idPaciente_fk";
       public          postgres    false    218    4715    220                  x������ � �            x������ � �            x������ � �            x������ � �     