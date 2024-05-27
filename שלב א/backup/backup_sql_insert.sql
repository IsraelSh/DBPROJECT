prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by Israel on Monday, 27 May 2024
set feedback off
set define off

prompt Dropping CINEMA_ROOM...
drop table CINEMA_ROOM cascade constraints;
prompt Dropping PROJECTOR_EMPLOYEE...
drop table PROJECTOR_EMPLOYEE cascade constraints;
prompt Dropping MOVIE...
drop table MOVIE cascade constraints;
prompt Dropping TICKET...
drop table TICKET cascade constraints;
prompt Dropping FOOD...
drop table FOOD cascade constraints;
prompt Dropping SEAT...
drop table SEAT cascade constraints;
prompt Creating CINEMA_ROOM...
create table CINEMA_ROOM
(
  room_number INTEGER not null,
  names       VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CINEMA_ROOM
  add primary key (ROOM_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PROJECTOR_EMPLOYEE...
create table PROJECTOR_EMPLOYEE
(
  projector_code INTEGER not null,
  dates          DATE not null,
  times          INTEGER not null,
  room_numbeer   INTEGER not null,
  movie_name     VARCHAR2(20) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PROJECTOR_EMPLOYEE
  add primary key (PROJECTOR_CODE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating MOVIE...
create table MOVIE
(
  film_code      INTEGER not null,
  names          VARCHAR2(20) not null,
  duration       INTEGER not null,
  categorie      VARCHAR2(20) not null,
  room_number    INTEGER not null,
  projector_code INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MOVIE
  add primary key (FILM_CODE)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MOVIE
  add foreign key (ROOM_NUMBER)
  references CINEMA_ROOM (ROOM_NUMBER);
alter table MOVIE
  add foreign key (PROJECTOR_CODE)
  references PROJECTOR_EMPLOYEE (PROJECTOR_CODE);

prompt Creating TICKET...
create table TICKET
(
  identifying_number INTEGER not null,
  hours              INTEGER not null,
  seat               INTEGER not null,
  price              INTEGER not null,
  filme_number       INTEGER not null,
  film_code          INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TICKET
  add primary key (IDENTIFYING_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TICKET
  add foreign key (FILM_CODE)
  references MOVIE (FILM_CODE);

prompt Creating FOOD...
create table FOOD
(
  food               VARCHAR2(20) not null,
  drinks             VARCHAR2(20) not null,
  receipt            INTEGER not null,
  identifying_number INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FOOD
  add primary key (RECEIPT)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table FOOD
  add foreign key (IDENTIFYING_NUMBER)
  references TICKET (IDENTIFYING_NUMBER);

prompt Creating SEAT...
create table SEAT
(
  seat_number INTEGER not null,
  row_number  INTEGER not null,
  room_number INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SEAT
  add primary key (SEAT_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SEAT
  add unique (ROW_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SEAT
  add foreign key (ROOM_NUMBER)
  references CINEMA_ROOM (ROOM_NUMBER);

prompt Disabling foreign key constraints for MOVIE...
alter table MOVIE disable constraint SYS_C008728;
alter table MOVIE disable constraint SYS_C008729;
prompt Disabling foreign key constraints for TICKET...
alter table TICKET disable constraint SYS_C008737;
prompt Disabling foreign key constraints for FOOD...
alter table FOOD disable constraint SYS_C008743;
prompt Disabling foreign key constraints for SEAT...
alter table SEAT disable constraint SYS_C008720;
prompt Loading CINEMA_ROOM...
insert into CINEMA_ROOM (room_number, names)
values (1, 'Becki');
insert into CINEMA_ROOM (room_number, names)
values (2, 'Rodd');
insert into CINEMA_ROOM (room_number, names)
values (3, 'Mahmoud');
insert into CINEMA_ROOM (room_number, names)
values (4, 'Riannon');
insert into CINEMA_ROOM (room_number, names)
values (5, 'Ilyse');
insert into CINEMA_ROOM (room_number, names)
values (6, 'Stafford');
insert into CINEMA_ROOM (room_number, names)
values (7, 'Marcie');
insert into CINEMA_ROOM (room_number, names)
values (8, 'Petronia');
insert into CINEMA_ROOM (room_number, names)
values (9, 'Kimberlee');
insert into CINEMA_ROOM (room_number, names)
values (10, 'Pembroke');
insert into CINEMA_ROOM (room_number, names)
values (11, 'Dorice');
insert into CINEMA_ROOM (room_number, names)
values (12, 'Susannah');
insert into CINEMA_ROOM (room_number, names)
values (13, 'Eimile');
insert into CINEMA_ROOM (room_number, names)
values (14, 'Mandel');
insert into CINEMA_ROOM (room_number, names)
values (15, 'Virge');
insert into CINEMA_ROOM (room_number, names)
values (16, 'Reeta');
insert into CINEMA_ROOM (room_number, names)
values (17, 'Elsa');
insert into CINEMA_ROOM (room_number, names)
values (18, 'Konstantine');
insert into CINEMA_ROOM (room_number, names)
values (19, 'Tandi');
insert into CINEMA_ROOM (room_number, names)
values (20, 'Rory');
insert into CINEMA_ROOM (room_number, names)
values (21, 'Yvor');
insert into CINEMA_ROOM (room_number, names)
values (22, 'Darlleen');
insert into CINEMA_ROOM (room_number, names)
values (23, 'Molli');
insert into CINEMA_ROOM (room_number, names)
values (24, 'Haslett');
insert into CINEMA_ROOM (room_number, names)
values (25, 'Agnola');
insert into CINEMA_ROOM (room_number, names)
values (26, 'Francesca');
insert into CINEMA_ROOM (room_number, names)
values (27, 'Annamarie');
insert into CINEMA_ROOM (room_number, names)
values (28, 'Siegfried');
insert into CINEMA_ROOM (room_number, names)
values (29, 'Blake');
insert into CINEMA_ROOM (room_number, names)
values (30, 'Conrad');
insert into CINEMA_ROOM (room_number, names)
values (31, 'Tessy');
insert into CINEMA_ROOM (room_number, names)
values (32, 'Gisella');
insert into CINEMA_ROOM (room_number, names)
values (33, 'Chip');
insert into CINEMA_ROOM (room_number, names)
values (34, 'Karil');
insert into CINEMA_ROOM (room_number, names)
values (35, 'Baxter');
insert into CINEMA_ROOM (room_number, names)
values (36, 'Locke');
insert into CINEMA_ROOM (room_number, names)
values (37, 'Riva');
insert into CINEMA_ROOM (room_number, names)
values (38, 'Arden');
insert into CINEMA_ROOM (room_number, names)
values (39, 'Reagen');
insert into CINEMA_ROOM (room_number, names)
values (40, 'Goober');
insert into CINEMA_ROOM (room_number, names)
values (41, 'Di');
insert into CINEMA_ROOM (room_number, names)
values (42, 'Kellyann');
insert into CINEMA_ROOM (room_number, names)
values (43, 'Lief');
insert into CINEMA_ROOM (room_number, names)
values (44, 'Shannen');
insert into CINEMA_ROOM (room_number, names)
values (45, 'Sarette');
insert into CINEMA_ROOM (room_number, names)
values (46, 'Cooper');
insert into CINEMA_ROOM (room_number, names)
values (47, 'Letti');
insert into CINEMA_ROOM (room_number, names)
values (48, 'Alf');
insert into CINEMA_ROOM (room_number, names)
values (49, 'Karleen');
insert into CINEMA_ROOM (room_number, names)
values (50, 'Darell');
insert into CINEMA_ROOM (room_number, names)
values (51, 'Maris');
insert into CINEMA_ROOM (room_number, names)
values (52, 'Dory');
insert into CINEMA_ROOM (room_number, names)
values (53, 'Cary');
insert into CINEMA_ROOM (room_number, names)
values (54, 'Aldous');
insert into CINEMA_ROOM (room_number, names)
values (55, 'Boy');
insert into CINEMA_ROOM (room_number, names)
values (56, 'Antone');
insert into CINEMA_ROOM (room_number, names)
values (57, 'Honey');
insert into CINEMA_ROOM (room_number, names)
values (58, 'Marin');
insert into CINEMA_ROOM (room_number, names)
values (59, 'Ogden');
insert into CINEMA_ROOM (room_number, names)
values (60, 'Llywellyn');
insert into CINEMA_ROOM (room_number, names)
values (61, 'Burg');
insert into CINEMA_ROOM (room_number, names)
values (62, 'Mercie');
insert into CINEMA_ROOM (room_number, names)
values (63, 'Thorndike');
insert into CINEMA_ROOM (room_number, names)
values (64, 'Husain');
insert into CINEMA_ROOM (room_number, names)
values (65, 'Annalee');
insert into CINEMA_ROOM (room_number, names)
values (66, 'Pinchas');
insert into CINEMA_ROOM (room_number, names)
values (67, 'Grier');
insert into CINEMA_ROOM (room_number, names)
values (68, 'Benita');
insert into CINEMA_ROOM (room_number, names)
values (69, 'Bernelle');
insert into CINEMA_ROOM (room_number, names)
values (70, 'Garrek');
insert into CINEMA_ROOM (room_number, names)
values (71, 'Tedda');
insert into CINEMA_ROOM (room_number, names)
values (72, 'Paige');
insert into CINEMA_ROOM (room_number, names)
values (73, 'Hollis');
insert into CINEMA_ROOM (room_number, names)
values (74, 'Aharon');
insert into CINEMA_ROOM (room_number, names)
values (75, 'Birdie');
insert into CINEMA_ROOM (room_number, names)
values (76, 'Koralle');
insert into CINEMA_ROOM (room_number, names)
values (77, 'Zorine');
insert into CINEMA_ROOM (room_number, names)
values (78, 'Reed');
insert into CINEMA_ROOM (room_number, names)
values (79, 'Benedetta');
insert into CINEMA_ROOM (room_number, names)
values (80, 'Alexis');
insert into CINEMA_ROOM (room_number, names)
values (81, 'Arlina');
insert into CINEMA_ROOM (room_number, names)
values (82, 'Erek');
insert into CINEMA_ROOM (room_number, names)
values (83, 'Stephani');
insert into CINEMA_ROOM (room_number, names)
values (84, 'Marijn');
insert into CINEMA_ROOM (room_number, names)
values (85, 'Kimmy');
insert into CINEMA_ROOM (room_number, names)
values (86, 'Elwin');
insert into CINEMA_ROOM (room_number, names)
values (87, 'Alexa');
insert into CINEMA_ROOM (room_number, names)
values (88, 'Monroe');
insert into CINEMA_ROOM (room_number, names)
values (89, 'Babbette');
insert into CINEMA_ROOM (room_number, names)
values (90, 'Melissa');
insert into CINEMA_ROOM (room_number, names)
values (91, 'Wilbur');
insert into CINEMA_ROOM (room_number, names)
values (92, 'Delphine');
insert into CINEMA_ROOM (room_number, names)
values (93, 'Roxie');
insert into CINEMA_ROOM (room_number, names)
values (94, 'Talbot');
insert into CINEMA_ROOM (room_number, names)
values (95, 'Glynnis');
insert into CINEMA_ROOM (room_number, names)
values (96, 'Zora');
insert into CINEMA_ROOM (room_number, names)
values (97, 'Malachi');
insert into CINEMA_ROOM (room_number, names)
values (98, 'Nat');
insert into CINEMA_ROOM (room_number, names)
values (99, 'Mame');
insert into CINEMA_ROOM (room_number, names)
values (100, 'Carolee');
commit;
prompt 100 records committed...
insert into CINEMA_ROOM (room_number, names)
values (101, 'Madelina');
insert into CINEMA_ROOM (room_number, names)
values (102, 'Lorelei');
insert into CINEMA_ROOM (room_number, names)
values (103, 'Carter');
insert into CINEMA_ROOM (room_number, names)
values (104, 'Charis');
insert into CINEMA_ROOM (room_number, names)
values (105, 'Wolfgang');
insert into CINEMA_ROOM (room_number, names)
values (106, 'Katleen');
insert into CINEMA_ROOM (room_number, names)
values (107, 'Arden');
insert into CINEMA_ROOM (room_number, names)
values (108, 'Laurene');
insert into CINEMA_ROOM (room_number, names)
values (109, 'Glenda');
insert into CINEMA_ROOM (room_number, names)
values (110, 'Rollin');
insert into CINEMA_ROOM (room_number, names)
values (111, 'Huberto');
insert into CINEMA_ROOM (room_number, names)
values (112, 'Lenci');
insert into CINEMA_ROOM (room_number, names)
values (113, 'Karna');
insert into CINEMA_ROOM (room_number, names)
values (114, 'Merry');
insert into CINEMA_ROOM (room_number, names)
values (115, 'Annmaria');
insert into CINEMA_ROOM (room_number, names)
values (116, 'Arch');
insert into CINEMA_ROOM (room_number, names)
values (117, 'Niles');
insert into CINEMA_ROOM (room_number, names)
values (118, 'Bride');
insert into CINEMA_ROOM (room_number, names)
values (119, 'Benedetta');
insert into CINEMA_ROOM (room_number, names)
values (120, 'Denise');
insert into CINEMA_ROOM (room_number, names)
values (121, 'Emory');
insert into CINEMA_ROOM (room_number, names)
values (122, 'Joye');
insert into CINEMA_ROOM (room_number, names)
values (123, 'Willabella');
insert into CINEMA_ROOM (room_number, names)
values (124, 'Kermit');
insert into CINEMA_ROOM (room_number, names)
values (125, 'Vinson');
insert into CINEMA_ROOM (room_number, names)
values (126, 'Cherri');
insert into CINEMA_ROOM (room_number, names)
values (127, 'Israel');
insert into CINEMA_ROOM (room_number, names)
values (128, 'Aluin');
insert into CINEMA_ROOM (room_number, names)
values (129, 'Christin');
insert into CINEMA_ROOM (room_number, names)
values (130, 'Luciano');
insert into CINEMA_ROOM (room_number, names)
values (131, 'Karim');
insert into CINEMA_ROOM (room_number, names)
values (132, 'Rania');
insert into CINEMA_ROOM (room_number, names)
values (133, 'Shawnee');
insert into CINEMA_ROOM (room_number, names)
values (134, 'Sindee');
insert into CINEMA_ROOM (room_number, names)
values (135, 'Phaedra');
insert into CINEMA_ROOM (room_number, names)
values (136, 'Elvina');
insert into CINEMA_ROOM (room_number, names)
values (137, 'Shayla');
insert into CINEMA_ROOM (room_number, names)
values (138, 'Shelly');
insert into CINEMA_ROOM (room_number, names)
values (139, 'Monroe');
insert into CINEMA_ROOM (room_number, names)
values (140, 'Sofia');
insert into CINEMA_ROOM (room_number, names)
values (141, 'Ulric');
insert into CINEMA_ROOM (room_number, names)
values (142, 'Jeremiah');
insert into CINEMA_ROOM (room_number, names)
values (143, 'Onfre');
insert into CINEMA_ROOM (room_number, names)
values (144, 'Diego');
insert into CINEMA_ROOM (room_number, names)
values (145, 'Kenneth');
insert into CINEMA_ROOM (room_number, names)
values (146, 'Blanch');
insert into CINEMA_ROOM (room_number, names)
values (147, 'Monte');
insert into CINEMA_ROOM (room_number, names)
values (148, 'Gerhardt');
insert into CINEMA_ROOM (room_number, names)
values (149, 'Eleanore');
insert into CINEMA_ROOM (room_number, names)
values (150, 'Garret');
insert into CINEMA_ROOM (room_number, names)
values (151, 'Hobart');
insert into CINEMA_ROOM (room_number, names)
values (152, 'Darell');
insert into CINEMA_ROOM (room_number, names)
values (153, 'Janella');
insert into CINEMA_ROOM (room_number, names)
values (154, 'Efren');
insert into CINEMA_ROOM (room_number, names)
values (155, 'Andriana');
insert into CINEMA_ROOM (room_number, names)
values (156, 'Tracey');
insert into CINEMA_ROOM (room_number, names)
values (157, 'Kristina');
insert into CINEMA_ROOM (room_number, names)
values (158, 'Lydia');
insert into CINEMA_ROOM (room_number, names)
values (159, 'Yuma');
insert into CINEMA_ROOM (room_number, names)
values (160, 'Annamarie');
insert into CINEMA_ROOM (room_number, names)
values (161, 'Kurt');
insert into CINEMA_ROOM (room_number, names)
values (162, 'Henry');
insert into CINEMA_ROOM (room_number, names)
values (163, 'Thomasine');
insert into CINEMA_ROOM (room_number, names)
values (164, 'Foss');
insert into CINEMA_ROOM (room_number, names)
values (165, 'Gothart');
insert into CINEMA_ROOM (room_number, names)
values (166, 'Dulcy');
insert into CINEMA_ROOM (room_number, names)
values (167, 'Upton');
insert into CINEMA_ROOM (room_number, names)
values (168, 'Mohandis');
insert into CINEMA_ROOM (room_number, names)
values (169, 'Fred');
insert into CINEMA_ROOM (room_number, names)
values (170, 'Neda');
insert into CINEMA_ROOM (room_number, names)
values (171, 'Marilin');
insert into CINEMA_ROOM (room_number, names)
values (172, 'Vanna');
insert into CINEMA_ROOM (room_number, names)
values (173, 'Ekaterina');
insert into CINEMA_ROOM (room_number, names)
values (174, 'Natasha');
insert into CINEMA_ROOM (room_number, names)
values (175, 'Perkin');
insert into CINEMA_ROOM (room_number, names)
values (176, 'Stoddard');
insert into CINEMA_ROOM (room_number, names)
values (177, 'Arlana');
insert into CINEMA_ROOM (room_number, names)
values (178, 'Sukey');
insert into CINEMA_ROOM (room_number, names)
values (179, 'Si');
insert into CINEMA_ROOM (room_number, names)
values (180, 'Leopold');
insert into CINEMA_ROOM (room_number, names)
values (181, 'Cindi');
insert into CINEMA_ROOM (room_number, names)
values (182, 'Karyl');
insert into CINEMA_ROOM (room_number, names)
values (183, 'Ramon');
insert into CINEMA_ROOM (room_number, names)
values (184, 'Gillie');
insert into CINEMA_ROOM (room_number, names)
values (185, 'Wallie');
insert into CINEMA_ROOM (room_number, names)
values (186, 'Marilin');
insert into CINEMA_ROOM (room_number, names)
values (187, 'Tim');
insert into CINEMA_ROOM (room_number, names)
values (188, 'Natasha');
insert into CINEMA_ROOM (room_number, names)
values (189, 'Dermot');
insert into CINEMA_ROOM (room_number, names)
values (190, 'Durante');
insert into CINEMA_ROOM (room_number, names)
values (191, 'Cherida');
insert into CINEMA_ROOM (room_number, names)
values (192, 'Sheppard');
insert into CINEMA_ROOM (room_number, names)
values (193, 'Neilla');
insert into CINEMA_ROOM (room_number, names)
values (194, 'Herc');
insert into CINEMA_ROOM (room_number, names)
values (195, 'Remy');
insert into CINEMA_ROOM (room_number, names)
values (196, 'Mil');
insert into CINEMA_ROOM (room_number, names)
values (197, 'Genevra');
insert into CINEMA_ROOM (room_number, names)
values (198, 'Ada');
insert into CINEMA_ROOM (room_number, names)
values (199, 'Kalvin');
insert into CINEMA_ROOM (room_number, names)
values (200, 'Alvie');
commit;
prompt 200 records committed...
insert into CINEMA_ROOM (room_number, names)
values (201, 'Carlin');
insert into CINEMA_ROOM (room_number, names)
values (202, 'Mara');
insert into CINEMA_ROOM (room_number, names)
values (203, 'Nana');
insert into CINEMA_ROOM (room_number, names)
values (204, 'Glennis');
insert into CINEMA_ROOM (room_number, names)
values (205, 'Mylo');
insert into CINEMA_ROOM (room_number, names)
values (206, 'Roze');
insert into CINEMA_ROOM (room_number, names)
values (207, 'Marian');
insert into CINEMA_ROOM (room_number, names)
values (208, 'Lyda');
insert into CINEMA_ROOM (room_number, names)
values (209, 'Tamma');
insert into CINEMA_ROOM (room_number, names)
values (210, 'Richart');
insert into CINEMA_ROOM (room_number, names)
values (211, 'Lynette');
insert into CINEMA_ROOM (room_number, names)
values (212, 'Gavrielle');
insert into CINEMA_ROOM (room_number, names)
values (213, 'Rakel');
insert into CINEMA_ROOM (room_number, names)
values (214, 'Abby');
insert into CINEMA_ROOM (room_number, names)
values (215, 'Hedda');
insert into CINEMA_ROOM (room_number, names)
values (216, 'Ignaz');
insert into CINEMA_ROOM (room_number, names)
values (217, 'Brittani');
insert into CINEMA_ROOM (room_number, names)
values (218, 'Gradeigh');
insert into CINEMA_ROOM (room_number, names)
values (219, 'Carlin');
insert into CINEMA_ROOM (room_number, names)
values (220, 'Addy');
insert into CINEMA_ROOM (room_number, names)
values (221, 'Antin');
insert into CINEMA_ROOM (room_number, names)
values (222, 'Immanuel');
insert into CINEMA_ROOM (room_number, names)
values (223, 'Hartwell');
insert into CINEMA_ROOM (room_number, names)
values (224, 'Marysa');
insert into CINEMA_ROOM (room_number, names)
values (225, 'Edmund');
insert into CINEMA_ROOM (room_number, names)
values (226, 'Kaspar');
insert into CINEMA_ROOM (room_number, names)
values (227, 'Suzy');
insert into CINEMA_ROOM (room_number, names)
values (228, 'Judas');
insert into CINEMA_ROOM (room_number, names)
values (229, 'Ethyl');
insert into CINEMA_ROOM (room_number, names)
values (230, 'Rozamond');
insert into CINEMA_ROOM (room_number, names)
values (231, 'Demetre');
insert into CINEMA_ROOM (room_number, names)
values (232, 'Abelard');
insert into CINEMA_ROOM (room_number, names)
values (233, 'Ashlen');
insert into CINEMA_ROOM (room_number, names)
values (234, 'Michaela');
insert into CINEMA_ROOM (room_number, names)
values (235, 'Gerda');
insert into CINEMA_ROOM (room_number, names)
values (236, 'Shelley');
insert into CINEMA_ROOM (room_number, names)
values (237, 'Gus');
insert into CINEMA_ROOM (room_number, names)
values (238, 'Felicity');
insert into CINEMA_ROOM (room_number, names)
values (239, 'Emmy');
insert into CINEMA_ROOM (room_number, names)
values (240, 'Rodd');
insert into CINEMA_ROOM (room_number, names)
values (241, 'Lyn');
insert into CINEMA_ROOM (room_number, names)
values (242, 'Shayne');
insert into CINEMA_ROOM (room_number, names)
values (243, 'Marylinda');
insert into CINEMA_ROOM (room_number, names)
values (244, 'Eamon');
insert into CINEMA_ROOM (room_number, names)
values (245, 'Nedi');
insert into CINEMA_ROOM (room_number, names)
values (246, 'Caria');
insert into CINEMA_ROOM (room_number, names)
values (247, 'Lilian');
insert into CINEMA_ROOM (room_number, names)
values (248, 'Tuckie');
insert into CINEMA_ROOM (room_number, names)
values (249, 'Adina');
insert into CINEMA_ROOM (room_number, names)
values (250, 'Claire');
insert into CINEMA_ROOM (room_number, names)
values (251, 'Avie');
insert into CINEMA_ROOM (room_number, names)
values (252, 'Roselia');
insert into CINEMA_ROOM (room_number, names)
values (253, 'Rabbi');
insert into CINEMA_ROOM (room_number, names)
values (254, 'Raven');
insert into CINEMA_ROOM (room_number, names)
values (255, 'Elayne');
insert into CINEMA_ROOM (room_number, names)
values (256, 'Heda');
insert into CINEMA_ROOM (room_number, names)
values (257, 'Dallas');
insert into CINEMA_ROOM (room_number, names)
values (258, 'Chic');
insert into CINEMA_ROOM (room_number, names)
values (259, 'Phaidra');
insert into CINEMA_ROOM (room_number, names)
values (260, 'Gert');
insert into CINEMA_ROOM (room_number, names)
values (261, 'Zacharias');
insert into CINEMA_ROOM (room_number, names)
values (262, 'Minne');
insert into CINEMA_ROOM (room_number, names)
values (263, 'Nickey');
insert into CINEMA_ROOM (room_number, names)
values (264, 'Elmer');
insert into CINEMA_ROOM (room_number, names)
values (265, 'Darbie');
insert into CINEMA_ROOM (room_number, names)
values (266, 'Linda');
insert into CINEMA_ROOM (room_number, names)
values (267, 'Shanta');
insert into CINEMA_ROOM (room_number, names)
values (268, 'Lukas');
insert into CINEMA_ROOM (room_number, names)
values (269, 'Andee');
insert into CINEMA_ROOM (room_number, names)
values (270, 'Odella');
insert into CINEMA_ROOM (room_number, names)
values (271, 'Patricio');
insert into CINEMA_ROOM (room_number, names)
values (272, 'Gerard');
insert into CINEMA_ROOM (room_number, names)
values (273, 'Carolynn');
insert into CINEMA_ROOM (room_number, names)
values (274, 'Sanderson');
insert into CINEMA_ROOM (room_number, names)
values (275, 'Michaelina');
insert into CINEMA_ROOM (room_number, names)
values (276, 'Margy');
insert into CINEMA_ROOM (room_number, names)
values (277, 'Alan');
insert into CINEMA_ROOM (room_number, names)
values (278, 'Jennie');
insert into CINEMA_ROOM (room_number, names)
values (279, 'Kristos');
insert into CINEMA_ROOM (room_number, names)
values (280, 'Shannah');
insert into CINEMA_ROOM (room_number, names)
values (281, 'Ivett');
insert into CINEMA_ROOM (room_number, names)
values (282, 'Rubi');
insert into CINEMA_ROOM (room_number, names)
values (283, 'Anetta');
insert into CINEMA_ROOM (room_number, names)
values (284, 'Brittaney');
insert into CINEMA_ROOM (room_number, names)
values (285, 'Sheilah');
insert into CINEMA_ROOM (room_number, names)
values (286, 'Anallise');
insert into CINEMA_ROOM (room_number, names)
values (287, 'Read');
insert into CINEMA_ROOM (room_number, names)
values (288, 'Odessa');
insert into CINEMA_ROOM (room_number, names)
values (289, 'Virgil');
insert into CINEMA_ROOM (room_number, names)
values (290, 'Gerome');
insert into CINEMA_ROOM (room_number, names)
values (291, 'Derril');
insert into CINEMA_ROOM (room_number, names)
values (292, 'Gary');
insert into CINEMA_ROOM (room_number, names)
values (293, 'Orsa');
insert into CINEMA_ROOM (room_number, names)
values (294, 'Etti');
insert into CINEMA_ROOM (room_number, names)
values (295, 'Roderic');
insert into CINEMA_ROOM (room_number, names)
values (296, 'Bary');
insert into CINEMA_ROOM (room_number, names)
values (297, 'Darn');
insert into CINEMA_ROOM (room_number, names)
values (298, 'Che');
insert into CINEMA_ROOM (room_number, names)
values (299, 'Kass');
insert into CINEMA_ROOM (room_number, names)
values (300, 'Nevsa');
commit;
prompt 300 records committed...
insert into CINEMA_ROOM (room_number, names)
values (301, 'Adler');
insert into CINEMA_ROOM (room_number, names)
values (302, 'Izabel');
insert into CINEMA_ROOM (room_number, names)
values (303, 'Emmanuel');
insert into CINEMA_ROOM (room_number, names)
values (304, 'Cordelie');
insert into CINEMA_ROOM (room_number, names)
values (305, 'Dwain');
insert into CINEMA_ROOM (room_number, names)
values (306, 'Johnath');
insert into CINEMA_ROOM (room_number, names)
values (307, 'Tabbitha');
insert into CINEMA_ROOM (room_number, names)
values (308, 'Lexi');
insert into CINEMA_ROOM (room_number, names)
values (309, 'Perry');
insert into CINEMA_ROOM (room_number, names)
values (310, 'Teriann');
insert into CINEMA_ROOM (room_number, names)
values (311, 'Violet');
insert into CINEMA_ROOM (room_number, names)
values (312, 'Liane');
insert into CINEMA_ROOM (room_number, names)
values (313, 'Gibbie');
insert into CINEMA_ROOM (room_number, names)
values (314, 'Olvan');
insert into CINEMA_ROOM (room_number, names)
values (315, 'Prudi');
insert into CINEMA_ROOM (room_number, names)
values (316, 'Phillipp');
insert into CINEMA_ROOM (room_number, names)
values (317, 'Nonna');
insert into CINEMA_ROOM (room_number, names)
values (318, 'Darnall');
insert into CINEMA_ROOM (room_number, names)
values (319, 'Meyer');
insert into CINEMA_ROOM (room_number, names)
values (320, 'Wallie');
insert into CINEMA_ROOM (room_number, names)
values (321, 'Darill');
insert into CINEMA_ROOM (room_number, names)
values (322, 'Sunny');
insert into CINEMA_ROOM (room_number, names)
values (323, 'Veda');
insert into CINEMA_ROOM (room_number, names)
values (324, 'Elie');
insert into CINEMA_ROOM (room_number, names)
values (325, 'Christean');
insert into CINEMA_ROOM (room_number, names)
values (326, 'Codi');
insert into CINEMA_ROOM (room_number, names)
values (327, 'Natasha');
insert into CINEMA_ROOM (room_number, names)
values (328, 'Gretel');
insert into CINEMA_ROOM (room_number, names)
values (329, 'Sula');
insert into CINEMA_ROOM (room_number, names)
values (330, 'Winnie');
insert into CINEMA_ROOM (room_number, names)
values (331, 'Orrin');
insert into CINEMA_ROOM (room_number, names)
values (332, 'Jake');
insert into CINEMA_ROOM (room_number, names)
values (333, 'Enrico');
insert into CINEMA_ROOM (room_number, names)
values (334, 'Jarib');
insert into CINEMA_ROOM (room_number, names)
values (335, 'Nanete');
insert into CINEMA_ROOM (room_number, names)
values (336, 'Montague');
insert into CINEMA_ROOM (room_number, names)
values (337, 'Robyn');
insert into CINEMA_ROOM (room_number, names)
values (338, 'Juana');
insert into CINEMA_ROOM (room_number, names)
values (339, 'Dotty');
insert into CINEMA_ROOM (room_number, names)
values (340, 'Kelci');
insert into CINEMA_ROOM (room_number, names)
values (341, 'Sol');
insert into CINEMA_ROOM (room_number, names)
values (342, 'Kanya');
insert into CINEMA_ROOM (room_number, names)
values (343, 'Skipton');
insert into CINEMA_ROOM (room_number, names)
values (344, 'Lorin');
insert into CINEMA_ROOM (room_number, names)
values (345, 'Wendell');
insert into CINEMA_ROOM (room_number, names)
values (346, 'Yvon');
insert into CINEMA_ROOM (room_number, names)
values (347, 'Zebulen');
insert into CINEMA_ROOM (room_number, names)
values (348, 'Chrisy');
insert into CINEMA_ROOM (room_number, names)
values (349, 'Grover');
insert into CINEMA_ROOM (room_number, names)
values (350, 'Andris');
insert into CINEMA_ROOM (room_number, names)
values (351, 'Roshelle');
insert into CINEMA_ROOM (room_number, names)
values (352, 'Rusty');
insert into CINEMA_ROOM (room_number, names)
values (353, 'Madlin');
insert into CINEMA_ROOM (room_number, names)
values (354, 'Nicolai');
insert into CINEMA_ROOM (room_number, names)
values (355, 'Natividad');
insert into CINEMA_ROOM (room_number, names)
values (356, 'Iolanthe');
insert into CINEMA_ROOM (room_number, names)
values (357, 'Cherye');
insert into CINEMA_ROOM (room_number, names)
values (358, 'Norean');
insert into CINEMA_ROOM (room_number, names)
values (359, 'Brewster');
insert into CINEMA_ROOM (room_number, names)
values (360, 'Marlena');
insert into CINEMA_ROOM (room_number, names)
values (361, 'Prissie');
insert into CINEMA_ROOM (room_number, names)
values (362, 'Tabbie');
insert into CINEMA_ROOM (room_number, names)
values (363, 'Mendy');
insert into CINEMA_ROOM (room_number, names)
values (364, 'Stacy');
insert into CINEMA_ROOM (room_number, names)
values (365, 'Rogerio');
insert into CINEMA_ROOM (room_number, names)
values (366, 'Abramo');
insert into CINEMA_ROOM (room_number, names)
values (367, 'Terri');
insert into CINEMA_ROOM (room_number, names)
values (368, 'Renaud');
insert into CINEMA_ROOM (room_number, names)
values (369, 'Krystal');
insert into CINEMA_ROOM (room_number, names)
values (370, 'Sharline');
insert into CINEMA_ROOM (room_number, names)
values (371, 'Evanne');
insert into CINEMA_ROOM (room_number, names)
values (372, 'Sharity');
insert into CINEMA_ROOM (room_number, names)
values (373, 'Ilene');
insert into CINEMA_ROOM (room_number, names)
values (374, 'Daphna');
insert into CINEMA_ROOM (room_number, names)
values (375, 'Janis');
insert into CINEMA_ROOM (room_number, names)
values (376, 'Staford');
insert into CINEMA_ROOM (room_number, names)
values (377, 'Lenard');
insert into CINEMA_ROOM (room_number, names)
values (378, 'Malynda');
insert into CINEMA_ROOM (room_number, names)
values (379, 'Cosette');
insert into CINEMA_ROOM (room_number, names)
values (380, 'Bibbye');
insert into CINEMA_ROOM (room_number, names)
values (381, 'Nat');
insert into CINEMA_ROOM (room_number, names)
values (382, 'Scarlett');
insert into CINEMA_ROOM (room_number, names)
values (383, 'Raimondo');
insert into CINEMA_ROOM (room_number, names)
values (384, 'Charisse');
insert into CINEMA_ROOM (room_number, names)
values (385, 'Barnie');
insert into CINEMA_ROOM (room_number, names)
values (386, 'Alvin');
insert into CINEMA_ROOM (room_number, names)
values (387, 'Josephina');
insert into CINEMA_ROOM (room_number, names)
values (388, 'Marijo');
insert into CINEMA_ROOM (room_number, names)
values (389, 'Reginauld');
insert into CINEMA_ROOM (room_number, names)
values (390, 'Annnora');
insert into CINEMA_ROOM (room_number, names)
values (391, 'Simonette');
insert into CINEMA_ROOM (room_number, names)
values (392, 'Collin');
insert into CINEMA_ROOM (room_number, names)
values (393, 'Doralynn');
insert into CINEMA_ROOM (room_number, names)
values (394, 'Whitby');
insert into CINEMA_ROOM (room_number, names)
values (395, 'Rayshell');
insert into CINEMA_ROOM (room_number, names)
values (396, 'Chico');
insert into CINEMA_ROOM (room_number, names)
values (397, 'Keefer');
insert into CINEMA_ROOM (room_number, names)
values (398, 'Franklyn');
insert into CINEMA_ROOM (room_number, names)
values (399, 'Rivi');
insert into CINEMA_ROOM (room_number, names)
values (400, 'Paton');
commit;
prompt 400 records loaded
prompt Loading PROJECTOR_EMPLOYEE...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (1, to_date('05-12-2023', 'dd-mm-yyyy'), 1, 9, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (2, to_date('03-02-2023', 'dd-mm-yyyy'), 3, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (3, to_date('26-03-2023', 'dd-mm-yyyy'), 1, 16, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (4, to_date('23-12-2023', 'dd-mm-yyyy'), 1, 19, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (5, to_date('10-05-2023', 'dd-mm-yyyy'), 2, 18, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (6, to_date('18-05-2023', 'dd-mm-yyyy'), 1, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (7, to_date('06-07-2023', 'dd-mm-yyyy'), 3, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (8, to_date('21-12-2023', 'dd-mm-yyyy'), 1, 6, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (9, to_date('11-08-2023', 'dd-mm-yyyy'), 3, 10, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (10, to_date('02-03-2023', 'dd-mm-yyyy'), 3, 10, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (11, to_date('03-01-2023', 'dd-mm-yyyy'), 3, 13, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (12, to_date('11-05-2023', 'dd-mm-yyyy'), 4, 5, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (13, to_date('16-09-2023', 'dd-mm-yyyy'), 4, 9, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (14, to_date('02-05-2023', 'dd-mm-yyyy'), 1, 9, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (15, to_date('20-01-2023', 'dd-mm-yyyy'), 2, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (16, to_date('08-10-2023', 'dd-mm-yyyy'), 2, 19, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (17, to_date('16-11-2023', 'dd-mm-yyyy'), 2, 7, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (18, to_date('07-09-2023', 'dd-mm-yyyy'), 2, 17, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (19, to_date('15-05-2023', 'dd-mm-yyyy'), 1, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (20, to_date('11-10-2023', 'dd-mm-yyyy'), 2, 3, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (21, to_date('14-10-2023', 'dd-mm-yyyy'), 3, 16, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (22, to_date('01-06-2023', 'dd-mm-yyyy'), 2, 4, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (23, to_date('24-07-2023', 'dd-mm-yyyy'), 3, 2, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (24, to_date('12-01-2023', 'dd-mm-yyyy'), 4, 3, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (25, to_date('07-11-2023', 'dd-mm-yyyy'), 1, 1, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (26, to_date('29-05-2023', 'dd-mm-yyyy'), 4, 10, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (27, to_date('11-01-2023', 'dd-mm-yyyy'), 2, 6, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (28, to_date('16-04-2023', 'dd-mm-yyyy'), 2, 5, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (29, to_date('02-07-2023', 'dd-mm-yyyy'), 4, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (30, to_date('23-03-2023', 'dd-mm-yyyy'), 4, 10, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (31, to_date('04-05-2023', 'dd-mm-yyyy'), 4, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (32, to_date('11-08-2023', 'dd-mm-yyyy'), 2, 1, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (33, to_date('18-11-2023', 'dd-mm-yyyy'), 3, 2, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (34, to_date('20-08-2023', 'dd-mm-yyyy'), 1, 9, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (35, to_date('24-05-2023', 'dd-mm-yyyy'), 3, 10, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (36, to_date('23-07-2023', 'dd-mm-yyyy'), 3, 9, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (37, to_date('22-06-2023', 'dd-mm-yyyy'), 1, 9, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (38, to_date('21-01-2023', 'dd-mm-yyyy'), 4, 10, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (39, to_date('02-12-2023', 'dd-mm-yyyy'), 2, 3, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (40, to_date('18-11-2023', 'dd-mm-yyyy'), 2, 14, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (41, to_date('20-04-2023', 'dd-mm-yyyy'), 2, 5, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (42, to_date('24-08-2023', 'dd-mm-yyyy'), 1, 5, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (43, to_date('01-02-2023', 'dd-mm-yyyy'), 4, 16, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (44, to_date('15-04-2023', 'dd-mm-yyyy'), 2, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (45, to_date('15-10-2023', 'dd-mm-yyyy'), 2, 4, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (46, to_date('14-06-2023', 'dd-mm-yyyy'), 3, 15, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (47, to_date('26-09-2023', 'dd-mm-yyyy'), 3, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (48, to_date('23-04-2023', 'dd-mm-yyyy'), 4, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (49, to_date('01-07-2023', 'dd-mm-yyyy'), 2, 4, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (50, to_date('01-06-2023', 'dd-mm-yyyy'), 1, 5, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (51, to_date('19-07-2023', 'dd-mm-yyyy'), 3, 3, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (52, to_date('16-07-2023', 'dd-mm-yyyy'), 3, 6, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (53, to_date('07-11-2023', 'dd-mm-yyyy'), 4, 2, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (54, to_date('20-12-2023', 'dd-mm-yyyy'), 4, 12, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (55, to_date('29-12-2023', 'dd-mm-yyyy'), 4, 14, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (56, to_date('17-10-2023', 'dd-mm-yyyy'), 4, 13, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (57, to_date('31-08-2023', 'dd-mm-yyyy'), 2, 4, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (58, to_date('25-04-2023', 'dd-mm-yyyy'), 3, 5, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (59, to_date('03-12-2023', 'dd-mm-yyyy'), 2, 17, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (60, to_date('27-04-2023', 'dd-mm-yyyy'), 2, 3, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (61, to_date('08-11-2023', 'dd-mm-yyyy'), 1, 6, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (62, to_date('14-12-2023', 'dd-mm-yyyy'), 4, 2, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (63, to_date('30-08-2023', 'dd-mm-yyyy'), 3, 10, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (64, to_date('19-03-2023', 'dd-mm-yyyy'), 3, 20, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (65, to_date('18-07-2023', 'dd-mm-yyyy'), 4, 7, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (66, to_date('21-06-2023', 'dd-mm-yyyy'), 1, 17, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (67, to_date('15-07-2023', 'dd-mm-yyyy'), 2, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (68, to_date('30-04-2023', 'dd-mm-yyyy'), 2, 3, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (69, to_date('13-11-2023', 'dd-mm-yyyy'), 2, 17, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (70, to_date('30-12-2023', 'dd-mm-yyyy'), 1, 2, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (71, to_date('02-11-2023', 'dd-mm-yyyy'), 4, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (72, to_date('27-04-2023', 'dd-mm-yyyy'), 2, 18, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (73, to_date('16-02-2023', 'dd-mm-yyyy'), 2, 14, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (74, to_date('13-11-2023', 'dd-mm-yyyy'), 4, 2, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (75, to_date('15-07-2023', 'dd-mm-yyyy'), 3, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (76, to_date('19-08-2023', 'dd-mm-yyyy'), 3, 14, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (77, to_date('24-11-2023', 'dd-mm-yyyy'), 3, 20, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (78, to_date('17-06-2023', 'dd-mm-yyyy'), 3, 18, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (79, to_date('29-12-2023', 'dd-mm-yyyy'), 4, 15, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (80, to_date('09-01-2023', 'dd-mm-yyyy'), 4, 20, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (81, to_date('21-09-2023', 'dd-mm-yyyy'), 4, 19, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (82, to_date('10-12-2023', 'dd-mm-yyyy'), 1, 7, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (83, to_date('21-02-2023', 'dd-mm-yyyy'), 1, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (84, to_date('08-09-2023', 'dd-mm-yyyy'), 3, 14, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (85, to_date('07-10-2023', 'dd-mm-yyyy'), 4, 13, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (86, to_date('27-12-2023', 'dd-mm-yyyy'), 2, 9, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (87, to_date('23-05-2023', 'dd-mm-yyyy'), 1, 13, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (88, to_date('01-05-2023', 'dd-mm-yyyy'), 2, 14, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (89, to_date('15-03-2023', 'dd-mm-yyyy'), 2, 7, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (90, to_date('10-04-2023', 'dd-mm-yyyy'), 3, 14, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (91, to_date('09-06-2023', 'dd-mm-yyyy'), 1, 5, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (92, to_date('30-10-2023', 'dd-mm-yyyy'), 3, 6, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (93, to_date('04-02-2023', 'dd-mm-yyyy'), 4, 15, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (94, to_date('10-11-2023', 'dd-mm-yyyy'), 4, 17, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (95, to_date('02-06-2023', 'dd-mm-yyyy'), 2, 11, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (96, to_date('22-01-2023', 'dd-mm-yyyy'), 2, 18, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (97, to_date('07-09-2023', 'dd-mm-yyyy'), 2, 13, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (98, to_date('29-01-2023', 'dd-mm-yyyy'), 1, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (99, to_date('14-11-2023', 'dd-mm-yyyy'), 1, 8, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (100, to_date('02-10-2023', 'dd-mm-yyyy'), 3, 20, 'MovieD');
commit;
prompt 100 records committed...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (101, to_date('18-03-2023', 'dd-mm-yyyy'), 2, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (102, to_date('16-02-2023', 'dd-mm-yyyy'), 3, 7, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (103, to_date('20-01-2023', 'dd-mm-yyyy'), 1, 12, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (104, to_date('11-07-2023', 'dd-mm-yyyy'), 1, 9, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (105, to_date('03-06-2023', 'dd-mm-yyyy'), 3, 1, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (106, to_date('19-11-2023', 'dd-mm-yyyy'), 4, 9, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (107, to_date('29-07-2023', 'dd-mm-yyyy'), 4, 19, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (108, to_date('20-08-2023', 'dd-mm-yyyy'), 1, 4, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (109, to_date('16-07-2023', 'dd-mm-yyyy'), 2, 7, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (110, to_date('18-10-2023', 'dd-mm-yyyy'), 3, 19, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (111, to_date('02-12-2023', 'dd-mm-yyyy'), 1, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (112, to_date('16-08-2023', 'dd-mm-yyyy'), 3, 10, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (113, to_date('22-03-2023', 'dd-mm-yyyy'), 1, 5, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (114, to_date('07-01-2023', 'dd-mm-yyyy'), 2, 3, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (115, to_date('27-03-2023', 'dd-mm-yyyy'), 1, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (116, to_date('04-03-2023', 'dd-mm-yyyy'), 2, 15, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (117, to_date('15-12-2023', 'dd-mm-yyyy'), 2, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (118, to_date('17-01-2023', 'dd-mm-yyyy'), 4, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (119, to_date('27-06-2023', 'dd-mm-yyyy'), 4, 15, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (120, to_date('24-10-2023', 'dd-mm-yyyy'), 3, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (121, to_date('24-06-2023', 'dd-mm-yyyy'), 1, 5, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (122, to_date('07-06-2023', 'dd-mm-yyyy'), 1, 8, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (123, to_date('07-03-2023', 'dd-mm-yyyy'), 1, 3, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (124, to_date('02-03-2023', 'dd-mm-yyyy'), 4, 11, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (125, to_date('08-02-2023', 'dd-mm-yyyy'), 4, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (126, to_date('25-04-2023', 'dd-mm-yyyy'), 3, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (127, to_date('21-02-2023', 'dd-mm-yyyy'), 4, 7, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (128, to_date('18-01-2023', 'dd-mm-yyyy'), 3, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (129, to_date('25-05-2023', 'dd-mm-yyyy'), 2, 4, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (130, to_date('17-08-2023', 'dd-mm-yyyy'), 3, 3, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (131, to_date('29-06-2023', 'dd-mm-yyyy'), 2, 19, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (132, to_date('02-08-2023', 'dd-mm-yyyy'), 1, 11, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (133, to_date('11-02-2023', 'dd-mm-yyyy'), 2, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (134, to_date('21-02-2023', 'dd-mm-yyyy'), 3, 2, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (135, to_date('06-02-2023', 'dd-mm-yyyy'), 2, 18, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (136, to_date('27-05-2023', 'dd-mm-yyyy'), 4, 11, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (137, to_date('15-09-2023', 'dd-mm-yyyy'), 4, 6, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (138, to_date('26-12-2023', 'dd-mm-yyyy'), 2, 2, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (139, to_date('19-09-2023', 'dd-mm-yyyy'), 3, 2, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (140, to_date('24-08-2023', 'dd-mm-yyyy'), 4, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (141, to_date('01-11-2023', 'dd-mm-yyyy'), 2, 13, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (142, to_date('11-08-2023', 'dd-mm-yyyy'), 4, 9, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (143, to_date('15-05-2023', 'dd-mm-yyyy'), 4, 12, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (144, to_date('31-03-2023', 'dd-mm-yyyy'), 3, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (145, to_date('26-08-2023', 'dd-mm-yyyy'), 2, 1, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (146, to_date('28-01-2023', 'dd-mm-yyyy'), 1, 18, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (147, to_date('27-01-2023', 'dd-mm-yyyy'), 3, 1, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (148, to_date('06-02-2023', 'dd-mm-yyyy'), 2, 19, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (149, to_date('25-03-2023', 'dd-mm-yyyy'), 2, 6, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (150, to_date('16-11-2023', 'dd-mm-yyyy'), 4, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (151, to_date('10-03-2023', 'dd-mm-yyyy'), 1, 12, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (152, to_date('24-09-2023', 'dd-mm-yyyy'), 4, 16, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (153, to_date('30-05-2023', 'dd-mm-yyyy'), 2, 20, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (154, to_date('20-12-2023', 'dd-mm-yyyy'), 2, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (155, to_date('08-04-2023', 'dd-mm-yyyy'), 4, 1, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (156, to_date('10-06-2023', 'dd-mm-yyyy'), 1, 12, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (157, to_date('19-04-2023', 'dd-mm-yyyy'), 4, 5, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (158, to_date('01-08-2023', 'dd-mm-yyyy'), 3, 20, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (159, to_date('27-08-2023', 'dd-mm-yyyy'), 2, 8, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (160, to_date('12-04-2023', 'dd-mm-yyyy'), 3, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (161, to_date('23-04-2023', 'dd-mm-yyyy'), 4, 14, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (162, to_date('08-12-2023', 'dd-mm-yyyy'), 4, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (163, to_date('15-02-2023', 'dd-mm-yyyy'), 3, 13, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (164, to_date('02-11-2023', 'dd-mm-yyyy'), 4, 8, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (165, to_date('01-01-2023', 'dd-mm-yyyy'), 3, 14, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (166, to_date('20-03-2023', 'dd-mm-yyyy'), 4, 15, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (167, to_date('20-12-2023', 'dd-mm-yyyy'), 3, 3, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (168, to_date('19-10-2023', 'dd-mm-yyyy'), 1, 2, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (169, to_date('25-02-2023', 'dd-mm-yyyy'), 3, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (170, to_date('06-06-2023', 'dd-mm-yyyy'), 4, 11, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (171, to_date('21-05-2023', 'dd-mm-yyyy'), 3, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (172, to_date('04-02-2023', 'dd-mm-yyyy'), 3, 1, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (173, to_date('07-07-2023', 'dd-mm-yyyy'), 2, 17, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (174, to_date('17-09-2023', 'dd-mm-yyyy'), 4, 8, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (175, to_date('03-12-2023', 'dd-mm-yyyy'), 3, 19, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (176, to_date('05-09-2023', 'dd-mm-yyyy'), 2, 15, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (177, to_date('29-07-2023', 'dd-mm-yyyy'), 4, 8, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (178, to_date('21-05-2023', 'dd-mm-yyyy'), 4, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (179, to_date('06-08-2023', 'dd-mm-yyyy'), 2, 12, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (180, to_date('21-01-2023', 'dd-mm-yyyy'), 1, 11, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (181, to_date('29-04-2023', 'dd-mm-yyyy'), 1, 4, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (182, to_date('14-07-2023', 'dd-mm-yyyy'), 2, 19, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (183, to_date('29-08-2023', 'dd-mm-yyyy'), 4, 6, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (184, to_date('20-05-2023', 'dd-mm-yyyy'), 4, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (185, to_date('30-01-2023', 'dd-mm-yyyy'), 4, 2, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (186, to_date('08-03-2023', 'dd-mm-yyyy'), 3, 5, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (187, to_date('12-01-2023', 'dd-mm-yyyy'), 3, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (188, to_date('25-12-2023', 'dd-mm-yyyy'), 4, 9, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (189, to_date('03-09-2023', 'dd-mm-yyyy'), 4, 1, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (190, to_date('26-02-2023', 'dd-mm-yyyy'), 2, 17, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (191, to_date('11-07-2023', 'dd-mm-yyyy'), 2, 18, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (192, to_date('11-02-2023', 'dd-mm-yyyy'), 1, 20, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (193, to_date('04-09-2023', 'dd-mm-yyyy'), 2, 2, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (194, to_date('10-01-2023', 'dd-mm-yyyy'), 4, 7, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (195, to_date('03-08-2023', 'dd-mm-yyyy'), 3, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (196, to_date('18-08-2023', 'dd-mm-yyyy'), 3, 19, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (197, to_date('08-04-2023', 'dd-mm-yyyy'), 4, 4, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (198, to_date('08-07-2023', 'dd-mm-yyyy'), 2, 11, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (199, to_date('18-12-2023', 'dd-mm-yyyy'), 3, 10, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (200, to_date('23-03-2023', 'dd-mm-yyyy'), 4, 6, 'MovieA');
commit;
prompt 200 records committed...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (201, to_date('27-09-2023', 'dd-mm-yyyy'), 1, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (202, to_date('27-07-2023', 'dd-mm-yyyy'), 3, 4, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (203, to_date('05-10-2023', 'dd-mm-yyyy'), 4, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (204, to_date('26-10-2023', 'dd-mm-yyyy'), 3, 8, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (205, to_date('26-06-2023', 'dd-mm-yyyy'), 1, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (206, to_date('01-07-2023', 'dd-mm-yyyy'), 1, 4, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (207, to_date('16-03-2023', 'dd-mm-yyyy'), 4, 4, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (208, to_date('31-08-2023', 'dd-mm-yyyy'), 2, 14, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (209, to_date('12-11-2023', 'dd-mm-yyyy'), 1, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (210, to_date('02-09-2023', 'dd-mm-yyyy'), 4, 17, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (211, to_date('25-03-2023', 'dd-mm-yyyy'), 2, 17, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (212, to_date('08-11-2023', 'dd-mm-yyyy'), 4, 11, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (213, to_date('27-08-2023', 'dd-mm-yyyy'), 2, 17, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (214, to_date('31-10-2023', 'dd-mm-yyyy'), 2, 7, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (215, to_date('17-06-2023', 'dd-mm-yyyy'), 4, 5, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (216, to_date('13-08-2023', 'dd-mm-yyyy'), 3, 5, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (217, to_date('18-02-2023', 'dd-mm-yyyy'), 3, 13, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (218, to_date('22-05-2023', 'dd-mm-yyyy'), 1, 13, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (219, to_date('21-12-2023', 'dd-mm-yyyy'), 1, 12, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (220, to_date('13-04-2023', 'dd-mm-yyyy'), 2, 6, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (221, to_date('10-02-2023', 'dd-mm-yyyy'), 2, 2, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (222, to_date('22-06-2023', 'dd-mm-yyyy'), 1, 10, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (223, to_date('08-06-2023', 'dd-mm-yyyy'), 4, 17, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (224, to_date('03-08-2023', 'dd-mm-yyyy'), 4, 2, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (225, to_date('13-06-2023', 'dd-mm-yyyy'), 2, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (226, to_date('04-09-2023', 'dd-mm-yyyy'), 1, 18, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (227, to_date('03-11-2023', 'dd-mm-yyyy'), 3, 11, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (228, to_date('23-09-2023', 'dd-mm-yyyy'), 2, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (229, to_date('28-04-2023', 'dd-mm-yyyy'), 4, 3, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (230, to_date('07-01-2023', 'dd-mm-yyyy'), 3, 1, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (231, to_date('10-10-2023', 'dd-mm-yyyy'), 3, 10, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (232, to_date('17-08-2023', 'dd-mm-yyyy'), 3, 5, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (233, to_date('25-12-2023', 'dd-mm-yyyy'), 3, 9, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (234, to_date('12-06-2023', 'dd-mm-yyyy'), 3, 10, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (235, to_date('01-10-2023', 'dd-mm-yyyy'), 3, 8, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (236, to_date('13-09-2023', 'dd-mm-yyyy'), 2, 13, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (237, to_date('21-01-2023', 'dd-mm-yyyy'), 1, 20, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (238, to_date('27-03-2023', 'dd-mm-yyyy'), 1, 7, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (239, to_date('08-04-2023', 'dd-mm-yyyy'), 3, 17, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (240, to_date('21-08-2023', 'dd-mm-yyyy'), 3, 13, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (241, to_date('28-03-2023', 'dd-mm-yyyy'), 2, 17, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (242, to_date('28-03-2023', 'dd-mm-yyyy'), 1, 6, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (243, to_date('30-06-2023', 'dd-mm-yyyy'), 1, 4, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (244, to_date('10-04-2023', 'dd-mm-yyyy'), 3, 2, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (245, to_date('22-10-2023', 'dd-mm-yyyy'), 2, 8, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (246, to_date('30-09-2023', 'dd-mm-yyyy'), 2, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (247, to_date('10-04-2023', 'dd-mm-yyyy'), 2, 14, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (248, to_date('15-12-2023', 'dd-mm-yyyy'), 4, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (249, to_date('20-09-2023', 'dd-mm-yyyy'), 2, 2, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (250, to_date('11-10-2023', 'dd-mm-yyyy'), 1, 4, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (251, to_date('12-12-2023', 'dd-mm-yyyy'), 1, 7, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (252, to_date('12-01-2023', 'dd-mm-yyyy'), 1, 18, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (253, to_date('19-10-2023', 'dd-mm-yyyy'), 4, 9, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (254, to_date('20-05-2023', 'dd-mm-yyyy'), 4, 19, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (255, to_date('23-10-2023', 'dd-mm-yyyy'), 2, 11, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (256, to_date('19-01-2023', 'dd-mm-yyyy'), 1, 17, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (257, to_date('03-08-2023', 'dd-mm-yyyy'), 3, 7, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (258, to_date('04-09-2023', 'dd-mm-yyyy'), 4, 19, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (259, to_date('08-04-2023', 'dd-mm-yyyy'), 4, 8, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (260, to_date('31-10-2023', 'dd-mm-yyyy'), 3, 1, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (261, to_date('25-06-2023', 'dd-mm-yyyy'), 3, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (262, to_date('14-04-2023', 'dd-mm-yyyy'), 3, 6, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (263, to_date('18-08-2023', 'dd-mm-yyyy'), 3, 12, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (264, to_date('06-05-2023', 'dd-mm-yyyy'), 1, 15, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (265, to_date('05-09-2023', 'dd-mm-yyyy'), 4, 11, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (266, to_date('01-06-2023', 'dd-mm-yyyy'), 1, 5, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (267, to_date('12-11-2023', 'dd-mm-yyyy'), 3, 10, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (268, to_date('13-09-2023', 'dd-mm-yyyy'), 3, 9, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (269, to_date('27-11-2023', 'dd-mm-yyyy'), 4, 16, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (270, to_date('14-01-2023', 'dd-mm-yyyy'), 3, 19, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (271, to_date('02-02-2023', 'dd-mm-yyyy'), 3, 6, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (272, to_date('06-01-2023', 'dd-mm-yyyy'), 4, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (273, to_date('07-12-2023', 'dd-mm-yyyy'), 1, 15, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (274, to_date('02-04-2023', 'dd-mm-yyyy'), 2, 4, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (275, to_date('17-12-2023', 'dd-mm-yyyy'), 4, 19, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (276, to_date('12-06-2023', 'dd-mm-yyyy'), 1, 2, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (277, to_date('08-09-2023', 'dd-mm-yyyy'), 4, 10, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (278, to_date('09-08-2023', 'dd-mm-yyyy'), 3, 3, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (279, to_date('16-07-2023', 'dd-mm-yyyy'), 4, 15, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (280, to_date('20-02-2023', 'dd-mm-yyyy'), 2, 3, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (281, to_date('12-10-2023', 'dd-mm-yyyy'), 4, 6, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (282, to_date('16-12-2023', 'dd-mm-yyyy'), 1, 3, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (283, to_date('27-02-2023', 'dd-mm-yyyy'), 1, 13, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (284, to_date('07-02-2023', 'dd-mm-yyyy'), 1, 2, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (285, to_date('11-08-2023', 'dd-mm-yyyy'), 4, 5, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (286, to_date('08-12-2023', 'dd-mm-yyyy'), 3, 7, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (287, to_date('20-06-2023', 'dd-mm-yyyy'), 3, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (288, to_date('29-08-2023', 'dd-mm-yyyy'), 3, 13, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (289, to_date('18-03-2023', 'dd-mm-yyyy'), 3, 2, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (290, to_date('21-11-2023', 'dd-mm-yyyy'), 3, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (291, to_date('17-01-2023', 'dd-mm-yyyy'), 3, 3, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (292, to_date('07-03-2023', 'dd-mm-yyyy'), 4, 20, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (293, to_date('06-02-2023', 'dd-mm-yyyy'), 4, 15, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (294, to_date('10-07-2023', 'dd-mm-yyyy'), 1, 7, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (295, to_date('02-10-2023', 'dd-mm-yyyy'), 3, 1, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (296, to_date('20-12-2023', 'dd-mm-yyyy'), 4, 4, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (297, to_date('14-01-2023', 'dd-mm-yyyy'), 2, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (298, to_date('28-11-2023', 'dd-mm-yyyy'), 3, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (299, to_date('18-01-2023', 'dd-mm-yyyy'), 3, 7, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (300, to_date('18-09-2023', 'dd-mm-yyyy'), 1, 17, 'MovieD');
commit;
prompt 300 records committed...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (301, to_date('28-03-2023', 'dd-mm-yyyy'), 4, 11, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (302, to_date('24-03-2023', 'dd-mm-yyyy'), 2, 1, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (303, to_date('01-02-2023', 'dd-mm-yyyy'), 1, 19, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (304, to_date('14-02-2023', 'dd-mm-yyyy'), 2, 18, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (305, to_date('04-03-2023', 'dd-mm-yyyy'), 1, 3, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (306, to_date('30-05-2023', 'dd-mm-yyyy'), 4, 17, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (307, to_date('09-01-2023', 'dd-mm-yyyy'), 4, 5, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (308, to_date('12-01-2023', 'dd-mm-yyyy'), 3, 2, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (309, to_date('21-09-2023', 'dd-mm-yyyy'), 2, 20, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (310, to_date('15-01-2023', 'dd-mm-yyyy'), 1, 11, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (311, to_date('30-03-2023', 'dd-mm-yyyy'), 3, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (312, to_date('25-04-2023', 'dd-mm-yyyy'), 3, 1, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (313, to_date('16-06-2023', 'dd-mm-yyyy'), 2, 17, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (314, to_date('02-12-2023', 'dd-mm-yyyy'), 2, 12, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (315, to_date('02-01-2023', 'dd-mm-yyyy'), 3, 9, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (316, to_date('09-02-2023', 'dd-mm-yyyy'), 2, 11, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (317, to_date('17-11-2023', 'dd-mm-yyyy'), 2, 5, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (318, to_date('25-02-2023', 'dd-mm-yyyy'), 3, 18, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (319, to_date('08-07-2023', 'dd-mm-yyyy'), 4, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (320, to_date('19-11-2023', 'dd-mm-yyyy'), 4, 3, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (321, to_date('08-11-2023', 'dd-mm-yyyy'), 1, 4, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (322, to_date('16-07-2023', 'dd-mm-yyyy'), 3, 17, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (323, to_date('21-02-2023', 'dd-mm-yyyy'), 4, 1, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (324, to_date('17-10-2023', 'dd-mm-yyyy'), 3, 8, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (325, to_date('23-02-2023', 'dd-mm-yyyy'), 2, 5, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (326, to_date('14-08-2023', 'dd-mm-yyyy'), 4, 13, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (327, to_date('25-03-2023', 'dd-mm-yyyy'), 4, 18, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (328, to_date('18-11-2023', 'dd-mm-yyyy'), 4, 5, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (329, to_date('05-04-2023', 'dd-mm-yyyy'), 1, 13, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (330, to_date('24-03-2023', 'dd-mm-yyyy'), 4, 18, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (331, to_date('21-05-2023', 'dd-mm-yyyy'), 1, 20, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (332, to_date('23-01-2023', 'dd-mm-yyyy'), 2, 8, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (333, to_date('18-04-2023', 'dd-mm-yyyy'), 3, 8, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (334, to_date('10-02-2023', 'dd-mm-yyyy'), 3, 18, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (335, to_date('08-11-2023', 'dd-mm-yyyy'), 4, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (336, to_date('14-04-2023', 'dd-mm-yyyy'), 1, 11, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (337, to_date('29-07-2023', 'dd-mm-yyyy'), 4, 20, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (338, to_date('11-01-2023', 'dd-mm-yyyy'), 3, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (339, to_date('24-10-2023', 'dd-mm-yyyy'), 2, 19, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (340, to_date('25-07-2023', 'dd-mm-yyyy'), 2, 3, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (341, to_date('13-10-2023', 'dd-mm-yyyy'), 3, 19, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (342, to_date('14-10-2023', 'dd-mm-yyyy'), 1, 14, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (343, to_date('02-10-2023', 'dd-mm-yyyy'), 3, 18, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (344, to_date('20-09-2023', 'dd-mm-yyyy'), 3, 6, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (345, to_date('23-05-2023', 'dd-mm-yyyy'), 3, 12, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (346, to_date('06-08-2023', 'dd-mm-yyyy'), 2, 18, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (347, to_date('06-11-2023', 'dd-mm-yyyy'), 3, 14, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (348, to_date('20-07-2023', 'dd-mm-yyyy'), 3, 17, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (349, to_date('12-05-2023', 'dd-mm-yyyy'), 2, 10, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (350, to_date('26-03-2023', 'dd-mm-yyyy'), 1, 3, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (351, to_date('04-02-2023', 'dd-mm-yyyy'), 1, 9, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (352, to_date('13-06-2023', 'dd-mm-yyyy'), 1, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (353, to_date('15-10-2023', 'dd-mm-yyyy'), 4, 13, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (354, to_date('06-10-2023', 'dd-mm-yyyy'), 3, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (355, to_date('25-05-2023', 'dd-mm-yyyy'), 2, 12, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (356, to_date('05-12-2023', 'dd-mm-yyyy'), 1, 10, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (357, to_date('11-11-2023', 'dd-mm-yyyy'), 2, 1, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (358, to_date('23-07-2023', 'dd-mm-yyyy'), 1, 12, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (359, to_date('11-12-2023', 'dd-mm-yyyy'), 4, 7, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (360, to_date('26-07-2023', 'dd-mm-yyyy'), 4, 15, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (361, to_date('27-01-2023', 'dd-mm-yyyy'), 3, 15, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (362, to_date('10-03-2023', 'dd-mm-yyyy'), 1, 7, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (363, to_date('19-03-2023', 'dd-mm-yyyy'), 1, 4, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (364, to_date('03-10-2023', 'dd-mm-yyyy'), 3, 1, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (365, to_date('24-05-2023', 'dd-mm-yyyy'), 2, 4, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (366, to_date('02-12-2023', 'dd-mm-yyyy'), 3, 19, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (367, to_date('17-12-2023', 'dd-mm-yyyy'), 1, 17, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (368, to_date('19-02-2023', 'dd-mm-yyyy'), 1, 16, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (369, to_date('04-10-2023', 'dd-mm-yyyy'), 2, 10, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (370, to_date('29-06-2023', 'dd-mm-yyyy'), 1, 19, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (371, to_date('18-11-2023', 'dd-mm-yyyy'), 2, 20, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (372, to_date('04-02-2023', 'dd-mm-yyyy'), 4, 8, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (373, to_date('20-02-2023', 'dd-mm-yyyy'), 4, 14, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (374, to_date('29-06-2023', 'dd-mm-yyyy'), 4, 18, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (375, to_date('10-09-2023', 'dd-mm-yyyy'), 3, 16, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (376, to_date('16-07-2023', 'dd-mm-yyyy'), 4, 9, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (377, to_date('30-04-2023', 'dd-mm-yyyy'), 3, 18, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (378, to_date('24-08-2023', 'dd-mm-yyyy'), 2, 1, 'MovieD');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (379, to_date('24-07-2023', 'dd-mm-yyyy'), 2, 6, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (380, to_date('06-07-2023', 'dd-mm-yyyy'), 1, 7, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (381, to_date('18-03-2023', 'dd-mm-yyyy'), 1, 15, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (382, to_date('16-11-2023', 'dd-mm-yyyy'), 1, 14, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (383, to_date('06-11-2023', 'dd-mm-yyyy'), 1, 17, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (384, to_date('21-05-2023', 'dd-mm-yyyy'), 1, 11, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (385, to_date('08-09-2023', 'dd-mm-yyyy'), 3, 8, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (386, to_date('14-12-2023', 'dd-mm-yyyy'), 4, 5, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (387, to_date('28-02-2023', 'dd-mm-yyyy'), 2, 16, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (388, to_date('21-08-2023', 'dd-mm-yyyy'), 1, 1, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (389, to_date('14-01-2023', 'dd-mm-yyyy'), 3, 4, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (390, to_date('17-08-2023', 'dd-mm-yyyy'), 4, 20, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (391, to_date('27-09-2023', 'dd-mm-yyyy'), 2, 13, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (392, to_date('17-01-2023', 'dd-mm-yyyy'), 2, 13, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (393, to_date('04-04-2023', 'dd-mm-yyyy'), 4, 3, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (394, to_date('09-04-2023', 'dd-mm-yyyy'), 3, 17, 'MovieE');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (395, to_date('04-01-2023', 'dd-mm-yyyy'), 1, 1, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (396, to_date('26-11-2023', 'dd-mm-yyyy'), 2, 13, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (397, to_date('18-03-2023', 'dd-mm-yyyy'), 1, 10, 'MovieC');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (398, to_date('28-10-2023', 'dd-mm-yyyy'), 2, 2, 'MovieB');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (399, to_date('21-03-2023', 'dd-mm-yyyy'), 3, 5, 'MovieA');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (400, to_date('30-07-2023', 'dd-mm-yyyy'), 2, 1, 'MovieC');
commit;
prompt 400 records loaded
prompt Loading MOVIE...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (1, 'Pierce', 90, 'Fantasy', 11, 1);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (2, 'Praga', 110, 'Fantasy', 13, 2);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (3, 'Peabo', 138, 'Documentary', 1, 3);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (4, 'Leslie', 146, 'Animation', 6, 4);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (5, 'Praga', 117, 'Horror', 15, 5);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (6, 'Tal', 155, 'Science Fiction', 14, 6);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (7, 'Madeline', 95, 'Thriller', 4, 7);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (8, 'Tara', 176, 'Action', 20, 8);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (9, 'Jaime', 130, 'Fantasy', 4, 9);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (10, 'Tim', 116, 'Horror', 15, 10);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (11, 'Howie', 61, 'Horror', 18, 11);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (12, 'Joan', 61, 'Horror', 1, 12);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (13, 'Sylvester', 152, 'Comedy', 4, 13);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (14, 'Rosario', 108, 'Science Fiction', 1, 14);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (15, 'Fairuza', 177, 'Documentary', 2, 15);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (16, 'Rawlins', 88, 'Horror', 3, 16);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (17, 'Morgan', 79, 'Romance', 3, 17);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (18, 'Rene', 136, 'Comedy', 16, 18);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (19, 'Gran', 155, 'Action', 18, 19);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (20, 'Diamond', 66, 'Animation', 9, 20);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (21, 'Daniel', 160, 'Fantasy', 8, 21);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (22, 'Isaiah', 84, 'Animation', 14, 22);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (23, 'Parker', 112, 'Drama', 15, 23);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (24, 'Demi', 168, 'Animation', 11, 24);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (25, 'Brent', 140, 'Action', 2, 25);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (26, 'Suzi', 75, 'Animation', 5, 26);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (27, 'Rodney', 86, 'Horror', 19, 27);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (28, 'Eugene', 70, 'Romance', 2, 28);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (29, 'George', 101, 'Thriller', 6, 29);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (30, 'Dar', 96, 'Documentary', 5, 30);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (31, 'Jet', 143, 'Fantasy', 2, 31);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (32, 'Gwyneth', 159, 'Documentary', 9, 32);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (33, 'Jennifer', 94, 'Romance', 14, 33);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (34, 'Emma', 115, 'Animation', 5, 34);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (35, 'Carolyn', 129, 'Comedy', 8, 35);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (36, 'Tony', 71, 'Science Fiction', 14, 36);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (37, 'Miko', 123, 'Animation', 15, 37);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (38, 'Davis', 69, 'Fantasy', 17, 38);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (39, 'Christina', 150, 'Documentary', 7, 39);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (40, 'Devon', 137, 'Fantasy', 9, 40);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (41, 'Chuck', 148, 'Thriller', 9, 41);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (42, 'Jean-Claude', 105, 'Documentary', 9, 42);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (43, 'Stephanie', 75, 'Documentary', 18, 43);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (44, 'Jesus', 162, 'Documentary', 1, 44);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (45, 'Dionne', 70, 'Drama', 8, 45);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (46, 'Stewart', 81, 'Romance', 6, 46);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (47, 'Roger', 138, 'Horror', 2, 47);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (48, 'Sarah', 149, 'Fantasy', 4, 48);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (49, 'Jody', 89, 'Fantasy', 16, 49);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (50, 'Edie', 170, 'Action', 6, 50);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (51, 'Sheryl', 81, 'Documentary', 9, 51);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (52, 'Arturo', 166, 'Thriller', 3, 52);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (53, 'Sharon', 91, 'Documentary', 20, 53);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (54, 'Catherine', 121, 'Animation', 2, 54);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (55, 'Kyle', 114, 'Documentary', 8, 55);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (56, 'Chrissie', 95, 'Romance', 9, 56);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (57, 'Cloris', 126, 'Science Fiction', 20, 57);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (58, 'Christopher', 103, 'Science Fiction', 16, 58);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (59, 'Barbara', 62, 'Fantasy', 13, 59);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (60, 'Tzi', 117, 'Comedy', 3, 60);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (61, 'Willem', 156, 'Fantasy', 18, 61);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (62, 'Frankie', 88, 'Animation', 5, 62);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (63, 'Mili', 84, 'Documentary', 13, 63);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (64, 'Betty', 87, 'Drama', 5, 64);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (65, 'Tea', 170, 'Thriller', 5, 65);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (66, 'Wallace', 91, 'Animation', 12, 66);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (67, 'Ming-Na', 179, 'Horror', 4, 67);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (68, 'Eddie', 144, 'Horror', 5, 68);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (69, 'Rip', 176, 'Horror', 11, 69);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (70, 'Denis', 157, 'Fantasy', 12, 70);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (71, 'Paula', 60, 'Fantasy', 13, 71);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (72, 'Johnnie', 88, 'Animation', 11, 72);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (73, 'Tobey', 73, 'Comedy', 13, 73);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (74, 'Wang', 115, 'Comedy', 1, 74);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (75, 'Balthazar', 111, 'Documentary', 9, 75);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (76, 'Bobbi', 105, 'Horror', 18, 76);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (77, 'Clint', 125, 'Action', 5, 77);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (78, 'Chi', 171, 'Fantasy', 8, 78);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (79, 'Kenneth', 173, 'Drama', 12, 79);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (80, 'Chad', 152, 'Fantasy', 14, 80);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (81, 'Debbie', 111, 'Documentary', 4, 81);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (82, 'Terry', 62, 'Animation', 1, 82);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (83, 'Scott', 141, 'Animation', 20, 83);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (84, 'Joey', 71, 'Documentary', 12, 84);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (85, 'Nik', 160, 'Action', 2, 85);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (86, 'Ron', 127, 'Science Fiction', 15, 86);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (87, 'Timothy', 75, 'Science Fiction', 1, 87);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (88, 'Sona', 66, 'Science Fiction', 19, 88);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (89, 'Johnny', 140, 'Action', 14, 89);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (90, 'Xander', 97, 'Science Fiction', 4, 90);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (91, 'Ryan', 74, 'Animation', 17, 91);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (92, 'Holland', 87, 'Thriller', 1, 92);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (93, 'Morgan', 136, 'Horror', 4, 93);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (94, 'Harry', 174, 'Horror', 6, 94);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (95, 'CeCe', 145, 'Romance', 19, 95);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (96, 'Holland', 70, 'Comedy', 17, 96);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (97, 'Avril', 77, 'Documentary', 19, 97);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (98, 'Sara', 175, 'Animation', 15, 98);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (99, 'Albertina', 76, 'Thriller', 9, 99);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (100, 'Ronnie', 166, 'Science Fiction', 2, 100);
commit;
prompt 100 records committed...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (101, 'Beth', 94, 'Drama', 11, 101);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (102, 'Joely', 131, 'Romance', 6, 102);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (103, 'Juliana', 156, 'Science Fiction', 15, 103);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (104, 'Graham', 134, 'Science Fiction', 1, 104);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (105, 'Breckin', 146, 'Romance', 12, 105);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (106, 'Lucy', 159, 'Fantasy', 10, 106);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (107, 'Louise', 76, 'Fantasy', 12, 107);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (108, 'Merle', 175, 'Comedy', 14, 108);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (109, 'Lynette', 136, 'Action', 18, 109);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (110, 'Chely', 90, 'Action', 15, 110);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (111, 'Laura', 130, 'Fantasy', 2, 111);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (112, 'James', 80, 'Animation', 6, 112);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (113, 'Graham', 145, 'Animation', 3, 113);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (114, 'Raul', 68, 'Action', 20, 114);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (115, 'Wade', 124, 'Action', 10, 115);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (116, 'Pamela', 70, 'Comedy', 18, 116);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (117, 'Mel', 62, 'Horror', 1, 117);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (118, 'Wayman', 177, 'Fantasy', 3, 118);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (119, 'Barbara', 87, 'Romance', 4, 119);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (120, 'Chalee', 63, 'Fantasy', 12, 120);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (121, 'Gordon', 180, 'Thriller', 1, 121);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (122, 'Hugo', 74, 'Horror', 9, 122);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (123, 'Rebecca', 151, 'Horror', 15, 123);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (124, 'Steven', 146, 'Horror', 1, 124);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (125, 'Fionnula', 101, 'Science Fiction', 11, 125);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (126, 'Tobey', 65, 'Fantasy', 16, 126);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (127, 'Albert', 172, 'Romance', 11, 127);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (128, 'Benjamin', 90, 'Animation', 18, 128);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (129, 'Ethan', 177, 'Action', 12, 129);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (130, 'Tony', 137, 'Thriller', 10, 130);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (131, 'Rolando', 91, 'Fantasy', 5, 131);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (132, 'Sigourney', 62, 'Fantasy', 8, 132);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (133, 'Hex', 178, 'Action', 20, 133);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (134, 'Jena', 64, 'Animation', 10, 134);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (135, 'Leelee', 167, 'Horror', 2, 135);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (136, 'Neil', 138, 'Fantasy', 11, 136);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (137, 'Avenged', 123, 'Drama', 1, 137);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (138, 'Famke', 131, 'Thriller', 14, 138);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (139, 'Brooke', 121, 'Documentary', 9, 139);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (140, 'Hugh', 174, 'Science Fiction', 12, 140);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (141, 'Hugo', 160, 'Romance', 15, 141);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (142, 'Howie', 154, 'Drama', 15, 142);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (143, 'Art', 99, 'Animation', 3, 143);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (144, 'Jimmy', 158, 'Fantasy', 15, 144);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (145, 'Elvis', 69, 'Drama', 9, 145);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (146, 'Sammy', 81, 'Science Fiction', 2, 146);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (147, 'Shirley', 178, 'Thriller', 2, 147);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (148, 'Cesar', 86, 'Horror', 6, 148);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (149, 'Leelee', 100, 'Drama', 2, 149);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (150, 'Charlton', 104, 'Horror', 14, 150);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (151, 'Bradley', 118, 'Comedy', 9, 151);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (152, 'Patti', 71, 'Science Fiction', 2, 152);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (153, 'Donald', 125, 'Science Fiction', 16, 153);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (154, 'Isaac', 166, 'Documentary', 8, 154);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (155, 'Kurt', 80, 'Drama', 6, 155);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (156, 'Nils', 97, 'Thriller', 5, 156);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (157, 'Powers', 110, 'Horror', 5, 157);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (158, 'Juliette', 79, 'Romance', 3, 158);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (159, 'Jeroen', 135, 'Horror', 20, 159);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (160, 'Tamala', 132, 'Romance', 4, 160);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (161, 'Yaphet', 106, 'Comedy', 20, 161);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (162, 'Doug', 114, 'Documentary', 18, 162);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (163, 'Norm', 132, 'Documentary', 12, 163);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (164, 'Neneh', 117, 'Fantasy', 8, 164);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (165, 'Mary-Louise', 124, 'Comedy', 5, 165);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (166, 'Murray', 154, 'Drama', 11, 166);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (167, 'Bill', 180, 'Animation', 7, 167);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (168, 'Dick', 85, 'Fantasy', 15, 168);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (169, 'Demi', 126, 'Animation', 17, 169);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (170, 'Burton', 166, 'Horror', 13, 170);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (171, 'Ed', 154, 'Horror', 20, 171);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (172, 'Mark', 148, 'Animation', 18, 172);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (173, 'Judge', 138, 'Horror', 1, 173);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (174, 'Jackson', 75, 'Science Fiction', 17, 174);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (175, 'Corey', 169, 'Thriller', 7, 175);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (176, 'Alfie', 130, 'Action', 15, 176);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (177, 'Hank', 123, 'Documentary', 19, 177);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (178, 'Christine', 116, 'Science Fiction', 5, 178);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (179, 'Cornell', 92, 'Action', 15, 179);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (180, 'Vendetta', 162, 'Horror', 18, 180);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (181, 'Gino', 91, 'Drama', 12, 181);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (182, 'Sander', 103, 'Animation', 17, 182);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (183, 'Chris', 137, 'Romance', 6, 183);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (184, 'Jeanne', 73, 'Horror', 4, 184);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (185, 'Larry', 95, 'Drama', 17, 185);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (186, 'Anita', 148, 'Romance', 20, 186);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (187, 'Petula', 134, 'Thriller', 12, 187);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (188, 'Chalee', 105, 'Thriller', 17, 188);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (189, 'Treat', 102, 'Romance', 11, 189);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (190, 'Lupe', 168, 'Romance', 17, 190);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (191, 'Lindsey', 123, 'Thriller', 17, 191);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (192, 'Mia', 180, 'Action', 6, 192);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (193, 'Liquid', 104, 'Comedy', 20, 193);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (194, 'Rowan', 119, 'Comedy', 16, 194);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (195, 'Harris', 107, 'Comedy', 12, 195);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (196, 'Lindsay', 135, 'Drama', 5, 196);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (197, 'Nicholas', 114, 'Action', 11, 197);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (198, 'Noah', 111, 'Documentary', 17, 198);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (199, 'Debi', 166, 'Thriller', 20, 199);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (200, 'Reese', 79, 'Romance', 7, 200);
commit;
prompt 200 records committed...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (201, 'Yaphet', 153, 'Fantasy', 16, 201);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (202, 'Bebe', 158, 'Animation', 4, 202);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (203, 'Nicole', 84, 'Action', 6, 203);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (204, 'Liv', 140, 'Horror', 13, 204);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (205, 'Percy', 129, 'Fantasy', 3, 205);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (206, 'Ossie', 169, 'Science Fiction', 10, 206);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (207, 'Brittany', 67, 'Comedy', 5, 207);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (208, 'Stockard', 99, 'Animation', 18, 208);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (209, 'Angela', 65, 'Comedy', 8, 209);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (210, 'Petula', 65, 'Romance', 8, 210);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (211, 'Lucy', 136, 'Horror', 12, 211);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (212, 'Joaquim', 102, 'Documentary', 20, 212);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (213, 'Thin', 94, 'Thriller', 16, 213);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (214, 'Lynn', 128, 'Drama', 20, 214);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (215, 'Jackson', 113, 'Animation', 8, 215);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (216, 'Ahmad', 175, 'Romance', 10, 216);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (217, 'Max', 89, 'Action', 18, 217);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (218, 'Garland', 153, 'Comedy', 4, 218);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (219, 'Billy', 98, 'Comedy', 14, 219);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (220, 'Jimmy', 93, 'Comedy', 2, 220);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (221, 'Quentin', 137, 'Romance', 15, 221);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (222, 'Philip', 165, 'Fantasy', 6, 222);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (223, 'Lena', 105, 'Horror', 13, 223);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (224, 'Boyd', 96, 'Drama', 18, 224);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (225, 'Javon', 172, 'Documentary', 8, 225);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (226, 'Mykelti', 166, 'Thriller', 3, 226);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (227, 'Javon', 168, 'Horror', 6, 227);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (228, 'Ralph', 159, 'Fantasy', 1, 228);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (229, 'Kasey', 85, 'Drama', 5, 229);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (230, 'Azucar', 131, 'Action', 18, 230);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (231, 'Carolyn', 93, 'Romance', 13, 231);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (232, 'Beth', 104, 'Science Fiction', 1, 232);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (233, 'Quentin', 82, 'Comedy', 14, 233);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (234, 'Coley', 120, 'Documentary', 6, 234);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (235, 'Bob', 60, 'Comedy', 9, 235);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (236, 'Lee', 75, 'Romance', 3, 236);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (237, 'Boz', 71, 'Thriller', 7, 237);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (238, 'Shannon', 149, 'Fantasy', 1, 238);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (239, 'Tracy', 126, 'Thriller', 8, 239);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (240, 'Salma', 170, 'Action', 18, 240);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (241, 'Mitchell', 136, 'Romance', 13, 241);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (242, 'Matt', 63, 'Romance', 9, 242);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (243, 'Nils', 99, 'Animation', 12, 243);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (244, 'Teena', 70, 'Action', 13, 244);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (245, 'Clea', 169, 'Comedy', 1, 245);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (246, 'Tia', 132, 'Fantasy', 11, 246);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (247, 'Aida', 134, 'Science Fiction', 5, 247);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (248, 'Debbie', 119, 'Romance', 14, 248);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (249, 'Thin', 105, 'Thriller', 17, 249);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (250, 'Elvis', 76, 'Documentary', 19, 250);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (251, 'Clay', 124, 'Fantasy', 13, 251);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (252, 'Tcheky', 106, 'Animation', 2, 252);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (253, 'Brittany', 152, 'Documentary', 5, 253);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (254, 'Julianne', 146, 'Fantasy', 18, 254);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (255, 'Kurtwood', 172, 'Documentary', 20, 255);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (256, 'Yaphet', 107, 'Fantasy', 15, 256);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (257, 'Uma', 65, 'Fantasy', 19, 257);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (258, 'Sal', 150, 'Fantasy', 18, 258);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (259, 'Kristin', 100, 'Animation', 14, 259);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (260, 'Lena', 113, 'Comedy', 2, 260);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (261, 'Tobey', 98, 'Comedy', 13, 261);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (262, 'Don', 169, 'Fantasy', 2, 262);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (263, 'Tramaine', 172, 'Science Fiction', 16, 263);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (264, 'Taye', 143, 'Action', 9, 264);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (265, 'Thelma', 155, 'Thriller', 7, 265);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (266, 'Jude', 67, 'Comedy', 18, 266);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (267, 'Armand', 113, 'Documentary', 9, 267);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (268, 'Roddy', 117, 'Thriller', 9, 268);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (269, 'Ivan', 145, 'Science Fiction', 19, 269);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (270, 'Gerald', 89, 'Thriller', 1, 270);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (271, 'Sandra', 72, 'Action', 6, 271);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (272, 'Merrilee', 87, 'Comedy', 10, 272);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (273, 'Nancy', 93, 'Science Fiction', 9, 273);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (274, 'Rosanne', 126, 'Action', 7, 274);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (275, 'Darius', 130, 'Fantasy', 19, 275);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (276, 'Mac', 112, 'Science Fiction', 2, 276);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (277, 'Aida', 134, 'Comedy', 13, 277);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (278, 'Glen', 70, 'Animation', 20, 278);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (279, 'Beverley', 172, 'Drama', 7, 279);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (280, 'Selma', 130, 'Thriller', 10, 280);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (281, 'Robby', 143, 'Horror', 9, 281);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (282, 'Tim', 171, 'Thriller', 3, 282);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (283, 'Moe', 120, 'Drama', 10, 283);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (284, 'Ricardo', 67, 'Thriller', 1, 284);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (285, 'Solomon', 87, 'Documentary', 5, 285);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (286, 'George', 63, 'Thriller', 2, 286);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (287, 'Mike', 170, 'Drama', 8, 287);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (288, 'Cevin', 76, 'Science Fiction', 9, 288);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (289, 'Lauren', 146, 'Action', 10, 289);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (290, 'Garth', 83, 'Action', 18, 290);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (291, 'Geena', 176, 'Thriller', 18, 291);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (292, 'Darren', 163, 'Documentary', 10, 292);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (293, 'Steve', 90, 'Drama', 1, 293);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (294, 'Rick', 177, 'Romance', 18, 294);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (295, 'Roger', 129, 'Romance', 2, 295);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (296, 'Anne', 61, 'Animation', 7, 296);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (297, 'Sona', 128, 'Drama', 12, 297);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (298, 'William', 134, 'Comedy', 18, 298);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (299, 'Donald', 150, 'Romance', 8, 299);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (300, 'Maureen', 69, 'Horror', 17, 300);
commit;
prompt 300 records committed...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (301, 'Maggie', 168, 'Action', 4, 301);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (302, 'Mos', 63, 'Comedy', 16, 302);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (303, 'Warren', 115, 'Action', 11, 303);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (304, 'Beth', 73, 'Horror', 5, 304);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (305, 'Joey', 177, 'Science Fiction', 13, 305);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (306, 'Gloria', 145, 'Fantasy', 20, 306);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (307, 'Omar', 137, 'Documentary', 11, 307);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (308, 'Ricardo', 151, 'Documentary', 10, 308);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (309, 'Frankie', 169, 'Documentary', 18, 309);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (310, 'Hugh', 136, 'Drama', 15, 310);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (311, 'Rhett', 72, 'Animation', 7, 311);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (312, 'Natascha', 71, 'Comedy', 12, 312);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (313, 'Mykelti', 80, 'Documentary', 10, 313);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (314, 'Fats', 92, 'Action', 14, 314);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (315, 'Derek', 115, 'Science Fiction', 6, 315);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (316, 'Hank', 142, 'Fantasy', 3, 316);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (317, 'Vivica', 123, 'Action', 2, 317);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (318, 'Robin', 113, 'Comedy', 6, 318);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (319, 'Beverley', 69, 'Documentary', 8, 319);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (320, 'Faye', 107, 'Comedy', 15, 320);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (321, 'Mandy', 172, 'Comedy', 17, 321);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (322, 'Chloe', 101, 'Thriller', 4, 322);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (323, 'Jonny Lee', 62, 'Drama', 20, 323);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (324, 'Aida', 111, 'Animation', 10, 324);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (325, 'Edward', 122, 'Documentary', 14, 325);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (326, 'Debra', 109, 'Horror', 14, 326);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (327, 'Suzi', 176, 'Comedy', 19, 327);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (328, 'Edie', 83, 'Drama', 6, 328);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (329, 'Allan', 121, 'Fantasy', 4, 329);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (330, 'Ossie', 92, 'Horror', 6, 330);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (331, 'Gene', 79, 'Horror', 7, 331);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (332, 'Ernest', 96, 'Horror', 9, 332);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (333, 'Lisa', 79, 'Action', 10, 333);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (334, 'Jackie', 147, 'Animation', 17, 334);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (335, 'Joshua', 104, 'Comedy', 15, 335);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (336, 'Tara', 115, 'Comedy', 19, 336);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (337, 'Isaiah', 145, 'Thriller', 2, 337);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (338, 'Dionne', 136, 'Fantasy', 8, 338);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (339, 'Taylor', 150, 'Documentary', 11, 339);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (340, 'Quentin', 109, 'Horror', 2, 340);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (341, 'William', 92, 'Drama', 2, 341);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (342, 'Lucy', 164, 'Animation', 5, 342);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (343, 'Elvis', 167, 'Action', 16, 343);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (344, 'Julianna', 169, 'Horror', 13, 344);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (345, 'Uma', 159, 'Drama', 17, 345);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (346, 'Isabella', 92, 'Horror', 12, 346);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (347, 'Kasey', 138, 'Horror', 3, 347);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (348, 'Terry', 133, 'Comedy', 11, 348);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (349, 'Ernie', 76, 'Thriller', 3, 349);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (350, 'Jean-Luc', 129, 'Animation', 20, 350);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (351, 'Trey', 79, 'Animation', 12, 351);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (352, 'Dianne', 64, 'Action', 6, 352);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (353, 'Lara', 142, 'Action', 15, 353);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (354, 'Gwyneth', 98, 'Science Fiction', 13, 354);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (355, 'Manu', 149, 'Romance', 19, 355);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (356, 'David', 121, 'Fantasy', 4, 356);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (357, 'Vincent', 132, 'Animation', 20, 357);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (358, 'Azucar', 161, 'Animation', 19, 358);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (359, 'Geggy', 160, 'Fantasy', 1, 359);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (360, 'Geraldine', 71, 'Fantasy', 1, 360);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (361, 'Rade', 134, 'Romance', 19, 361);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (362, 'Oded', 78, 'Science Fiction', 18, 362);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (363, 'Trick', 173, 'Science Fiction', 7, 363);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (364, 'Antonio', 122, 'Fantasy', 9, 364);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (365, 'Debbie', 180, 'Documentary', 1, 365);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (366, 'Austin', 173, 'Documentary', 11, 366);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (367, 'Juliette', 128, 'Horror', 7, 367);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (368, 'Taye', 73, 'Animation', 5, 368);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (369, 'Thin', 117, 'Drama', 10, 369);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (370, 'Kimberly', 112, 'Romance', 8, 370);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (371, 'Ivan', 78, 'Action', 20, 371);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (372, 'Red', 153, 'Romance', 19, 372);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (373, 'Tracy', 83, 'Drama', 11, 373);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (374, 'Joanna', 108, 'Thriller', 17, 374);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (375, 'Nelly', 62, 'Fantasy', 4, 375);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (376, 'Andre', 165, 'Fantasy', 6, 376);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (377, 'Alannah', 136, 'Science Fiction', 5, 377);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (378, 'Eric', 67, 'Science Fiction', 15, 378);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (379, 'Carlene', 98, 'Action', 1, 379);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (380, 'Nile', 84, 'Horror', 9, 380);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (381, 'Pablo', 127, 'Fantasy', 12, 381);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (382, 'Pamela', 63, 'Action', 12, 382);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (383, 'Hugo', 170, 'Science Fiction', 11, 383);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (384, 'Penelope', 172, 'Fantasy', 15, 384);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (385, 'Parker', 176, 'Romance', 2, 385);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (386, 'Vivica', 87, 'Fantasy', 4, 386);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (387, 'Holland', 106, 'Comedy', 18, 387);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (388, 'Burt', 119, 'Action', 16, 388);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (389, 'Suzanne', 179, 'Drama', 4, 389);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (390, 'Rufus', 166, 'Comedy', 2, 390);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (391, 'Elijah', 172, 'Fantasy', 18, 391);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (392, 'Anita', 131, 'Action', 6, 392);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (393, 'Juliet', 165, 'Fantasy', 14, 393);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (394, 'William', 106, 'Action', 15, 394);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (395, 'Pat', 97, 'Documentary', 9, 395);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (396, 'Cornell', 70, 'Thriller', 1, 396);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (397, 'Jeanne', 167, 'Action', 5, 397);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (398, 'Chaka', 94, 'Science Fiction', 8, 398);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (399, 'Cliff', 156, 'Drama', 20, 399);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (400, 'Scott', 175, 'Romance', 16, 400);
commit;
prompt 400 records loaded
prompt Loading TICKET...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (1, 42799, 1, 10, 334, 1);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (2, 38134, 2, 105, 522, 2);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (3, 9041, 3, 9, 263, 3);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (4, 12534, 4, 319, 326, 4);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (5, 61413, 5, 30, 333, 5);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (6, 57505, 6, 65, 289, 6);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (7, 411, 7, 245, 104, 7);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (8, 59705, 8, 289, 806, 8);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (9, 11886, 9, 155, 684, 9);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (10, 81104, 10, 169, 142, 10);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (11, 5031, 11, 65, 973, 11);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (12, 20406, 12, 255, 187, 12);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (13, 77019, 13, 329, 232, 13);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (14, 69605, 14, 149, 490, 14);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (15, 85476, 15, 319, 773, 15);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (16, 79996, 16, 1, 947, 16);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (17, 77613, 17, 89, 202, 17);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (18, 82372, 18, 398, 308, 18);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (19, 16396, 19, 179, 227, 19);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (20, 15790, 20, 240, 696, 20);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (21, 62676, 21, 99, 952, 21);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (22, 68109, 22, 65, 332, 22);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (23, 67136, 23, 48, 253, 23);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (24, 14260, 24, 385, 811, 24);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (25, 26600, 25, 618, 885, 25);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (26, 82195, 26, 219, 369, 26);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (27, 83113, 27, 72, 892, 27);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (28, 79589, 28, 121, 116, 28);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (29, 61471, 29, 28, 679, 29);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (30, 30252, 30, 72, 132, 30);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (31, 85682, 31, 199, 590, 31);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (32, 38344, 32, 259, 719, 32);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (33, 27836, 33, 69, 911, 33);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (34, 46295, 34, 75, 627, 34);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (35, 15854, 35, 110, 224, 35);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (36, 6596, 36, 65, 164, 36);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (37, 8902, 37, 125, 297, 37);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (38, 43424, 38, 5, 659, 38);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (39, 70409, 39, 49, 290, 39);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (40, 84260, 40, 265, 151, 40);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (41, 69902, 41, 17, 194, 41);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (42, 20594, 42, 38, 331, 42);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (43, 76555, 43, 35, 616, 43);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (44, 50187, 44, 75, 142, 44);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (45, 25987, 45, 265, 515, 45);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (46, 52218, 46, 58, 254, 46);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (47, 1685, 47, 59, 474, 47);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (48, 25973, 48, 45, 239, 48);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (49, 29987, 49, 89, 352, 49);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (50, 32162, 50, 109, 686, 50);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (51, 1183, 51, 8, 796, 51);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (52, 74016, 52, 136, 126, 52);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (53, 48192, 53, 159, 631, 53);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (54, 42869, 54, 59, 570, 54);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (55, 70421, 55, 12, 505, 55);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (56, 197, 56, 229, 898, 56);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (57, 29109, 57, 299, 911, 57);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (58, 81963, 58, 24, 257, 58);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (59, 79910, 59, 289, 833, 59);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (60, 48307, 60, 139, 606, 60);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (61, 86141, 61, 54, 729, 61);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (62, 60300, 62, 45, 202, 62);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (63, 43739, 63, 25, 193, 63);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (64, 84590, 64, 19, 724, 64);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (65, 36733, 65, 145, 742, 65);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (66, 56592, 66, 129, 791, 66);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (67, 61073, 67, 241, 204, 67);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (68, 76349, 68, 289, 385, 68);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (69, 81343, 69, 39, 107, 69);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (70, 57768, 70, 119, 537, 70);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (71, 83238, 71, 95, 496, 71);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (72, 24547, 72, 16, 554, 72);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (73, 20788, 73, 45, 229, 73);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (74, 77425, 74, 139, 938, 74);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (75, 26154, 75, 265, 656, 75);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (76, 37589, 76, 69, 841, 76);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (77, 48104, 77, 49, 935, 77);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (78, 11104, 78, 299, 402, 78);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (79, 78268, 79, 76, 880, 79);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (80, 45391, 80, 13, 765, 80);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (81, 38287, 81, 89, 570, 81);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (82, 77561, 82, 125, 376, 82);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (83, 38937, 83, 89, 337, 83);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (84, 56927, 84, 115, 329, 84);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (85, 69650, 85, 46, 939, 85);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (86, 38359, 86, 399, 225, 86);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (87, 86195, 87, 255, 578, 87);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (88, 71571, 88, 279, 446, 88);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (89, 7349, 89, 115, 202, 89);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (90, 75363, 90, 10, 858, 90);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (91, 37685, 91, 1, 824, 91);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (92, 72209, 92, 25, 358, 92);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (93, 62043, 93, 175, 329, 93);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (94, 6447, 94, 75, 397, 94);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (95, 65270, 95, 8, 129, 95);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (96, 31253, 96, 9, 215, 96);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (97, 24611, 97, 105, 965, 97);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (98, 21405, 98, 236, 538, 98);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (99, 56706, 99, 319, 914, 99);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (100, 55119, 100, 659, 111, 100);
commit;
prompt 100 records committed...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (101, 83503, 101, 27, 446, 101);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (102, 7187, 102, 156, 137, 102);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (103, 23300, 103, 89, 486, 103);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (104, 36714, 104, 1, 600, 104);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (105, 18453, 105, 289, 594, 105);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (106, 82817, 106, 109, 531, 106);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (107, 86123, 107, 172, 612, 107);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (108, 21476, 108, 72, 928, 108);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (109, 65923, 109, 78, 448, 109);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (110, 61152, 110, 8, 476, 110);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (111, 63714, 111, 409, 615, 111);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (112, 8537, 112, 235, 468, 112);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (113, 34012, 113, 229, 341, 113);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (114, 69022, 114, 49, 261, 114);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (115, 1838, 115, 65, 892, 115);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (116, 3726, 116, 121, 938, 116);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (117, 5391, 117, 175, 118, 117);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (118, 86106, 118, 72, 533, 118);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (119, 69834, 119, 74, 779, 119);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (120, 39604, 120, 149, 922, 120);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (121, 26805, 121, 29, 737, 121);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (122, 72488, 122, 95, 525, 122);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (123, 84109, 123, 20, 136, 123);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (124, 72036, 124, 109, 558, 124);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (125, 6906, 125, 58, 721, 125);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (126, 43654, 126, 156, 605, 126);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (127, 64140, 127, 145, 690, 127);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (128, 30090, 128, 78, 239, 128);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (129, 28945, 129, 285, 764, 129);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (130, 78066, 130, 99, 756, 130);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (131, 51110, 131, 68, 771, 131);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (132, 58385, 132, 265, 840, 132);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (133, 10498, 133, 219, 267, 133);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (134, 4880, 134, 35, 365, 134);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (135, 32947, 135, 399, 654, 135);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (136, 62255, 136, 20, 581, 136);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (137, 83159, 137, 72, 488, 137);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (138, 9737, 138, 15, 398, 138);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (139, 63507, 139, 135, 861, 139);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (140, 20465, 140, 74, 977, 140);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (141, 62749, 141, 59, 331, 141);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (142, 48597, 142, 175, 259, 142);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (143, 80462, 143, 139, 292, 143);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (144, 46242, 144, 14, 346, 144);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (145, 31010, 145, 99, 798, 145);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (146, 41953, 146, 20, 785, 146);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (147, 71221, 147, 35, 404, 147);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (148, 62967, 148, 10, 363, 148);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (149, 10507, 149, 118, 985, 149);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (150, 78583, 150, 35, 715, 150);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (151, 48263, 151, 38, 244, 151);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (152, 19266, 152, 119, 990, 152);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (153, 19313, 153, 78, 287, 153);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (154, 52383, 154, 285, 326, 154);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (155, 8002, 155, 259, 701, 155);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (156, 34678, 156, 209, 716, 156);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (157, 85608, 157, 35, 968, 157);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (158, 78234, 158, 179, 954, 158);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (159, 68963, 159, 159, 553, 159);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (160, 61410, 160, 200, 392, 160);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (161, 83156, 161, 229, 968, 161);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (162, 30456, 162, 79, 998, 162);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (163, 56193, 163, 28, 400, 163);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (164, 51775, 164, 12, 144, 164);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (165, 47796, 165, 2, 395, 165);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (166, 24998, 166, 389, 113, 166);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (167, 66878, 167, 10, 229, 167);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (168, 819, 168, 5, 687, 168);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (169, 15115, 169, 168, 309, 169);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (170, 59305, 170, 77, 939, 170);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (171, 31301, 171, 1, 835, 171);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (172, 32920, 172, 389, 787, 172);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (173, 82636, 173, 58, 583, 173);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (174, 69427, 174, 189, 674, 174);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (175, 20100, 175, 145, 702, 175);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (176, 31493, 176, 279, 846, 176);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (177, 39078, 177, 135, 215, 177);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (178, 43909, 178, 269, 157, 178);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (179, 46368, 179, 125, 832, 179);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (180, 60551, 180, 93, 293, 180);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (181, 84840, 181, 63, 118, 181);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (182, 28416, 182, 285, 684, 182);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (183, 33559, 183, 5, 543, 183);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (184, 83681, 184, 9, 116, 184);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (185, 42258, 185, 168, 524, 185);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (186, 49440, 186, 35, 443, 186);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (187, 36934, 187, 15, 806, 187);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (188, 13175, 188, 385, 468, 188);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (189, 5381, 189, 179, 651, 189);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (190, 7048, 190, 2, 908, 190);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (191, 50301, 191, 109, 376, 191);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (192, 20474, 192, 5, 622, 192);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (193, 43818, 193, 245, 451, 193);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (194, 40205, 194, 132, 379, 194);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (195, 47411, 195, 12, 838, 195);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (196, 23867, 196, 105, 675, 196);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (197, 52812, 197, 3, 823, 197);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (198, 75439, 198, 49, 765, 198);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (199, 64946, 199, 78, 874, 199);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (200, 55801, 200, 16, 111, 200);
commit;
prompt 200 records committed...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (201, 85683, 201, 375, 750, 201);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (202, 55987, 202, 129, 766, 202);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (203, 69251, 203, 145, 828, 203);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (204, 36957, 204, 9, 283, 204);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (205, 57589, 205, 499, 822, 205);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (206, 37379, 206, 385, 179, 206);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (207, 61766, 207, 229, 121, 207);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (208, 11422, 208, 198, 967, 208);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (209, 63965, 209, 235, 315, 209);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (210, 48196, 210, 75, 653, 210);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (211, 35710, 211, 265, 936, 211);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (212, 18131, 212, 23, 290, 212);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (213, 72982, 213, 125, 477, 213);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (214, 68378, 214, 175, 143, 214);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (215, 22949, 215, 70, 277, 215);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (216, 4918, 216, 125, 371, 216);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (217, 19377, 217, 75, 712, 217);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (218, 67003, 218, 16, 172, 218);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (219, 59624, 219, 8, 496, 219);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (220, 40318, 220, 39, 481, 220);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (221, 52602, 221, 115, 775, 221);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (222, 63109, 222, 179, 174, 222);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (223, 7068, 223, 129, 103, 223);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (224, 63089, 224, 12, 331, 224);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (225, 22654, 225, 75, 633, 225);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (226, 21894, 226, 229, 280, 226);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (227, 50173, 227, 79, 823, 227);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (228, 72587, 228, 142, 258, 228);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (229, 73315, 229, 250, 714, 229);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (230, 25053, 230, 135, 789, 230);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (231, 38552, 231, 17, 380, 231);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (232, 43149, 232, 74, 648, 232);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (233, 573, 233, 579, 997, 233);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (234, 52404, 234, 545, 307, 234);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (235, 4650, 235, 329, 188, 235);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (236, 76841, 236, 20, 419, 236);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (237, 66761, 237, 79, 283, 237);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (238, 29540, 238, 142, 176, 238);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (239, 67350, 239, 175, 609, 239);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (240, 34513, 240, 12, 960, 240);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (241, 20968, 241, 209, 867, 241);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (242, 40269, 242, 58, 507, 242);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (243, 24830, 243, 69, 787, 243);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (244, 66711, 244, 249, 496, 244);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (245, 9874, 245, 409, 582, 245);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (246, 19394, 246, 90, 382, 246);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (247, 85208, 247, 145, 485, 247);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (248, 31599, 248, 35, 124, 248);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (249, 86353, 249, 29, 409, 249);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (250, 77366, 250, 44, 622, 250);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (251, 57943, 251, 152, 676, 251);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (252, 42246, 252, 29, 645, 252);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (253, 56001, 253, 1, 162, 253);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (254, 37979, 254, 45, 496, 254);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (255, 52929, 255, 23, 758, 255);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (256, 815, 256, 58, 169, 256);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (257, 40937, 257, 24, 978, 257);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (258, 75053, 258, 58, 747, 258);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (259, 53435, 259, 35, 406, 259);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (260, 59614, 260, 63, 899, 260);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (261, 1820, 261, 135, 204, 261);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (262, 35640, 262, 149, 247, 262);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (263, 70646, 263, 48, 777, 263);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (264, 82557, 264, 79, 394, 264);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (265, 23045, 265, 259, 531, 265);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (266, 70123, 266, 110, 905, 266);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (267, 17143, 267, 595, 925, 267);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (268, 3787, 268, 8, 474, 268);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (269, 77257, 269, 35, 528, 269);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (270, 27147, 270, 889, 504, 270);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (271, 13491, 271, 24, 806, 271);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (272, 64201, 272, 229, 528, 272);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (273, 80537, 273, 38, 580, 273);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (274, 17736, 274, 359, 222, 274);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (275, 49262, 275, 236, 863, 275);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (276, 14642, 276, 319, 726, 276);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (277, 34409, 277, 10, 831, 277);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (278, 81739, 278, 78, 682, 278);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (279, 15063, 279, 5, 131, 279);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (280, 24897, 280, 75, 346, 280);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (281, 72424, 281, 8, 372, 281);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (282, 21770, 282, 69, 216, 282);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (283, 20511, 283, 125, 406, 283);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (284, 11251, 284, 66, 976, 284);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (285, 77858, 285, 209, 856, 285);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (286, 59371, 286, 5, 257, 286);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (287, 70696, 287, 35, 849, 287);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (288, 78561, 288, 265, 240, 288);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (289, 29490, 289, 209, 797, 289);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (290, 52165, 290, 38, 487, 290);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (291, 9706, 291, 135, 945, 291);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (292, 42376, 292, 130, 677, 292);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (293, 7595, 293, 16, 398, 293);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (294, 43550, 294, 115, 789, 294);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (295, 56530, 295, 24, 221, 295);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (296, 79074, 296, 267, 946, 296);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (297, 23511, 297, 119, 932, 297);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (298, 13262, 298, 295, 314, 298);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (299, 33927, 299, 179, 501, 299);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (300, 80761, 300, 29, 752, 300);
commit;
prompt 300 records committed...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (301, 30532, 301, 155, 934, 301);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (302, 1988, 302, 69, 339, 302);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (303, 77976, 303, 159, 435, 303);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (304, 65270, 304, 149, 626, 304);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (305, 63468, 305, 265, 715, 305);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (306, 76751, 306, 75, 764, 306);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (307, 21686, 307, 61, 250, 307);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (308, 38828, 308, 299, 475, 308);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (309, 43828, 309, 209, 786, 309);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (310, 57438, 310, 245, 109, 310);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (311, 24390, 311, 44, 620, 311);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (312, 63331, 312, 68, 111, 312);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (313, 18774, 313, 175, 751, 313);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (314, 69611, 314, 155, 993, 314);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (315, 29096, 315, 24, 507, 315);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (316, 5772, 316, 35, 718, 316);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (317, 68402, 317, 75, 920, 317);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (318, 72745, 318, 35, 781, 318);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (319, 57934, 319, 79, 866, 319);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (320, 24186, 320, 75, 100, 320);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (321, 1487, 321, 250, 144, 321);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (322, 77060, 322, 65, 472, 322);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (323, 7842, 323, 48, 602, 323);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (324, 14850, 324, 69, 949, 324);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (325, 18255, 325, 22, 671, 325);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (326, 18882, 326, 125, 252, 326);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (327, 49455, 327, 35, 208, 327);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (328, 68695, 328, 200, 203, 328);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (329, 84330, 329, 95, 471, 329);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (330, 14090, 330, 109, 807, 330);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (331, 75345, 331, 129, 842, 331);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (332, 32077, 332, 44, 786, 332);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (333, 15189, 333, 849, 500, 333);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (334, 2799, 334, 58, 900, 334);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (335, 34945, 335, 73, 305, 335);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (336, 3852, 336, 200, 759, 336);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (337, 45710, 337, 179, 573, 337);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (338, 66420, 338, 59, 862, 338);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (339, 77536, 339, 30, 243, 339);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (340, 79922, 340, 46, 712, 340);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (341, 39322, 341, 15, 985, 341);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (342, 41465, 342, 1, 225, 342);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (343, 51014, 343, 109, 384, 343);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (344, 10775, 344, 229, 195, 344);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (345, 5739, 345, 72, 190, 345);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (346, 13631, 346, 285, 505, 346);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (347, 85820, 347, 78, 855, 347);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (348, 64000, 348, 295, 142, 348);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (349, 38612, 349, 20, 740, 349);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (350, 14114, 350, 17, 928, 350);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (351, 40557, 351, 39, 583, 351);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (352, 85298, 352, 356, 554, 352);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (353, 52449, 353, 117, 722, 353);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (354, 26518, 354, 48, 341, 354);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (355, 13851, 355, 28, 653, 355);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (356, 80363, 356, 2, 947, 356);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (357, 65369, 357, 16, 468, 357);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (358, 51885, 358, 209, 766, 358);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (359, 1423, 359, 69, 162, 359);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (360, 45567, 360, 275, 466, 360);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (361, 67813, 361, 595, 418, 361);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (362, 1026, 362, 46, 164, 362);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (363, 82093, 363, 5, 227, 363);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (364, 80201, 364, 289, 233, 364);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (365, 7783, 365, 18, 545, 365);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (366, 68867, 366, 48, 942, 366);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (367, 32487, 367, 69, 505, 367);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (368, 20234, 368, 215, 783, 368);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (369, 12761, 369, 499, 203, 369);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (370, 20799, 370, 145, 610, 370);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (371, 56593, 371, 69, 744, 371);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (372, 15126, 372, 255, 283, 372);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (373, 39635, 373, 165, 231, 373);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (374, 76145, 374, 70, 575, 374);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (375, 17913, 375, 35, 289, 375);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (376, 34849, 376, 5, 373, 376);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (377, 66405, 377, 10, 333, 377);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (378, 47524, 378, 29, 817, 378);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (379, 26753, 379, 156, 384, 379);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (380, 31074, 380, 7, 545, 380);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (381, 60216, 381, 18, 318, 381);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (382, 69241, 382, 5, 697, 382);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (383, 72827, 383, 68, 856, 383);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (384, 78857, 384, 179, 962, 384);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (385, 14651, 385, 355, 476, 385);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (386, 48670, 386, 136, 192, 386);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (387, 43691, 387, 99, 977, 387);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (388, 19595, 388, 78, 482, 388);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (389, 25253, 389, 28, 205, 389);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (390, 7360, 390, 329, 645, 390);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (391, 22384, 391, 38, 141, 391);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (392, 48386, 392, 4, 337, 392);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (393, 48220, 393, 134, 537, 393);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (394, 44236, 394, 15, 686, 394);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (395, 1615, 395, 5, 497, 395);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (396, 81748, 396, 45, 682, 396);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (397, 45619, 397, 93, 210, 397);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (398, 57231, 398, 130, 359, 398);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (399, 74239, 399, 140, 407, 399);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (400, 83248, 400, 329, 909, 400);
commit;
prompt 400 records loaded
prompt Loading FOOD...
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Soda', 1, 1);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 2, 2);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Sprite', 3, 3);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 4, 4);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Sprite', 5, 5);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 6, 6);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Beer', 7, 7);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Sprite', 8, 8);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 9, 9);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Water', 10, 10);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 11, 11);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 12, 12);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 13, 13);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 14, 14);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 15, 15);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 16, 16);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 17, 17);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Schewpes', 18, 18);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 19, 19);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 20, 20);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 21, 21);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 22, 22);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 23, 23);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 24, 24);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 25, 25);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 26, 26);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 27, 27);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Beer', 28, 28);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 29, 29);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 30, 30);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 31, 31);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Soda', 32, 32);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 33, 33);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 34, 34);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 35, 35);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Schewpes', 36, 36);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Fanta', 37, 37);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Sprite', 38, 38);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 39, 39);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 40, 40);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 41, 41);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 42, 42);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 43, 43);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 44, 44);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 45, 45);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 46, 46);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 47, 47);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 48, 48);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 49, 49);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 50, 50);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 51, 51);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 52, 52);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 53, 53);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 54, 54);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Soda', 55, 55);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 56, 56);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Spring', 57, 57);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 58, 58);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 59, 59);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 60, 60);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 61, 61);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Beer', 62, 62);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 63, 63);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 64, 64);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 65, 65);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 66, 66);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 67, 67);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 68, 68);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Fanta', 69, 69);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Schewpes', 70, 70);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 71, 71);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 72, 72);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 73, 73);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 74, 74);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 75, 75);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 76, 76);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 77, 77);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 78, 78);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 79, 79);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 80, 80);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 81, 81);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 82, 82);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 83, 83);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Schewpes', 84, 84);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 85, 85);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 86, 86);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Fanta', 87, 87);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 88, 88);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 89, 89);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 90, 90);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Spring', 91, 91);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 92, 92);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 93, 93);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 94, 94);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 95, 95);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 96, 96);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 97, 97);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Sprite', 98, 98);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 99, 99);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 100, 100);
commit;
prompt 100 records committed...
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 101, 101);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 102, 102);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 103, 103);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 104, 104);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Sprite', 105, 105);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 106, 106);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 107, 107);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Beer', 108, 108);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Spring', 109, 109);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Spring', 110, 110);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 111, 111);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 112, 112);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 113, 113);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 114, 114);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Sprite', 115, 115);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 116, 116);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 117, 117);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 118, 118);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Water', 119, 119);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Schewpes', 120, 120);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 121, 121);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 122, 122);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 123, 123);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 124, 124);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 125, 125);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 126, 126);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 127, 127);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 128, 128);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 129, 129);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 130, 130);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Soda', 131, 131);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 132, 132);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 133, 133);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 134, 134);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Water', 135, 135);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Coca', 136, 136);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 137, 137);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 138, 138);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Water', 139, 139);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Soda', 140, 140);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 141, 141);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Coca', 142, 142);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 143, 143);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 144, 144);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 145, 145);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 146, 146);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 147, 147);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 148, 148);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Sprite', 149, 149);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 150, 150);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Fanta', 151, 151);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 152, 152);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 153, 153);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Soda', 154, 154);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 155, 155);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 156, 156);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Fanta', 157, 157);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 158, 158);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 159, 159);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 160, 160);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Sprite', 161, 161);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 162, 162);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 163, 163);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Fanta', 164, 164);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 165, 165);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 166, 166);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 167, 167);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Water', 168, 168);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 169, 169);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Water', 170, 170);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Beer', 171, 171);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 172, 172);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Soda', 173, 173);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 174, 174);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Fanta', 175, 175);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 176, 176);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 177, 177);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 178, 178);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 179, 179);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 180, 180);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 181, 181);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 182, 182);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Spring', 183, 183);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 184, 184);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Schewpes', 185, 185);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 186, 186);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 187, 187);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 188, 188);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Sprite', 189, 189);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 190, 190);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 191, 191);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 192, 192);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 193, 193);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 194, 194);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 195, 195);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Beer', 196, 196);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 197, 197);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 198, 198);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Spring', 199, 199);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 200, 200);
commit;
prompt 200 records committed...
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 201, 201);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 202, 202);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Beer', 203, 203);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Spring', 204, 204);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 205, 205);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Spring', 206, 206);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 207, 207);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 208, 208);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 209, 209);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 210, 210);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 211, 211);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 212, 212);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 213, 213);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 214, 214);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 215, 215);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Beer', 216, 216);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 217, 217);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Sprite', 218, 218);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Sprite', 219, 219);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Sprite', 220, 220);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 221, 221);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 222, 222);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 223, 223);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 224, 224);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 225, 225);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 226, 226);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Water', 227, 227);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Schewpes', 228, 228);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 229, 229);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 230, 230);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Beer', 231, 231);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Fanta', 232, 232);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 233, 233);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Spring', 234, 234);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 235, 235);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 236, 236);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 237, 237);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Beer', 238, 238);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 239, 239);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Beer', 240, 240);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 241, 241);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 242, 242);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 243, 243);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 244, 244);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Beer', 245, 245);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 246, 246);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 247, 247);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Water', 248, 248);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 249, 249);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 250, 250);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Beer', 251, 251);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 252, 252);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Beer', 253, 253);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 254, 254);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Fanta', 255, 255);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 256, 256);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 257, 257);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Fanta', 258, 258);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 259, 259);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Fanta', 260, 260);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 261, 261);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 262, 262);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 263, 263);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Water', 264, 264);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Sprite', 265, 265);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 266, 266);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Water', 267, 267);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 268, 268);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 269, 269);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Water', 270, 270);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 271, 271);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 272, 272);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 273, 273);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 274, 274);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 275, 275);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Sprite', 276, 276);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 277, 277);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Spring', 278, 278);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 279, 279);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 280, 280);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Coca', 281, 281);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Sprite', 282, 282);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 283, 283);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 284, 284);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 285, 285);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 286, 286);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 287, 287);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Schewpes', 288, 288);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 289, 289);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 290, 290);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 291, 291);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Coca', 292, 292);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 293, 293);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Spring', 294, 294);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Sprite', 295, 295);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Beer', 296, 296);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 297, 297);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 298, 298);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Schewpes', 299, 299);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Beer', 300, 300);
commit;
prompt 300 records committed...
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 301, 301);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Schewpes', 302, 302);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 303, 303);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 304, 304);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Fanta', 305, 305);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Coca', 306, 306);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Spring', 307, 307);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Spring', 308, 308);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 309, 309);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 310, 310);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Soda', 311, 311);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 312, 312);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Sprite', 313, 313);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Soda', 314, 314);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Schewpes', 315, 315);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Fanta', 316, 316);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Sprite', 317, 317);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Beer', 318, 318);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 319, 319);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 320, 320);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Spring', 321, 321);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 322, 322);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Water', 323, 323);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Water', 324, 324);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 325, 325);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 326, 326);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 327, 327);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 328, 328);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Sprite', 329, 329);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 330, 330);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 331, 331);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 332, 332);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 333, 333);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Beer', 334, 334);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 335, 335);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Beer', 336, 336);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 337, 337);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Beer', 338, 338);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 339, 339);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Fanta', 340, 340);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Sprite', 341, 341);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Coca', 342, 342);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Soda', 343, 343);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Sprite', 344, 344);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Soda', 345, 345);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Beer', 346, 346);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 347, 347);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 348, 348);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Water', 349, 349);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 350, 350);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 351, 351);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Soda', 352, 352);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 353, 353);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 354, 354);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 355, 355);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Soda', 356, 356);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Schewpes', 357, 357);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 358, 358);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 359, 359);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 360, 360);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 361, 361);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 362, 362);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Coca', 363, 363);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 364, 364);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Water', 365, 365);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Soda', 366, 366);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 367, 367);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Coca', 368, 368);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Fanta', 369, 369);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 370, 370);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Spring', 371, 371);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Schewpes', 372, 372);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 373, 373);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Spring', 374, 374);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Spring', 375, 375);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Spring', 376, 376);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Schewpes', 377, 377);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Coca', 378, 378);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Water', 379, 379);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Beer', 380, 380);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 381, 381);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 382, 382);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Coca', 383, 383);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Sprite', 384, 384);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('burger', 'Beer', 385, 385);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Beer', 386, 386);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 387, 387);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Fanta', 388, 388);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Soda', 389, 389);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Coca', 390, 390);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 391, 391);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Water', 392, 392);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pasta', 'Sprite', 393, 393);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('pizza', 'Spring', 394, 394);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('hot-dog', 'Soda', 395, 395);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('popcorn', 'Schewpes', 396, 396);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Schewpes', 397, 397);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('chips', 'Water', 398, 398);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('sushi', 'Fanta', 399, 399);
insert into FOOD (food, drinks, receipt, identifying_number)
values ('ice-cream', 'Sprite', 400, 400);
commit;
prompt 400 records loaded
prompt Loading SEAT...
insert into SEAT (seat_number, row_number, room_number)
values (1, 1, 9);
insert into SEAT (seat_number, row_number, room_number)
values (2, 2, 2);
insert into SEAT (seat_number, row_number, room_number)
values (3, 3, 1);
insert into SEAT (seat_number, row_number, room_number)
values (4, 4, 6);
insert into SEAT (seat_number, row_number, room_number)
values (5, 5, 8);
insert into SEAT (seat_number, row_number, room_number)
values (6, 6, 2);
insert into SEAT (seat_number, row_number, room_number)
values (7, 7, 2);
insert into SEAT (seat_number, row_number, room_number)
values (8, 8, 8);
insert into SEAT (seat_number, row_number, room_number)
values (9, 9, 8);
insert into SEAT (seat_number, row_number, room_number)
values (10, 10, 7);
insert into SEAT (seat_number, row_number, room_number)
values (11, 11, 7);
insert into SEAT (seat_number, row_number, room_number)
values (12, 12, 8);
insert into SEAT (seat_number, row_number, room_number)
values (13, 13, 10);
insert into SEAT (seat_number, row_number, room_number)
values (14, 14, 3);
insert into SEAT (seat_number, row_number, room_number)
values (15, 15, 3);
insert into SEAT (seat_number, row_number, room_number)
values (16, 16, 2);
insert into SEAT (seat_number, row_number, room_number)
values (17, 17, 2);
insert into SEAT (seat_number, row_number, room_number)
values (18, 18, 9);
insert into SEAT (seat_number, row_number, room_number)
values (19, 19, 4);
insert into SEAT (seat_number, row_number, room_number)
values (20, 20, 5);
insert into SEAT (seat_number, row_number, room_number)
values (21, 21, 6);
insert into SEAT (seat_number, row_number, room_number)
values (22, 22, 4);
insert into SEAT (seat_number, row_number, room_number)
values (23, 23, 7);
insert into SEAT (seat_number, row_number, room_number)
values (24, 24, 6);
insert into SEAT (seat_number, row_number, room_number)
values (25, 25, 2);
insert into SEAT (seat_number, row_number, room_number)
values (26, 26, 7);
insert into SEAT (seat_number, row_number, room_number)
values (27, 27, 7);
insert into SEAT (seat_number, row_number, room_number)
values (28, 28, 1);
insert into SEAT (seat_number, row_number, room_number)
values (29, 29, 5);
insert into SEAT (seat_number, row_number, room_number)
values (30, 30, 8);
insert into SEAT (seat_number, row_number, room_number)
values (31, 31, 3);
insert into SEAT (seat_number, row_number, room_number)
values (32, 32, 1);
insert into SEAT (seat_number, row_number, room_number)
values (33, 33, 4);
insert into SEAT (seat_number, row_number, room_number)
values (34, 34, 9);
insert into SEAT (seat_number, row_number, room_number)
values (35, 35, 9);
insert into SEAT (seat_number, row_number, room_number)
values (36, 36, 6);
insert into SEAT (seat_number, row_number, room_number)
values (37, 37, 7);
insert into SEAT (seat_number, row_number, room_number)
values (38, 38, 9);
insert into SEAT (seat_number, row_number, room_number)
values (39, 39, 1);
insert into SEAT (seat_number, row_number, room_number)
values (40, 40, 1);
insert into SEAT (seat_number, row_number, room_number)
values (41, 41, 8);
insert into SEAT (seat_number, row_number, room_number)
values (42, 42, 4);
insert into SEAT (seat_number, row_number, room_number)
values (43, 43, 6);
insert into SEAT (seat_number, row_number, room_number)
values (44, 44, 2);
insert into SEAT (seat_number, row_number, room_number)
values (45, 45, 7);
insert into SEAT (seat_number, row_number, room_number)
values (46, 46, 8);
insert into SEAT (seat_number, row_number, room_number)
values (47, 47, 3);
insert into SEAT (seat_number, row_number, room_number)
values (48, 48, 1);
insert into SEAT (seat_number, row_number, room_number)
values (49, 49, 8);
insert into SEAT (seat_number, row_number, room_number)
values (50, 50, 5);
insert into SEAT (seat_number, row_number, room_number)
values (51, 51, 6);
insert into SEAT (seat_number, row_number, room_number)
values (52, 52, 8);
insert into SEAT (seat_number, row_number, room_number)
values (53, 53, 10);
insert into SEAT (seat_number, row_number, room_number)
values (54, 54, 9);
insert into SEAT (seat_number, row_number, room_number)
values (55, 55, 10);
insert into SEAT (seat_number, row_number, room_number)
values (56, 56, 10);
insert into SEAT (seat_number, row_number, room_number)
values (57, 57, 2);
insert into SEAT (seat_number, row_number, room_number)
values (58, 58, 1);
insert into SEAT (seat_number, row_number, room_number)
values (59, 59, 2);
insert into SEAT (seat_number, row_number, room_number)
values (60, 60, 2);
insert into SEAT (seat_number, row_number, room_number)
values (61, 61, 9);
insert into SEAT (seat_number, row_number, room_number)
values (62, 62, 6);
insert into SEAT (seat_number, row_number, room_number)
values (63, 63, 2);
insert into SEAT (seat_number, row_number, room_number)
values (64, 64, 5);
insert into SEAT (seat_number, row_number, room_number)
values (65, 65, 2);
insert into SEAT (seat_number, row_number, room_number)
values (66, 66, 6);
insert into SEAT (seat_number, row_number, room_number)
values (67, 67, 7);
insert into SEAT (seat_number, row_number, room_number)
values (68, 68, 5);
insert into SEAT (seat_number, row_number, room_number)
values (69, 69, 1);
insert into SEAT (seat_number, row_number, room_number)
values (70, 70, 1);
insert into SEAT (seat_number, row_number, room_number)
values (71, 71, 6);
insert into SEAT (seat_number, row_number, room_number)
values (72, 72, 1);
insert into SEAT (seat_number, row_number, room_number)
values (73, 73, 5);
insert into SEAT (seat_number, row_number, room_number)
values (74, 74, 6);
insert into SEAT (seat_number, row_number, room_number)
values (75, 75, 7);
insert into SEAT (seat_number, row_number, room_number)
values (76, 76, 6);
insert into SEAT (seat_number, row_number, room_number)
values (77, 77, 8);
insert into SEAT (seat_number, row_number, room_number)
values (78, 78, 4);
insert into SEAT (seat_number, row_number, room_number)
values (79, 79, 3);
insert into SEAT (seat_number, row_number, room_number)
values (80, 80, 4);
insert into SEAT (seat_number, row_number, room_number)
values (81, 81, 7);
insert into SEAT (seat_number, row_number, room_number)
values (82, 82, 10);
insert into SEAT (seat_number, row_number, room_number)
values (83, 83, 2);
insert into SEAT (seat_number, row_number, room_number)
values (84, 84, 2);
insert into SEAT (seat_number, row_number, room_number)
values (85, 85, 5);
insert into SEAT (seat_number, row_number, room_number)
values (86, 86, 2);
insert into SEAT (seat_number, row_number, room_number)
values (87, 87, 5);
insert into SEAT (seat_number, row_number, room_number)
values (88, 88, 1);
insert into SEAT (seat_number, row_number, room_number)
values (89, 89, 9);
insert into SEAT (seat_number, row_number, room_number)
values (90, 90, 1);
insert into SEAT (seat_number, row_number, room_number)
values (91, 91, 10);
insert into SEAT (seat_number, row_number, room_number)
values (92, 92, 10);
insert into SEAT (seat_number, row_number, room_number)
values (93, 93, 8);
insert into SEAT (seat_number, row_number, room_number)
values (94, 94, 6);
insert into SEAT (seat_number, row_number, room_number)
values (95, 95, 4);
insert into SEAT (seat_number, row_number, room_number)
values (96, 96, 6);
insert into SEAT (seat_number, row_number, room_number)
values (97, 97, 3);
insert into SEAT (seat_number, row_number, room_number)
values (98, 98, 10);
insert into SEAT (seat_number, row_number, room_number)
values (99, 99, 8);
insert into SEAT (seat_number, row_number, room_number)
values (100, 100, 7);
commit;
prompt 100 records committed...
insert into SEAT (seat_number, row_number, room_number)
values (101, 101, 9);
insert into SEAT (seat_number, row_number, room_number)
values (102, 102, 5);
insert into SEAT (seat_number, row_number, room_number)
values (103, 103, 9);
insert into SEAT (seat_number, row_number, room_number)
values (104, 104, 2);
insert into SEAT (seat_number, row_number, room_number)
values (105, 105, 6);
insert into SEAT (seat_number, row_number, room_number)
values (106, 106, 3);
insert into SEAT (seat_number, row_number, room_number)
values (107, 107, 7);
insert into SEAT (seat_number, row_number, room_number)
values (108, 108, 1);
insert into SEAT (seat_number, row_number, room_number)
values (109, 109, 1);
insert into SEAT (seat_number, row_number, room_number)
values (110, 110, 4);
insert into SEAT (seat_number, row_number, room_number)
values (111, 111, 2);
insert into SEAT (seat_number, row_number, room_number)
values (112, 112, 7);
insert into SEAT (seat_number, row_number, room_number)
values (113, 113, 7);
insert into SEAT (seat_number, row_number, room_number)
values (114, 114, 9);
insert into SEAT (seat_number, row_number, room_number)
values (115, 115, 9);
insert into SEAT (seat_number, row_number, room_number)
values (116, 116, 5);
insert into SEAT (seat_number, row_number, room_number)
values (117, 117, 7);
insert into SEAT (seat_number, row_number, room_number)
values (118, 118, 9);
insert into SEAT (seat_number, row_number, room_number)
values (119, 119, 7);
insert into SEAT (seat_number, row_number, room_number)
values (120, 120, 6);
insert into SEAT (seat_number, row_number, room_number)
values (121, 121, 1);
insert into SEAT (seat_number, row_number, room_number)
values (122, 122, 4);
insert into SEAT (seat_number, row_number, room_number)
values (123, 123, 6);
insert into SEAT (seat_number, row_number, room_number)
values (124, 124, 7);
insert into SEAT (seat_number, row_number, room_number)
values (125, 125, 3);
insert into SEAT (seat_number, row_number, room_number)
values (126, 126, 7);
insert into SEAT (seat_number, row_number, room_number)
values (127, 127, 2);
insert into SEAT (seat_number, row_number, room_number)
values (128, 128, 10);
insert into SEAT (seat_number, row_number, room_number)
values (129, 129, 2);
insert into SEAT (seat_number, row_number, room_number)
values (130, 130, 10);
insert into SEAT (seat_number, row_number, room_number)
values (131, 131, 2);
insert into SEAT (seat_number, row_number, room_number)
values (132, 132, 7);
insert into SEAT (seat_number, row_number, room_number)
values (133, 133, 4);
insert into SEAT (seat_number, row_number, room_number)
values (134, 134, 8);
insert into SEAT (seat_number, row_number, room_number)
values (135, 135, 3);
insert into SEAT (seat_number, row_number, room_number)
values (136, 136, 10);
insert into SEAT (seat_number, row_number, room_number)
values (137, 137, 2);
insert into SEAT (seat_number, row_number, room_number)
values (138, 138, 5);
insert into SEAT (seat_number, row_number, room_number)
values (139, 139, 4);
insert into SEAT (seat_number, row_number, room_number)
values (140, 140, 7);
insert into SEAT (seat_number, row_number, room_number)
values (141, 141, 8);
insert into SEAT (seat_number, row_number, room_number)
values (142, 142, 3);
insert into SEAT (seat_number, row_number, room_number)
values (143, 143, 1);
insert into SEAT (seat_number, row_number, room_number)
values (144, 144, 4);
insert into SEAT (seat_number, row_number, room_number)
values (145, 145, 8);
insert into SEAT (seat_number, row_number, room_number)
values (146, 146, 9);
insert into SEAT (seat_number, row_number, room_number)
values (147, 147, 7);
insert into SEAT (seat_number, row_number, room_number)
values (148, 148, 8);
insert into SEAT (seat_number, row_number, room_number)
values (149, 149, 6);
insert into SEAT (seat_number, row_number, room_number)
values (150, 150, 4);
insert into SEAT (seat_number, row_number, room_number)
values (151, 151, 6);
insert into SEAT (seat_number, row_number, room_number)
values (152, 152, 7);
insert into SEAT (seat_number, row_number, room_number)
values (153, 153, 6);
insert into SEAT (seat_number, row_number, room_number)
values (154, 154, 4);
insert into SEAT (seat_number, row_number, room_number)
values (155, 155, 7);
insert into SEAT (seat_number, row_number, room_number)
values (156, 156, 7);
insert into SEAT (seat_number, row_number, room_number)
values (157, 157, 9);
insert into SEAT (seat_number, row_number, room_number)
values (158, 158, 8);
insert into SEAT (seat_number, row_number, room_number)
values (159, 159, 9);
insert into SEAT (seat_number, row_number, room_number)
values (160, 160, 4);
insert into SEAT (seat_number, row_number, room_number)
values (161, 161, 5);
insert into SEAT (seat_number, row_number, room_number)
values (162, 162, 7);
insert into SEAT (seat_number, row_number, room_number)
values (163, 163, 8);
insert into SEAT (seat_number, row_number, room_number)
values (164, 164, 8);
insert into SEAT (seat_number, row_number, room_number)
values (165, 165, 9);
insert into SEAT (seat_number, row_number, room_number)
values (166, 166, 7);
insert into SEAT (seat_number, row_number, room_number)
values (167, 167, 7);
insert into SEAT (seat_number, row_number, room_number)
values (168, 168, 4);
insert into SEAT (seat_number, row_number, room_number)
values (169, 169, 7);
insert into SEAT (seat_number, row_number, room_number)
values (170, 170, 6);
insert into SEAT (seat_number, row_number, room_number)
values (171, 171, 1);
insert into SEAT (seat_number, row_number, room_number)
values (172, 172, 4);
insert into SEAT (seat_number, row_number, room_number)
values (173, 173, 10);
insert into SEAT (seat_number, row_number, room_number)
values (174, 174, 3);
insert into SEAT (seat_number, row_number, room_number)
values (175, 175, 10);
insert into SEAT (seat_number, row_number, room_number)
values (176, 176, 8);
insert into SEAT (seat_number, row_number, room_number)
values (177, 177, 7);
insert into SEAT (seat_number, row_number, room_number)
values (178, 178, 7);
insert into SEAT (seat_number, row_number, room_number)
values (179, 179, 5);
insert into SEAT (seat_number, row_number, room_number)
values (180, 180, 10);
insert into SEAT (seat_number, row_number, room_number)
values (181, 181, 6);
insert into SEAT (seat_number, row_number, room_number)
values (182, 182, 9);
insert into SEAT (seat_number, row_number, room_number)
values (183, 183, 5);
insert into SEAT (seat_number, row_number, room_number)
values (184, 184, 5);
insert into SEAT (seat_number, row_number, room_number)
values (185, 185, 9);
insert into SEAT (seat_number, row_number, room_number)
values (186, 186, 1);
insert into SEAT (seat_number, row_number, room_number)
values (187, 187, 4);
insert into SEAT (seat_number, row_number, room_number)
values (188, 188, 2);
insert into SEAT (seat_number, row_number, room_number)
values (189, 189, 9);
insert into SEAT (seat_number, row_number, room_number)
values (190, 190, 4);
insert into SEAT (seat_number, row_number, room_number)
values (191, 191, 5);
insert into SEAT (seat_number, row_number, room_number)
values (192, 192, 9);
insert into SEAT (seat_number, row_number, room_number)
values (193, 193, 7);
insert into SEAT (seat_number, row_number, room_number)
values (194, 194, 10);
insert into SEAT (seat_number, row_number, room_number)
values (195, 195, 10);
insert into SEAT (seat_number, row_number, room_number)
values (196, 196, 8);
insert into SEAT (seat_number, row_number, room_number)
values (197, 197, 8);
insert into SEAT (seat_number, row_number, room_number)
values (198, 198, 7);
insert into SEAT (seat_number, row_number, room_number)
values (199, 199, 5);
insert into SEAT (seat_number, row_number, room_number)
values (200, 200, 6);
commit;
prompt 200 records committed...
insert into SEAT (seat_number, row_number, room_number)
values (201, 201, 8);
insert into SEAT (seat_number, row_number, room_number)
values (202, 202, 6);
insert into SEAT (seat_number, row_number, room_number)
values (203, 203, 10);
insert into SEAT (seat_number, row_number, room_number)
values (204, 204, 3);
insert into SEAT (seat_number, row_number, room_number)
values (205, 205, 9);
insert into SEAT (seat_number, row_number, room_number)
values (206, 206, 6);
insert into SEAT (seat_number, row_number, room_number)
values (207, 207, 6);
insert into SEAT (seat_number, row_number, room_number)
values (208, 208, 6);
insert into SEAT (seat_number, row_number, room_number)
values (209, 209, 8);
insert into SEAT (seat_number, row_number, room_number)
values (210, 210, 3);
insert into SEAT (seat_number, row_number, room_number)
values (211, 211, 10);
insert into SEAT (seat_number, row_number, room_number)
values (212, 212, 2);
insert into SEAT (seat_number, row_number, room_number)
values (213, 213, 1);
insert into SEAT (seat_number, row_number, room_number)
values (214, 214, 7);
insert into SEAT (seat_number, row_number, room_number)
values (215, 215, 4);
insert into SEAT (seat_number, row_number, room_number)
values (216, 216, 7);
insert into SEAT (seat_number, row_number, room_number)
values (217, 217, 6);
insert into SEAT (seat_number, row_number, room_number)
values (218, 218, 2);
insert into SEAT (seat_number, row_number, room_number)
values (219, 219, 8);
insert into SEAT (seat_number, row_number, room_number)
values (220, 220, 6);
insert into SEAT (seat_number, row_number, room_number)
values (221, 221, 8);
insert into SEAT (seat_number, row_number, room_number)
values (222, 222, 4);
insert into SEAT (seat_number, row_number, room_number)
values (223, 223, 3);
insert into SEAT (seat_number, row_number, room_number)
values (224, 224, 7);
insert into SEAT (seat_number, row_number, room_number)
values (225, 225, 7);
insert into SEAT (seat_number, row_number, room_number)
values (226, 226, 2);
insert into SEAT (seat_number, row_number, room_number)
values (227, 227, 9);
insert into SEAT (seat_number, row_number, room_number)
values (228, 228, 9);
insert into SEAT (seat_number, row_number, room_number)
values (229, 229, 4);
insert into SEAT (seat_number, row_number, room_number)
values (230, 230, 1);
insert into SEAT (seat_number, row_number, room_number)
values (231, 231, 6);
insert into SEAT (seat_number, row_number, room_number)
values (232, 232, 10);
insert into SEAT (seat_number, row_number, room_number)
values (233, 233, 7);
insert into SEAT (seat_number, row_number, room_number)
values (234, 234, 4);
insert into SEAT (seat_number, row_number, room_number)
values (235, 235, 8);
insert into SEAT (seat_number, row_number, room_number)
values (236, 236, 6);
insert into SEAT (seat_number, row_number, room_number)
values (237, 237, 7);
insert into SEAT (seat_number, row_number, room_number)
values (238, 238, 1);
insert into SEAT (seat_number, row_number, room_number)
values (239, 239, 10);
insert into SEAT (seat_number, row_number, room_number)
values (240, 240, 6);
insert into SEAT (seat_number, row_number, room_number)
values (241, 241, 5);
insert into SEAT (seat_number, row_number, room_number)
values (242, 242, 8);
insert into SEAT (seat_number, row_number, room_number)
values (243, 243, 4);
insert into SEAT (seat_number, row_number, room_number)
values (244, 244, 2);
insert into SEAT (seat_number, row_number, room_number)
values (245, 245, 7);
insert into SEAT (seat_number, row_number, room_number)
values (246, 246, 8);
insert into SEAT (seat_number, row_number, room_number)
values (247, 247, 4);
insert into SEAT (seat_number, row_number, room_number)
values (248, 248, 10);
insert into SEAT (seat_number, row_number, room_number)
values (249, 249, 7);
insert into SEAT (seat_number, row_number, room_number)
values (250, 250, 10);
insert into SEAT (seat_number, row_number, room_number)
values (251, 251, 4);
insert into SEAT (seat_number, row_number, room_number)
values (252, 252, 2);
insert into SEAT (seat_number, row_number, room_number)
values (253, 253, 3);
insert into SEAT (seat_number, row_number, room_number)
values (254, 254, 10);
insert into SEAT (seat_number, row_number, room_number)
values (255, 255, 4);
insert into SEAT (seat_number, row_number, room_number)
values (256, 256, 7);
insert into SEAT (seat_number, row_number, room_number)
values (257, 257, 8);
insert into SEAT (seat_number, row_number, room_number)
values (258, 258, 8);
insert into SEAT (seat_number, row_number, room_number)
values (259, 259, 6);
insert into SEAT (seat_number, row_number, room_number)
values (260, 260, 10);
insert into SEAT (seat_number, row_number, room_number)
values (261, 261, 4);
insert into SEAT (seat_number, row_number, room_number)
values (262, 262, 2);
insert into SEAT (seat_number, row_number, room_number)
values (263, 263, 1);
insert into SEAT (seat_number, row_number, room_number)
values (264, 264, 4);
insert into SEAT (seat_number, row_number, room_number)
values (265, 265, 8);
insert into SEAT (seat_number, row_number, room_number)
values (266, 266, 2);
insert into SEAT (seat_number, row_number, room_number)
values (267, 267, 1);
insert into SEAT (seat_number, row_number, room_number)
values (268, 268, 2);
insert into SEAT (seat_number, row_number, room_number)
values (269, 269, 9);
insert into SEAT (seat_number, row_number, room_number)
values (270, 270, 10);
insert into SEAT (seat_number, row_number, room_number)
values (271, 271, 8);
insert into SEAT (seat_number, row_number, room_number)
values (272, 272, 3);
insert into SEAT (seat_number, row_number, room_number)
values (273, 273, 10);
insert into SEAT (seat_number, row_number, room_number)
values (274, 274, 5);
insert into SEAT (seat_number, row_number, room_number)
values (275, 275, 6);
insert into SEAT (seat_number, row_number, room_number)
values (276, 276, 4);
insert into SEAT (seat_number, row_number, room_number)
values (277, 277, 7);
insert into SEAT (seat_number, row_number, room_number)
values (278, 278, 2);
insert into SEAT (seat_number, row_number, room_number)
values (279, 279, 3);
insert into SEAT (seat_number, row_number, room_number)
values (280, 280, 7);
insert into SEAT (seat_number, row_number, room_number)
values (281, 281, 5);
insert into SEAT (seat_number, row_number, room_number)
values (282, 282, 4);
insert into SEAT (seat_number, row_number, room_number)
values (283, 283, 8);
insert into SEAT (seat_number, row_number, room_number)
values (284, 284, 5);
insert into SEAT (seat_number, row_number, room_number)
values (285, 285, 9);
insert into SEAT (seat_number, row_number, room_number)
values (286, 286, 8);
insert into SEAT (seat_number, row_number, room_number)
values (287, 287, 7);
insert into SEAT (seat_number, row_number, room_number)
values (288, 288, 2);
insert into SEAT (seat_number, row_number, room_number)
values (289, 289, 6);
insert into SEAT (seat_number, row_number, room_number)
values (290, 290, 3);
insert into SEAT (seat_number, row_number, room_number)
values (291, 291, 5);
insert into SEAT (seat_number, row_number, room_number)
values (292, 292, 3);
insert into SEAT (seat_number, row_number, room_number)
values (293, 293, 3);
insert into SEAT (seat_number, row_number, room_number)
values (294, 294, 2);
insert into SEAT (seat_number, row_number, room_number)
values (295, 295, 8);
insert into SEAT (seat_number, row_number, room_number)
values (296, 296, 6);
insert into SEAT (seat_number, row_number, room_number)
values (297, 297, 7);
insert into SEAT (seat_number, row_number, room_number)
values (298, 298, 2);
insert into SEAT (seat_number, row_number, room_number)
values (299, 299, 8);
insert into SEAT (seat_number, row_number, room_number)
values (300, 300, 4);
commit;
prompt 300 records committed...
insert into SEAT (seat_number, row_number, room_number)
values (301, 301, 8);
insert into SEAT (seat_number, row_number, room_number)
values (302, 302, 8);
insert into SEAT (seat_number, row_number, room_number)
values (303, 303, 10);
insert into SEAT (seat_number, row_number, room_number)
values (304, 304, 9);
insert into SEAT (seat_number, row_number, room_number)
values (305, 305, 2);
insert into SEAT (seat_number, row_number, room_number)
values (306, 306, 5);
insert into SEAT (seat_number, row_number, room_number)
values (307, 307, 4);
insert into SEAT (seat_number, row_number, room_number)
values (308, 308, 5);
insert into SEAT (seat_number, row_number, room_number)
values (309, 309, 1);
insert into SEAT (seat_number, row_number, room_number)
values (310, 310, 8);
insert into SEAT (seat_number, row_number, room_number)
values (311, 311, 3);
insert into SEAT (seat_number, row_number, room_number)
values (312, 312, 9);
insert into SEAT (seat_number, row_number, room_number)
values (313, 313, 7);
insert into SEAT (seat_number, row_number, room_number)
values (314, 314, 1);
insert into SEAT (seat_number, row_number, room_number)
values (315, 315, 7);
insert into SEAT (seat_number, row_number, room_number)
values (316, 316, 6);
insert into SEAT (seat_number, row_number, room_number)
values (317, 317, 5);
insert into SEAT (seat_number, row_number, room_number)
values (318, 318, 9);
insert into SEAT (seat_number, row_number, room_number)
values (319, 319, 3);
insert into SEAT (seat_number, row_number, room_number)
values (320, 320, 8);
insert into SEAT (seat_number, row_number, room_number)
values (321, 321, 9);
insert into SEAT (seat_number, row_number, room_number)
values (322, 322, 4);
insert into SEAT (seat_number, row_number, room_number)
values (323, 323, 9);
insert into SEAT (seat_number, row_number, room_number)
values (324, 324, 6);
insert into SEAT (seat_number, row_number, room_number)
values (325, 325, 10);
insert into SEAT (seat_number, row_number, room_number)
values (326, 326, 2);
insert into SEAT (seat_number, row_number, room_number)
values (327, 327, 10);
insert into SEAT (seat_number, row_number, room_number)
values (328, 328, 10);
insert into SEAT (seat_number, row_number, room_number)
values (329, 329, 5);
insert into SEAT (seat_number, row_number, room_number)
values (330, 330, 9);
insert into SEAT (seat_number, row_number, room_number)
values (331, 331, 2);
insert into SEAT (seat_number, row_number, room_number)
values (332, 332, 2);
insert into SEAT (seat_number, row_number, room_number)
values (333, 333, 10);
insert into SEAT (seat_number, row_number, room_number)
values (334, 334, 6);
insert into SEAT (seat_number, row_number, room_number)
values (335, 335, 2);
insert into SEAT (seat_number, row_number, room_number)
values (336, 336, 4);
insert into SEAT (seat_number, row_number, room_number)
values (337, 337, 10);
insert into SEAT (seat_number, row_number, room_number)
values (338, 338, 6);
insert into SEAT (seat_number, row_number, room_number)
values (339, 339, 1);
insert into SEAT (seat_number, row_number, room_number)
values (340, 340, 9);
insert into SEAT (seat_number, row_number, room_number)
values (341, 341, 3);
insert into SEAT (seat_number, row_number, room_number)
values (342, 342, 4);
insert into SEAT (seat_number, row_number, room_number)
values (343, 343, 1);
insert into SEAT (seat_number, row_number, room_number)
values (344, 344, 3);
insert into SEAT (seat_number, row_number, room_number)
values (345, 345, 1);
insert into SEAT (seat_number, row_number, room_number)
values (346, 346, 2);
insert into SEAT (seat_number, row_number, room_number)
values (347, 347, 1);
insert into SEAT (seat_number, row_number, room_number)
values (348, 348, 1);
insert into SEAT (seat_number, row_number, room_number)
values (349, 349, 7);
insert into SEAT (seat_number, row_number, room_number)
values (350, 350, 7);
insert into SEAT (seat_number, row_number, room_number)
values (351, 351, 1);
insert into SEAT (seat_number, row_number, room_number)
values (352, 352, 6);
insert into SEAT (seat_number, row_number, room_number)
values (353, 353, 1);
insert into SEAT (seat_number, row_number, room_number)
values (354, 354, 8);
insert into SEAT (seat_number, row_number, room_number)
values (355, 355, 8);
insert into SEAT (seat_number, row_number, room_number)
values (356, 356, 2);
insert into SEAT (seat_number, row_number, room_number)
values (357, 357, 9);
insert into SEAT (seat_number, row_number, room_number)
values (358, 358, 10);
insert into SEAT (seat_number, row_number, room_number)
values (359, 359, 1);
insert into SEAT (seat_number, row_number, room_number)
values (360, 360, 10);
insert into SEAT (seat_number, row_number, room_number)
values (361, 361, 6);
insert into SEAT (seat_number, row_number, room_number)
values (362, 362, 6);
insert into SEAT (seat_number, row_number, room_number)
values (363, 363, 6);
insert into SEAT (seat_number, row_number, room_number)
values (364, 364, 7);
insert into SEAT (seat_number, row_number, room_number)
values (365, 365, 2);
insert into SEAT (seat_number, row_number, room_number)
values (366, 366, 6);
insert into SEAT (seat_number, row_number, room_number)
values (367, 367, 10);
insert into SEAT (seat_number, row_number, room_number)
values (368, 368, 5);
insert into SEAT (seat_number, row_number, room_number)
values (369, 369, 1);
insert into SEAT (seat_number, row_number, room_number)
values (370, 370, 2);
insert into SEAT (seat_number, row_number, room_number)
values (371, 371, 9);
insert into SEAT (seat_number, row_number, room_number)
values (372, 372, 3);
insert into SEAT (seat_number, row_number, room_number)
values (373, 373, 4);
insert into SEAT (seat_number, row_number, room_number)
values (374, 374, 5);
insert into SEAT (seat_number, row_number, room_number)
values (375, 375, 7);
insert into SEAT (seat_number, row_number, room_number)
values (376, 376, 9);
insert into SEAT (seat_number, row_number, room_number)
values (377, 377, 2);
insert into SEAT (seat_number, row_number, room_number)
values (378, 378, 6);
insert into SEAT (seat_number, row_number, room_number)
values (379, 379, 3);
insert into SEAT (seat_number, row_number, room_number)
values (380, 380, 3);
insert into SEAT (seat_number, row_number, room_number)
values (381, 381, 5);
insert into SEAT (seat_number, row_number, room_number)
values (382, 382, 10);
insert into SEAT (seat_number, row_number, room_number)
values (383, 383, 10);
insert into SEAT (seat_number, row_number, room_number)
values (384, 384, 4);
insert into SEAT (seat_number, row_number, room_number)
values (385, 385, 5);
insert into SEAT (seat_number, row_number, room_number)
values (386, 386, 7);
insert into SEAT (seat_number, row_number, room_number)
values (387, 387, 10);
insert into SEAT (seat_number, row_number, room_number)
values (388, 388, 1);
insert into SEAT (seat_number, row_number, room_number)
values (389, 389, 2);
insert into SEAT (seat_number, row_number, room_number)
values (390, 390, 6);
insert into SEAT (seat_number, row_number, room_number)
values (391, 391, 3);
insert into SEAT (seat_number, row_number, room_number)
values (392, 392, 4);
insert into SEAT (seat_number, row_number, room_number)
values (393, 393, 7);
insert into SEAT (seat_number, row_number, room_number)
values (394, 394, 3);
insert into SEAT (seat_number, row_number, room_number)
values (395, 395, 6);
insert into SEAT (seat_number, row_number, room_number)
values (396, 396, 2);
insert into SEAT (seat_number, row_number, room_number)
values (397, 397, 8);
insert into SEAT (seat_number, row_number, room_number)
values (398, 398, 7);
insert into SEAT (seat_number, row_number, room_number)
values (399, 399, 2);
insert into SEAT (seat_number, row_number, room_number)
values (400, 400, 7);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for MOVIE...
alter table MOVIE enable constraint SYS_C008728;
alter table MOVIE enable constraint SYS_C008729;
prompt Enabling foreign key constraints for TICKET...
alter table TICKET enable constraint SYS_C008737;
prompt Enabling foreign key constraints for FOOD...
alter table FOOD enable constraint SYS_C008743;
prompt Enabling foreign key constraints for SEAT...
alter table SEAT enable constraint SYS_C008720;

set feedback on
set define on
prompt Done
