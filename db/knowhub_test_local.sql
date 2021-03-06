PGDMP     )    %            	    s           knowhub_test_local    9.4.4    9.4.0 b    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            P           1262    16978    knowhub_test_local    DATABASE     �   CREATE DATABASE knowhub_test_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 "   DROP DATABASE knowhub_test_local;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            Q           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6            R           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6            �            3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            S           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    195            �            1259    16979    authorities    TABLE     �   CREATE TABLE authorities (
    authority_id bigint NOT NULL,
    user_id bigint NOT NULL,
    authority character varying(50) NOT NULL
);
    DROP TABLE public.authorities;
       public         kuts    false    6            �            1259    16982    authorities_authority_id_seq    SEQUENCE     ~   CREATE SEQUENCE authorities_authority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.authorities_authority_id_seq;
       public       kuts    false    172    6            T           0    0    authorities_authority_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE authorities_authority_id_seq OWNED BY authorities.authority_id;
            public       kuts    false    173            �            1259    16984 
   categories    TABLE     �   CREATE TABLE categories (
    category_id bigint NOT NULL,
    value character varying(250) NOT NULL,
    short_value character varying(10) NOT NULL
);
    DROP TABLE public.categories;
       public         kuts    false    6            �            1259    16987    categories_category_id_seq    SEQUENCE     |   CREATE SEQUENCE categories_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_category_id_seq;
       public       kuts    false    6    174            U           0    0    categories_category_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE categories_category_id_seq OWNED BY categories.category_id;
            public       kuts    false    175            �            1259    16989    comments    TABLE     �   CREATE TABLE comments (
    comment_id bigint NOT NULL,
    value text NOT NULL,
    load_date timestamp without time zone,
    rating bigint,
    user_id bigint,
    question_id bigint
);
    DROP TABLE public.comments;
       public         kuts    false    6            �            1259    16995    comments_comment_id_seq    SEQUENCE     y   CREATE SEQUENCE comments_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.comments_comment_id_seq;
       public       kuts    false    176    6            V           0    0    comments_comment_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE comments_comment_id_seq OWNED BY comments.comment_id;
            public       kuts    false    177            �            1259    16997    confirmations    TABLE     �   CREATE TABLE confirmations (
    conf_id bigint NOT NULL,
    user_id bigint,
    link character varying(50),
    reg_date timestamp without time zone
);
 !   DROP TABLE public.confirmations;
       public         kuts    false    6            �            1259    17000    confirmations_conf_id_seq    SEQUENCE     {   CREATE SEQUENCE confirmations_conf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.confirmations_conf_id_seq;
       public       kuts    false    6    178            W           0    0    confirmations_conf_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE confirmations_conf_id_seq OWNED BY confirmations.conf_id;
            public       kuts    false    179            �            1259    17002 
   properties    TABLE     �   CREATE TABLE properties (
    property_id bigint NOT NULL,
    key character varying(250) NOT NULL,
    value character varying(250)
);
    DROP TABLE public.properties;
       public         kuts    false    6            �            1259    17008    properties_property_id_seq    SEQUENCE     |   CREATE SEQUENCE properties_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.properties_property_id_seq;
       public       kuts    false    180    6            X           0    0    properties_property_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE properties_property_id_seq OWNED BY properties.property_id;
            public       kuts    false    181            �            1259    17010    question_tags    TABLE     o   CREATE TABLE question_tags (
    question_tag_id bigint NOT NULL,
    question_id bigint,
    tag_id bigint
);
 !   DROP TABLE public.question_tags;
       public         kuts    false    6            �            1259    17013 !   question_tags_question_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE question_tags_question_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.question_tags_question_tag_id_seq;
       public       kuts    false    182    6            Y           0    0 !   question_tags_question_tag_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE question_tags_question_tag_id_seq OWNED BY question_tags.question_tag_id;
            public       kuts    false    183            �            1259    17015 	   questions    TABLE     �   CREATE TABLE questions (
    question_id bigint NOT NULL,
    value character varying(140) NOT NULL,
    load_date timestamp without time zone,
    category_id bigint NOT NULL
);
    DROP TABLE public.questions;
       public         kuts    false    6            �            1259    17018    questions_category_id_seq    SEQUENCE     {   CREATE SEQUENCE questions_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.questions_category_id_seq;
       public       kuts    false    184    6            Z           0    0    questions_category_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE questions_category_id_seq OWNED BY questions.category_id;
            public       kuts    false    185            �            1259    17020    questions_question_id_seq    SEQUENCE     {   CREATE SEQUENCE questions_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.questions_question_id_seq;
       public       kuts    false    6    184            [           0    0    questions_question_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE questions_question_id_seq OWNED BY questions.question_id;
            public       kuts    false    186            �            1259    17022    ratings    TABLE     d   CREATE TABLE ratings (
    rating_id bigint NOT NULL,
    question_id bigint,
    user_id bigint
);
    DROP TABLE public.ratings;
       public         kuts    false    6            �            1259    17025    ratings_rating_id_seq    SEQUENCE     w   CREATE SEQUENCE ratings_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ratings_rating_id_seq;
       public       kuts    false    6    187            \           0    0    ratings_rating_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE ratings_rating_id_seq OWNED BY ratings.rating_id;
            public       kuts    false    188            �            1259    17027    tags    TABLE     ]   CREATE TABLE tags (
    tag_id bigint NOT NULL,
    value character varying(250) NOT NULL
);
    DROP TABLE public.tags;
       public         kuts    false    6            �            1259    17030    tags_tag_id_seq    SEQUENCE     q   CREATE SEQUENCE tags_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tags_tag_id_seq;
       public       kuts    false    189    6            ]           0    0    tags_tag_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE tags_tag_id_seq OWNED BY tags.tag_id;
            public       kuts    false    190            �            1259    17032    user_settings    TABLE     {   CREATE TABLE user_settings (
    user_setting_id bigint NOT NULL,
    num_of_records_on_page bigint,
    user_id bigint
);
 !   DROP TABLE public.user_settings;
       public         kuts    false    6            �            1259    17035 !   user_settings_user_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE user_settings_user_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.user_settings_user_setting_id_seq;
       public       kuts    false    191    6            ^           0    0 !   user_settings_user_setting_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE user_settings_user_setting_id_seq OWNED BY user_settings.user_setting_id;
            public       kuts    false    192            �            1259    17037    users    TABLE     �   CREATE TABLE users (
    user_id bigint NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    enabled boolean NOT NULL,
    confirmed boolean NOT NULL
);
    DROP TABLE public.users;
       public         kuts    false    6            �            1259    17040    users_user_id_seq    SEQUENCE     s   CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public       kuts    false    193    6            _           0    0    users_user_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;
            public       kuts    false    194            �           2604    17042    authority_id    DEFAULT     v   ALTER TABLE ONLY authorities ALTER COLUMN authority_id SET DEFAULT nextval('authorities_authority_id_seq'::regclass);
 G   ALTER TABLE public.authorities ALTER COLUMN authority_id DROP DEFAULT;
       public       kuts    false    173    172            �           2604    17043    category_id    DEFAULT     r   ALTER TABLE ONLY categories ALTER COLUMN category_id SET DEFAULT nextval('categories_category_id_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN category_id DROP DEFAULT;
       public       kuts    false    175    174            �           2604    17044 
   comment_id    DEFAULT     l   ALTER TABLE ONLY comments ALTER COLUMN comment_id SET DEFAULT nextval('comments_comment_id_seq'::regclass);
 B   ALTER TABLE public.comments ALTER COLUMN comment_id DROP DEFAULT;
       public       kuts    false    177    176            �           2604    17045    conf_id    DEFAULT     p   ALTER TABLE ONLY confirmations ALTER COLUMN conf_id SET DEFAULT nextval('confirmations_conf_id_seq'::regclass);
 D   ALTER TABLE public.confirmations ALTER COLUMN conf_id DROP DEFAULT;
       public       kuts    false    179    178            �           2604    17046    property_id    DEFAULT     r   ALTER TABLE ONLY properties ALTER COLUMN property_id SET DEFAULT nextval('properties_property_id_seq'::regclass);
 E   ALTER TABLE public.properties ALTER COLUMN property_id DROP DEFAULT;
       public       kuts    false    181    180            �           2604    17047    question_tag_id    DEFAULT     �   ALTER TABLE ONLY question_tags ALTER COLUMN question_tag_id SET DEFAULT nextval('question_tags_question_tag_id_seq'::regclass);
 L   ALTER TABLE public.question_tags ALTER COLUMN question_tag_id DROP DEFAULT;
       public       kuts    false    183    182            �           2604    17048    question_id    DEFAULT     p   ALTER TABLE ONLY questions ALTER COLUMN question_id SET DEFAULT nextval('questions_question_id_seq'::regclass);
 D   ALTER TABLE public.questions ALTER COLUMN question_id DROP DEFAULT;
       public       kuts    false    186    184            �           2604    17049    category_id    DEFAULT     p   ALTER TABLE ONLY questions ALTER COLUMN category_id SET DEFAULT nextval('questions_category_id_seq'::regclass);
 D   ALTER TABLE public.questions ALTER COLUMN category_id DROP DEFAULT;
       public       kuts    false    185    184            �           2604    17050 	   rating_id    DEFAULT     h   ALTER TABLE ONLY ratings ALTER COLUMN rating_id SET DEFAULT nextval('ratings_rating_id_seq'::regclass);
 @   ALTER TABLE public.ratings ALTER COLUMN rating_id DROP DEFAULT;
       public       kuts    false    188    187            �           2604    17051    tag_id    DEFAULT     \   ALTER TABLE ONLY tags ALTER COLUMN tag_id SET DEFAULT nextval('tags_tag_id_seq'::regclass);
 :   ALTER TABLE public.tags ALTER COLUMN tag_id DROP DEFAULT;
       public       kuts    false    190    189            �           2604    17052    user_setting_id    DEFAULT     �   ALTER TABLE ONLY user_settings ALTER COLUMN user_setting_id SET DEFAULT nextval('user_settings_user_setting_id_seq'::regclass);
 L   ALTER TABLE public.user_settings ALTER COLUMN user_setting_id DROP DEFAULT;
       public       kuts    false    192    191            �           2604    17053    user_id    DEFAULT     `   ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public       kuts    false    194    193            5          0    16979    authorities 
   TABLE DATA               @   COPY authorities (authority_id, user_id, authority) FROM stdin;
    public       kuts    false    172   �h       `           0    0    authorities_authority_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('authorities_authority_id_seq', 1, false);
            public       kuts    false    173            7          0    16984 
   categories 
   TABLE DATA               >   COPY categories (category_id, value, short_value) FROM stdin;
    public       kuts    false    174   �h       a           0    0    categories_category_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('categories_category_id_seq', 8, true);
            public       kuts    false    175            9          0    16989    comments 
   TABLE DATA               W   COPY comments (comment_id, value, load_date, rating, user_id, question_id) FROM stdin;
    public       kuts    false    176   �i       b           0    0    comments_comment_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('comments_comment_id_seq', 1, false);
            public       kuts    false    177            ;          0    16997    confirmations 
   TABLE DATA               B   COPY confirmations (conf_id, user_id, link, reg_date) FROM stdin;
    public       kuts    false    178   �i       c           0    0    confirmations_conf_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('confirmations_conf_id_seq', 93, true);
            public       kuts    false    179            =          0    17002 
   properties 
   TABLE DATA               6   COPY properties (property_id, key, value) FROM stdin;
    public       kuts    false    180   Jj       d           0    0    properties_property_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('properties_property_id_seq', 9, true);
            public       kuts    false    181            ?          0    17010    question_tags 
   TABLE DATA               F   COPY question_tags (question_tag_id, question_id, tag_id) FROM stdin;
    public       kuts    false    182   �j       e           0    0 !   question_tags_question_tag_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('question_tags_question_tag_id_seq', 1, false);
            public       kuts    false    183            A          0    17015 	   questions 
   TABLE DATA               H   COPY questions (question_id, value, load_date, category_id) FROM stdin;
    public       kuts    false    184   �j       f           0    0    questions_category_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('questions_category_id_seq', 1, false);
            public       kuts    false    185            g           0    0    questions_question_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('questions_question_id_seq', 8023, true);
            public       kuts    false    186            D          0    17022    ratings 
   TABLE DATA               ;   COPY ratings (rating_id, question_id, user_id) FROM stdin;
    public       kuts    false    187   a	      h           0    0    ratings_rating_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('ratings_rating_id_seq', 7, true);
            public       kuts    false    188            F          0    17027    tags 
   TABLE DATA               &   COPY tags (tag_id, value) FROM stdin;
    public       kuts    false    189   �	      i           0    0    tags_tag_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('tags_tag_id_seq', 3, true);
            public       kuts    false    190            H          0    17032    user_settings 
   TABLE DATA               R   COPY user_settings (user_setting_id, num_of_records_on_page, user_id) FROM stdin;
    public       kuts    false    191   �	      j           0    0 !   user_settings_user_setting_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('user_settings_user_setting_id_seq', 1, false);
            public       kuts    false    192            J          0    17037    users 
   TABLE DATA               F   COPY users (user_id, login, password, enabled, confirmed) FROM stdin;
    public       kuts    false    193   �	      k           0    0    users_user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('users_user_id_seq', 93, true);
            public       kuts    false    194            �           2606    17055    authorities_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY authorities
    ADD CONSTRAINT authorities_pkey PRIMARY KEY (authority_id);
 F   ALTER TABLE ONLY public.authorities DROP CONSTRAINT authorities_pkey;
       public         kuts    false    172    172            �           2606    17057    categories_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public         kuts    false    174    174            �           2606    17059    comments_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public         kuts    false    176    176            �           2606    17061    confirmations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY confirmations
    ADD CONSTRAINT confirmations_pkey PRIMARY KEY (conf_id);
 J   ALTER TABLE ONLY public.confirmations DROP CONSTRAINT confirmations_pkey;
       public         kuts    false    178    178            �           2606    17063    properties_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (property_id);
 D   ALTER TABLE ONLY public.properties DROP CONSTRAINT properties_pkey;
       public         kuts    false    180    180            �           2606    17065    question_tags_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY question_tags
    ADD CONSTRAINT question_tags_pkey PRIMARY KEY (question_tag_id);
 J   ALTER TABLE ONLY public.question_tags DROP CONSTRAINT question_tags_pkey;
       public         kuts    false    182    182            �           2606    17067    questions_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);
 B   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
       public         kuts    false    184    184            �           2606    17069    ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (rating_id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public         kuts    false    187    187            �           2606    17071 	   tags_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public         kuts    false    189    189            �           2606    17073    user_settings_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (user_setting_id);
 J   ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_pkey;
       public         kuts    false    191    191            �           2606    17075 
   users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         kuts    false    193    193            �           2606    17076    authorities_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY authorities
    ADD CONSTRAINT authorities_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);
 N   ALTER TABLE ONLY public.authorities DROP CONSTRAINT authorities_user_id_fkey;
       public       kuts    false    1982    172    193            �           2606    17081    comments_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(question_id);
 L   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_question_id_fkey;
       public       kuts    false    184    176    1974            �           2606    17086    comments_user_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public       kuts    false    193    1982    176            �           2606    17091    question_tags_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY question_tags
    ADD CONSTRAINT question_tags_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(question_id);
 V   ALTER TABLE ONLY public.question_tags DROP CONSTRAINT question_tags_question_id_fkey;
       public       kuts    false    182    184    1974            �           2606    17096    question_tags_tag_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY question_tags
    ADD CONSTRAINT question_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tags(tag_id);
 Q   ALTER TABLE ONLY public.question_tags DROP CONSTRAINT question_tags_tag_id_fkey;
       public       kuts    false    182    1978    189            �           2606    17101    questions_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES categories(category_id);
 N   ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_category_id_fkey;
       public       kuts    false    1964    174    184            �           2606    17106    ratings_question_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_question_id_fkey FOREIGN KEY (question_id) REFERENCES questions(question_id);
 J   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_question_id_fkey;
       public       kuts    false    1974    184    187            �           2606    17111    ratings_user_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_user_id_fkey;
       public       kuts    false    193    187    1982            �           2606    17116    user_settings_user_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);
 R   ALTER TABLE ONLY public.user_settings DROP CONSTRAINT user_settings_user_id_fkey;
       public       kuts    false    193    191    1982            5      x������ � �      7   �   x�E���0F�{��#,$����	�tti�4���^x~	���/������nn��k�w`&���,e	ܫ����=ԓ������^\m� fL,J�s���k<B'����4��Op��{����)��U�B1��ؓ*�����G��]B4�      9      x������ � �      ;   �   x�M��	C1Dѵ]�k�fF���%��%��Ȏ��',E��.��|hu���k6�[bG??�xE�;���nQUn
���Y>�Ҭ�;Eg��ũi�:�-Y<����)��}�����K������-���o�"(�      =   b   x�5�I
�0D�u�aqv�AmED*��ⰫO=KaS��!x��+�.��{y��ȹ|;ޖ&��p�7?�>܇p:��	�6� s��&.*%���/�5'�      ?      x������ � �      A      x�̽M�-�v����(�z�����4D	���`��(v�-£pS y
W3R��S�'�*�0p	6H��{�ޑ�Q�2�Z�~���������W��w��_�����������տ��?�-_�����(��]�?����~d�?H�����/�����\O�����������?����/���� �����������7����������������o��߈������R.M����O�������s���?��������!�d�~���?��@]�'�������������Է���ƃ��k�e�6`�a��-�c��Z��?��#_/��d������:\̖m��_���@�.���9\�O�<\�'T~��2\L.k��)��p1����Ϳ�t��[��p�?��p��P�Q��p19����f��k.��z�:\�?���o�����t~ɸ�O����e���^3����=cc���_}�؀?�W��������xը?�񣽽j0�j����������zx�`��U��%�j�?�W���?�۫�ޫ�7������W�P_5�[ҫ���W�i�/��/~�'G8���1�iV�-�����$���1.���q��������#3����?F��柉o�~���?�������o>~��������A�����ׄ�N�-��w����F(F�=i�_8�ؤ�UaO����'v����xΣ)�>U���f�(A&���9eIA��P��9
�+A�s�R���(��Y�Qh})�9
m�Y���гd=G�w%�z�B�RZ
Y
��ѥ �QS	��'7�R$]�q�]��t=b.53���t����H��&�5�{�DJgQ�{EjgQ��'�Y������Y��K�����^�#k����s0J>O����Q��D�4�p��p�,�#=ǣ69�9u��H��hI�hVI]�s<ڐ���x�$u����M꒟�ч�%?�c$�K~��hr��N�!�)���K���Y�.��C�R�q�s�ƞ�!�Z`��Po��U�׊�����y���γ/�NnpV9�An�e��Z�Enp�}7W/r���.��g_p��]��t�)ǣҳC�����ԥvr�� 7кLr��s<�X�7�.r�m=�&�i��r��Bn ui��@���a.�������n�c�7�/���0C~��q�Y��8�8�Gg���P�<��X��V�q�!����*^���pC�28ސ�8�.#���28��ep�!utH]GZ^Z�;�.x� ��&R�Ɂ�\G��%�)�b���q�GX#�8jpy�]��(���M�5�[�k�E��5�K�k����\5\#�f�Fp�p�����M�5�[�k���r��%�5�ˆkW���\3\#�n�Fp�p����-�5n�"s���ҷk����\5\#�f�Fp�p�����M�5�[�k����5�K�k����\5\#�f�Fp�p�����M�5�[�k����5�K�k����\5\#�f�Fp�p��Ʒk��s��-�5n��r��%�5�ˆkW���\3\#�n�Fp�p����-�5n��r��%�5�ˆkW���\3\#�n�Fp�p����-�5n�"s��%�5�ˆkW��~�F�����u�5��k7�n�qs�+�.�\6\#�b�Fp�p�����u�5��k7�n�qs�2\#�d�Fp�p�����U�5�k�k��n��4\#�e���Qd�\#8J(����㱒�M��/qB�n����2E抻#-��w�[Qd���M)2W\�G^bw:�(���v�E�K]��"�%Κ#s�\��jp�������o��C�ڇ~4���x�3�[?�̗8��l�dp�~�+�֏bs���Ql��[?���c�p%���ӌ�y�?͋��i~).��|H���Ur�4O���y^�㧹�%��\��i�u᧹օ��Z~�K](2oϷ��㧹�~���R��Os�K᧹ԥ��\�R�i�u���Ժ��\��Os�.)6�S��-6?b��Rh�ΪF��Y��h1�E	�=�Y��(��gQ��m�t%8:�h����<Oқ�����$���
�˔�A�y�r<(0�M��u����%�m#6�z�m#&��I](0�C�B��HR
�G���1�<��|^R
�gպС�к������7+���_�1Nb���U��
���j���j���j��b�Gۈb�Gۈb�G��ϳ*8�Fl�Yus�S��ѣ\�����!V[p��(u��\���hQ���hQ����Q��.����<��9-�)�ԅsJ��8�F�����U~�;��UX3Vyp�X��ѳ\��G��rV/8z���z�G���
'6����=8z����(�/��ѳ\��G�r���=8z��=��y�G��R�RX��{p�,/��Q�!^؃�g�xa���xa���=˳օ��rU
̩�b������Q7Lg�O���"��D�%0�0?�j�Fp�p�����5���k�׈Z��p�����e�5�+�kW���\7\#�a�Fp�p����7Ga�r�����e�5�+�kW����*�|`�-@Ugn�L��8�:����5���'K47N�hn�,��8Y��q�Ls�d����B͍������p��d����b͍�՚'�57N�kn�,��8Y��q�ds�d�&s�2\#8Y��q�fs�ʷk��߮X3\#�n�Fp�p����-�5nn^�k��.�\1\#�j�Fp�p�����5���k�׸�u�\2\#�l�Fp�p����5�5��k7�n��2\c�h��?��X�v��d���ɢ͍��k�����0\#�i�Fp�p���Dv��%�5�ˆkW���\3\#�n�Fp�p����-�5n._�k��.�\1\#�j�Fp�p����Q:��]�7G�$��%n����E�K����"s���d�k?Z��V즥ܭw��η~�S��G��G͡��8�����Qd��[�*ӭX���֏����[?�̗xn��Qd����E�K����Qh���o\�'ӭX�vܭ��Sy�Bs���Qd.�[�s�(S\�<�0<��8�Ȓ�m���8<��:Erx\��n1SrxH]8�}I](,�Y��9�кp�u��C��P���CN����ԅ��ޤ.����Y�28�<�.xh]8���9�<�>ogYn���*��&�Y��(�HgQ�����E	�vI�Y��(�HgQ�����op�K2ϓ48�;�y��E�����)�����x�iy��AQy�r<(*��GqwT��C�BqGҺP�є.���>�.���t�����i��|5O;���R�t��V�.���9�.��8��yc��{�k���y��\b�:Ϫ���C�����C�����C����Q.V[p��~�U�щ�Xm��h��
�N<�yVG'S�7~�-8zv��7���p�7�ڂ��ڂ��ڂ�GyҺЉG��rʔ�8z�_R��)Sr���C����Wy������*��<8z�����Y^��G��qV/8z�_g�n������Y.^؃��C��G�r��=��{px����Y^�.�,���K�n�&^�o�b�.^؃��C��G�r��-���=8��*u��|�uD�9[l�!�w!
��2�?:ח��]`�k%�����C����5���k�����0\#�i�Fp�p����o�5�K�k����\5\#�f�Fp�p�����M�5�[�k����5�K�k����\5\#8U���ڏ����OLln�,��8Y��7~n�,��8Y��q�`s�d���ɂ͍��'67Nln�,�$nP\�� 8Y��q�`s�d���ɂ͍��'67Nln�,��8Y��E�����*�ܒ���ƍ�o���\3\#8'�Ή<�s"������y�D�9�GpN��y�D�9�GpN��y�D7W��#8'�Ή<�s"����#8'�Ή<�s"����[�npc[�    ��.n\6� �b�Ap�p�����u���77nnps[�7����M�5~��p�7��U��k��7nn�4� �e�A�Hun\2� �l�Ap�p��8�G���)���5E披77�~ǡ�\q��u�kſ�"�%vu��ѻUU��cpn�:��/q�z�G���n�(2WܭE抻�2�jӏ[)�3�A��Ϗ[�ɹ=J>
�-c���/q���}��f�2ъmv��m��mN���s�t=��v��Ҭ��-�f�ߍ{�=]����=��O���#��QxI��H��x�$I�g3��y�I�o�d��k�c4v��H�*�[$J�y���eriyֺ��օ�H�.�E��.��Hγ48�"Q�oriy��PLޛ�%��ԅK˳ԅ[�5�o�h]x�D��[$j]��[$r�rq�Y�|c��{V%0��-1�i�,mRD��Y�ว�Y�ว�Y�ว�y��=�Γ�渲<�'ip��J�E�e�����$ǃ"���xPD^��,OZ�!�Z�i�u�VR��{��PLއԅ+˓ԅb���<��|9O�����PL�Vq�C��]�ě����_�1�,��qO��
��b��=����=�����r�ڂ�V�Y��:Ϫ�x4γ*8�i�^'W�O9\Y.V[p�Q��b��=��.\Y.V[p��J��=��.��J�S�,r�re� ��VR�,�����U^n�~�����ʃ��*�����:���:�ws�?7v����=8�iuv�ว�
ɫxa�{ZI]��\���=��.���ڂ�Vr�PL��{p�,/��qO+����@�W���ว�ԅ��g����\�#�,�r�R`.�o��(.a~`�gu���q��yt�+�W7�n\7� �a�Ap�p����7Ga�r�����e��+�W7�n\7� �a�Ap�p����7�-߄�7.n\1� �j�Ap��ڍ�o7ln�4� �e��͕�p�����e��+�W7�n\7� �a�Ap�p����7W/��K��7�n\5� �f�Ap�p�����M��[��\�7.}������������7�n�0� �i�Ap�p����\�Ap�p���������7�n�0� �i�Ap�p����\�Ap�p���������7�n��v�~c��S՚ǅ���K��7�n\5� �f�Ap�p�����M��[������K��7�n\5� �f�Ap�p�����M��[����\��d��l@_oP%[�f�6�vlNį���ԩP��J�z�3@�oP%]�:�i��4���`蘺���/u�}s󛃊�m(V_b�<Ə��%e���/q>?%s���\���ܾ��ܿ�n'ܡ�4@��e��S�� �p38Ə�np�S���\d&��q�=�f�۟G';�M����եAn{54�}��)v��E�����d;ȭ��r��WZ�����pz��P_��<���E:�/�p�������t�R���@�7-��}jy�=ky�M\��P4?�<�	�E�]iz�R@?���ѧ�:a<�I�����q?,�xҧv� ײ���-��� �X�E��b�g-@�u��R`_��������I���7=2�שG�+ԓ����V_���X/�p{�yhǥjy(��C��u�I�Ca��z�R�?���\�~iy(ҏ\3	r�ۋ<��9��x?�|��9�{9�� )�O�<� r���$�Ͳ�*�nY�GsѺX� ���y��Y�I���<� r�,��IQ?eb2�(�ob�g�X� �m��'q��X� i+F�A��9Kʓ��=��ý���M�[nȉ���]Dr{��P�?E� 0/�\�^�઱�6c��@F���Z��� ����"@
d�Y� �r��H�z��E�v=0\�.��rI��g�i��pQ{~�����k ���ٳյky��]����v-�Vڮ���v����۵<[u��g+o׋k�o���ϟ\��������E�䬯3���i_�)��������p�p�p� �C�C�CXCXC�C�C8C8C�C	��ޅ� L�� ̆� ,�� ��� T%���jJwN�*�AYV���2|�,,�AYY����tem�����ե;(�KwP֗�,0��y>P��1�AYd����te���:����;(+MwP��n _�.|`���\��	p��	���	���	���	���	���	������e��d��l��b��j��f��n��a��i��e�D�|��	���	���	���	���	���	���	���!��G��.�-*s���=��mQ�����e����t���e /�x@��,��t���e /�x@�� :^��2���t�,��x@�� :^��2���t���e /H^&��s�2����k�Ĺq
P�m~�7�	0���`�-E�
��_��#E�K�g
��7mhX�6}�_�2�!E��	)�\(Hq��B@�x'�m����!5����!7� ��q��:��N�!7�{��g�|�<	�#��{�V֑{ߥ�G����N��#w�`�����BGNǐ?�����xs9k�6��uys�k�7�� R؟�Kkysyh�7�ϓ o.��C�2�<�៵<�7��<|���p���,�\>�F�����#���yxs�E�\~��7��<���e)O�䦔�p���
�g�˵�]rSN�B��0��+��Gegm��޲02�������ʍ�6 9K�@Β9/j�\�t�� 9K�<kr����Z9=0�פGf�XN��v���Z�����rU˳].���n�����rU˳�/��٪�_�%S��ݮ��w�cN˳]2���[準����������8Β9�A����<� ���9�;(sdwP��n`�9�;(sdwP���̑�A�#��2Gve�����9�;(sd7����9�;(sdwP���̑�A�#��2Gv���/����n�?@N�� W(돦��jsv���gR ��*�*��H�2�E�:e=0�W���+��<|�x�HO���Пjsv������.{�� �+ky�J:���+�_��Ƈ/�pͲ��b���Az��,.��n����Ο\�S�w�Ø�B H9�b� �0|�4|�2|"@��N��d��l��b��j��f��n��a��i��e��V
��O L�O ̆O ,�O ��O l�O �O �O ��O \�>�n����.>0>�>�>�>�>p>p>p>`�� �� �� X� X� �� �� 8� 8� ���\�O L�O ̆O ,�O ��O l�>1���>n>p>p> ��� �� �� X� X� �� �� 8� 8� ���K��O L�O ̆O ,�O ��O l�O �O �O ��O \�O�/�' �o����o� W� X� �� �� 8� 8� ���k��O L�O ̆O ,�O ��O l�O �O �O ��O \�O���ky��_��l��b��j��f��n�@J�;�9@�W� g��*#d+߂'��+_�'7y*߃'Nn���T&7�*_�'��(�W`��Q���o
��G���-�W\�������o�G�"6�s�4*�I4�2��и��8'/v���� !�2�Б��=O:;�]V_�`������6�u��~��ѡ#7�`����:rs?���+:r7e����2$Gaz�� m�<�҆���v��c�@
��si� m�<W��qL>O2��!�_�q�/��qL��P�_�����:�<���塰���lH2KOGn�<��yhCf����_�����L-�3ky(�M/W
����a�a����,8
.�ڀ��ad i?���H�1�M���t� �Ǵ�H�1�<k�~L:�Z���    ���-zCE�5����G�/қzd(�wR�ߪ��;�-�������^�<|����P�?��������|��������Y��S�<|�^��lq�|+��_�=p�s^� ���y����X� i?F�A������/� @ڏk0@�^O�A���O�I��c�~�����Ew��b����~�X� ��/� @ڏk �/ky(�l�����'.��=q)�"�H�1U�C��a����#��l��H����������$���ӿ�p�_��?���uV 7�>�4@z��w��U.�S�_Ż?@z��w�Ȉw� )��*���?�A��,9{:���� ��/��R #����_���ދ/�P #����?ky(��/����R�A�_:r�����dV�r���H�O �O ��O \�O�U��' &�' f�' �' V�' 6�' v�' �' N�' .�'�*� �� �� �� �� �� �� �� �O��ַO�.�' &�' f�' �' V�' 6�' v�' �' N�' .�'�� �� �� �� �� �� �� �� �� �����	���	���	���	���'Fp��'�u�' �' N�' .�'��_��d��l��b��j��f��n��a��i��e�D��+� �� �� X� X� �� �� 8� 8� ����Aѿ��\��	p��	���	���	���	���	���	���	���� �e��d��l��b��j��f��n��a��i��e�D��+� �� �� X� X� �� H	��t��~r7x��~rKf�~bG6� ��W����{���m���O�d�����d���%S�/�
��8)�W ~�4@��e��[��� ��PؿĆz�3��K<�b�)�_��=ƙ��%��CG
�:Rد�Б��	:N��42ϓ��:6�W�XGn��<�i�#7�K���� CGn�'�Б��	0t��~?�����K���_�2��B�A.��2=�\��\Z;�e�M�\�t�d ���Eڐ�/�p���<\���2�������<[��y6����#��'-�V�����_���"�����e�Z.�OZ���_/׭�_O\��wV'���z����ad i?����u~gm �~L:k W����u~�Y�O�γ ��4=.|����U�I�W�7=2|���#�U�׋<�S�<���6�<���K�3�ʿJy&��7�<���/)��*�*'��[��������yh?����wahy��_��M
�����1�5����'@z��5��c���1/?��b����~�X�r�:O2����{��*��G����H�1b�����_�A��#� @n��"=���������\�?���*C������*& l�˿׿�?�a,��X� ��_�V�/���U���"@��?�����#������E�V��"W����Y�/�p���g��?�A�\�gW��w�\��٪��<\�/��r���<\��"W����U�zqmU�z�r����kp40�'��w�Nc��f��n��a��i��e�D�[�������O ̆O ,�O ��O l�O �O �O ��O \�O�U�ky��_��l��b��j��f��n����-8խt�����	���	���	���	���	���	���	���	���	����\�e��d��l��b��j��f��n��a��i��e�D��+� �� �� X�}bW�}\3|`7|�0|�4|�2|"@���O L�O ̆O ,�O ��O l�O �O �O ��O \�OH���	���	���	���	���	���	���	���	���	���'��q�����%�' f�' �' V�' 6�' v�' �' N�' .�'��_��d��l��b��j��f��n��a��i��e�D��+� �� �� X� X� H	��t��~r7x��~rKf�~bG6�ye*�Z|��~��[����~Z@�ӯ����w���吚����!��'@h3�L�:� C
���P�q���'Q�Ha�'�#��K�����+0t��_��#��
��� �#���n:ʼ��:rw��Me��_:t����:r?����O��#��`�������G�o*�o�P3��拂��y�����3�m�}�k��Ǌ�}LM�����A~���15|7���/�����'��������������'��������y �����c���y�}�E~{���Ǵ<��ߴ<��?�<�Ϥ��<���+��O=q����N����8�h��8:V
�6��Y� )�O�@:VNgm ��r=/j���<γ _�g-@�Xnz\(�/C��5鑡��6=2�סG�b��*A�X�Z
����P��/-��jy(��C�����yx��KA�z�R�9}
��?rB$H�]��E��xI;�珞���h��L�� ���v�� �\Y�V���,V+@�K�h���X� igY�V���,V+@:WN���v��zg�A�Yzd(�ob���e�Z�βX� �\Y�� )��b���e�Zҹ��П�Yw�v�����O�����"�,���d�x����(����yN�sB��0
�ʼ|4�2*��Ae�z�P�7@e�r�峙�PF��PF˳8���,e�<�C-��PF�7ȡ��=�C�y8�y��C�y8���C)O�8���C)O�8���+]�ȉ�8�?r�����d�����}���� �e��d��l��b��j��f��n��a��i��e�D��2|`2|`6|`1|`5|`3|`7|�0|�4|�2|"�r>0}�DN5^޹b��j��f��n��a��i��e�D��2|`2|`6|`1|`5|`3|`7|�0|�4|�2|"�v>0>0>�>�>�>�>PU�?�����9Y鿁��e���J����;(+�wPV���AY鿃��e���J����;(+�wPV���AY鿃��e���J�����+�wPV������=������ �� �� �� ��r���	���	���	���	���	���	���	���	���	������e��d��l��b��j��f��n��a��i�@ʔ��I����I�{��?e��O?��O��� )K���̷��S� g�����B�i�Pq`Ș/3g���L��O��1sf��8ș3��~^�� CGn�'�Б��	:N���Y�0��:r���)Fa���󤥰�������o\�����?`7�?n�'�?n�'�?n�'�?n��W�g.�!7�;s���ߙ�����r��Ŀj�^Ǟ9w;ȝ������ �ױ�'6������M��A�
��7-��7�<�׬���ڋ<��<_��N�/�p'��j	�o��z:R�ߓ��K����o�Z
�G����~M��7��y�u,��Ý��r�������t<�(�����������z�� icy�3@:"K���6��y��M�q�� �~��lH��<�����F?=2ۍ~zd�F��Gf��O˳�������<t�|���7����7�iy�F�K˳��'�v�����G�;	��r��l7�iy(�O�xɗ���F>�?28�Yo7X(�O�<���9�;(sdwP���̑�A�#��2Gve����L2Gve�����9�;(sdwP���̑�A�#��2Gve��f�#��2Gvu��N�o�(��o� �� �� �[�/�[�2�-|�_?�`��� yk�,7@�eD� ������~"N �[�Z��[�/����<��,w'J�e={��_�	 ykY�SykY��w��8 o-ky*o-ky�N��"o-��UykYO\��ϟ\o�O��N����AY�����oe���j���~;(��vPV�m ��'|����AY�����oe���j���~;(��vPV������@��    O�@Y�����oe���j�l�>тS]dwn>p>p> ��'|`2|`6|`1|`5|`3|`7|�0|�4|�2|"@��O��d��l��b��j��f��n��a��i��e����2|`���\��	p��	���	���	���	���	���	���� ����	���	���	���	���	���	���	���	���	���� �e��d��l��b��j��f��n����=������r���	���	���	���	���	���	���	���	���	���� �e��d��l��b��j��f��n��a��i��e�D�\�/|`2|`6| �������!\�b?q*���2�!T�0��4�x�j� �F�e��c��2y^V;������9�L���Ωer��r�?����O��#�� t�9��'��Gs��3*r��3�p����Ұ<F�oH��Li�?�`w�`w�`w�`w�K�+r��3ߐ{�����S��mߏ3�����cv��c�9ӿj��c�? 1YO�-ӿIp�������8ӿiy�L-ϖ���L����2�_���y�8��W@>��ӱ]|#�i[����q�?�<m����-�_��8�Hyږ��"���ڶL9q������n���oGA�0P�tSϿ mȌ�oȗ��3@�Z���
�/�;�F�|��y6��z�� �����R?=2|�_�#×�=2ۥ~Z��R?-_�׵<ۥ~/��~/�pi�<�\Z��R?=q�K��ĥ�?�T� _���.���P�?���l�e/����;��hd�_�Ȝ�u��S��� ����-@N-;@N-�?�o�� �Ȉe�S��� ����-@N-�!B��Z�G�o�� ��iy��hy�V?��rj���qj���o��^���2=q���˝�Ų�o�+Z�ΩeZ�����/�˷Q���Q�sb��0
�˼|4�22n�c����e�z�X�,7@�e�f�c=0|��( r,��˼�ñ̋<�Z&7F��XF�n�'
��hy&�2Z��O 9���LN-���~�E�e�����������Q�/v(�qj�y! �Բ�H,�O ��O l�O �O �O ��O \�O�`�.�' &�' f�' �' V�' 6�' v�' �' N�' .�'��_��d��l��b��j����-������ �� ���~�' &�' f�' �' V�' 6�' v�' �' N�' .�',�� �� �� �� �� �� �� �� �� �����	�ܵD��t��_qW�\5`3`7�0�4�2%@
��� L�� ̆� ,�� ��� l�� 송 �� ��� \���/�P &�P f�P �P V�P 6�P v�P �P �o����o��b� �� �� �� �� �� �� �� �� ��R�|`2|`6|`1|`5|`3|`7|�0|�4|�2|"@.�>0>0>�>�S��p����m
�S��P���A��'�x�Z� ow�e�=@N-�k���2�_>.N-�G����2�_6�f�5�n�-�a��q tT�e��bR�e��aR�e�� w�;s������\$�p��g
Z�Q�.�O���<?z ~5�^lG0f7w�{�'�g7���?2r{��9�9c�_ �1E�Ɯ�@c���Z��E� �1I������Z����Z���)�hy�ֿiy��jy
�1/�P���  �1z�c�<\�ߴ<\�?�<��-��7-��-O�0F�õ�M/k��z����G�Aq���7G������k���7�0�:�f����bț����t�� )�����������p��#õ�C�����p���l��Z
�����Z��"�1�E
c�yh�T=q�ֿ�˵�K�õ�E�õ�]�õ�K�38�I��p���������G�1� �Ǵ��K�ŢH�dbQ�e-���E��cĢH�"5@:�I�Y��c�.�zd��_,� ��_,j�t#5@z]� o�ky��_,j�tsiy�Կ�˥�CO\���X� �<F�178)�"� H;2K�3�-�L��I��p�\�vp��y�u�y �y r旯��e�<�f�~@�܀�<� ��yX r���rf=��W� ��/�p�y��<�eM���o��C��	@���D|�0ky�f?� $/�	@n��"7`֋�o��z�r���'��h`���L�c ��2���>�>�>p>p>p> ��'|`2|`6|`1|`5|`3|`7|�0|�4|�2|"@
��O L�O ̆O ,�O ��O l�O ��>т�>n>p> ��'|`2|`6|`1|`5|`3|`7|�0|�4|�2|"@
��O L�O ̆O ,�O ��O l�O �O �O ��O \�O�7�	� �� ��}bW�}\5|`3|`7|�0|�4|�2|"�u>0>0>�>�>�>�>p>p>p>q��� �� �� X� X� �� �� 8� 8�}���}"�t>0>0>�>�>�>�>p>p>p> ��� �� �� X� X� �� �� 8� 8� ������O L�O ̆O ,�O �Lqv���e���z?� �� �����~�_�������,{�3@Jagۡc��e���`�X����`�X�BG�9���fx�����8�l���%yZ6������y�џ Cn����	�<����F�iF�>�A���d5������?�� @~�g����OF ?������/����A��x���/����E�����M�3�����?ky?���  ?�����?iy�࿾�Ï�y���"?��<��Z���g��_/k�������z��aP\�������7�c̪����4ο ���7����y����q�� )��γ �.�g#@��z`8�Ozd��_�#C�zd8��^�c̢�)��+y������)7��J������A
�/%�Ғ�j�� mdv5qo�62׋<t�Y^����P�?������?yǹ2��@Fs���ޠn��1�y�����;�yX r�ߋ8t�)u����Ұ�E�N1�y��}̪G�b�����N1ŢH��bQ�
�y�uY,j�\���ؿ�E�N1/-���z�R��3� ���E��1E��1E��2_��~R�[�~�V믹d�	�l�	@n����Տ
�o�[��� ��9@n[z�: ����� r�=��Wu �V?Z
���: r�-�?KU ��ѳ�q�<���En��"chy(�"� �mK�<��,U9���G/.����@Z3�O�����?�1����3� �c�gD�\�/�`2�`6�`1�`5�`3�`7��0��4��2�$�y~0~0~�~�~�~�~p~p~p~�?�?����W��\��p��������������L�+?�?�?X?X?�?�?8?8?�?	��~�' ��' ��' ��' ��' ��' ��' ��' ��' ׷�������.}�	�l�	�b�	�j�	�f�	�n�	�a�	�i�	�e�I�\�/�`2�`6�`1�`5�`3�`7��0��4��2�$�z~0~0~�~�~�~��In|�	���'���'r������������������������������ ��_�	�d�	�l�	�b�	�j�	�f�	�n�	�a�	�i�	�e�I��+?�?�?HI2��8xN,�eG&��~�v�w(��O�a�|�� �)}I�k����2g���$N�C�yN,�U�Y0t�� C��0t�� CG
�������Ĳ���X�X
�8����q%W6��q�͟ CGn��<�XGn��<��Xǭ�_�:    R��dp�@��L������/�w/$R$�<�A>��s,_| #E����k��̋<| �"�hy(��I˓�@F˓�@F�C�KZ��2��d����?����Ƚ��2/������b�Q�<�d�<�d�<���e��@FO\������h`οmc
H'2Uzh��?��o�k���oȽ~΋ ��9�F���y�g#@��s�� �׏���G�b�Z��P�_���ۥ�ؿ-���ky*�/iy����P�߻��r.���b�Q�ĥ�t=q)���C�^?Z��'2Z���Z����=d���Ls|"#_�2����g-@��� ���E�/���P�_ĢH'2bQ�a� mc��H'2U����Ѻ���)5@:�� _"�"�.ky(��bQ����6��؟2Zw�Nd������҉�x ҉��; �F�<\Tv��;p�����
0;���P��P ��P ��D�k�e���Z�����<�r���c r���Er��@��q@����l��Z����E��׳g��׳g���򔋭L�S�Z)O�j��<e�����_�S�Z)O�j���*\�?��-��_Oб�q�ɱ� G2��
���38��s2��m�y2t��ce +�XY�ٱ2���t��ce +�X@�� :Vб2���X+�X@�� :Vб2���t��ce 緟��m-�%'��wN���`6�`1�`5�`3�`7��0��4��2�$@N�~0~0~�~�~�~�~p~p~p~��������<[���gK���zK�����ϟ/<|��`p��O�M�O .�O�t�' ��' ��' ��' ��' ��' ��' ��' ��' ��'n��Z�-���` f�O �O V�O 6�O v�O �O N�O .�O�����������t��'G\����W��\3�`7��0��4��2���u~0~0~�~�~�~�~p~p~p~�����t�' ��' ��' ��' ��' ��' ��' ��' 9�L�U��O8��;��䀚9�Ln��\�X��p�0t̜X&O0k��2y4Q3'���y�����K2�бdK1�Б��	0t�.���':r��ǁ��.I�Ȼ�珆�� CG��'�Б��	0t�.)��g.~4��_��-��9�F�<, ���0�_@�d�K��|��^0��g����v�H����п4-��ejy(����y��y��^��kdΫ?@
���ӖB���<����п-��#iy(�U�C��/��52/����eM��z�r���[�C��o�b�3@����Nd��7�-�����6f=/V�t"3γ mc^����1�y6H�z`(�����k�#C�zd(�o���b�V�<���"mc^/��6fy��6����b�qiy(�EO\��G������O��-���iy(���E����o۩�渓����� �ȴ�H[2bQ�w2��҉�X� iS,j���)5@���6�u�� i���|��G�b�&5@��� �ȈE��1ŢHۘbQ�����6��"mcV=q9߿����bQ�mL��F�Z��_Z��[�*xk���<%�q'9�Q#� �1�O ҉��:�t�,����]F�����yX �վ���ED ��D����}���u $+Q@�c�������=��?���tu �}�<��/��ǈ� �����W���CqLz����/���������?�'����_8�#�ȉe����3 '��������O Җ�� 9�_�	@N,��p�����X���t�' 9�L�����O rb�y� �e=m9�_�I�[����#�' 9�L˳��ky8�_�	@N,��p�����X�'.���OZp�ly��f���Se˿��l�P�-����_@U���ʖU��/�*[�Te�;�x�L˳8�L˳8�L�Cq����l�P�-����_@U���ʖU��v
��� Te˿��l�P�-����_@Z3�O����?��8��` rb�yF�7�	?ȉe�'N,��i�o�~��K-O��2-��'� '���Ée/�pb����~�' ��' ��' ��' ��' ��' ��' ��' ��' ��'�������| #�E@�o����o�׾�\7��0��4��2�'�z�0�0���������p�p�p�`������X�X�����8�8���	�b�%��s��Y&7�;��K�B� )I�� �� �����
���_�Б3���`�������88��1)&�88����qd�͟ CGn�'�Б��	0t�6ϣ��:r���i��t�̲K�șe��R�3:r�?����O��#��`������=Չ�����D�<, �Dfi�Od��f��������|����򉌖�o�kZ�������~�E>�y��Od^��)ϸ�D��򉌜��o���<�o��R�q񉌔g��~I�3�f��"�ȼ��'2/����e=�f�!'��6������>�x  �#�x �H�����~�����;/V�|$s�� i�:�� ���γ _��������lW��ٮ��#õ�K�õ��E���E���E��/Z��j?-�v����k������~z�nW�iy����<[���<|#֋<���^���?88��?k��d�{��Z�z�� iKF,j��N&5@�^� �c�E��dĢH�"5@�Ǽγ6@���zd��葡ؿ�E��dĢHG2bQ�}L���οX� �HF,j���y��CG2EO\���z�r��X� �HFDo �HF�õ�K��۷��������~n~p~�V��de"<�wb�����]���*��A�����gs�wb��Z� �;1�<�W� �8&iy�ֿ�iF�?�� ߉���Z� �;1^��;1^��$�y�N-��'-����B���8g9��HN�P�F����_�ʒ�9�%���ebc�2���u�0�0���������p�p�p�`������X�X�����8�8���	0_�� L�~҂�d�ʷ����� l�� 솟 �� ��� \���w�	?�?�?X?X?�?�?8?8?�?	�^�� L�� ̆� ,�� ��� l�� 솟 �� ��~2�[�~���?\2�`6�`1�`5�`3�`7��0��4��2�$@��O�	�d�	�l�	�b�	�j�	�f�	�n�	�a�	�i�	�e�I��2�`2�`6�`1�`5� =�Ud�;On|;���<���<R䯜��'�ٓ��� t�d :{2 �=�Ξ@gO��'�r�d :{2 �=�Ξ@gO��'�ٓ��� t�d :{27�.gO��'�ٓHi2b{9H	L�Qf��Z&��ũerok]� k�� [�� o�]��_��#��K쾇��S�ۦc�ԲǤ�c�ԲrC��0t��_��#��
��� �#���tb�����y�2XGn��<��t�F��ѡ#7�`�ȍ�:r�?����O��#��g?�b̡9ޓ���)�� �-��P�y����KN/��s�3�b��|;�Az��y���^����y��<�צ�|���ؿ%-����W?@
e����O��<���"�2�E>]~���U�C��Z��/iy(��U/��_O\n�w��a�|����hS< ґ�p<�|$s�� i�:�� )����X��y6�}��<ґL=�F�4.]W�_zd(��U��u葡࿮yh��hy(�o]�C�[Z
�{��P�߻����/-_�W�ĥ�t=q)���Y	R��_���%Z��_Z
��'�����?o�h��d�{#_�Wϳ�̒�A�%��2Kve��.�%��2Kve���,��Y�;(�dwPf��̒�A�%��2K    ��z]2Kve���,��Y�;(�dwPf��̒�A�%����OJp��O��|���K�� ̆� �#�� �#�� ɨ���H�<, �H��;���� ����#��G2z3�hy8�_D �HF˓�HFϞ�͟�=�wu �#�y�H�E>���>���p¿�: 򑌖���_/��G2z��H��KҢ9�=d�_�.k��d�K+@����� �G2�0���������p�p�p� g������X�X�����8�8���	�_�� L�� ̆� ,�~҂��~�}�	�n�	�a�	�i�	�e�I��+?�?�?X?X?�?�?8?8?�?	�o�~0~0~�~�~�~�~p~p~p~ W��?y���\��p��������������������L�+?�?�?X?X?�?�?8?8?�?	�o�~0~0~�~�~�~�~��*29������'8��?Cp�ry��< ��< �=�Ξ@gO��'�ٓ���X�=�Ξ@gO��'�ٓ��� t�d :{2 �=�ΞL��ٓ��� t�d :{2 �=��&#v�s��&#eȩeꌾ�ʩero+�e�w���e�-�d�a��+0t���M�Бb�j�tl�Z���ul�Z��`�؆B�i��q`�ȝ�:r���Cg����\������yv��ȝ����CG��'�Б;�	0t�N��� �#�d����۱���~���?�� =��Ƴ��<��v��Y/N�ozF��~Ϸ���z���M˳���������o�kZ��v?-�<�篝W?@��v�ߋ<���/�P(3�<��~Z�ݯjy�v����^Z�ݯ�eͷ�=q)�&��M�Ͽ�c�@22�x7�/��9�f���y�3@:����
��dγ �c^����d�y6�q�r`2W�_rd2W�W92����zd�z����j�����������[Z��/Z�ޯky�z��"�=q�z��'._ﷴ<�g-_�״<|����P�/>y�1��8OFs|$#�3_�Wϳ ɜg-@�%��Ef��̒�A�%��2Kve���,��Y�;(�dwPf��̒��*�dwPf��̒�A�%��2Kve���,��Y�;(�dwPf�n`�Y�;�������\�6p�0��0��0�ܸD�d�ޯ�8o����%��z?����Ξ��L�' �q���z?-'��� 7.y����ٳ]�g_�' ����<��~Z��O�' �q��g��O˳]�����^�v�����#O����6�|����8OFs�'s^Z yO�<w ��y� l�� �� �� ��� \�����y &�y f�y �y V�y 6�y v�y �y N�y .�yn�\��< ��< ��< ��< ��< ��< ��< U��k����S����	�(K�wP�.�,]�AY����tye��������;(K�7�S��� ���;(K�wP�.�,]�AY����tye���������)��y ������;(K�w�~���}�	���'���' ��' ��'��~�O &�O f�O �O V�O 6�O v�O �O N�O .�O����� L�� ̆� ,�� ��� l�� 솟 �� ��� \�����O ��_�ɀ���Ӄ+���~;�f8�n8�a8�i8�e8O���/�`2�`6�`1�`5�`3�`7��0��4��2�'@
��� L�� ̆� ,�� ��� l�� �� �� ��� �&���o���%eȹe�ؿ,�-��`��F�G��������R��Б��%�ߡ#�U*���ܲǤh�c�8�,�`2�`6�`1�`5� ���x����[�=OP�X����gבs�������O��#��`�ȭ�:r����ͦ#_�w���N��2͑�e���?�� �2]��	fe����MO�̡L� �2Z��K��de�<�C�y8�y��C�y8���e�6�B���m�PF�S8���e�<�C-O�P�Ee^����"�2zY�CO\
��X���|��%�	����,����~��a80@�e��$3��m���u� �2����?��� )��� �2�<�Ҹt=0��K�E��ꑡ�v=2���"�2�E�����--E��hy(��]�C�_Z
�G������ĥ�?�� �2�En^�"����p���(n�w�`p��|��/�w�|�6Q��/�y rG��;ʝ� w�{Q�;�i9�_�~�deb��r���;��!����~w�;�iy8�_�~��Q�E�2��rG9-�]�~�deK��9�E�p
�)�w�����s�E�	�;ʽ���^���&���xn�]׷�K�� ̆� ,�� ��e�;�(򧪤���� �������g����r ���� W/ky(�"����Z�ę�z�p�?���� ���y�z�E:^O��� ��e-��_Z���eqQ�OUI;�u�{��ʜ�c�2�����7���K+@��/�Z rG�����X�X�����8�8���	��������X�X�����8�8���	�s��� L�� ̆� ,����ӂk���;�a8�i8�e8O���_8�d8�l8�b8�j8�f8�n8�a8�i8�e8O�\�/�`2�`6�`1�`5�`3�`7��0��4��2�'@��/�`������s�~i�d��6�O ����� ��� \���9��O &�O f�O �O V�O 6�O v�O �O N�O .�On�S��`2�`6�`1�`5�`3�`7��0��V���%UO��o���<�TO���=evP���A�SfeO��=evP���A�SfeO���_9@�SfeO��=evP���A�SfeO��=evP���A�Sf9�_8@�SfeO��=evP���A�Sf9�L��w
��8^.N�.�߶:�
s�2�o���/�Y��rr�WN.{@ey�ٟ Cn�'@�3�L�<42�3���p���1Fey�����4�f��ѡ#7�`����:r�?����O��#7�{���:��<Oyv���䐑�����4G��th���?���������g���X��� ?�_����~�ky?��<�ת�����~�ky?��~��z�~���Ï�y��ߵ<��Z�ɏ-��ǿ����K�3����ǿ�����^�ٺc��Z4g���Q����Ma� �̺�e���u� ʔ������ �\�	�e�y�聡�^rdE��ʑ��.Gfp��%���)���Y�3�������{y��̬��Cf�^�C�"'��t9q���Z���eZ��g��p����ٮ�S�F#q�����Ѧ�x�H/eU��
��;@n��ҙ�X� �=�V�������1����c��7@n�y�� �=�B
�)Ew�ӿX� �=����ֿ��;�����cjy(��b����/�p{L=�)������ZN��(@n����N�K˳��B�A��0p��x�u�x �x N�x �ercp��q��Z��� �X��#���� �X��S�E��o,{���c���7����7���á�г�S�E��o,��pʿ�x r{L-���� �X�"=��y��2��8��;�HF���ejokNb�����!8ڔ{- �|�<w ���y� �� ��� \���9��y &�y f�y �y V�y 6�y v�y �y N�y .�y��< ��< ��< ��< ��< ��< ��< ��< ��< ׷�u^׷�K��.���������p�p�p�`������X�X�����8�8���	����� L�� ̆� ,�� ��� l�� ��~2��~n~�	�e�I�[�    �yF L�� ̆� ,�� ��� l�� 솟 �� ��� \�����ky��-ϖ�^0 ��' ��' ��' ��' ��' ��' ��'n9�Z�-�_/�-�_O�=���K��2�����j*�s���ʦ2;(��l���/<��/3���; eS��MevP6��A�TfeS��MevP6���-��<kʦ2;(���l*�����ʦ2;(���l*�����ʦ2����;9�L��O
��8^.�V��-
��8e�������<I��SJ��rr�c�������_�/r����D��n���12��O�12��O�12��O�12��O�12���y����eU�Hϙ�'�2.��������8�?4@��Ͽ ?��9�lj�c9���gr��"��Z�-���l����c����b-��ky8��'� ��z�n���<�����eZ�-���l����c����b-���e���z�fN.{���`PN�8��,8��T>b�]z��K���o�	��
��ϳ 'd�g#@za.g�rB�֛/�������l�	zd8�_Z���g��<�/-�E�����p�^��=q9��z�r�?�<�g-�M������4�0S/2�B����DFs��!�D��U�j-���
@��L������+�*�%b���_�~�|_�yz��J�� �W���c����c���}�Z�-���p�/V?@��T�ñ�X� �ʖ��c��g8��]O\�����[�/��}�Z����g���k��¡Jp�ۡ��o�����8�H��<~ �j}/
��>g�j���_�1 �ͯ@��q@n'�����8 _��"_��g��j���"�.��|5���]�w� �1�<7�Wc(yn���P�� �1׋<|5�Z\7�Wc��{��NV˓��2�k�������������5ǹe�5�s�Γ �-�'�aX�iX�eXT�\�/,
`2,
`6,
`1,
`5,
`3,
`7,
�0,
�4,
�2,*�r00����ppp9$�¢Zp�7���o�W�X�����8�8���
�"eQ �aQ �aQ �aQ �aQ �aQ �aQ �aQ �aQ �aQR�,
`2,
`6,
`1,
`5,
`3,
`7,
�0,
�t,
�j�����q��-�T#����vP6b�Aوae#���vP6b�Aوae#��aQ e#���vP6b�Aوae#���vP6b�Aوae#�\�aQ e#���vP6b�Aوae#���v��0���o[�z/�?;]�{Y�x/g���s�� :�e ��2��{@���^�y/09�e ��2��{@���^�y/輗t�� :�e ��� ��^�y/輗t�� :�e ��2��{@���e-�e�ae�+0>���sp�RN�� ��S#7H�e�S�|_�c�������~��|_i=��h�����%�e���(q�?�PW���y��ٟ c�����Tfӑ��=�6����lӑ����G����O��q t\:r�?�������)�r�#+[������;����;̗y�yh�w������������t�a�������t�a��t�a�������t�a~����ϗ��f=m;�0ky�0ky�0ky�0ky�0ky(�]�3x�Y�3x�Y/k��g���׋<�K���_�28�(���'a� )�Y���;ʝ+@�u�� ���y6�rg�rG������b�Zγ w��#C�]Z���&(	rG9-��miy(���Eڕi/�pG�y������B������G�	rG9)O��6)O��N)O���'���!�9Ja:k�;�����]��|��|�/^P ���	�;(�wP&0�L`�A����2�ye����2�ye����	�;(�wP&0�L`�A����2�ye�����2�ye��o�)��o�׾�\7��0��4� �1�<,R�OV;��d��)�/"<��Ξ�;������� '0����^��r/���z�P�OV;��<�w� �f-��C�' �����q�<�Q�E�(���Ta�����<���_��g����2���ye�-����[2�p�p�p� w��0�0���������p�p�p� G��x &�x f�x �x V�x 6�x v�x �x N�x ����n�"a<�TM��ɚ��5�;(k�wP֔)�AYS����|eM9���(k�wP֔)�AYS����|eM�ʚ��5�;(k�7�{��(k�wP֔)�AYS����|eM��o���o����'8��/�`2�`6�`1�`5�`3�`7��0��4��2�'@��/�`2�`6�`1�`5�`3�`7��0��4��2�'@
��� L�� ̆� ,�� ��� l��ӃSו���6p�0��0� �e�d�l�b�j�f�n�a�i�eO���_�d�l���;�$Yu Y�߽̳B!�e���W�c6��T��uSI�"��x�x������x�@<D���#��#����%�����f�Z ���]z�������9Mή�UT�<'8p>��w��7��pƛs������9���9ϗ"��9u��g9�π3��v�K{ *�# g9����c�#��=��,q䜿�;�%������zƑs�8�8l��G��3�����G< ��͡��;Q�?'��
�c��QȘ�'k2��Z+�B�����(d.{e����6uNT���2�Kx�&s���??><��w������A�><���|�ZA���6mOT���2�%<X�i/�A!���᜿Ӈ���͇����p���/k��7����><,���)��b�� 2s���e{�89�o��@T2u�
D%���(���g�@T2un��d��7J��s����l�J��3�9Ç��U|x�����᜿�ÃҿU���|x8�o�����O\���|�r�_	*����9���uV����'�����Ë�}l�q8�}�>���̓s���@��\��n�\��?s�Ļes�Ļes�D�������g���n��S�9͟B��3W�@�����^���Vs�Ļes�D����BeÇ����g8��]>q9��\���i�e�x�l
�PY��A�o�S'w����[<�j �g �W �ܷ�?-�o�.%����m�|��<� 
�j��ܷ�O ��My"���}x8�ϔ'�oه�?6$� �-��a��)Or߲υҿ��D �-��\��oS�D��)Or߲υڿ���✿f�✿�~�ǭ](���������$���rIf�:�2�."��#�
�#��x����x&�n#�G �%���G��G��G`�#��#��8�L�~�<�,�x�@<�@<�@<�o�\���G\�-q#�9�ψG��G`	�#��x�x������x�@<D���#��#��X�<���l�xށx�@<G �	��߈G��G`	�#��x��=��xĵ��w����x&��߉G��G`	�#��x�x������x�@<D���#��#��X�<���l�xށx�@<G �	��w�x�X~��M�}ya����w������x�@<_���w�x�X���x��x^�x�@<�@<{ �#�Q�;�<�,�x�@<�@<�@<[ �w �=���g�(�W&��%�Z-�K�.�7T����c��$g��Z������`+w ���x����+��8r���Çq䈿�K���u��g9�π3��v�}G��3��#g�pƑ3��o;�8�����#����G��k�?s�_���i��xsğg�9�π3�ˈ�=8���؟7�����    ���d�����oγ@~A�{�K2��$�@���)�v����ϗ�pI�%<�c>/�ᒌO㒌��?><l�?���@.���e��Ǉ���Շ�qI�%<\�y	.��.��������v��_�l�o>qo.�����Gg�����8��߀Q�F��%����%��X'�7�m���&3��(�]2�pd���7*�:|�;�d����KƟ��.���)/�a��7�T����v���v�����>q�d|�vɼ��]2/��0���KƆ�f���}rx�������ϱK�>�ߜ��ћ����@��\��%c�~�X�1W�@��\��ts�Ě������g���%S�)�t��O!*��\��%c�~����Kx�2s�D����'������N��>�9���[�#���nSVĚ�)PBe�%<��x���o�L�����W��G`	�#��h7.��ݸ��v��
ڍK+h7.��ݸ����OS���V�n\ZA�qi�ƥ��V�n\ZA�qi�ƥ���b����.��]2><�d��u�K�'��.���߭������q��$���&ظ$�O�\�٧���G`�#��#�
�#��x����x&x�<�,�x�@<�@<�@<[ �w �=���g���G��G`	�#��x��5��xĵ��w����x&8>�x�x�@<k �g �W �-��;���G������G��G`	�#��x�x������x�@<<>�x�x���'W�G�ۂ�rv�
�@<���x�@<,�@<�@<K �5��3��+���G��G`�#p�`��x�X���x��x^�x�@<�@<{ �#���?�6��xĹ-�+g�`���G�݂��-��;���G��3A��N<�@<K �5��3��+���G��G`�#p� J'�G �%���G��G��G`�#��#�Kf�L�K�.�w�����c��$g��:J���sg�pzy����5g�=V��8r���E�T9I�؂�#'�����#g�pƱ���'8���q�?�8r���-�G���<��x�ƛ#���xs�ߵ?D��5���^F����e�����?�xs�����͍���'�Oe��'����@2��	Ě�����\:8P���^���m���lx��O��ʿ�6<�����v��%<���KxP�|^��O.�/�	��n�������W���������ݿ�����Kx8�%<(d������O\�}����G�L��������F +{�(�����Q����*�L�g�@T2c��Q��}�'�ҿ6o��u����?����g�g���Ã�NO� *��%<�d�KxPɔ�𠒹|xP���Ã��.>qY�_>qQ�Ϸ.D%S|xNV2><��{	�S��w����8�(�����@�[>��@��P�+�/ ���?�lE���\�����ȯ`��[ T6��=A��W
Q�?�}���
�����/�_����Fs�Ļes��W�_�ï`���_���������W�}x��o�j�l���A�����^��S'�~�G��[<�z �#�Q�;��J��E ?Tb���熤? ���r��P��y����o���P�Kx��v�|xP�?7$����=��7�@~ۇ�3�@~��%<�
�Kx������C%.<�J�*q�Ļ����C%.<_���Y5�r���P���������%�}���>u�@<<>�x�x�@<k �g �W �-��;���G��3��	�#��#��X�<���l�xށx�@<G �	�O ��o�\�+��#����3��+���G��G`�#p� �~'�G �%���G��G��G`�#��#��8�L����#���G`�#��#�
�#��x�����s9~�o����W���x��x^�x�@<�@<{ �#�Q�;�<�,�x�@<�@<�@<[ �w �=���g�(��x�x�@<k �g �W �-����x���o���3��	�#��#��X�<���l�xށx�@<G �/x��w�x�X���x��x^�x�@<�@<{ �#�9�߈G��G`	�#��x���%�
]&�����ہ��}L����Z�����:��缃3�xO���#g�=W�;���	�q䌿�ˎ�8r�_���G��3��h;����3���g�G��;m9����cqb��c�xs����o�����zƛ#�8�]m���e��T�G �x��^��N����W��c���2�-���'���̓���d�������Y��}x�~��7���߇g����Y��}x�����Y���W�@����E�����߇g����Y��}x��_}x�~���߇����_�K��Oܥ��%<,����Y�}p&���0w��d����1��Y *���X���g�@T2c���I�}���i>�(��x	8*��o�(����L�=Ƈ�����Q�\><(���Ãҿ���z	*��T2�'.���'.��9���d��`%�Ã�wV���<��=�e�؈����v��0Q���/XP���ȯ`�ϟ@~�F���/��ȯ`�ϟ@~{�����Oo��
�=��?�}W��|x��o�~��
�J��\��n�\��l����]A\2�fxA�~�� ����+�><l�7�@~ۇ��O�\�-q�o��l�xށxr������PP�cC�
r�?F�Ք'9���@v���D G0���?My"�3�_��>{*�}���ߔ'9����3�@�`��A���D 7�������1/jlHZA�`��a����ə��8�(��d�W�@n\ڧ�@.��SG`�#��#��8�L�}�<�,�x�@<�@<�@<[ �w �=���g��'��#���G`�#��#�
�#��x���皜��r|�?@qG �%���G��G��G`�#��#��8�Lu���#���G`�#��#�
�#��x����x�`E���#��#��X�<���l��sO��-q��xč@<D���#��#��X�<���l�xށx�@<G �	��w�x�X���x��x^�x�@<�@<{ �#���o�#��#��X�<��M��-q��x�݁x�@<G �	��w�x�X���x��x^�x�@<�@<{ �#�Q�;�<�,�x�@<�@<�@<[ �w �=���g�(��x�x�۱�]E����'�Ir�9����v�`�s���oy��?N/sƟg9��J3����|�p3����|�q3���W��c��8�}ۆ����?�xsğg��{P�Ɖy��X~5G�=��,�房�;�%��w����#G�pƱێ�%�ˈ�=8���ۃ3�����[?�w�����￿r����	d���A����9������Y��_��~���p��Kx��o�s~��o�s�߿��K��Ϲ���U&���6mOT�װ�9�~�����%<&�����,��><K�������ϥ��&������,s�>�]�}p�q㒽�+{�8Q�c��'���u�
d%��F��d�>����pD%s�x��������}�8Q��͟��g	*��Ã���|xP�_݇����J�v���oÇ����O\��O\T��ED%s���_*��A�߻���������lq�`��O��W��y��w(�2s�Ļes�d���"J�b�~�x�l�~�h�1W�@�l��[ �-W
Q���w9��%<x�l�~�h�1W�@��\�d�����M�\���    ���v��3����'.J��\��nٔ������@e�%<�x�U����SB��[<�J �5��3�@�`؟��`�N�ؐ��܅�r���w�Q�WS��Q���<�NLv�|x�]��g
lHZA��}	G0���#|x��o�����3�Y���n��j��rq��ǆ������[5:�a����.�].��,�\�٧�@.��SG`�#��#�
�#��x����x&x|�<�,�x�@<�@<�@<[ �w �=���g���G��G`	�#��x�x��597�w�������x&��߉G��G`	�#��x�x������x�@<D���#��#��X�<���l�xށx�@<G �	��w�x�X����sO��-q�o�k�xށx�@<G �	��w�x�X���x��x^�x�@<�@<{ �#�Q�;�<�,�x�@<�@<�@<[ �w �=���g�(��x���&W~�G\�-qg �W �-��;���G��3A��N<�@<K �5��3��+���G��G`�#p�������#���G`�#��#�
�#��x����c�+����y�O���ls@C�?�k�:���m���g��`�G���Jߖ8���x'��¡1���|)�o��+�C��.��1�ˈ�=8㽌�ۃ3��g�o����h�a��(���6+��Â��������N�c�]�g{�
�.��c�=�� ���\ ��}��]���c��?|�Q����~�o��Q �|>�܈����\��|�o����>y��l��-��u�[��q�xO��Y��ӿ�G c�����>�l�//?�2ݟ6��}�d��8����J�����7pލ8�o�2q|��oo���O�@~qq�l�۟@�%��@���(˘�%<X�4�8A��&�Ʋ��e+���S�ڿ�/V�����N�%���;����F���ߓ��L~<���������������k.��/-��T��F��T��c�Z��F�\-�g��3O	9������%����������K�������:�}��?�,�������7j��� �� �� ��A���؂x	.�	.p	>A��.�A�,A��A����+��b�f��$��;Hp�=Hp�#H�	�O��� �� �� ��A���؂x	.�n�YA�Ef����x	.�	.Ѝ_�Z�]mc�
^A�lA���؃8�� j��� ��]e+hw���$��+Hp�-Hp�w��{��G���{����	�&g�W�	.�\�$�@�s�F��A�A�Op���>'A�,A��A�<�x	.�	.�\`\ _���X� 7�w�8rs������RƖQ77�p>oq���}���8���7��#w�?.�k	#��<��ĉy�;\�77�?�<.ƛ����_�xs��g���߀3���o�on�7��7����h��߇Q _�4��ǂ�/e����ꏑ���ooV�O�/��'�Ӄ|b�'�@v0�#?��N�z9F<1�}�|��a۟͞��<W	y�v����q��������@.1��-�K����%�}�r��J����M���������[�G��}ND��#̺����K\&���x��LNL���MN���?Z ��>�Ჺ��e&'�e&'�e&'�eݟN�+���@�2�9a��������N�Y&�Y&���>'���O(�]���&�]���Ȯ��c�D�}NL�]������?F��7�7�\�9F�.�\�\���@~�ԫ��������Z ��	>A��7�(��Q�m�YA�,���Yfm��
�f���t؃t8�t� ���� �	,P:_��,xY&�
�L`�L�d��d��d����d��#�2�%�2�5�2�g�e� �� �.�'��L`�	��e�	L\&0q���e�	L\&0q���e�Mp$.��L`�6��e�	L\&0q���e�	L\��'q���e�	L\&0q���e�	�<Y��3P�c�����}��ެ��xM�.1�K߿?�����R}���YE� 2������"<oT�X�=��*�# g��]b>���x����6�đ}���v�c�]Ɔ��?�#�2�%���g���h�8��F�_�?��7����{�ꏱ�s� �0�/��Y�r��$�g�՗c��OG�܎�տ�Xgڢ�?̅ �ee�r<�>��`V��Z z2�>���T�Q�ϩD�Y�#����1����������T�s�Ꮡ[�������T?�g%����r�'�LN䆌}�rC��G䆌}�'ظ!cK��2��2��yߗc�˺?3|�_�7�l/9F������β���Y&�&���e�@���@���2(���m	d��>'�Y���,��	�l�ݟ��\�r��\���o��ۖ@n.���?ތ� ��=7�1���<	d��>o� ��A�	�A�	A�M���3Y&��L`	�L`�L�d��+�2�-�2�w�e��,�
�M�]���.�&.��L`�2���&.��L`�2���&.����L`�2���.�'��L`�2���&.��L`�	��e�	L\&0q���e�	L\&0q���emr��&X�	L\&0q���e�	L\&0q���e�	L\6�3q���e�	d��[����u��_�
�s�- �oO�ļ\2g@�j6�>.��,�����>�>A�d^[p��b���_�8^5 g�3 g�+ g/��\G��㹔��g�Y��q�m��0r��gbr��A��Y߮ 71�S͑��9�o�����1Bfυ�Ḑ̌�W�;2�1��oÇ����?F���ا�@���ك��\�3mQ��}p����'��_�)!k�cn�X/+��� g��}�b���_���*�Q�_���+/��&>���O	�x.;^�k��Kx�`���Sy#Q�@vdz���/&'Be&'Be&'��X�x���������1Be&'Be&'����/	V*+���@<���P���
<gY��d��d�@�s�{���1��1Wо�\A�s�{���1Wо�\A�s�{���1W��2�Y�(t��
�c�>o� �� ��A�	��,؂,xY&�Y&pY6��	�L�d��d��d�@ד�B樶'cmO�
&.��L`�	���&.��L`�2���&.��L`�2���.�V�Ǖ�L`�2���&.��L`�2���&.��L`�	��e�	L\&0q���emr��&.��L`�2���&x'.��L`�2���&.��L`�2���&.�qv�����[��߀�f�]����v�y�d��߀�W����+�!�ߜ����� �oN����k�/8��ܶ�����-8������_��<j � �3 g��3����#J��\jY������Qy�tǂ���˿r���gP ��>W�W��g���X�<mN����#gd��(���1rF��Al����p�_���-�Ç��]�1r����@~�gJsU�ɡ�oq�����_�)!�c�	r�_٧�@���p����5*���#v�woT���#v�wp~��SB �c�#v��><����[B����+��rǿ�r��<9�dbbǿI��^�?1яQ�a��%����$�@N/����ݟ��/���@N/y9F�*3�j�-H�s�w ^��v�7w���� +���)��g�@v��ǲr�Sf%d��>�r7��1�Sf�eQ�W/��7wV�����sg�N�;e�W����=�3 �yf����<
���� �y+py;AT�.oA�
,A�
�A�
<��xy+�y+��V`�V��v���;˦E9��d��d��d��3�2�W�e[�e� K   �� �� �&8>A�	<�,X�,X�,xY&0pٔ�H\&0q���e�}��I\&0q���e�	L\&0q���e�	L\&0q���emr��&.��L`�2���&.��L`�2���&X�	L\&0q���e�	�,�GR��+���>�>A�b�[� g1��u��������7�5A��|�"�% gQ���
�G��X�]��<��8V��=�X� T{ *�v�y���	�G��?�>�.�OG�*_<�=+��B�OpT���#�e�9!�Se_���?D�U�e�e�1��oÇ��]_�����@Nb���=��C�+�s	�ê�ф@<��}JL���p�s٧�@�݇[ ����Q�_��1r���7��V^��Ce}�Q��e�9T�#��~���7p��NT&�32���-�&'r�yo�\b��h�T�>��ļ�#��?��%�}N���1v.1�3ӹļ�����1r�ه����Y6o��{��o؃,�}�91�eؿ�[����V ���sB d�#���sB \V���2���9��%<��r��o����/oW��dܓ�����V��e��xY&�
�L`�L�d��d��d�9��d��#�2�%�2�5�2�g�e� ���YvM��L`�L`�	��e�	L\&0q���e�	L\&0q���e�M�&.��\�2���&.��L`�2���&.��l�g�2���&.��L`�2���.k�K\&0q���e��	L\&0q���e�	L\&0q���e�	L\6���L 2����'���>�>A�ʖ-xL����=������Z N�7����E�z *�X�|�K���g]�đ��{�'-q����_�8�S�q��8�x�%�%��ԟg9���4����(���r����]AN��	�i��#��:�9!}L����� ���c�>�8���#����2+��i���P ����Y��ۋտ��a_�ф@<��}J�s߇[ ���>%bxY߇[ ����/��a����n�}q��a����n~q�٧�@<�/ǈ���%<�/w��>��Be��:.���@���@���@�lo�PY�����@���@��������A��o2D����@��<O,���N�Y&��L \���@~��>�](����	����M 'd�cD���+�U��u��o��&�.��A��ۛ@~�ğkT�x߹�x,�s�����ǲ}�N��Y&��L`	�L`�L�d��+�2�-�2�w�e{�eG�e��e� ���YvM�Y&��L`�2���&.��L`�	��e�	L\&0q���e�	L\&0p�=��e�M�N\&0q���e�	L\&0q���e�	L\&0q�{�2���.k�K\&0q���e�	L\&0q���e��&.��L`�2���&.��L 2����b�������7�?J�'x�w�{e���N��s�% �	�%�'xO��6A,d>��%���s�w�c���?��^���VG �8�S�q<��G~�π3�K�o�2���9���A��Q��9��'�2�����}NL����?FT��cA���?�g����c�N�//��i���P �e��~�o��b��}p&�a�F�A�}J�s߇[ ?(�O	�^���������\v�#?(���a���1�r>���SB ?(珑��o��������L T����19!*39!*39!*��xO���%��e&'�r��������3sQe���@~P�������;���ſ˲	rֿ�2�ǰ�	����P�Ws{ȏc�sB 7ʾ#�e�>'r��B����M �1������M �1�s����������'Ǜ.۟A�|,���d��;�2�=�2�#Ȳ	.���1rؿ�2�%�2�5�2�g�e� �� ��A�	쿳l���o�l��o�L`�2���&.��L`�2���&.��L`�/x�	L\&0q���e���	L\&0q���e�	L\6�#q���e�	L\&0q���e�	L\&0pY�\�	��e�	L\&0q���e�	L\&0q���e�M�&.��L`�2�X�|>�w�77�?��'�^��<&�^������`�i�j��;/Bn�7��#���,�8���:�G~�����Ƒ����=��O�p�q���gO�ļƱ�������e��>r�� ��WrڿO�e���1�+L���i�/ǈ7�����|�q�_�ǸL����̿�q�����Y���A�o5/VT����y�r�٧�@,0�}��r��� G��}�rs�����c�ȿ���a���1�r>���SB ?(�r����Kx�`fE��	�ʚ�ut6��sB TfrB ?(��������@n.�����@~Pn��2��ȿ����$XA~P�#������w�͛?��e[�e��}N�K����jno_������&�.���9�o�sB \V��VG����M ?\b��Q����&�.�纣����d���A��Ϡ@/���d��d��3�2�W�e[�e� �� �� �&ȑ&�A�	,A�	�A�	<g�5�+�2�-�2���&.��l�5q���e�	L\&0q���e�	L\&0q���eߚ����&.��L`�2���&.��L`�2���&.����L`�2���&.��M.q���e�	L\&0q�[�2���&.��L`�2���&.��L`�2��t�#)n���������8���	�Wv���#7�p����߀��]b�yrӿgQ��gQ���Ϻl�#{e��#?����zƑ��3��#?�g��n���8�S�qd��͹��t�-����\��A̖�>�Q��ꏑ3��>'r��?F��{.� ���,C����1�Y/��'�^��s���@4��=�QT���x�;��E?�W�)!�}n��`�>%bLV߇[ ���˯�s��r��u�x�c�?F���>���߱O	�x.��#Ɨ�><��7��䂙�%��.���]�_A�����.���]�_A����v����
������+h�W�.�����{W��7�#�]�s-�]��l���܎��ٟk���x9Fve�ϵ@veا���s;Ȯv��ۑ@ve�s�����G�83{���gP dfz� ��A�	�A�	A�M���&�A�	,A�	�A�	<�,xY&�Y&��L`��e��F�ed��2���&.��L`�2���&.��L`�2���&x'.��L`�2�����%.��L`�2���&.��l�=q���e�	L\&0q���e�	L\&0pY�\�	��e�	L\&0q���e�	L\&0q���e����瓸L`�2���bG���ߖ�_�܂���/��;��>m���Qe�[;��_c����@�'}Al���?��"��==����o�����_���?����_,�Q ��~��7�@�k����?�-g���?�\@����P�g������)�����(p������������8�"��������$g���&�'9`�?���������%r�      D   %   x�3�4�4�2�4�&��@ҔHs��M�b���� Lz6      F      x�3�,IL7�2QF\� ʘ+F��� T��      H      x������ � �      J   �  x�]�Mn1���k�2�DQ��MR`@�dl8�#���U�6��6���!N"���9���4u���SGoNNܢ�ȐkUt�t���uG7�<�K6� �$������*�7��(P�&i��v�,���rZ��	T[%����S�Ab���+34V2��д����ͧ��]���������r��=�x��.
7*5�>"�3�����a���d�B���
�LY`���Ӝ��-�t'�iy��*g��|X�>�Fc7��[��C�5�l�FL�������s��-T�u��Jx} ['��)uQ:�6ױ�if�}<d�
ww#�~��]��vx���:x��[��K5MA�h"/Y��g�75Lj�m������s�jA���P�c��|,��ĩ"`�dr��黭��$�u9��\93���2���QǄ����7�;-������x((ʹ�\�7��K����-���ޗ������ ���=     