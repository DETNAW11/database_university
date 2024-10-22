PGDMP  -    :                |         
   university    16.2    16.2     |           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            }           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ~           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    20765 
   university    DATABASE     }   CREATE DATABASE university WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE university;
                postgres    false            n          0    20842    estudiantes 
   TABLE DATA           d   COPY "Ingenieria Ambiental".estudiantes (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr) FROM stdin;
    Ingenieria Ambiental          postgres    false    234   �       l          0    20830    estudiantes 
   TABLE DATA           f   COPY "Ingenieria Electronica".estudiantes (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr) FROM stdin;
    Ingenieria Electronica          postgres    false    232   z       p          0    20854    estudiantes 
   TABLE DATA           e   COPY "Ingenieria Industrial".estudiantes (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr) FROM stdin;
    Ingenieria Industrial          postgres    false    236          j          0    20818    estudiantes 
   TABLE DATA           c   COPY "Ingenieria Mecanica".estudiantes (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr) FROM stdin;
    Ingenieria Mecanica          postgres    false    230   �       h          0    20806    estudiantes 
   TABLE DATA           f   COPY "Ingenieria de Sistemas".estudiantes (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr) FROM stdin;
    Ingenieria de Sistemas          postgres    false    228   (       t          0    20911    autores 
   TABLE DATA           D   COPY biblioteca.autores (id_a, nom_autor, nacionalidad) FROM stdin;
 
   biblioteca          postgres    false    240   �       u          0    20917 
   ejemplares 
   TABLE DATA           6   COPY biblioteca.ejemplares (isbn, num_ej) FROM stdin;
 
   biblioteca          postgres    false    241   N       v          0    20927    escribe 
   TABLE DATA           1   COPY biblioteca.escribe (isbn, id_a) FROM stdin;
 
   biblioteca          postgres    false    242   �       r          0    20905    libros 
   TABLE DATA           F   COPY biblioteca.libros (isbn, titulo, edicion, editorial) FROM stdin;
 
   biblioteca          postgres    false    238   f       w          0    20942    presta 
   TABLE DATA           K   COPY biblioteca.presta (cod_e, isbn, num_ej, fecha_p, fecha_d) FROM stdin;
 
   biblioteca          postgres    false    243   �       e          0    20784    asignaturas 
   TABLE DATA           J   COPY ingenieria.asignaturas (cod_a, nom_a, int_h, creditos_a) FROM stdin;
 
   ingenieria          postgres    false    225   y       c          0    20778    carreras 
   TABLE DATA           N   COPY ingenieria.carreras (id_carr, nom_carr, reg_calif, creditos) FROM stdin;
 
   ingenieria          postgres    false    223   f       f          0    20790    imparte 
   TABLE DATA           B   COPY ingenieria.imparte (id_p, cod_a, grupo, horario) FROM stdin;
 
   ingenieria          postgres    false    226   �       q          0    20865    inscribe 
   TABLE DATA           M   COPY ingenieria.inscribe (cod_e, cod_a, id_p, grupo, n1, n2, n3) FROM stdin;
 
   ingenieria          postgres    false    237   R        b          0    20773 
   profesores 
   TABLE DATA           N   COPY ingenieria.profesores (id_p, nom_p, dir_p, tel_p, profesion) FROM stdin;
 
   ingenieria          postgres    false    222   �        x          0    20977 
   referencia 
   TABLE DATA           5   COPY ingenieria.referencia (cod_a, isbn) FROM stdin;
 
   ingenieria          postgres    false    244   v!       y          0    21033    all_students 
   TABLE DATA           U   COPY public.all_students (cod_e, nom_e, dir_e, tel_e, fech_nac, id_carr) FROM stdin;
    public          postgres    false    254   �!       �           0    0    estudiantes_cod_e_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"Ingenieria Ambiental".estudiantes_cod_e_seq', 1, false);
          Ingenieria Ambiental          postgres    false    233            �           0    0    estudiantes_cod_e_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"Ingenieria Electronica".estudiantes_cod_e_seq', 1, false);
          Ingenieria Electronica          postgres    false    231            �           0    0    estudiantes_cod_e_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"Ingenieria Industrial".estudiantes_cod_e_seq', 1, false);
          Ingenieria Industrial          postgres    false    235            �           0    0    estudiantes_cod_e_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"Ingenieria Mecanica".estudiantes_cod_e_seq', 1, false);
          Ingenieria Mecanica          postgres    false    229            �           0    0    estudiantes_cod_e_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('"Ingenieria de Sistemas".estudiantes_cod_e_seq', 1, false);
          Ingenieria de Sistemas          postgres    false    227            �           0    0    autores_id_a_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('biblioteca.autores_id_a_seq', 1, false);
       
   biblioteca          postgres    false    239            �           0    0    asignaturas_cod_a_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('ingenieria.asignaturas_cod_a_seq', 1, false);
       
   ingenieria          postgres    false    224            n   |   x�e�A
�@�u�^`$?S09��覨��(X{�f����|�#�>h|����c��u_��nk7z+m0�L������$'��5p%h_�53��-p#XK�0���R��ۍ{;�������O)}[�>	      l   }   x�U�1�0���90��&"`�	X*`�B��σ�R�����`���K}m�ڡ��Y繾�nDMO�R
��)@v��\r.Q������:�ώg2??^X"Gi�Y�QG�ܬ���SB8'�<�      p   |   x�]�1�0�990�7����'`A����޿TBƞ������p�?�w.�/�����i*�����W@�`@���9A}n��L�Qǎ'Ǔ����� ��uu\דK��6��և6���<�      j   �   x�]�;
�@�Z{
_@F#Ab�mN�&�.�q q��V�n`H*%N�g�N���s�4��<���4��� ��Y�Me�I7�Ui+{���w04p����9���cA���'׋C��n����:��}hSJ?�KR      h   �   x�e�=�0���9���X{�
X����7�>�;��8�	���l��X;�e{���n�g�a(��OҐq�:��#�U[���x��G�iz���VwEQ@NT��EDQ��酃�z��Mh�DI�}��f�m���\���mA[�h:�/;O�1���t�      t   a   x�=λ�0�КL�(7��,��	���ȏ�$-�s�תe�c�Gq�	g�q�W\q�wܧ���x�?(�*lQ�`�J�T&إ��؜s/m^@�      u      x�]�[
�0D�o�i��ֽ��u}�E�ǡL�$^�����k�uZ�����Y��'�9��g��mC�!s���Y�8f:TttttH�����~N�dXp���ao��o��M�f��L�i�nfB�XS      v   y   x�U���0C�d���.�?ǂT�<9;p��78����%FU�'6bTl�ē�gb�Ń�x$κwս��E�TЕԐ+��y����ic(>-�ƿ����۔�Fd���:����i�F
      r   �   x�Mл�0ј����C(R�Ȁ���q F/��)%=/����y)({��99;grq.��\�͹��s'�A��s����k��i�(�flJF
������Bl�!����ȝܹz����k�N��[���?le      w   n   x����� �g�s-��%���簀Jy������ȑc;v����]�r�H��
�k�F~ O�����i�:`ATm�^δOl�τi}E���Ez�vx�o�4j      e   �   x�M�Aj�0E��)|�������EK��r6�Q� ��v詺(=B.��fJw�������z���7V���ʾ�����#%<�Yͨ.�0�a��I�b�V�������?!��0��RF5;���G�OP/�k���B�Ί��P	��7��g
����Z|`*��6�B�H�a�8]���C.)s�Lm��v:_P�丹M��R�����a:�S������OR�_��`�      c   f   x�34000���KO��L-�LTHIU�,.I�M,��".C�#d%��ɉy�ɉH����9��%E�hJL��8�&e��$� )0EV���RZ\d�T��qqq +c4�      f   f   x�34400��>���
^@B�Ј�!g�%Aj�rF9cl��r&���*���C�g���/�ϘB���+��)1� �準0�1z\\\ ��(�      q   x   x�m��� C��0q@�0���Kiy�D����f-��L�����H|h4�!¶;?6�)�ݪ[�wG�.~�������4=#	�e]���%<��ؓ�Ñ��ӧ�;�i)���9      b   �   x�e�K
�0е}
� D�����&.x���C���oG�`D��Vm�}ʯuc�Q{���N�Y� 8_��W�8����<������ 0Ӥ( "��4)	H���d�A�&�zVs�������k�Z���s      x   o   x�u�A� ��1��V�K���ZV+��qWN�����JLu�F�0���_\��[�{Q.��2�������R��x���\M��4�S�Vݬ�GCV�.�X�O"z |2>      y   �  x�m�=n�0Fg�����t��=A�"ɐ%����L��g��聢�$!�������z?N�������z�.��L�sN=I�1p�:)�xV<+A,�խ�Ӹc�g�gc�~��s�B��J=�=4zh��u�{�&ٳ�g'�Na��cay����ٳs�-�n<�l�l�l
������ٳٳy���GZ 1�	< ��	�L`� ��G&5�&w䆃I*�B.�	�p����r�W���V^q+��c��,����=kٵ醃\viV^��Y�\O]q�ׇ����8�gГ�O�b	��d[�C��PE5�Tm8H�`�f���G��\`��-�D�o!�ȮY{$[ٱr`���	�Eǉ5<�L3ë/�c�}u�M@7�\���M[���?�Xt�     