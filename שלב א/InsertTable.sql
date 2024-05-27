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
alter table MOVIE disable constraint SYS_C008611;
alter table MOVIE disable constraint SYS_C008612;
prompt Disabling foreign key constraints for TICKET...
alter table TICKET disable constraint SYS_C008620;
prompt Disabling foreign key constraints for FOOD...
alter table FOOD disable constraint SYS_C008626;
prompt Disabling foreign key constraints for SEAT...
alter table SEAT disable constraint SYS_C008603;
prompt Loading CINEMA_ROOM...
insert into CINEMA_ROOM (room_number, names)
values (1, 'Corey');
insert into CINEMA_ROOM (room_number, names)
values (2, 'Meg');
insert into CINEMA_ROOM (room_number, names)
values (3, 'Suzi');
insert into CINEMA_ROOM (room_number, names)
values (4, 'Meg');
insert into CINEMA_ROOM (room_number, names)
values (5, 'Dustin');
insert into CINEMA_ROOM (room_number, names)
values (6, 'Ian');
insert into CINEMA_ROOM (room_number, names)
values (7, 'Anne');
insert into CINEMA_ROOM (room_number, names)
values (8, 'Kylie');
insert into CINEMA_ROOM (room_number, names)
values (9, 'Cuba');
insert into CINEMA_ROOM (room_number, names)
values (10, 'Spike');
insert into CINEMA_ROOM (room_number, names)
values (11, 'Arnold');
insert into CINEMA_ROOM (room_number, names)
values (12, 'Jake');
insert into CINEMA_ROOM (room_number, names)
values (13, 'Karen');
insert into CINEMA_ROOM (room_number, names)
values (14, 'Johnny');
insert into CINEMA_ROOM (room_number, names)
values (15, 'Kyra');
insert into CINEMA_ROOM (room_number, names)
values (16, 'Drew');
insert into CINEMA_ROOM (room_number, names)
values (17, 'Freddy');
insert into CINEMA_ROOM (room_number, names)
values (18, 'Celia');
insert into CINEMA_ROOM (room_number, names)
values (19, 'Brothers');
insert into CINEMA_ROOM (room_number, names)
values (20, 'Lydia');
insert into CINEMA_ROOM (room_number, names)
values (21, 'Kasey');
insert into CINEMA_ROOM (room_number, names)
values (22, 'Kieran');
insert into CINEMA_ROOM (room_number, names)
values (23, 'Jodie');
insert into CINEMA_ROOM (room_number, names)
values (24, 'Ice');
insert into CINEMA_ROOM (room_number, names)
values (25, 'Alice');
insert into CINEMA_ROOM (room_number, names)
values (26, 'Talvin');
insert into CINEMA_ROOM (room_number, names)
values (27, 'Armand');
insert into CINEMA_ROOM (room_number, names)
values (28, 'Spike');
insert into CINEMA_ROOM (room_number, names)
values (29, 'Derek');
insert into CINEMA_ROOM (room_number, names)
values (30, 'Leo');
insert into CINEMA_ROOM (room_number, names)
values (31, 'Jude');
insert into CINEMA_ROOM (room_number, names)
values (32, 'Rob');
insert into CINEMA_ROOM (room_number, names)
values (33, 'Rascal');
insert into CINEMA_ROOM (room_number, names)
values (34, 'Bryan');
insert into CINEMA_ROOM (room_number, names)
values (35, 'Tim');
insert into CINEMA_ROOM (room_number, names)
values (36, 'Coley');
insert into CINEMA_ROOM (room_number, names)
values (37, 'Aimee');
insert into CINEMA_ROOM (room_number, names)
values (38, 'Robert');
insert into CINEMA_ROOM (room_number, names)
values (39, 'Edwin');
insert into CINEMA_ROOM (room_number, names)
values (40, 'Emm');
insert into CINEMA_ROOM (room_number, names)
values (41, 'Glenn');
insert into CINEMA_ROOM (room_number, names)
values (42, 'Tia');
insert into CINEMA_ROOM (room_number, names)
values (43, 'Owen');
insert into CINEMA_ROOM (room_number, names)
values (44, 'Fionnula');
insert into CINEMA_ROOM (room_number, names)
values (45, 'Samantha');
insert into CINEMA_ROOM (room_number, names)
values (46, 'Mos');
insert into CINEMA_ROOM (room_number, names)
values (47, 'Clint');
insert into CINEMA_ROOM (room_number, names)
values (48, 'Dylan');
insert into CINEMA_ROOM (room_number, names)
values (49, 'Rip');
insert into CINEMA_ROOM (room_number, names)
values (50, 'Glen');
insert into CINEMA_ROOM (room_number, names)
values (51, 'Jackson');
insert into CINEMA_ROOM (room_number, names)
values (52, 'Tal');
insert into CINEMA_ROOM (room_number, names)
values (53, 'Joan');
insert into CINEMA_ROOM (room_number, names)
values (54, 'Kiefer');
insert into CINEMA_ROOM (room_number, names)
values (55, 'Balthazar');
insert into CINEMA_ROOM (room_number, names)
values (56, 'Maureen');
insert into CINEMA_ROOM (room_number, names)
values (57, 'Suzy');
insert into CINEMA_ROOM (room_number, names)
values (58, 'Marlon');
insert into CINEMA_ROOM (room_number, names)
values (59, 'Vin');
insert into CINEMA_ROOM (room_number, names)
values (60, 'Rosco');
insert into CINEMA_ROOM (room_number, names)
values (61, 'Omar');
insert into CINEMA_ROOM (room_number, names)
values (62, 'Clay');
insert into CINEMA_ROOM (room_number, names)
values (63, 'Bridgette');
insert into CINEMA_ROOM (room_number, names)
values (64, 'Yolanda');
insert into CINEMA_ROOM (room_number, names)
values (65, 'Courtney');
insert into CINEMA_ROOM (room_number, names)
values (66, 'Jeremy');
insert into CINEMA_ROOM (room_number, names)
values (67, 'Keanu');
insert into CINEMA_ROOM (room_number, names)
values (68, 'Nigel');
insert into CINEMA_ROOM (room_number, names)
values (69, 'Roddy');
insert into CINEMA_ROOM (room_number, names)
values (70, 'Hank');
insert into CINEMA_ROOM (room_number, names)
values (71, 'Neneh');
insert into CINEMA_ROOM (room_number, names)
values (72, 'Christina');
insert into CINEMA_ROOM (room_number, names)
values (73, 'Melba');
insert into CINEMA_ROOM (room_number, names)
values (74, 'Alicia');
insert into CINEMA_ROOM (room_number, names)
values (75, 'Kathy');
insert into CINEMA_ROOM (room_number, names)
values (76, 'Swoosie');
insert into CINEMA_ROOM (room_number, names)
values (77, 'Raymond');
insert into CINEMA_ROOM (room_number, names)
values (78, 'Terrence');
insert into CINEMA_ROOM (room_number, names)
values (79, 'Joan');
insert into CINEMA_ROOM (room_number, names)
values (80, 'Willie');
insert into CINEMA_ROOM (room_number, names)
values (81, 'Patty');
insert into CINEMA_ROOM (room_number, names)
values (82, 'Timothy');
insert into CINEMA_ROOM (room_number, names)
values (83, 'Willem');
insert into CINEMA_ROOM (room_number, names)
values (84, 'Nigel');
insert into CINEMA_ROOM (room_number, names)
values (85, 'Red');
insert into CINEMA_ROOM (room_number, names)
values (86, 'Nicolas');
insert into CINEMA_ROOM (room_number, names)
values (87, 'Curtis');
insert into CINEMA_ROOM (room_number, names)
values (88, 'Kurtwood');
insert into CINEMA_ROOM (room_number, names)
values (89, 'Emmylou');
insert into CINEMA_ROOM (room_number, names)
values (90, 'Parker');
insert into CINEMA_ROOM (room_number, names)
values (91, 'Steven');
insert into CINEMA_ROOM (room_number, names)
values (92, 'Vendetta');
insert into CINEMA_ROOM (room_number, names)
values (93, 'Sarah');
insert into CINEMA_ROOM (room_number, names)
values (94, 'Kim');
insert into CINEMA_ROOM (room_number, names)
values (95, 'Bo');
insert into CINEMA_ROOM (room_number, names)
values (96, 'Karen');
insert into CINEMA_ROOM (room_number, names)
values (97, 'Mika');
insert into CINEMA_ROOM (room_number, names)
values (98, 'Keanu');
insert into CINEMA_ROOM (room_number, names)
values (99, 'Holly');
insert into CINEMA_ROOM (room_number, names)
values (100, 'Saffron');
commit;
prompt 100 records committed...
insert into CINEMA_ROOM (room_number, names)
values (101, 'Davy');
insert into CINEMA_ROOM (room_number, names)
values (102, 'Ned');
insert into CINEMA_ROOM (room_number, names)
values (103, 'Ozzy');
insert into CINEMA_ROOM (room_number, names)
values (104, 'Allan');
insert into CINEMA_ROOM (room_number, names)
values (105, 'Morgan');
insert into CINEMA_ROOM (room_number, names)
values (106, 'Bret');
insert into CINEMA_ROOM (room_number, names)
values (107, 'Hilary');
insert into CINEMA_ROOM (room_number, names)
values (108, 'Buddy');
insert into CINEMA_ROOM (room_number, names)
values (109, 'Colin');
insert into CINEMA_ROOM (room_number, names)
values (110, 'Kid');
insert into CINEMA_ROOM (room_number, names)
values (111, 'Jesus');
insert into CINEMA_ROOM (room_number, names)
values (112, 'Phoebe');
insert into CINEMA_ROOM (room_number, names)
values (113, 'Andrea');
insert into CINEMA_ROOM (room_number, names)
values (114, 'Debra');
insert into CINEMA_ROOM (room_number, names)
values (115, 'Victoria');
insert into CINEMA_ROOM (room_number, names)
values (116, 'LeVar');
insert into CINEMA_ROOM (room_number, names)
values (117, 'Luis');
insert into CINEMA_ROOM (room_number, names)
values (118, 'Kirsten');
insert into CINEMA_ROOM (room_number, names)
values (119, 'Kelly');
insert into CINEMA_ROOM (room_number, names)
values (120, 'Diamond');
insert into CINEMA_ROOM (room_number, names)
values (121, 'Donald');
insert into CINEMA_ROOM (room_number, names)
values (122, 'Hugh');
insert into CINEMA_ROOM (room_number, names)
values (123, 'Vern');
insert into CINEMA_ROOM (room_number, names)
values (124, 'Saffron');
insert into CINEMA_ROOM (room_number, names)
values (125, 'Rueben');
insert into CINEMA_ROOM (room_number, names)
values (126, 'Lauren');
insert into CINEMA_ROOM (room_number, names)
values (127, 'Kieran');
insert into CINEMA_ROOM (room_number, names)
values (128, 'Mia');
insert into CINEMA_ROOM (room_number, names)
values (129, 'Doug');
insert into CINEMA_ROOM (room_number, names)
values (130, 'Mena');
insert into CINEMA_ROOM (room_number, names)
values (131, 'Louise');
insert into CINEMA_ROOM (room_number, names)
values (132, 'Larry');
insert into CINEMA_ROOM (room_number, names)
values (133, 'Isaiah');
insert into CINEMA_ROOM (room_number, names)
values (134, 'Lou');
insert into CINEMA_ROOM (room_number, names)
values (135, 'Ray');
insert into CINEMA_ROOM (room_number, names)
values (136, 'Rhys');
insert into CINEMA_ROOM (room_number, names)
values (137, 'Joey');
insert into CINEMA_ROOM (room_number, names)
values (138, 'Andrea');
insert into CINEMA_ROOM (room_number, names)
values (139, 'Charlton');
insert into CINEMA_ROOM (room_number, names)
values (140, 'Mira');
insert into CINEMA_ROOM (room_number, names)
values (141, 'Brooke');
insert into CINEMA_ROOM (room_number, names)
values (142, 'Kyle');
insert into CINEMA_ROOM (room_number, names)
values (143, 'Quentin');
insert into CINEMA_ROOM (room_number, names)
values (144, 'Jean-Claude');
insert into CINEMA_ROOM (room_number, names)
values (145, 'Joely');
insert into CINEMA_ROOM (room_number, names)
values (146, 'Anne');
insert into CINEMA_ROOM (room_number, names)
values (147, 'Patrick');
insert into CINEMA_ROOM (room_number, names)
values (148, 'Gina');
insert into CINEMA_ROOM (room_number, names)
values (149, 'Michelle');
insert into CINEMA_ROOM (room_number, names)
values (150, 'Meryl');
insert into CINEMA_ROOM (room_number, names)
values (151, 'Moe');
insert into CINEMA_ROOM (room_number, names)
values (152, 'Vivica');
insert into CINEMA_ROOM (room_number, names)
values (153, 'Derek');
insert into CINEMA_ROOM (room_number, names)
values (154, 'Noah');
insert into CINEMA_ROOM (room_number, names)
values (155, 'Bette');
insert into CINEMA_ROOM (room_number, names)
values (156, 'Sissy');
insert into CINEMA_ROOM (room_number, names)
values (157, 'Alessandro');
insert into CINEMA_ROOM (room_number, names)
values (158, 'Suzi');
insert into CINEMA_ROOM (room_number, names)
values (159, 'Alice');
insert into CINEMA_ROOM (room_number, names)
values (160, 'Harrison');
insert into CINEMA_ROOM (room_number, names)
values (161, 'Vince');
insert into CINEMA_ROOM (room_number, names)
values (162, 'Marlon');
insert into CINEMA_ROOM (room_number, names)
values (163, 'Hilton');
insert into CINEMA_ROOM (room_number, names)
values (164, 'Buffy');
insert into CINEMA_ROOM (room_number, names)
values (165, 'Davis');
insert into CINEMA_ROOM (room_number, names)
values (166, 'Austin');
insert into CINEMA_ROOM (room_number, names)
values (167, 'Dustin');
insert into CINEMA_ROOM (room_number, names)
values (168, 'Joey');
insert into CINEMA_ROOM (room_number, names)
values (169, 'Hilary');
insert into CINEMA_ROOM (room_number, names)
values (170, 'Miguel');
insert into CINEMA_ROOM (room_number, names)
values (171, 'Gavin');
insert into CINEMA_ROOM (room_number, names)
values (172, 'Cevin');
insert into CINEMA_ROOM (room_number, names)
values (173, 'Nikki');
insert into CINEMA_ROOM (room_number, names)
values (174, 'Night');
insert into CINEMA_ROOM (room_number, names)
values (175, 'Keanu');
insert into CINEMA_ROOM (room_number, names)
values (176, 'Jude');
insert into CINEMA_ROOM (room_number, names)
values (177, 'Nicolas');
insert into CINEMA_ROOM (room_number, names)
values (178, 'Merle');
insert into CINEMA_ROOM (room_number, names)
values (179, 'Warren');
insert into CINEMA_ROOM (room_number, names)
values (180, 'Dwight');
insert into CINEMA_ROOM (room_number, names)
values (181, 'Goran');
insert into CINEMA_ROOM (room_number, names)
values (182, 'Tobey');
insert into CINEMA_ROOM (room_number, names)
values (183, 'Hank');
insert into CINEMA_ROOM (room_number, names)
values (184, 'Albertina');
insert into CINEMA_ROOM (room_number, names)
values (185, 'Beth');
insert into CINEMA_ROOM (room_number, names)
values (186, 'Percy');
insert into CINEMA_ROOM (room_number, names)
values (187, 'Terry');
insert into CINEMA_ROOM (room_number, names)
values (188, 'Emilio');
insert into CINEMA_ROOM (room_number, names)
values (189, 'Tara');
insert into CINEMA_ROOM (room_number, names)
values (190, 'Temuera');
insert into CINEMA_ROOM (room_number, names)
values (191, 'Nikki');
insert into CINEMA_ROOM (room_number, names)
values (192, 'Chuck');
insert into CINEMA_ROOM (room_number, names)
values (193, 'Milla');
insert into CINEMA_ROOM (room_number, names)
values (194, 'Morgan');
insert into CINEMA_ROOM (room_number, names)
values (195, 'Gerald');
insert into CINEMA_ROOM (room_number, names)
values (196, 'Chloe');
insert into CINEMA_ROOM (room_number, names)
values (197, 'Brooke');
insert into CINEMA_ROOM (room_number, names)
values (198, 'Garry');
insert into CINEMA_ROOM (room_number, names)
values (199, 'Marisa');
insert into CINEMA_ROOM (room_number, names)
values (200, 'Caroline');
commit;
prompt 200 records committed...
insert into CINEMA_ROOM (room_number, names)
values (201, 'Denzel');
insert into CINEMA_ROOM (room_number, names)
values (202, 'Pierce');
insert into CINEMA_ROOM (room_number, names)
values (203, 'Debra');
insert into CINEMA_ROOM (room_number, names)
values (204, 'Taryn');
insert into CINEMA_ROOM (room_number, names)
values (205, 'Gaby');
insert into CINEMA_ROOM (room_number, names)
values (206, 'Juliet');
insert into CINEMA_ROOM (room_number, names)
values (207, 'Geggy');
insert into CINEMA_ROOM (room_number, names)
values (208, 'Ty');
insert into CINEMA_ROOM (room_number, names)
values (209, 'Gavin');
insert into CINEMA_ROOM (room_number, names)
values (210, 'Patty');
insert into CINEMA_ROOM (room_number, names)
values (211, 'Marley');
insert into CINEMA_ROOM (room_number, names)
values (212, 'Russell');
insert into CINEMA_ROOM (room_number, names)
values (213, 'Patricia');
insert into CINEMA_ROOM (room_number, names)
values (214, 'Jeffrey');
insert into CINEMA_ROOM (room_number, names)
values (215, 'Eugene');
insert into CINEMA_ROOM (room_number, names)
values (216, 'Paul');
insert into CINEMA_ROOM (room_number, names)
values (217, 'Adina');
insert into CINEMA_ROOM (room_number, names)
values (218, 'Kathy');
insert into CINEMA_ROOM (room_number, names)
values (219, 'Terri');
insert into CINEMA_ROOM (room_number, names)
values (220, 'Busta');
insert into CINEMA_ROOM (room_number, names)
values (221, 'Carrie-Anne');
insert into CINEMA_ROOM (room_number, names)
values (222, 'Miki');
insert into CINEMA_ROOM (room_number, names)
values (223, 'Dennis');
insert into CINEMA_ROOM (room_number, names)
values (224, 'Busta');
insert into CINEMA_ROOM (room_number, names)
values (225, 'Buffy');
insert into CINEMA_ROOM (room_number, names)
values (226, 'Katie');
insert into CINEMA_ROOM (room_number, names)
values (227, 'Donal');
insert into CINEMA_ROOM (room_number, names)
values (228, 'Maxine');
insert into CINEMA_ROOM (room_number, names)
values (229, 'Coley');
insert into CINEMA_ROOM (room_number, names)
values (230, 'Rick');
insert into CINEMA_ROOM (room_number, names)
values (231, 'Freddie');
insert into CINEMA_ROOM (room_number, names)
values (232, 'Tori');
insert into CINEMA_ROOM (room_number, names)
values (233, 'Clay');
insert into CINEMA_ROOM (room_number, names)
values (234, 'Bebe');
insert into CINEMA_ROOM (room_number, names)
values (235, 'Taylor');
insert into CINEMA_ROOM (room_number, names)
values (236, 'Coley');
insert into CINEMA_ROOM (room_number, names)
values (237, 'Hikaru');
insert into CINEMA_ROOM (room_number, names)
values (238, 'Anne');
insert into CINEMA_ROOM (room_number, names)
values (239, 'Hank');
insert into CINEMA_ROOM (room_number, names)
values (240, 'Jeremy');
insert into CINEMA_ROOM (room_number, names)
values (241, 'Rich');
insert into CINEMA_ROOM (room_number, names)
values (242, 'Julianna');
insert into CINEMA_ROOM (room_number, names)
values (243, 'Scott');
insert into CINEMA_ROOM (room_number, names)
values (244, 'Toni');
insert into CINEMA_ROOM (room_number, names)
values (245, 'Joy');
insert into CINEMA_ROOM (room_number, names)
values (246, 'Jeffery');
insert into CINEMA_ROOM (room_number, names)
values (247, 'Christian');
insert into CINEMA_ROOM (room_number, names)
values (248, 'Madeleine');
insert into CINEMA_ROOM (room_number, names)
values (249, 'Matt');
insert into CINEMA_ROOM (room_number, names)
values (250, 'Val');
insert into CINEMA_ROOM (room_number, names)
values (251, 'Elle');
insert into CINEMA_ROOM (room_number, names)
values (252, 'Dorry');
insert into CINEMA_ROOM (room_number, names)
values (253, 'Johnny');
insert into CINEMA_ROOM (room_number, names)
values (254, 'Stevie');
insert into CINEMA_ROOM (room_number, names)
values (255, 'Patricia');
insert into CINEMA_ROOM (room_number, names)
values (256, 'Shannyn');
insert into CINEMA_ROOM (room_number, names)
values (257, 'Veruca');
insert into CINEMA_ROOM (room_number, names)
values (258, 'Diamond');
insert into CINEMA_ROOM (room_number, names)
values (259, 'Danni');
insert into CINEMA_ROOM (room_number, names)
values (260, 'Roger');
insert into CINEMA_ROOM (room_number, names)
values (261, 'Cyndi');
insert into CINEMA_ROOM (room_number, names)
values (262, 'Brenda');
insert into CINEMA_ROOM (room_number, names)
values (263, 'Rory');
insert into CINEMA_ROOM (room_number, names)
values (264, 'CeCe');
insert into CINEMA_ROOM (room_number, names)
values (265, 'Rascal');
insert into CINEMA_ROOM (room_number, names)
values (266, 'Eric');
insert into CINEMA_ROOM (room_number, names)
values (267, 'Daryle');
insert into CINEMA_ROOM (room_number, names)
values (268, 'Alfie');
insert into CINEMA_ROOM (room_number, names)
values (269, 'Katrin');
insert into CINEMA_ROOM (room_number, names)
values (270, 'Debby');
insert into CINEMA_ROOM (room_number, names)
values (271, 'Ethan');
insert into CINEMA_ROOM (room_number, names)
values (272, 'Chloe');
insert into CINEMA_ROOM (room_number, names)
values (273, 'Jeroen');
insert into CINEMA_ROOM (room_number, names)
values (274, 'Kevin');
insert into CINEMA_ROOM (room_number, names)
values (275, 'Charlie');
insert into CINEMA_ROOM (room_number, names)
values (276, 'Pete');
insert into CINEMA_ROOM (room_number, names)
values (277, 'Tal');
insert into CINEMA_ROOM (room_number, names)
values (278, 'Hugo');
insert into CINEMA_ROOM (room_number, names)
values (279, 'Nigel');
insert into CINEMA_ROOM (room_number, names)
values (280, 'Carole');
insert into CINEMA_ROOM (room_number, names)
values (281, 'Vince');
insert into CINEMA_ROOM (room_number, names)
values (282, 'Alana');
insert into CINEMA_ROOM (room_number, names)
values (283, 'Vern');
insert into CINEMA_ROOM (room_number, names)
values (284, 'Isaac');
insert into CINEMA_ROOM (room_number, names)
values (285, 'Rutger');
insert into CINEMA_ROOM (room_number, names)
values (286, 'Ashley');
insert into CINEMA_ROOM (room_number, names)
values (287, 'Sylvester');
insert into CINEMA_ROOM (room_number, names)
values (288, 'Merrill');
insert into CINEMA_ROOM (room_number, names)
values (289, 'Philip');
insert into CINEMA_ROOM (room_number, names)
values (290, 'Juan');
insert into CINEMA_ROOM (room_number, names)
values (291, 'Laurie');
insert into CINEMA_ROOM (room_number, names)
values (292, 'Fats');
insert into CINEMA_ROOM (room_number, names)
values (293, 'Laura');
insert into CINEMA_ROOM (room_number, names)
values (294, 'Annette');
insert into CINEMA_ROOM (room_number, names)
values (295, 'Martha');
insert into CINEMA_ROOM (room_number, names)
values (296, 'Angelina');
insert into CINEMA_ROOM (room_number, names)
values (297, 'Wayman');
insert into CINEMA_ROOM (room_number, names)
values (298, 'Arturo');
insert into CINEMA_ROOM (room_number, names)
values (299, 'Pat');
insert into CINEMA_ROOM (room_number, names)
values (300, 'Emily');
commit;
prompt 300 records committed...
insert into CINEMA_ROOM (room_number, names)
values (301, 'Jamie');
insert into CINEMA_ROOM (room_number, names)
values (302, 'Lois');
insert into CINEMA_ROOM (room_number, names)
values (303, 'Eliza');
insert into CINEMA_ROOM (room_number, names)
values (304, 'Sissy');
insert into CINEMA_ROOM (room_number, names)
values (305, 'Kid');
insert into CINEMA_ROOM (room_number, names)
values (306, 'Steven');
insert into CINEMA_ROOM (room_number, names)
values (307, 'Delroy');
insert into CINEMA_ROOM (room_number, names)
values (308, 'Ricardo');
insert into CINEMA_ROOM (room_number, names)
values (309, 'Veruca');
insert into CINEMA_ROOM (room_number, names)
values (310, 'Adam');
insert into CINEMA_ROOM (room_number, names)
values (311, 'Miriam');
insert into CINEMA_ROOM (room_number, names)
values (312, 'Tea');
insert into CINEMA_ROOM (room_number, names)
values (313, 'Jackson');
insert into CINEMA_ROOM (room_number, names)
values (314, 'Laurence');
insert into CINEMA_ROOM (room_number, names)
values (315, 'Neil');
insert into CINEMA_ROOM (room_number, names)
values (316, 'Burton');
insert into CINEMA_ROOM (room_number, names)
values (317, 'Eugene');
insert into CINEMA_ROOM (room_number, names)
values (318, 'Geggy');
insert into CINEMA_ROOM (room_number, names)
values (319, 'Taryn');
insert into CINEMA_ROOM (room_number, names)
values (320, 'Emmylou');
insert into CINEMA_ROOM (room_number, names)
values (321, 'Tim');
insert into CINEMA_ROOM (room_number, names)
values (322, 'Elijah');
insert into CINEMA_ROOM (room_number, names)
values (323, 'Suzanne');
insert into CINEMA_ROOM (room_number, names)
values (324, 'Alessandro');
insert into CINEMA_ROOM (room_number, names)
values (325, 'Donal');
insert into CINEMA_ROOM (room_number, names)
values (326, 'Miriam');
insert into CINEMA_ROOM (room_number, names)
values (327, 'Deborah');
insert into CINEMA_ROOM (room_number, names)
values (328, 'Andy');
insert into CINEMA_ROOM (room_number, names)
values (329, 'Chanté');
insert into CINEMA_ROOM (room_number, names)
values (330, 'Wally');
insert into CINEMA_ROOM (room_number, names)
values (331, 'Samantha');
insert into CINEMA_ROOM (room_number, names)
values (332, 'Moe');
insert into CINEMA_ROOM (room_number, names)
values (333, 'Adam');
insert into CINEMA_ROOM (room_number, names)
values (334, 'Holland');
insert into CINEMA_ROOM (room_number, names)
values (335, 'Alannah');
insert into CINEMA_ROOM (room_number, names)
values (336, 'Tony');
insert into CINEMA_ROOM (room_number, names)
values (337, 'Chely');
insert into CINEMA_ROOM (room_number, names)
values (338, 'Carrie');
insert into CINEMA_ROOM (room_number, names)
values (339, 'Bobby');
insert into CINEMA_ROOM (room_number, names)
values (340, 'Taylor');
insert into CINEMA_ROOM (room_number, names)
values (341, 'Dustin');
insert into CINEMA_ROOM (room_number, names)
values (342, 'Campbell');
insert into CINEMA_ROOM (room_number, names)
values (343, 'Rosanne');
insert into CINEMA_ROOM (room_number, names)
values (344, 'Merillee');
insert into CINEMA_ROOM (room_number, names)
values (345, 'Rachel');
insert into CINEMA_ROOM (room_number, names)
values (346, 'Holly');
insert into CINEMA_ROOM (room_number, names)
values (347, 'Willem');
insert into CINEMA_ROOM (room_number, names)
values (348, 'Pamela');
insert into CINEMA_ROOM (room_number, names)
values (349, 'Andy');
insert into CINEMA_ROOM (room_number, names)
values (350, 'Lionel');
insert into CINEMA_ROOM (room_number, names)
values (351, 'Joely');
insert into CINEMA_ROOM (room_number, names)
values (352, 'Chrissie');
insert into CINEMA_ROOM (room_number, names)
values (353, 'Robert');
insert into CINEMA_ROOM (room_number, names)
values (354, 'Buffy');
insert into CINEMA_ROOM (room_number, names)
values (355, 'Cameron');
insert into CINEMA_ROOM (room_number, names)
values (356, 'Denny');
insert into CINEMA_ROOM (room_number, names)
values (357, 'Wendy');
insert into CINEMA_ROOM (room_number, names)
values (358, 'Danni');
insert into CINEMA_ROOM (room_number, names)
values (359, 'Chanté');
insert into CINEMA_ROOM (room_number, names)
values (360, 'Machine');
insert into CINEMA_ROOM (room_number, names)
values (361, 'Adrien');
insert into CINEMA_ROOM (room_number, names)
values (362, 'Luke');
insert into CINEMA_ROOM (room_number, names)
values (363, 'Minnie');
insert into CINEMA_ROOM (room_number, names)
values (364, 'Ossie');
insert into CINEMA_ROOM (room_number, names)
values (365, 'Elias');
insert into CINEMA_ROOM (room_number, names)
values (366, 'Marina');
insert into CINEMA_ROOM (room_number, names)
values (367, 'Oded');
insert into CINEMA_ROOM (room_number, names)
values (368, 'Elle');
insert into CINEMA_ROOM (room_number, names)
values (369, 'Greg');
insert into CINEMA_ROOM (room_number, names)
values (370, 'Davey');
insert into CINEMA_ROOM (room_number, names)
values (371, 'Will');
insert into CINEMA_ROOM (room_number, names)
values (372, 'Elizabeth');
insert into CINEMA_ROOM (room_number, names)
values (373, 'Andrew');
insert into CINEMA_ROOM (room_number, names)
values (374, 'Rowan');
insert into CINEMA_ROOM (room_number, names)
values (375, 'Tom');
insert into CINEMA_ROOM (room_number, names)
values (376, 'Bobbi');
insert into CINEMA_ROOM (room_number, names)
values (377, 'Connie');
insert into CINEMA_ROOM (room_number, names)
values (378, 'Gabriel');
insert into CINEMA_ROOM (room_number, names)
values (379, 'Brian');
insert into CINEMA_ROOM (room_number, names)
values (380, 'Joey');
insert into CINEMA_ROOM (room_number, names)
values (381, 'Humberto');
insert into CINEMA_ROOM (room_number, names)
values (382, 'Goran');
insert into CINEMA_ROOM (room_number, names)
values (383, 'Remy');
insert into CINEMA_ROOM (room_number, names)
values (384, 'Dom');
insert into CINEMA_ROOM (room_number, names)
values (385, 'Malcolm');
insert into CINEMA_ROOM (room_number, names)
values (386, 'Vern');
insert into CINEMA_ROOM (room_number, names)
values (387, 'Gord');
insert into CINEMA_ROOM (room_number, names)
values (388, 'Kristin');
insert into CINEMA_ROOM (room_number, names)
values (389, 'Arturo');
insert into CINEMA_ROOM (room_number, names)
values (390, 'Bernie');
insert into CINEMA_ROOM (room_number, names)
values (391, 'Thin');
insert into CINEMA_ROOM (room_number, names)
values (392, 'Eric');
insert into CINEMA_ROOM (room_number, names)
values (393, 'Moe');
insert into CINEMA_ROOM (room_number, names)
values (394, 'James');
insert into CINEMA_ROOM (room_number, names)
values (395, 'Brothers');
insert into CINEMA_ROOM (room_number, names)
values (396, 'Rick');
insert into CINEMA_ROOM (room_number, names)
values (397, 'Herbie');
insert into CINEMA_ROOM (room_number, names)
values (398, 'Tilda');
insert into CINEMA_ROOM (room_number, names)
values (399, 'Carla');
insert into CINEMA_ROOM (room_number, names)
values (400, 'Hugh');
commit;
prompt 400 records loaded
prompt Loading PROJECTOR_EMPLOYEE...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (1, to_date('28-06-2105 20:43:00', 'dd-mm-yyyy hh24:mi:ss'), 36404, 16, 'Bonneville');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (2, to_date('05-11-2219 01:38:55', 'dd-mm-yyyy hh24:mi:ss'), 5163, 2, 'Frost');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (3, to_date('03-03-2927 02:11:28', 'dd-mm-yyyy hh24:mi:ss'), 81898, 13, 'Branagh');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (4, to_date('10-01-2414 23:19:32', 'dd-mm-yyyy hh24:mi:ss'), 18545, 1, 'Shearer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (5, to_date('06-02-2399 07:09:41', 'dd-mm-yyyy hh24:mi:ss'), 79275, 3, 'Posener');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (6, to_date('10-12-2705 20:14:55', 'dd-mm-yyyy hh24:mi:ss'), 78085, 17, 'Berenger');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (7, to_date('12-10-2662 12:18:34', 'dd-mm-yyyy hh24:mi:ss'), 60440, 10, 'Hawn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (8, to_date('30-05-1961 18:20:35', 'dd-mm-yyyy hh24:mi:ss'), 8604, 6, 'Bradford');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (9, to_date('07-10-2132 22:26:41', 'dd-mm-yyyy hh24:mi:ss'), 32729, 5, 'Lorenz');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (10, to_date('04-03-3035 02:37:32', 'dd-mm-yyyy hh24:mi:ss'), 25731, 14, 'Clarkson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (11, to_date('03-05-1980 16:16:19', 'dd-mm-yyyy hh24:mi:ss'), 28016, 4, 'Scaggs');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (12, to_date('21-05-2240 12:19:17', 'dd-mm-yyyy hh24:mi:ss'), 64108, 16, 'Griggs');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (13, to_date('12-04-2695 08:49:37', 'dd-mm-yyyy hh24:mi:ss'), 49216, 6, 'Melvin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (14, to_date('28-01-2998 18:24:54', 'dd-mm-yyyy hh24:mi:ss'), 39803, 5, 'Lynn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (15, to_date('31-01-2485 17:37:23', 'dd-mm-yyyy hh24:mi:ss'), 597, 10, 'Tucker');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (16, to_date('15-11-1925 21:10:48', 'dd-mm-yyyy hh24:mi:ss'), 10108, 11, 'Levert');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (17, to_date('20-03-2215 10:34:01', 'dd-mm-yyyy hh24:mi:ss'), 33881, 1, 'Johansen');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (18, to_date('31-05-2634 00:39:27', 'dd-mm-yyyy hh24:mi:ss'), 57952, 10, 'Nielsen');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (19, to_date('25-04-2779 09:33:15', 'dd-mm-yyyy hh24:mi:ss'), 14153, 6, 'Buckingham');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (20, to_date('05-02-1963 15:08:29', 'dd-mm-yyyy hh24:mi:ss'), 73704, 13, 'Popper');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (21, to_date('14-01-1955 10:44:41', 'dd-mm-yyyy hh24:mi:ss'), 6366, 20, 'Pullman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (22, to_date('29-07-2747 01:04:39', 'dd-mm-yyyy hh24:mi:ss'), 39177, 11, 'Boone');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (23, to_date('25-07-2504 12:41:45', 'dd-mm-yyyy hh24:mi:ss'), 54448, 10, 'Darren');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (24, to_date('18-04-2554 07:30:08', 'dd-mm-yyyy hh24:mi:ss'), 36241, 10, 'Colin Young');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (25, to_date('11-11-2121 12:30:48', 'dd-mm-yyyy hh24:mi:ss'), 30609, 2, 'Tilly');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (26, to_date('31-03-3067 22:21:30', 'dd-mm-yyyy hh24:mi:ss'), 66422, 16, 'Finn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (27, to_date('14-02-2856 18:25:20', 'dd-mm-yyyy hh24:mi:ss'), 73246, 4, 'Dushku');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (28, to_date('04-04-2497 14:24:00', 'dd-mm-yyyy hh24:mi:ss'), 27113, 14, 'Roy Parnell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (29, to_date('07-12-2381 06:23:11', 'dd-mm-yyyy hh24:mi:ss'), 58248, 17, 'Watley');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (30, to_date('15-11-2763 09:25:29', 'dd-mm-yyyy hh24:mi:ss'), 17179, 15, 'Geldof');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (31, to_date('13-10-2393 22:05:13', 'dd-mm-yyyy hh24:mi:ss'), 4506, 5, 'Buscemi');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (32, to_date('24-08-2051 13:07:14', 'dd-mm-yyyy hh24:mi:ss'), 21560, 16, 'Springfield');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (33, to_date('28-01-2375 09:30:57', 'dd-mm-yyyy hh24:mi:ss'), 31215, 4, 'Bancroft');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (34, to_date('06-01-2139 16:14:18', 'dd-mm-yyyy hh24:mi:ss'), 11685, 16, 'Janssen');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (35, to_date('02-01-2260 20:20:41', 'dd-mm-yyyy hh24:mi:ss'), 39783, 13, 'Checker');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (36, to_date('07-07-2277 21:52:33', 'dd-mm-yyyy hh24:mi:ss'), 29669, 9, 'Russell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (37, to_date('03-03-2229 08:59:25', 'dd-mm-yyyy hh24:mi:ss'), 70739, 9, 'David');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (38, to_date('06-12-1963 21:33:59', 'dd-mm-yyyy hh24:mi:ss'), 83526, 9, 'Serbedzija');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (39, to_date('07-09-1990 20:24:25', 'dd-mm-yyyy hh24:mi:ss'), 39633, 2, 'Zeta-Jones');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (40, to_date('15-01-2022 20:33:12', 'dd-mm-yyyy hh24:mi:ss'), 26172, 5, 'Prinze');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (41, to_date('13-08-3074 01:06:31', 'dd-mm-yyyy hh24:mi:ss'), 61547, 6, 'Broderick');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (42, to_date('01-02-2818 08:46:19', 'dd-mm-yyyy hh24:mi:ss'), 23034, 4, 'Donelly');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (43, to_date('23-06-2381 22:20:38', 'dd-mm-yyyy hh24:mi:ss'), 68203, 1, 'Coward');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (44, to_date('25-09-1961 12:32:32', 'dd-mm-yyyy hh24:mi:ss'), 53051, 14, 'Farrell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (45, to_date('10-02-2855 00:38:00', 'dd-mm-yyyy hh24:mi:ss'), 13664, 10, 'Lynne');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (46, to_date('20-11-2075 06:33:33', 'dd-mm-yyyy hh24:mi:ss'), 84687, 6, 'Smith');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (47, to_date('27-06-2474 11:50:21', 'dd-mm-yyyy hh24:mi:ss'), 63842, 16, 'Spacek');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (48, to_date('23-01-2765 00:59:11', 'dd-mm-yyyy hh24:mi:ss'), 62933, 1, 'Dickinson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (49, to_date('23-09-2721 21:37:17', 'dd-mm-yyyy hh24:mi:ss'), 78608, 4, 'Haggard');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (50, to_date('26-07-2652 12:49:49', 'dd-mm-yyyy hh24:mi:ss'), 52913, 15, 'Perlman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (51, to_date('01-08-2424 14:29:28', 'dd-mm-yyyy hh24:mi:ss'), 28093, 3, 'Heron');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (52, to_date('28-02-2079 05:33:12', 'dd-mm-yyyy hh24:mi:ss'), 21692, 7, 'Coltrane');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (53, to_date('08-09-2843 14:40:07', 'dd-mm-yyyy hh24:mi:ss'), 47198, 11, 'Atkinson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (54, to_date('20-05-2935 14:22:42', 'dd-mm-yyyy hh24:mi:ss'), 35883, 8, 'Matarazzo');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (55, to_date('09-12-2837 07:35:45', 'dd-mm-yyyy hh24:mi:ss'), 41897, 14, 'Deejay');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (56, to_date('28-10-2099 02:45:53', 'dd-mm-yyyy hh24:mi:ss'), 11050, 9, 'Cruise');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (57, to_date('30-10-2922 02:12:28', 'dd-mm-yyyy hh24:mi:ss'), 56947, 17, 'Dunn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (58, to_date('01-10-2001 08:13:37', 'dd-mm-yyyy hh24:mi:ss'), 49717, 15, 'Melvin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (59, to_date('27-08-2934 16:24:40', 'dd-mm-yyyy hh24:mi:ss'), 22591, 7, 'Harper');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (60, to_date('08-06-3030 16:14:26', 'dd-mm-yyyy hh24:mi:ss'), 71974, 15, 'Nolte');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (61, to_date('27-01-2708 21:46:30', 'dd-mm-yyyy hh24:mi:ss'), 3466, 6, 'Sledge');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (62, to_date('23-07-2485 07:54:46', 'dd-mm-yyyy hh24:mi:ss'), 34682, 18, 'Winstone');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (63, to_date('23-02-2239 16:57:04', 'dd-mm-yyyy hh24:mi:ss'), 85710, 13, 'Driver');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (64, to_date('08-07-2420 04:27:15', 'dd-mm-yyyy hh24:mi:ss'), 48079, 5, 'Ranger');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (65, to_date('20-11-2509 21:18:34', 'dd-mm-yyyy hh24:mi:ss'), 75064, 3, 'de Lancie');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (66, to_date('11-03-2860 06:13:32', 'dd-mm-yyyy hh24:mi:ss'), 44190, 9, 'Morales');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (67, to_date('15-07-2270 06:46:30', 'dd-mm-yyyy hh24:mi:ss'), 42785, 10, 'Ferrer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (68, to_date('24-09-2735 17:05:42', 'dd-mm-yyyy hh24:mi:ss'), 33828, 8, 'Dunst');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (69, to_date('03-11-2538 10:55:37', 'dd-mm-yyyy hh24:mi:ss'), 77745, 8, 'Diggs');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (70, to_date('01-09-2656 20:30:46', 'dd-mm-yyyy hh24:mi:ss'), 1803, 10, 'Suvari');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (71, to_date('04-06-2353 14:15:04', 'dd-mm-yyyy hh24:mi:ss'), 22344, 2, 'Norton');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (72, to_date('13-12-2464 06:15:59', 'dd-mm-yyyy hh24:mi:ss'), 45128, 5, 'Field');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (73, to_date('16-02-2244 22:41:13', 'dd-mm-yyyy hh24:mi:ss'), 56211, 1, 'Scheider');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (74, to_date('11-02-2978 11:58:50', 'dd-mm-yyyy hh24:mi:ss'), 63026, 13, 'Dayne');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (75, to_date('15-03-2484 08:50:12', 'dd-mm-yyyy hh24:mi:ss'), 54112, 19, 'Thomson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (76, to_date('14-05-2514 23:18:57', 'dd-mm-yyyy hh24:mi:ss'), 35535, 3, 'Street');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (77, to_date('22-12-2003 13:24:05', 'dd-mm-yyyy hh24:mi:ss'), 50859, 12, 'Marin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (78, to_date('18-07-2310 14:55:58', 'dd-mm-yyyy hh24:mi:ss'), 26715, 16, 'Trevino');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (79, to_date('10-08-2669 04:52:45', 'dd-mm-yyyy hh24:mi:ss'), 85212, 16, 'Phillips');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (80, to_date('28-03-2018 12:05:54', 'dd-mm-yyyy hh24:mi:ss'), 85252, 14, 'O''Sullivan');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (81, to_date('02-03-2464 16:23:57', 'dd-mm-yyyy hh24:mi:ss'), 27587, 9, 'Moorer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (82, to_date('02-12-2916 21:36:08', 'dd-mm-yyyy hh24:mi:ss'), 42469, 3, 'Plimpton');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (83, to_date('28-03-2265 21:22:27', 'dd-mm-yyyy hh24:mi:ss'), 82762, 12, 'Leto');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (84, to_date('18-02-2381 14:46:27', 'dd-mm-yyyy hh24:mi:ss'), 71728, 19, 'Pearce');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (85, to_date('12-09-2700 21:47:57', 'dd-mm-yyyy hh24:mi:ss'), 66784, 11, 'Cusack');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (86, to_date('11-04-1944 09:22:10', 'dd-mm-yyyy hh24:mi:ss'), 22038, 2, 'Lynch');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (87, to_date('23-11-2841 16:16:45', 'dd-mm-yyyy hh24:mi:ss'), 50077, 5, 'Dzundza');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (88, to_date('18-10-1912 05:32:47', 'dd-mm-yyyy hh24:mi:ss'), 31459, 1, 'Westerberg');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (89, to_date('13-02-1910 23:18:05', 'dd-mm-yyyy hh24:mi:ss'), 33942, 8, 'Hampton');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (90, to_date('09-06-2521 23:37:14', 'dd-mm-yyyy hh24:mi:ss'), 1114, 6, 'Cusack');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (91, to_date('03-06-2820 08:14:38', 'dd-mm-yyyy hh24:mi:ss'), 42871, 17, 'Beatty');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (92, to_date('14-03-2222 15:30:40', 'dd-mm-yyyy hh24:mi:ss'), 3388, 5, 'Dean');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (93, to_date('18-11-2275 00:29:31', 'dd-mm-yyyy hh24:mi:ss'), 27846, 20, 'O''Sullivan');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (94, to_date('23-04-2514 21:57:18', 'dd-mm-yyyy hh24:mi:ss'), 69140, 10, 'Bentley');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (95, to_date('09-11-2689 01:56:38', 'dd-mm-yyyy hh24:mi:ss'), 12652, 7, 'Satriani');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (96, to_date('03-06-2852 14:22:24', 'dd-mm-yyyy hh24:mi:ss'), 45105, 19, 'Milsap');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (97, to_date('01-04-2427 09:04:19', 'dd-mm-yyyy hh24:mi:ss'), 51178, 17, 'Skarsgard');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (98, to_date('03-11-2095 06:30:23', 'dd-mm-yyyy hh24:mi:ss'), 39904, 8, 'Patrick');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (99, to_date('20-02-1994 04:49:35', 'dd-mm-yyyy hh24:mi:ss'), 82127, 13, 'Worrell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (100, to_date('13-01-2971 05:15:47', 'dd-mm-yyyy hh24:mi:ss'), 76247, 11, 'Gertner');
commit;
prompt 100 records committed...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (101, to_date('21-06-2657 10:11:08', 'dd-mm-yyyy hh24:mi:ss'), 26719, 14, 'Lennix');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (102, to_date('01-09-1908 00:13:32', 'dd-mm-yyyy hh24:mi:ss'), 72541, 16, 'McGovern');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (103, to_date('31-05-2198 09:25:29', 'dd-mm-yyyy hh24:mi:ss'), 42999, 10, 'Franks');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (104, to_date('19-06-3060 23:30:37', 'dd-mm-yyyy hh24:mi:ss'), 67497, 8, 'Hawthorne');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (105, to_date('21-06-1910 07:10:07', 'dd-mm-yyyy hh24:mi:ss'), 72744, 15, 'Stowe');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (106, to_date('23-08-2403 06:39:10', 'dd-mm-yyyy hh24:mi:ss'), 82934, 8, 'Twilley');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (107, to_date('26-10-2499 02:35:57', 'dd-mm-yyyy hh24:mi:ss'), 63368, 8, 'Haysbert');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (108, to_date('26-09-1904 09:25:03', 'dd-mm-yyyy hh24:mi:ss'), 56786, 15, 'Dale');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (109, to_date('26-12-2998 18:52:42', 'dd-mm-yyyy hh24:mi:ss'), 829, 8, 'Hanks');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (110, to_date('22-06-2002 10:10:42', 'dd-mm-yyyy hh24:mi:ss'), 19110, 14, 'Braugher');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (111, to_date('12-10-2693 19:50:35', 'dd-mm-yyyy hh24:mi:ss'), 12732, 13, 'Hubbard');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (112, to_date('30-06-2983 05:04:50', 'dd-mm-yyyy hh24:mi:ss'), 79091, 14, 'Hawkins');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (113, to_date('12-10-2535 03:23:19', 'dd-mm-yyyy hh24:mi:ss'), 23242, 3, 'Hidalgo');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (114, to_date('11-11-2315 21:22:36', 'dd-mm-yyyy hh24:mi:ss'), 50247, 1, 'Lizzy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (115, to_date('29-07-2512 09:03:27', 'dd-mm-yyyy hh24:mi:ss'), 82983, 2, 'Tisdale');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (116, to_date('20-05-2051 15:04:53', 'dd-mm-yyyy hh24:mi:ss'), 9837, 20, 'Goldblum');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (117, to_date('07-05-2031 12:51:41', 'dd-mm-yyyy hh24:mi:ss'), 77951, 16, 'Woodard');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (118, to_date('13-05-2778 06:43:46', 'dd-mm-yyyy hh24:mi:ss'), 64467, 10, 'Gano');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (119, to_date('10-10-2139 13:50:26', 'dd-mm-yyyy hh24:mi:ss'), 27013, 5, 'Fiennes');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (120, to_date('16-06-2939 23:23:16', 'dd-mm-yyyy hh24:mi:ss'), 13094, 6, 'Badalucco');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (121, to_date('26-10-2528 03:17:34', 'dd-mm-yyyy hh24:mi:ss'), 17620, 2, 'Joli');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (122, to_date('13-10-2338 07:26:06', 'dd-mm-yyyy hh24:mi:ss'), 30638, 17, 'Wayans');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (123, to_date('22-09-2724 20:46:10', 'dd-mm-yyyy hh24:mi:ss'), 38909, 3, 'Rapaport');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (124, to_date('07-09-2782 07:01:12', 'dd-mm-yyyy hh24:mi:ss'), 39382, 14, 'McGoohan');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (125, to_date('23-07-2766 02:46:10', 'dd-mm-yyyy hh24:mi:ss'), 57811, 16, 'Chappelle');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (126, to_date('21-06-2326 01:42:05', 'dd-mm-yyyy hh24:mi:ss'), 14579, 8, 'Tucci');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (127, to_date('30-04-2193 16:38:55', 'dd-mm-yyyy hh24:mi:ss'), 78956, 6, 'Peterson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (128, to_date('09-10-1941 11:24:17', 'dd-mm-yyyy hh24:mi:ss'), 14663, 20, 'Blige');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (129, to_date('21-06-2044 21:46:30', 'dd-mm-yyyy hh24:mi:ss'), 15581, 12, 'Brothers');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (130, to_date('09-02-2262 10:00:20', 'dd-mm-yyyy hh24:mi:ss'), 22452, 1, 'Kelly');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (131, to_date('12-01-2818 00:51:07', 'dd-mm-yyyy hh24:mi:ss'), 62634, 12, 'Penders');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (132, to_date('19-10-2165 06:39:36', 'dd-mm-yyyy hh24:mi:ss'), 29351, 9, 'Bullock');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (133, to_date('03-06-1914 03:59:11', 'dd-mm-yyyy hh24:mi:ss'), 16884, 2, 'Pullman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (134, to_date('12-01-2724 05:23:08', 'dd-mm-yyyy hh24:mi:ss'), 16967, 5, 'Faithfull');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (135, to_date('30-11-2324 12:32:06', 'dd-mm-yyyy hh24:mi:ss'), 49623, 6, 'Weber');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (136, to_date('30-12-2402 16:48:51', 'dd-mm-yyyy hh24:mi:ss'), 8904, 16, 'McDowell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (137, to_date('15-12-1990 03:31:40', 'dd-mm-yyyy hh24:mi:ss'), 80773, 14, 'Lerner');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (138, to_date('24-11-2334 02:12:20', 'dd-mm-yyyy hh24:mi:ss'), 19981, 16, 'Collette');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (139, to_date('14-08-2639 06:28:48', 'dd-mm-yyyy hh24:mi:ss'), 796, 18, 'Cervine');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (140, to_date('19-12-2842 13:38:55', 'dd-mm-yyyy hh24:mi:ss'), 75628, 4, 'Harris');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (141, to_date('31-08-2817 23:15:47', 'dd-mm-yyyy hh24:mi:ss'), 49196, 11, 'Penders');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (142, to_date('13-11-2979 05:28:36', 'dd-mm-yyyy hh24:mi:ss'), 42299, 16, 'Platt');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (143, to_date('08-05-2170 07:49:09', 'dd-mm-yyyy hh24:mi:ss'), 53627, 4, 'Wood');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (144, to_date('26-05-1903 05:26:00', 'dd-mm-yyyy hh24:mi:ss'), 46475, 2, 'Wood');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (145, to_date('14-11-2853 07:33:18', 'dd-mm-yyyy hh24:mi:ss'), 35198, 10, 'Wahlberg');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (146, to_date('11-08-2089 21:34:24', 'dd-mm-yyyy hh24:mi:ss'), 13471, 16, 'Wolf');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (147, to_date('20-12-2201 20:52:30', 'dd-mm-yyyy hh24:mi:ss'), 19983, 2, 'Bachman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (148, to_date('13-02-2624 17:46:27', 'dd-mm-yyyy hh24:mi:ss'), 54043, 4, 'Diehl');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (149, to_date('01-11-2516 00:05:36', 'dd-mm-yyyy hh24:mi:ss'), 7122, 20, 'Blades');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (150, to_date('23-02-2562 13:35:54', 'dd-mm-yyyy hh24:mi:ss'), 57195, 9, 'Durning');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (151, to_date('02-10-2706 14:23:42', 'dd-mm-yyyy hh24:mi:ss'), 7131, 12, 'Esposito');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (152, to_date('18-04-2598 17:18:14', 'dd-mm-yyyy hh24:mi:ss'), 44380, 8, 'Aglukark');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (153, to_date('27-05-2344 00:08:21', 'dd-mm-yyyy hh24:mi:ss'), 64006, 2, 'Platt');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (154, to_date('01-01-2694 17:05:08', 'dd-mm-yyyy hh24:mi:ss'), 75515, 14, 'Osmond');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (155, to_date('11-11-2858 08:50:21', 'dd-mm-yyyy hh24:mi:ss'), 1932, 15, 'Tippe');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (156, to_date('03-05-2718 03:32:06', 'dd-mm-yyyy hh24:mi:ss'), 52379, 16, 'Sinise');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (157, to_date('16-07-2333 18:19:00', 'dd-mm-yyyy hh24:mi:ss'), 19787, 6, 'Winger');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (158, to_date('21-04-2574 00:49:23', 'dd-mm-yyyy hh24:mi:ss'), 24223, 9, 'Stuermer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (159, to_date('01-10-2724 03:10:56', 'dd-mm-yyyy hh24:mi:ss'), 59848, 10, 'Trejo');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (160, to_date('25-08-2986 18:06:37', 'dd-mm-yyyy hh24:mi:ss'), 45178, 11, 'Pigott-Smith');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (161, to_date('20-10-2454 19:53:45', 'dd-mm-yyyy hh24:mi:ss'), 24297, 12, 'Dafoe');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (162, to_date('21-05-2247 11:07:43', 'dd-mm-yyyy hh24:mi:ss'), 15458, 16, 'Schock');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (163, to_date('03-09-2601 06:41:11', 'dd-mm-yyyy hh24:mi:ss'), 61932, 17, 'Stanley');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (164, to_date('26-02-3030 16:05:22', 'dd-mm-yyyy hh24:mi:ss'), 24766, 15, 'Newman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (165, to_date('19-11-1990 04:33:53', 'dd-mm-yyyy hh24:mi:ss'), 61067, 6, 'Merchant');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (166, to_date('07-04-2227 19:08:06', 'dd-mm-yyyy hh24:mi:ss'), 74704, 14, 'Fiennes');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (167, to_date('05-04-2356 22:40:30', 'dd-mm-yyyy hh24:mi:ss'), 76640, 9, 'Lithgow');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (168, to_date('17-09-2614 01:13:43', 'dd-mm-yyyy hh24:mi:ss'), 44175, 12, 'Kinski');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (169, to_date('26-11-2402 12:44:03', 'dd-mm-yyyy hh24:mi:ss'), 49922, 2, 'Venora');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (170, to_date('08-03-2836 00:33:15', 'dd-mm-yyyy hh24:mi:ss'), 70593, 4, 'Schwimmer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (171, to_date('23-12-1938 15:48:57', 'dd-mm-yyyy hh24:mi:ss'), 30421, 19, 'McGill');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (172, to_date('03-08-2159 17:16:22', 'dd-mm-yyyy hh24:mi:ss'), 50886, 2, 'Kidman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (173, to_date('17-04-1965 07:16:45', 'dd-mm-yyyy hh24:mi:ss'), 35987, 17, 'Dawson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (174, to_date('26-03-2367 07:57:38', 'dd-mm-yyyy hh24:mi:ss'), 76705, 1, 'Brown');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (175, to_date('29-06-3074 06:55:43', 'dd-mm-yyyy hh24:mi:ss'), 69522, 11, 'Giraldo');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (176, to_date('12-01-2076 11:43:26', 'dd-mm-yyyy hh24:mi:ss'), 75827, 1, 'Barry');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (177, to_date('05-11-2159 22:22:04', 'dd-mm-yyyy hh24:mi:ss'), 33081, 15, 'Hynde');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (178, to_date('29-06-2302 00:06:02', 'dd-mm-yyyy hh24:mi:ss'), 42165, 16, 'Turner');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (179, to_date('22-08-2720 19:11:25', 'dd-mm-yyyy hh24:mi:ss'), 57786, 4, 'Green');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (180, to_date('14-10-2105 11:37:23', 'dd-mm-yyyy hh24:mi:ss'), 76772, 1, 'Jeter');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (181, to_date('06-08-2310 21:11:57', 'dd-mm-yyyy hh24:mi:ss'), 39923, 18, 'Colon');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (182, to_date('26-11-1947 11:38:32', 'dd-mm-yyyy hh24:mi:ss'), 67047, 18, 'Paul');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (183, to_date('30-03-2990 09:31:32', 'dd-mm-yyyy hh24:mi:ss'), 24854, 7, 'Conroy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (184, to_date('27-06-3011 02:20:49', 'dd-mm-yyyy hh24:mi:ss'), 40942, 8, 'Jovovich');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (185, to_date('07-02-2450 22:19:03', 'dd-mm-yyyy hh24:mi:ss'), 56325, 14, 'Glenn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (186, to_date('29-06-2475 22:58:30', 'dd-mm-yyyy hh24:mi:ss'), 72969, 5, 'Cromwell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (187, to_date('18-03-2258 15:47:22', 'dd-mm-yyyy hh24:mi:ss'), 9565, 2, 'Allen');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (188, to_date('10-06-2387 08:50:38', 'dd-mm-yyyy hh24:mi:ss'), 1204, 2, 'Barnett');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (189, to_date('10-01-2658 11:22:16', 'dd-mm-yyyy hh24:mi:ss'), 12999, 7, 'Sutherland');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (190, to_date('01-03-2734 17:28:27', 'dd-mm-yyyy hh24:mi:ss'), 78498, 11, 'Faithfull');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (191, to_date('13-07-2731 01:07:40', 'dd-mm-yyyy hh24:mi:ss'), 76152, 19, 'Hewett');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (192, to_date('17-08-2229 11:59:25', 'dd-mm-yyyy hh24:mi:ss'), 52275, 13, 'Brando');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (193, to_date('20-08-2399 20:54:14', 'dd-mm-yyyy hh24:mi:ss'), 46953, 2, 'Hatosy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (194, to_date('23-12-2115 11:47:11', 'dd-mm-yyyy hh24:mi:ss'), 42547, 19, 'LuPone');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (195, to_date('12-04-2732 08:41:08', 'dd-mm-yyyy hh24:mi:ss'), 71246, 17, 'Weller');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (196, to_date('17-08-2394 14:48:46', 'dd-mm-yyyy hh24:mi:ss'), 21315, 2, 'Barkin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (197, to_date('22-03-2216 09:08:21', 'dd-mm-yyyy hh24:mi:ss'), 85692, 1, 'Spine');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (198, to_date('25-07-2246 06:38:35', 'dd-mm-yyyy hh24:mi:ss'), 53377, 1, 'White');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (199, to_date('18-10-1915 14:56:24', 'dd-mm-yyyy hh24:mi:ss'), 72076, 20, 'Woods');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (200, to_date('04-01-2290 17:16:30', 'dd-mm-yyyy hh24:mi:ss'), 2534, 18, 'Nelson');
commit;
prompt 200 records committed...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (201, to_date('20-08-3063 11:45:44', 'dd-mm-yyyy hh24:mi:ss'), 36217, 3, 'Glenn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (202, to_date('23-11-2795 20:05:51', 'dd-mm-yyyy hh24:mi:ss'), 85595, 20, 'Paquin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (203, to_date('14-01-2961 00:28:56', 'dd-mm-yyyy hh24:mi:ss'), 57067, 1, 'Damon');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (204, to_date('23-09-2564 15:05:36', 'dd-mm-yyyy hh24:mi:ss'), 27786, 1, 'Martin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (205, to_date('23-01-2123 07:09:59', 'dd-mm-yyyy hh24:mi:ss'), 60426, 1, 'Palin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (206, to_date('02-10-1992 06:48:23', 'dd-mm-yyyy hh24:mi:ss'), 16354, 5, 'Mewes');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (207, to_date('14-09-2677 01:14:26', 'dd-mm-yyyy hh24:mi:ss'), 8441, 13, 'Keaton');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (208, to_date('23-10-2095 16:28:16', 'dd-mm-yyyy hh24:mi:ss'), 82775, 13, 'Chinlund');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (209, to_date('12-11-2722 15:48:48', 'dd-mm-yyyy hh24:mi:ss'), 72916, 2, 'Brooke');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (210, to_date('18-10-3018 06:52:24', 'dd-mm-yyyy hh24:mi:ss'), 73556, 9, 'Close');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (211, to_date('18-01-1928 15:49:58', 'dd-mm-yyyy hh24:mi:ss'), 14817, 16, 'Giraldo');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (212, to_date('05-08-2030 07:55:29', 'dd-mm-yyyy hh24:mi:ss'), 36849, 5, 'Bentley');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (213, to_date('29-11-1917 08:54:40', 'dd-mm-yyyy hh24:mi:ss'), 16378, 5, 'Abraham');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (214, to_date('24-10-2763 14:01:58', 'dd-mm-yyyy hh24:mi:ss'), 74448, 12, 'Vanian');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (215, to_date('04-08-2613 22:19:46', 'dd-mm-yyyy hh24:mi:ss'), 28209, 9, 'Warden');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (216, to_date('04-06-2773 19:02:21', 'dd-mm-yyyy hh24:mi:ss'), 4804, 10, 'Winslet');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (217, to_date('02-04-2763 22:48:08', 'dd-mm-yyyy hh24:mi:ss'), 50601, 2, 'McDonald');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (218, to_date('26-06-2923 10:31:35', 'dd-mm-yyyy hh24:mi:ss'), 46625, 18, 'Gugino');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (219, to_date('28-12-2309 03:59:02', 'dd-mm-yyyy hh24:mi:ss'), 53032, 15, 'Lerner');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (220, to_date('15-04-2148 02:44:18', 'dd-mm-yyyy hh24:mi:ss'), 17484, 6, 'Finn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (221, to_date('18-05-3069 03:09:04', 'dd-mm-yyyy hh24:mi:ss'), 50272, 13, 'Mars');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (222, to_date('25-05-2282 01:48:25', 'dd-mm-yyyy hh24:mi:ss'), 71428, 11, 'Kinski');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (223, to_date('04-12-3012 17:05:25', 'dd-mm-yyyy hh24:mi:ss'), 75893, 14, 'Cazale');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (224, to_date('15-10-2968 15:36:43', 'dd-mm-yyyy hh24:mi:ss'), 37979, 10, 'Secada');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (225, to_date('16-03-2972 09:16:33', 'dd-mm-yyyy hh24:mi:ss'), 53173, 7, 'Skaggs');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (226, to_date('11-03-1932 13:53:11', 'dd-mm-yyyy hh24:mi:ss'), 40945, 17, 'Lawrence');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (227, to_date('25-03-2245 02:11:28', 'dd-mm-yyyy hh24:mi:ss'), 81800, 3, 'Jessee');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (228, to_date('05-05-2969 21:38:09', 'dd-mm-yyyy hh24:mi:ss'), 64225, 1, 'Hauser');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (229, to_date('17-10-1919 14:55:23', 'dd-mm-yyyy hh24:mi:ss'), 17184, 3, 'Coyote');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (230, to_date('09-04-2258 14:04:16', 'dd-mm-yyyy hh24:mi:ss'), 19813, 3, 'Moore');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (231, to_date('10-09-2978 03:26:29', 'dd-mm-yyyy hh24:mi:ss'), 70356, 19, 'Fisher');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (232, to_date('26-02-2375 00:30:05', 'dd-mm-yyyy hh24:mi:ss'), 58806, 17, 'Osmond');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (233, to_date('18-07-2714 18:04:19', 'dd-mm-yyyy hh24:mi:ss'), 9281, 4, 'Wheel');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (234, to_date('03-05-2278 14:44:44', 'dd-mm-yyyy hh24:mi:ss'), 2212, 12, 'Miles');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (235, to_date('03-05-2389 12:47:31', 'dd-mm-yyyy hh24:mi:ss'), 71961, 13, 'Keith');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (236, to_date('01-11-2064 19:52:53', 'dd-mm-yyyy hh24:mi:ss'), 51552, 13, 'Rhodes');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (237, to_date('01-05-2620 20:08:26', 'dd-mm-yyyy hh24:mi:ss'), 48939, 18, 'Rispoli');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (238, to_date('14-09-2508 07:40:39', 'dd-mm-yyyy hh24:mi:ss'), 14471, 5, 'Marie');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (239, to_date('01-03-2955 04:52:10', 'dd-mm-yyyy hh24:mi:ss'), 77611, 9, 'Fiennes');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (240, to_date('25-12-2908 03:13:06', 'dd-mm-yyyy hh24:mi:ss'), 69341, 20, 'Tempest');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (241, to_date('25-05-2108 21:50:41', 'dd-mm-yyyy hh24:mi:ss'), 37927, 17, 'Chan');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (242, to_date('31-12-1950 04:46:50', 'dd-mm-yyyy hh24:mi:ss'), 44868, 1, 'Madsen');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (243, to_date('30-04-2387 04:40:13', 'dd-mm-yyyy hh24:mi:ss'), 55101, 8, 'Jolie');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (244, to_date('31-10-2756 10:27:50', 'dd-mm-yyyy hh24:mi:ss'), 65898, 8, 'Close');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (245, to_date('23-12-3019 23:27:44', 'dd-mm-yyyy hh24:mi:ss'), 35713, 16, 'Dushku');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (246, to_date('21-05-2134 03:54:43', 'dd-mm-yyyy hh24:mi:ss'), 59824, 10, 'Garr');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (247, to_date('20-01-2376 11:24:34', 'dd-mm-yyyy hh24:mi:ss'), 51620, 19, 'Madonna');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (248, to_date('15-05-2830 02:55:40', 'dd-mm-yyyy hh24:mi:ss'), 24392, 16, 'Cleary');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (249, to_date('26-03-2025 19:03:30', 'dd-mm-yyyy hh24:mi:ss'), 16460, 11, 'Murphy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (250, to_date('10-05-2926 22:08:06', 'dd-mm-yyyy hh24:mi:ss'), 20108, 20, 'Arkenstone');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (251, to_date('28-07-2049 16:45:24', 'dd-mm-yyyy hh24:mi:ss'), 37158, 4, 'Suchet');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (252, to_date('03-03-2359 13:00:02', 'dd-mm-yyyy hh24:mi:ss'), 60043, 19, 'Peniston');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (253, to_date('11-12-2896 14:52:13', 'dd-mm-yyyy hh24:mi:ss'), 58031, 18, 'Rauhofer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (254, to_date('11-03-3047 15:00:08', 'dd-mm-yyyy hh24:mi:ss'), 69838, 7, 'Ruffalo');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (255, to_date('11-05-2016 18:39:10', 'dd-mm-yyyy hh24:mi:ss'), 7097, 12, 'Blackmore');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (256, to_date('18-08-2622 13:59:13', 'dd-mm-yyyy hh24:mi:ss'), 4315, 4, 'Keitel');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (257, to_date('01-12-2913 02:28:36', 'dd-mm-yyyy hh24:mi:ss'), 12582, 13, 'Roth');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (258, to_date('05-04-2936 02:51:04', 'dd-mm-yyyy hh24:mi:ss'), 34277, 19, 'Lopez');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (259, to_date('28-09-2527 21:33:41', 'dd-mm-yyyy hh24:mi:ss'), 84820, 4, 'Sainte-Marie');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (260, to_date('03-10-2760 01:19:46', 'dd-mm-yyyy hh24:mi:ss'), 25920, 6, 'Rippy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (261, to_date('17-10-2782 10:09:24', 'dd-mm-yyyy hh24:mi:ss'), 41168, 6, 'Francis');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (262, to_date('28-08-2914 23:04:50', 'dd-mm-yyyy hh24:mi:ss'), 40835, 17, 'Mellencamp');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (263, to_date('13-06-2816 20:15:30', 'dd-mm-yyyy hh24:mi:ss'), 19505, 5, 'Ifans');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (264, to_date('17-06-2640 22:56:12', 'dd-mm-yyyy hh24:mi:ss'), 42216, 10, 'Chappelle');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (265, to_date('13-11-2448 16:08:49', 'dd-mm-yyyy hh24:mi:ss'), 25141, 8, 'Zahn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (266, to_date('27-09-2523 17:55:06', 'dd-mm-yyyy hh24:mi:ss'), 16868, 6, 'Jackson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (267, to_date('05-01-2787 22:37:12', 'dd-mm-yyyy hh24:mi:ss'), 66326, 5, 'Scorsese');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (268, to_date('13-02-2194 18:56:09', 'dd-mm-yyyy hh24:mi:ss'), 81010, 10, 'Candy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (269, to_date('18-06-2786 19:25:06', 'dd-mm-yyyy hh24:mi:ss'), 14350, 1, 'Cruise');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (270, to_date('06-07-2215 01:13:26', 'dd-mm-yyyy hh24:mi:ss'), 51481, 20, 'Fisher');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (271, to_date('16-04-2354 09:24:20', 'dd-mm-yyyy hh24:mi:ss'), 52256, 20, 'Sepulveda');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (272, to_date('12-01-1934 04:58:56', 'dd-mm-yyyy hh24:mi:ss'), 37553, 6, 'Speaks');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (273, to_date('11-08-2585 08:27:18', 'dd-mm-yyyy hh24:mi:ss'), 70540, 3, 'Rosas');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (274, to_date('02-03-2691 18:15:41', 'dd-mm-yyyy hh24:mi:ss'), 66126, 20, 'Van Der Beek');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (275, to_date('08-12-1957 21:31:49', 'dd-mm-yyyy hh24:mi:ss'), 83463, 11, 'Channing');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (276, to_date('12-12-2290 08:00:48', 'dd-mm-yyyy hh24:mi:ss'), 36344, 2, 'Singh');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (277, to_date('23-04-2594 23:02:58', 'dd-mm-yyyy hh24:mi:ss'), 24352, 5, 'Parm');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (278, to_date('25-09-3063 01:57:38', 'dd-mm-yyyy hh24:mi:ss'), 3598, 10, 'Def');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (279, to_date('18-12-1900 23:51:30', 'dd-mm-yyyy hh24:mi:ss'), 43113, 16, 'Watley');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (280, to_date('23-08-2952 02:02:24', 'dd-mm-yyyy hh24:mi:ss'), 15331, 7, 'McBride');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (281, to_date('20-03-2505 03:04:19', 'dd-mm-yyyy hh24:mi:ss'), 9927, 6, 'Phifer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (282, to_date('03-06-2548 11:43:09', 'dd-mm-yyyy hh24:mi:ss'), 17044, 18, 'Woodward');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (283, to_date('08-03-2864 16:28:24', 'dd-mm-yyyy hh24:mi:ss'), 39568, 17, 'Martin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (284, to_date('13-06-2202 11:54:57', 'dd-mm-yyyy hh24:mi:ss'), 1305, 14, 'Flack');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (285, to_date('07-01-2646 03:15:24', 'dd-mm-yyyy hh24:mi:ss'), 49100, 19, 'Caine');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (286, to_date('19-01-2153 16:11:42', 'dd-mm-yyyy hh24:mi:ss'), 54154, 15, 'Lynne');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (287, to_date('06-12-2892 03:26:29', 'dd-mm-yyyy hh24:mi:ss'), 76989, 16, 'Cobbs');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (288, to_date('22-05-2137 14:39:24', 'dd-mm-yyyy hh24:mi:ss'), 39708, 16, 'Mulroney');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (289, to_date('30-01-2142 01:28:33', 'dd-mm-yyyy hh24:mi:ss'), 67604, 2, 'Holeman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (290, to_date('24-08-2840 13:34:19', 'dd-mm-yyyy hh24:mi:ss'), 46167, 12, 'Kattan');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (291, to_date('13-03-2615 14:08:09', 'dd-mm-yyyy hh24:mi:ss'), 71531, 11, 'Jackson');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (292, to_date('23-02-2127 05:40:59', 'dd-mm-yyyy hh24:mi:ss'), 38025, 7, 'Duchovny');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (293, to_date('30-08-2958 08:32:47', 'dd-mm-yyyy hh24:mi:ss'), 84069, 5, 'Wariner');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (294, to_date('25-02-2516 00:19:09', 'dd-mm-yyyy hh24:mi:ss'), 10468, 20, 'Domino');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (295, to_date('30-04-2228 23:59:34', 'dd-mm-yyyy hh24:mi:ss'), 40347, 17, 'Gill');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (296, to_date('06-04-2856 12:36:51', 'dd-mm-yyyy hh24:mi:ss'), 41190, 20, 'Oakenfold');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (297, to_date('07-12-2183 06:57:18', 'dd-mm-yyyy hh24:mi:ss'), 53421, 20, 'Niven');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (298, to_date('27-06-2420 00:01:09', 'dd-mm-yyyy hh24:mi:ss'), 66789, 10, 'Allison');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (299, to_date('10-07-2013 17:47:36', 'dd-mm-yyyy hh24:mi:ss'), 31388, 7, 'Playboys');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (300, to_date('13-12-2134 08:32:03', 'dd-mm-yyyy hh24:mi:ss'), 74983, 6, 'Renfro');
commit;
prompt 300 records committed...
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (301, to_date('24-10-1950 02:13:03', 'dd-mm-yyyy hh24:mi:ss'), 55885, 7, 'Pesci');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (302, to_date('11-05-2941 00:37:09', 'dd-mm-yyyy hh24:mi:ss'), 21409, 6, 'Cole');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (303, to_date('05-04-2850 04:57:21', 'dd-mm-yyyy hh24:mi:ss'), 53200, 6, 'Willis');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (304, to_date('16-01-2469 20:19:23', 'dd-mm-yyyy hh24:mi:ss'), 75833, 11, 'Moore');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (305, to_date('24-11-2895 17:06:17', 'dd-mm-yyyy hh24:mi:ss'), 53979, 8, 'Danger');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (306, to_date('09-10-2951 10:12:25', 'dd-mm-yyyy hh24:mi:ss'), 74555, 13, 'Camp');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (307, to_date('05-02-2027 04:46:33', 'dd-mm-yyyy hh24:mi:ss'), 4728, 13, 'Strathairn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (308, to_date('23-02-2167 11:52:13', 'dd-mm-yyyy hh24:mi:ss'), 79814, 19, 'Collins');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (309, to_date('11-02-2322 19:54:46', 'dd-mm-yyyy hh24:mi:ss'), 81522, 7, 'Weisberg');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (310, to_date('10-05-2676 15:18:51', 'dd-mm-yyyy hh24:mi:ss'), 58997, 7, 'Weaver');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (311, to_date('02-08-1987 18:16:59', 'dd-mm-yyyy hh24:mi:ss'), 37111, 19, 'Burns');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (312, to_date('30-07-2910 16:24:48', 'dd-mm-yyyy hh24:mi:ss'), 66045, 7, 'Shaye');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (313, to_date('03-08-2944 16:18:28', 'dd-mm-yyyy hh24:mi:ss'), 627, 12, 'Zellweger');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (314, to_date('29-11-3029 12:41:36', 'dd-mm-yyyy hh24:mi:ss'), 61057, 19, 'Busey');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (315, to_date('13-04-2613 14:57:33', 'dd-mm-yyyy hh24:mi:ss'), 51488, 6, 'Baldwin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (316, to_date('31-05-2036 03:15:59', 'dd-mm-yyyy hh24:mi:ss'), 59297, 4, 'De Almeida');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (317, to_date('11-11-2821 21:02:18', 'dd-mm-yyyy hh24:mi:ss'), 36306, 9, 'Hiatt');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (318, to_date('05-02-2604 02:03:59', 'dd-mm-yyyy hh24:mi:ss'), 4800, 13, 'Bridges');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (319, to_date('20-02-2914 03:31:49', 'dd-mm-yyyy hh24:mi:ss'), 60793, 4, 'Hampton');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (320, to_date('28-04-2459 01:09:59', 'dd-mm-yyyy hh24:mi:ss'), 59782, 10, 'Thomas');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (321, to_date('10-11-2925 22:15:53', 'dd-mm-yyyy hh24:mi:ss'), 15066, 2, 'Weir');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (322, to_date('01-08-2885 07:28:07', 'dd-mm-yyyy hh24:mi:ss'), 13841, 2, 'Carradine');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (323, to_date('21-11-2718 06:45:56', 'dd-mm-yyyy hh24:mi:ss'), 33157, 12, 'Stigers');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (324, to_date('23-09-2602 21:59:19', 'dd-mm-yyyy hh24:mi:ss'), 59364, 19, 'Webb');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (325, to_date('04-09-2952 14:49:03', 'dd-mm-yyyy hh24:mi:ss'), 72313, 15, 'Santana');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (326, to_date('08-12-2890 06:57:44', 'dd-mm-yyyy hh24:mi:ss'), 81939, 11, 'Tankard');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (327, to_date('02-08-2013 21:14:58', 'dd-mm-yyyy hh24:mi:ss'), 80908, 17, 'Woods');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (328, to_date('21-11-2792 17:34:04', 'dd-mm-yyyy hh24:mi:ss'), 57751, 10, 'Russell');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (329, to_date('20-12-3012 22:59:05', 'dd-mm-yyyy hh24:mi:ss'), 63747, 6, 'Chan');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (330, to_date('21-11-2032 10:57:30', 'dd-mm-yyyy hh24:mi:ss'), 2800, 11, 'Checker');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (331, to_date('04-01-2632 16:10:59', 'dd-mm-yyyy hh24:mi:ss'), 44772, 10, 'Mitra');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (332, to_date('10-08-2245 16:27:50', 'dd-mm-yyyy hh24:mi:ss'), 78699, 12, 'Quinones');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (333, to_date('30-06-2970 12:17:08', 'dd-mm-yyyy hh24:mi:ss'), 13567, 10, 'Weller');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (334, to_date('04-09-2986 20:30:37', 'dd-mm-yyyy hh24:mi:ss'), 77480, 1, 'Kramer');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (335, to_date('29-06-2890 07:06:40', 'dd-mm-yyyy hh24:mi:ss'), 28470, 6, 'Ramirez');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (336, to_date('08-07-1932 10:15:18', 'dd-mm-yyyy hh24:mi:ss'), 13408, 19, 'Rowlands');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (337, to_date('31-07-2956 00:46:04', 'dd-mm-yyyy hh24:mi:ss'), 44270, 14, 'Osborne');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (338, to_date('12-02-2797 06:31:49', 'dd-mm-yyyy hh24:mi:ss'), 7379, 7, 'Wiedlin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (339, to_date('08-02-2806 05:15:21', 'dd-mm-yyyy hh24:mi:ss'), 69321, 6, 'Burstyn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (340, to_date('22-09-2743 01:49:17', 'dd-mm-yyyy hh24:mi:ss'), 68730, 13, 'Dorff');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (341, to_date('30-08-2708 18:46:30', 'dd-mm-yyyy hh24:mi:ss'), 47245, 18, 'Schiavelli');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (342, to_date('14-06-2800 09:09:12', 'dd-mm-yyyy hh24:mi:ss'), 33645, 20, 'Snipes');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (343, to_date('03-04-2259 17:46:36', 'dd-mm-yyyy hh24:mi:ss'), 68041, 10, 'Winter');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (344, to_date('30-06-2474 22:04:56', 'dd-mm-yyyy hh24:mi:ss'), 5761, 17, 'Kretschmann');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (345, to_date('03-10-2084 04:13:43', 'dd-mm-yyyy hh24:mi:ss'), 44584, 14, 'Ramirez');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (346, to_date('15-04-2083 11:56:58', 'dd-mm-yyyy hh24:mi:ss'), 2972, 12, 'Dayne');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (347, to_date('29-01-2684 22:34:27', 'dd-mm-yyyy hh24:mi:ss'), 64142, 19, 'Renfro');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (348, to_date('11-05-2219 14:50:38', 'dd-mm-yyyy hh24:mi:ss'), 20042, 19, 'Lovitz');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (349, to_date('05-11-2753 17:25:52', 'dd-mm-yyyy hh24:mi:ss'), 32472, 3, 'Frost');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (350, to_date('28-09-2700 11:16:04', 'dd-mm-yyyy hh24:mi:ss'), 75002, 19, 'Rippy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (351, to_date('27-03-2879 01:31:17', 'dd-mm-yyyy hh24:mi:ss'), 79334, 16, 'Owen');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (352, to_date('31-10-2182 14:02:24', 'dd-mm-yyyy hh24:mi:ss'), 66564, 8, 'Snow');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (353, to_date('25-09-2830 02:47:54', 'dd-mm-yyyy hh24:mi:ss'), 83792, 16, 'Moody');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (354, to_date('17-06-1959 02:56:32', 'dd-mm-yyyy hh24:mi:ss'), 47323, 18, 'Guzman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (355, to_date('12-02-3050 02:17:48', 'dd-mm-yyyy hh24:mi:ss'), 47323, 18, 'Lloyd');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (356, to_date('11-12-2193 15:01:17', 'dd-mm-yyyy hh24:mi:ss'), 48765, 13, 'Wainwright');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (357, to_date('13-03-2094 02:11:19', 'dd-mm-yyyy hh24:mi:ss'), 18723, 10, 'Mathis');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (358, to_date('13-06-2339 09:39:18', 'dd-mm-yyyy hh24:mi:ss'), 62871, 6, 'Steiger');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (359, to_date('25-06-2971 18:38:00', 'dd-mm-yyyy hh24:mi:ss'), 2813, 3, 'Garner');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (360, to_date('01-09-2220 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 7526, 1, 'Cara');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (361, to_date('17-06-2501 02:10:53', 'dd-mm-yyyy hh24:mi:ss'), 25743, 10, 'Paquin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (362, to_date('07-03-2601 12:09:12', 'dd-mm-yyyy hh24:mi:ss'), 21326, 16, 'Penn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (363, to_date('04-12-2501 05:36:57', 'dd-mm-yyyy hh24:mi:ss'), 11302, 2, 'Addy');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (364, to_date('20-05-2884 22:30:43', 'dd-mm-yyyy hh24:mi:ss'), 50980, 20, 'Checker');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (365, to_date('13-01-2823 07:49:09', 'dd-mm-yyyy hh24:mi:ss'), 73024, 5, 'Pigott-Smith');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (366, to_date('27-09-3003 18:33:33', 'dd-mm-yyyy hh24:mi:ss'), 27319, 2, 'McIntyre');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (367, to_date('29-04-2098 14:57:41', 'dd-mm-yyyy hh24:mi:ss'), 12489, 20, 'Belushi');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (368, to_date('11-08-2446 13:50:00', 'dd-mm-yyyy hh24:mi:ss'), 25103, 12, 'Turner');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (369, to_date('21-12-2684 08:25:00', 'dd-mm-yyyy hh24:mi:ss'), 11037, 7, 'Gill');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (370, to_date('07-07-2291 09:08:29', 'dd-mm-yyyy hh24:mi:ss'), 61025, 11, 'Folds');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (371, to_date('02-06-2154 10:47:51', 'dd-mm-yyyy hh24:mi:ss'), 9267, 18, 'Fogerty');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (372, to_date('12-02-2027 14:38:06', 'dd-mm-yyyy hh24:mi:ss'), 48320, 15, 'Cocker');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (373, to_date('25-05-1907 09:20:44', 'dd-mm-yyyy hh24:mi:ss'), 20749, 12, 'Vince');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (374, to_date('13-05-2912 05:37:40', 'dd-mm-yyyy hh24:mi:ss'), 80767, 6, 'DiBiasio');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (375, to_date('23-04-2339 21:26:12', 'dd-mm-yyyy hh24:mi:ss'), 83927, 7, 'Lonsdale');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (376, to_date('27-08-2590 02:35:05', 'dd-mm-yyyy hh24:mi:ss'), 9302, 20, 'Chaykin');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (377, to_date('16-11-2194 06:49:32', 'dd-mm-yyyy hh24:mi:ss'), 25025, 16, 'Carlyle');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (378, to_date('14-09-2124 02:25:09', 'dd-mm-yyyy hh24:mi:ss'), 39215, 2, 'Close');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (379, to_date('16-12-2111 10:39:30', 'dd-mm-yyyy hh24:mi:ss'), 68755, 8, 'Collins');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (380, to_date('23-08-1933 18:55:26', 'dd-mm-yyyy hh24:mi:ss'), 15166, 14, 'Gano');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (381, to_date('29-03-2947 21:09:38', 'dd-mm-yyyy hh24:mi:ss'), 50425, 17, 'Masur');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (382, to_date('05-05-1919 17:57:07', 'dd-mm-yyyy hh24:mi:ss'), 72384, 10, 'Thornton');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (383, to_date('24-07-2411 20:30:54', 'dd-mm-yyyy hh24:mi:ss'), 80638, 12, 'Ammons');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (384, to_date('04-03-2254 12:49:06', 'dd-mm-yyyy hh24:mi:ss'), 62078, 12, 'Biehn');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (385, to_date('07-12-2949 23:33:30', 'dd-mm-yyyy hh24:mi:ss'), 70607, 9, 'Minogue');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (386, to_date('31-05-2478 16:55:20', 'dd-mm-yyyy hh24:mi:ss'), 83839, 6, 'Arjona');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (387, to_date('04-04-2644 20:04:16', 'dd-mm-yyyy hh24:mi:ss'), 18855, 19, 'Swank');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (388, to_date('04-01-2435 20:04:33', 'dd-mm-yyyy hh24:mi:ss'), 51450, 1, 'Fisher');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (389, to_date('02-06-2064 06:53:51', 'dd-mm-yyyy hh24:mi:ss'), 22526, 6, 'Womack');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (390, to_date('12-11-2689 21:34:33', 'dd-mm-yyyy hh24:mi:ss'), 20089, 2, 'Lemmon');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (391, to_date('06-07-2373 00:13:06', 'dd-mm-yyyy hh24:mi:ss'), 13286, 16, 'Garr');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (392, to_date('04-11-2085 08:57:07', 'dd-mm-yyyy hh24:mi:ss'), 65339, 17, 'Dourif');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (393, to_date('23-07-2918 08:32:29', 'dd-mm-yyyy hh24:mi:ss'), 81834, 17, 'Kinney');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (394, to_date('27-09-3013 22:00:28', 'dd-mm-yyyy hh24:mi:ss'), 59592, 14, 'Klugh');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (395, to_date('28-06-3010 20:27:01', 'dd-mm-yyyy hh24:mi:ss'), 8605, 14, 'Freeman');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (396, to_date('24-09-2057 15:27:04', 'dd-mm-yyyy hh24:mi:ss'), 37053, 4, 'Branagh');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (397, to_date('14-09-2013 17:32:38', 'dd-mm-yyyy hh24:mi:ss'), 74278, 6, 'Napolitano');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (398, to_date('18-11-2468 16:55:37', 'dd-mm-yyyy hh24:mi:ss'), 24151, 6, 'Sirtis');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (399, to_date('09-12-2448 18:37:17', 'dd-mm-yyyy hh24:mi:ss'), 39683, 9, 'Tisdale');
insert into PROJECTOR_EMPLOYEE (projector_code, dates, times, room_numbeer, movie_name)
values (400, to_date('26-09-2605 23:34:39', 'dd-mm-yyyy hh24:mi:ss'), 26542, 12, 'Moffat');
commit;
prompt 400 records loaded
prompt Loading MOVIE...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (1, 'Tom', 170, 'Thriller', 3, 1);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (2, 'Jeremy', 120, 'Science Fiction', 1, 2);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (3, 'Gina', 112, 'Animation', 11, 3);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (4, 'Natacha', 166, 'Horror', 1, 4);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (5, 'Dom', 73, 'Comedy', 8, 5);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (6, 'Gloria', 60, 'Horror', 19, 6);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (7, 'Andrae', 76, 'Documentary', 16, 7);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (8, 'Faye', 152, 'Thriller', 20, 8);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (9, 'Ozzy', 63, 'Fantasy', 14, 9);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (10, 'Merillee', 105, 'Thriller', 14, 10);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (11, 'Kurt', 73, 'Romance', 10, 11);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (12, 'Lindsay', 111, 'Fantasy', 19, 12);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (13, 'Graham', 116, 'Animation', 15, 13);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (14, 'Courtney', 87, 'Romance', 1, 14);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (15, 'Kurt', 88, 'Romance', 20, 15);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (16, 'Julie', 121, 'Thriller', 18, 16);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (17, 'Juan', 77, 'Fantasy', 9, 17);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (18, 'Garry', 110, 'Thriller', 9, 18);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (19, 'Kim', 115, 'Comedy', 5, 19);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (20, 'Johnette', 154, 'Romance', 11, 20);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (21, 'Noah', 80, 'Documentary', 17, 21);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (22, 'Philip', 153, 'Horror', 4, 22);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (23, 'Peter', 119, 'Action', 1, 23);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (24, 'Dustin', 157, 'Documentary', 14, 24);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (25, 'Terence', 151, 'Drama', 14, 25);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (26, 'Kristin', 154, 'Animation', 17, 26);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (27, 'Chad', 118, 'Romance', 8, 27);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (28, 'Timothy', 136, 'Science Fiction', 9, 28);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (29, 'Bill', 169, 'Drama', 2, 29);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (30, 'Vonda', 87, 'Science Fiction', 6, 30);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (31, 'Ed', 145, 'Fantasy', 7, 31);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (32, 'Remy', 119, 'Action', 5, 32);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (33, 'Frankie', 72, 'Drama', 5, 33);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (34, 'Lucinda', 174, 'Romance', 17, 34);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (35, 'Demi', 90, 'Animation', 10, 35);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (36, 'Ernest', 118, 'Animation', 3, 36);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (37, 'Parker', 177, 'Science Fiction', 4, 37);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (38, 'Armand', 117, 'Action', 13, 38);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (39, 'Mindy', 147, 'Documentary', 3, 39);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (40, 'Andie', 89, 'Thriller', 20, 40);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (41, 'Joan', 60, 'Drama', 7, 41);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (42, 'Boz', 149, 'Romance', 11, 42);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (43, 'Mekhi', 171, 'Action', 4, 43);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (44, 'Maxine', 139, 'Thriller', 13, 44);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (45, 'Jose', 85, 'Science Fiction', 8, 45);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (46, 'Johnette', 151, 'Romance', 13, 46);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (47, 'Lizzy', 120, 'Action', 15, 47);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (48, 'Oliver', 125, 'Animation', 2, 48);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (49, 'Meryl', 163, 'Horror', 14, 49);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (50, 'Stephanie', 95, 'Action', 5, 50);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (51, 'Diane', 145, 'Romance', 19, 51);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (52, 'Rosie', 99, 'Fantasy', 15, 52);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (53, 'Maria', 69, 'Fantasy', 7, 53);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (54, 'Tyrone', 134, 'Drama', 1, 54);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (55, 'Mary-Louise', 65, 'Fantasy', 7, 55);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (56, 'Glen', 148, 'Horror', 10, 56);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (57, 'Norm', 136, 'Documentary', 9, 57);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (58, 'Boyd', 70, 'Science Fiction', 9, 58);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (59, 'Tia', 173, 'Fantasy', 3, 59);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (60, 'Juice', 117, 'Science Fiction', 20, 60);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (61, 'Wang', 129, 'Science Fiction', 4, 61);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (62, 'Kathleen', 173, 'Thriller', 13, 62);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (63, 'Joan', 115, 'Drama', 3, 63);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (64, 'Claire', 175, 'Science Fiction', 15, 64);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (65, 'Yolanda', 168, 'Comedy', 4, 65);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (66, 'Boz', 169, 'Comedy', 17, 66);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (67, 'Luis', 179, 'Comedy', 5, 67);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (68, 'Ahmad', 171, 'Animation', 10, 68);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (69, 'Teena', 95, 'Drama', 11, 69);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (70, 'Howie', 174, 'Romance', 9, 70);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (71, 'Oliver', 170, 'Science Fiction', 6, 71);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (72, 'Dan', 83, 'Horror', 3, 72);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (73, 'Geoffrey', 154, 'Documentary', 20, 73);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (74, 'Lari', 167, 'Horror', 7, 74);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (75, 'Chris', 98, 'Action', 12, 75);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (76, 'Kristin', 98, 'Science Fiction', 4, 76);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (77, 'Elvis', 110, 'Horror', 7, 77);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (78, 'Christian', 80, 'Animation', 16, 78);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (79, 'Brittany', 140, 'Romance', 17, 79);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (80, 'Derek', 91, 'Romance', 15, 80);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (81, 'Bridget', 179, 'Horror', 7, 81);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (82, 'Goldie', 118, 'Romance', 1, 82);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (83, 'Leslie', 118, 'Horror', 10, 83);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (84, 'Will', 75, 'Action', 15, 84);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (85, 'Jesus', 142, 'Animation', 3, 85);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (86, 'Lynn', 118, 'Drama', 3, 86);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (87, 'Eugene', 66, 'Documentary', 16, 87);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (88, 'Rory', 156, 'Thriller', 4, 88);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (89, 'Cliff', 157, 'Comedy', 5, 89);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (90, 'Nikka', 117, 'Drama', 6, 90);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (91, 'Penelope', 71, 'Fantasy', 4, 91);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (92, 'Avenged', 139, 'Horror', 7, 92);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (93, 'Franz', 111, 'Romance', 18, 93);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (94, 'Randall', 70, 'Action', 2, 94);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (95, 'Yaphet', 116, 'Animation', 5, 95);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (96, 'Elle', 92, 'Horror', 18, 96);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (97, 'Victor', 72, 'Action', 1, 97);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (98, 'Ashton', 177, 'Action', 12, 98);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (99, 'Morris', 163, 'Fantasy', 19, 99);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (100, 'Dabney', 64, 'Fantasy', 1, 100);
commit;
prompt 100 records committed...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (101, 'Elle', 126, 'Thriller', 18, 101);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (102, 'Aida', 119, 'Horror', 12, 102);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (103, 'Toni', 110, 'Action', 20, 103);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (104, 'Naomi', 176, 'Science Fiction', 19, 104);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (105, 'Hal', 100, 'Romance', 14, 105);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (106, 'Burt', 109, 'Thriller', 14, 106);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (107, 'Giancarlo', 124, 'Fantasy', 18, 107);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (108, 'Mary', 88, 'Thriller', 12, 108);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (109, 'Eddie', 125, 'Documentary', 2, 109);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (110, 'Talvin', 128, 'Thriller', 13, 110);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (111, 'Sander', 114, 'Animation', 2, 111);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (112, 'Sylvester', 60, 'Animation', 4, 112);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (113, 'Rose', 121, 'Horror', 9, 113);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (114, 'Sander', 128, 'Fantasy', 10, 114);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (115, 'Orlando', 180, 'Drama', 4, 115);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (116, 'Freddie', 62, 'Drama', 7, 116);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (117, 'Nikka', 115, 'Documentary', 15, 117);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (118, 'Gaby', 118, 'Romance', 12, 118);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (119, 'Juliana', 87, 'Thriller', 5, 119);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (120, 'Kurtwood', 101, 'Animation', 3, 120);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (121, 'Emily', 87, 'Romance', 2, 121);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (122, 'Keith', 123, 'Drama', 2, 122);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (123, 'Sammy', 79, 'Thriller', 17, 123);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (124, 'Alex', 62, 'Fantasy', 9, 124);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (125, 'Lin', 173, 'Drama', 12, 125);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (126, 'Hikaru', 150, 'Thriller', 17, 126);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (127, 'Matt', 114, 'Animation', 7, 127);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (128, 'Vin', 152, 'Romance', 20, 128);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (129, 'Crystal', 142, 'Animation', 17, 129);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (130, 'Marc', 147, 'Drama', 17, 130);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (131, 'Ozzy', 66, 'Drama', 19, 131);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (132, 'Domingo', 141, 'Comedy', 14, 132);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (133, 'Fred', 84, 'Drama', 18, 133);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (134, 'Juliet', 85, 'Thriller', 3, 134);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (135, 'Antonio', 173, 'Horror', 2, 135);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (136, 'Gin', 165, 'Fantasy', 14, 136);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (137, 'Larry', 134, 'Documentary', 9, 137);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (138, 'Thin', 168, 'Animation', 6, 138);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (139, 'Jane', 152, 'Animation', 9, 139);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (140, 'Emma', 90, 'Animation', 13, 140);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (141, 'Thelma', 65, 'Fantasy', 4, 141);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (142, 'Fionnula', 62, 'Animation', 7, 142);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (143, 'Lena', 127, 'Drama', 5, 143);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (144, 'Lonnie', 72, 'Drama', 17, 144);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (145, 'Ronny', 104, 'Comedy', 19, 145);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (146, 'Judy', 75, 'Romance', 4, 146);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (147, 'Wallace', 113, 'Fantasy', 6, 147);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (148, 'Claude', 162, 'Fantasy', 10, 148);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (149, 'Suzi', 162, 'Drama', 14, 149);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (150, 'Ozzy', 143, 'Animation', 11, 150);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (151, 'Vertical', 93, 'Fantasy', 8, 151);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (152, 'Gord', 145, 'Science Fiction', 16, 152);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (153, 'Amanda', 164, 'Horror', 20, 153);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (154, 'Manu', 160, 'Drama', 9, 154);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (155, 'Johnny', 102, 'Action', 7, 155);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (156, 'Olympia', 107, 'Comedy', 4, 156);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (157, 'Donal', 127, 'Science Fiction', 19, 157);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (158, 'Vonda', 62, 'Horror', 1, 158);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (159, 'Bradley', 73, 'Thriller', 5, 159);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (160, 'Bruce', 156, 'Animation', 11, 160);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (161, 'Natasha', 129, 'Horror', 12, 161);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (162, 'Shawn', 149, 'Romance', 4, 162);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (163, 'Willem', 158, 'Horror', 10, 163);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (164, 'Keith', 138, 'Animation', 7, 164);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (165, 'Kevin', 145, 'Comedy', 19, 165);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (166, 'Juan', 81, 'Drama', 6, 166);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (167, 'Roberta', 83, 'Documentary', 6, 167);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (168, 'Annie', 92, 'Science Fiction', 17, 168);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (169, 'Scott', 131, 'Documentary', 5, 169);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (170, 'Bobby', 171, 'Science Fiction', 16, 170);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (171, 'Meredith', 86, 'Thriller', 10, 171);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (172, 'Sophie', 83, 'Documentary', 6, 172);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (173, 'Peabo', 108, 'Science Fiction', 4, 173);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (174, 'Wally', 136, 'Fantasy', 1, 174);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (175, 'Viggo', 145, 'Horror', 1, 175);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (176, 'Charlton', 167, 'Science Fiction', 3, 176);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (177, 'Bebe', 125, 'Romance', 19, 177);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (178, 'Herbie', 151, 'Documentary', 16, 178);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (179, 'Leelee', 66, 'Comedy', 2, 179);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (180, 'Tom', 113, 'Documentary', 2, 180);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (181, 'Julie', 99, 'Action', 11, 181);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (182, 'Jessica', 82, 'Science Fiction', 4, 182);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (183, 'Jeremy', 170, 'Thriller', 1, 183);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (184, 'Cheryl', 87, 'Action', 11, 184);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (185, 'Ian', 140, 'Action', 20, 185);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (186, 'Carlos', 177, 'Horror', 20, 186);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (187, 'Saul', 166, 'Romance', 20, 187);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (188, 'Lauren', 135, 'Drama', 10, 188);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (189, 'Sal', 151, 'Fantasy', 9, 189);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (190, 'Chad', 179, 'Comedy', 16, 190);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (191, 'Catherine', 80, 'Drama', 14, 191);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (192, 'Lily', 142, 'Romance', 18, 192);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (193, 'Jerry', 152, 'Science Fiction', 7, 193);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (194, 'Tony', 135, 'Action', 5, 194);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (195, 'Nelly', 99, 'Thriller', 18, 195);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (196, 'Gordon', 158, 'Thriller', 18, 196);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (197, 'Hector', 123, 'Thriller', 14, 197);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (198, 'Lloyd', 118, 'Drama', 4, 198);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (199, 'Uma', 168, 'Horror', 7, 199);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (200, 'Miles', 119, 'Thriller', 16, 200);
commit;
prompt 200 records committed...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (201, 'Ewan', 86, 'Drama', 4, 201);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (202, 'Oro', 68, 'Science Fiction', 17, 202);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (203, 'Donald', 73, 'Fantasy', 6, 203);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (204, 'Raul', 170, 'Drama', 9, 204);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (205, 'Debra', 66, 'Documentary', 11, 205);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (206, 'Latin', 117, 'Comedy', 18, 206);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (207, 'Rosanna', 132, 'Animation', 7, 207);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (208, 'Jonathan', 145, 'Action', 9, 208);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (209, 'Lily', 178, 'Fantasy', 8, 209);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (210, 'Miki', 64, 'Horror', 20, 210);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (211, 'Nick', 63, 'Drama', 17, 211);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (212, 'Veruca', 136, 'Romance', 1, 212);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (213, 'Yaphet', 102, 'Fantasy', 16, 213);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (214, 'Bob', 68, 'Thriller', 13, 214);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (215, 'Murray', 163, 'Comedy', 20, 215);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (216, 'Rip', 87, 'Science Fiction', 15, 216);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (217, 'Ian', 133, 'Horror', 3, 217);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (218, 'Christmas', 125, 'Horror', 8, 218);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (219, 'Dick', 174, 'Fantasy', 1, 219);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (220, 'Scarlett', 124, 'Drama', 4, 220);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (221, 'Russell', 179, 'Documentary', 11, 221);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (222, 'Kelly', 148, 'Thriller', 6, 222);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (223, 'Julianne', 99, 'Animation', 10, 223);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (224, 'Davis', 152, 'Thriller', 10, 224);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (225, 'Jeremy', 83, 'Animation', 1, 225);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (226, 'Trey', 174, 'Romance', 15, 226);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (227, 'Brenda', 158, 'Romance', 7, 227);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (228, 'Chet', 180, 'Comedy', 4, 228);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (229, 'Howie', 73, 'Comedy', 11, 229);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (230, 'Jack', 85, 'Drama', 20, 230);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (231, 'Deborah', 151, 'Action', 2, 231);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (232, 'Armin', 164, 'Comedy', 18, 232);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (233, 'Sarah', 115, 'Romance', 5, 233);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (234, 'Vendetta', 174, 'Documentary', 1, 234);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (235, 'Judy', 140, 'Action', 3, 235);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (236, 'Geoffrey', 87, 'Animation', 20, 236);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (237, 'Sean', 117, 'Horror', 16, 237);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (238, 'Mary', 136, 'Drama', 1, 238);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (239, 'Sheena', 174, 'Drama', 18, 239);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (240, 'Jack', 168, 'Animation', 2, 240);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (241, 'Franz', 138, 'Fantasy', 7, 241);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (242, 'Jay', 126, 'Thriller', 9, 242);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (243, 'Miko', 130, 'Thriller', 17, 243);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (244, 'Marlon', 92, 'Documentary', 5, 244);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (245, 'Sydney', 105, 'Drama', 18, 245);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (246, 'Edgar', 111, 'Drama', 1, 246);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (247, 'Janeane', 157, 'Comedy', 20, 247);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (248, 'Cheryl', 67, 'Drama', 18, 248);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (249, 'Alessandro', 137, 'Horror', 8, 249);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (250, 'Selma', 73, 'Drama', 7, 250);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (251, 'Stellan', 153, 'Animation', 16, 251);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (252, 'Alannah', 177, 'Action', 6, 252);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (253, 'Orlando', 145, 'Documentary', 17, 253);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (254, 'Nicole', 100, 'Science Fiction', 13, 254);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (255, 'Tcheky', 96, 'Comedy', 9, 255);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (256, 'Terrence', 106, 'Animation', 13, 256);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (257, 'Morgan', 161, 'Horror', 16, 257);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (258, 'Aida', 96, 'Comedy', 6, 258);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (259, 'Javon', 119, 'Action', 4, 259);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (260, 'Eliza', 64, 'Comedy', 5, 260);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (261, 'Ashley', 174, 'Documentary', 2, 261);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (262, 'Luis', 115, 'Romance', 16, 262);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (263, 'Gwyneth', 117, 'Thriller', 6, 263);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (264, 'Boz', 148, 'Horror', 12, 264);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (265, 'Kieran', 92, 'Action', 10, 265);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (266, 'Stockard', 74, 'Thriller', 2, 266);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (267, 'Louise', 68, 'Fantasy', 7, 267);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (268, 'Todd', 179, 'Action', 17, 268);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (269, 'Carrie-Anne', 74, 'Documentary', 10, 269);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (270, 'Rupert', 84, 'Drama', 13, 270);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (271, 'Sally', 116, 'Documentary', 9, 271);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (272, 'Sal', 154, 'Fantasy', 12, 272);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (273, 'Ernie', 121, 'Thriller', 18, 273);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (274, 'Rod', 168, 'Comedy', 15, 274);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (275, 'Molly', 172, 'Thriller', 8, 275);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (276, 'Emm', 81, 'Documentary', 11, 276);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (277, 'Natalie', 165, 'Science Fiction', 10, 277);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (278, 'Maceo', 99, 'Horror', 11, 278);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (279, 'Ian', 117, 'Horror', 16, 279);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (280, 'Boz', 65, 'Drama', 5, 280);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (281, 'Devon', 147, 'Fantasy', 16, 281);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (282, 'Gabriel', 94, 'Documentary', 8, 282);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (283, 'Alannah', 128, 'Science Fiction', 9, 283);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (284, 'Hilton', 152, 'Action', 12, 284);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (285, 'Aida', 107, 'Thriller', 17, 285);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (286, 'Geoffrey', 167, 'Thriller', 20, 286);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (287, 'Carrie-Anne', 156, 'Fantasy', 6, 287);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (288, 'Lara', 165, 'Romance', 17, 288);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (289, 'Chanté', 139, 'Thriller', 11, 289);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (290, 'Derek', 93, 'Fantasy', 10, 290);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (291, 'Tori', 127, 'Documentary', 14, 291);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (292, 'Bernard', 153, 'Animation', 17, 292);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (293, 'Scarlett', 116, 'Drama', 17, 293);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (294, 'Patty', 95, 'Thriller', 16, 294);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (295, 'Carlene', 153, 'Animation', 14, 295);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (296, 'Melanie', 111, 'Action', 6, 296);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (297, 'Fairuza', 135, 'Comedy', 17, 297);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (298, 'Michael', 81, 'Animation', 13, 298);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (299, 'Robby', 126, 'Documentary', 2, 299);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (300, 'Tobey', 63, 'Animation', 17, 300);
commit;
prompt 300 records committed...
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (301, 'Kyra', 115, 'Action', 4, 301);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (302, 'Rhett', 92, 'Science Fiction', 17, 302);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (303, 'Julianna', 164, 'Thriller', 15, 303);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (304, 'Martha', 145, 'Romance', 7, 304);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (305, 'Juliet', 123, 'Romance', 19, 305);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (306, 'Terry', 137, 'Horror', 11, 306);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (307, 'Willem', 93, 'Horror', 14, 307);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (308, 'Freddy', 83, 'Thriller', 18, 308);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (309, 'Shawn', 95, 'Drama', 1, 309);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (310, 'Nile', 164, 'Science Fiction', 6, 310);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (311, 'Gwyneth', 130, 'Drama', 5, 311);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (312, 'Jonny', 124, 'Action', 7, 312);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (313, 'Avril', 160, 'Action', 8, 313);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (314, 'Mike', 136, 'Horror', 6, 314);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (315, 'Sissy', 125, 'Romance', 8, 315);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (316, 'Gloria', 151, 'Horror', 1, 316);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (317, 'Christina', 119, 'Thriller', 1, 317);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (318, 'Alex', 117, 'Action', 11, 318);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (319, 'Susan', 123, 'Thriller', 16, 319);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (320, 'Tyrone', 128, 'Animation', 8, 320);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (321, 'Rutger', 133, 'Documentary', 8, 321);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (322, 'Phoebe', 114, 'Thriller', 2, 322);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (323, 'Sharon', 88, 'Fantasy', 2, 323);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (324, 'Tim', 64, 'Fantasy', 18, 324);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (325, 'Emerson', 78, 'Science Fiction', 6, 325);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (326, 'Jonathan', 157, 'Comedy', 2, 326);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (327, 'Denis', 104, 'Documentary', 1, 327);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (328, 'Lin', 94, 'Animation', 7, 328);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (329, 'Christmas', 117, 'Animation', 9, 329);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (330, 'Goldie', 146, 'Action', 6, 330);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (331, 'Harrison', 98, 'Horror', 14, 331);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (332, 'Neve', 81, 'Romance', 19, 332);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (333, 'Linda', 173, 'Documentary', 7, 333);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (334, 'Brittany', 169, 'Science Fiction', 15, 334);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (335, 'Lena', 163, 'Action', 13, 335);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (336, 'Mary', 180, 'Documentary', 13, 336);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (337, 'Terri', 138, 'Drama', 11, 337);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (338, 'Sona', 107, 'Horror', 11, 338);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (339, 'Sal', 160, 'Fantasy', 1, 339);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (340, 'Blair', 78, 'Romance', 4, 340);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (341, 'Teena', 72, 'Action', 2, 341);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (342, 'Davis', 76, 'Documentary', 10, 342);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (343, 'Art', 160, 'Science Fiction', 1, 343);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (344, 'Christopher', 162, 'Horror', 10, 344);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (345, 'Joshua', 170, 'Science Fiction', 5, 345);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (346, 'Adina', 150, 'Science Fiction', 13, 346);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (347, 'Nikka', 168, 'Drama', 16, 347);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (348, 'Edwin', 153, 'Action', 10, 348);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (349, 'Neil', 117, 'Comedy', 20, 349);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (350, 'Harriet', 82, 'Thriller', 8, 350);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (351, 'Tramaine', 84, 'Drama', 15, 351);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (352, 'Albert', 156, 'Action', 16, 352);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (353, 'Paul', 137, 'Romance', 7, 353);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (354, 'Moe', 109, 'Animation', 13, 354);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (355, 'Jim', 147, 'Thriller', 14, 355);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (356, 'Dabney', 139, 'Science Fiction', 8, 356);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (357, 'Roscoe', 114, 'Thriller', 1, 357);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (358, 'Ian', 71, 'Drama', 18, 358);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (359, 'Jeff', 175, 'Romance', 4, 359);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (360, 'Penelope', 137, 'Science Fiction', 4, 360);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (361, 'Carole', 153, 'Animation', 5, 361);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (362, 'Cameron', 97, 'Science Fiction', 15, 362);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (363, 'Lara', 129, 'Thriller', 10, 363);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (364, 'Madeleine', 92, 'Science Fiction', 20, 364);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (365, 'Omar', 63, 'Action', 10, 365);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (366, 'Hugo', 85, 'Fantasy', 12, 366);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (367, 'Ray', 77, 'Horror', 17, 367);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (368, 'Nora', 60, 'Comedy', 19, 368);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (369, 'Lena', 161, 'Drama', 16, 369);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (370, 'Richie', 146, 'Comedy', 7, 370);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (371, 'Jonny Lee', 157, 'Fantasy', 14, 371);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (372, 'Vanessa', 168, 'Thriller', 7, 372);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (373, 'Gavin', 151, 'Drama', 3, 373);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (374, 'Owen', 85, 'Science Fiction', 4, 374);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (375, 'Dave', 173, 'Fantasy', 19, 375);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (376, 'Anjelica', 100, 'Thriller', 2, 376);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (377, 'Joshua', 172, 'Fantasy', 6, 377);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (378, 'Joe', 86, 'Comedy', 2, 378);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (379, 'Rachid', 163, 'Science Fiction', 19, 379);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (380, 'Kathleen', 139, 'Fantasy', 19, 380);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (381, 'Brad', 155, 'Science Fiction', 5, 381);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (382, 'Albertina', 72, 'Horror', 15, 382);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (383, 'Alfred', 124, 'Fantasy', 18, 383);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (384, 'Lynn', 169, 'Documentary', 8, 384);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (385, 'Scott', 148, 'Romance', 8, 385);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (386, 'Carlene', 150, 'Fantasy', 17, 386);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (387, 'Trace', 88, 'Romance', 16, 387);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (388, 'Eddie', 118, 'Romance', 3, 388);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (389, 'Wes', 160, 'Fantasy', 11, 389);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (390, 'Charlton', 88, 'Horror', 7, 390);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (391, 'Juan', 90, 'Science Fiction', 18, 391);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (392, 'Angela', 161, 'Romance', 4, 392);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (393, 'Christina', 120, 'Comedy', 6, 393);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (394, 'Armand', 126, 'Documentary', 12, 394);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (395, 'Lari', 124, 'Horror', 13, 395);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (396, 'Alannah', 78, 'Science Fiction', 20, 396);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (397, 'Juice', 82, 'Fantasy', 3, 397);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (398, 'Eugene', 91, 'Drama', 9, 398);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (399, 'Suzi', 114, 'Horror', 3, 399);
insert into MOVIE (film_code, names, duration, categorie, room_number, projector_code)
values (400, 'Radney', 66, 'Documentary', 13, 400);
commit;
prompt 400 records loaded
prompt Loading TICKET...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (1, 34140, 1, 155, 582, 1);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (2, 55950, 2, 85, 288, 2);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (3, 48727, 3, 45, 217, 3);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (4, 36071, 4, 135, 976, 4);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (5, 25738, 5, 259, 416, 5);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (6, 14012, 6, 49, 756, 6);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (7, 2429, 7, 40, 882, 7);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (8, 15923, 8, 229, 643, 8);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (9, 50260, 9, 49, 100, 9);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (10, 68096, 10, 39, 387, 10);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (11, 2551, 11, 48, 150, 11);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (12, 73565, 12, 130, 600, 12);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (13, 13449, 13, 69, 436, 13);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (14, 23210, 14, 589, 666, 14);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (15, 30535, 15, 125, 485, 15);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (16, 20900, 16, 16, 233, 16);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (17, 73189, 17, 219, 761, 17);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (18, 20475, 18, 12, 386, 18);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (19, 20900, 19, 119, 883, 19);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (20, 20573, 20, 35, 106, 20);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (21, 49831, 21, 95, 295, 21);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (22, 46910, 22, 165, 856, 22);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (23, 74355, 23, 229, 285, 23);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (24, 4001, 24, 199, 369, 24);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (25, 49585, 25, 259, 403, 25);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (26, 50441, 26, 78, 410, 26);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (27, 32447, 27, 169, 323, 27);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (28, 65199, 28, 229, 375, 28);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (29, 28915, 29, 68, 159, 29);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (30, 45880, 30, 209, 971, 30);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (31, 83699, 31, 75, 378, 31);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (32, 17352, 32, 209, 776, 32);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (33, 23900, 33, 49, 398, 33);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (34, 51231, 34, 139, 122, 34);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (35, 31975, 35, 355, 663, 35);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (36, 35885, 36, 219, 539, 36);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (37, 25299, 37, 185, 982, 37);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (38, 60860, 38, 41, 892, 38);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (39, 63435, 39, 199, 461, 39);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (40, 13376, 40, 85, 529, 40);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (41, 56878, 41, 51, 620, 41);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (42, 24492, 42, 119, 533, 42);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (43, 81224, 43, 152, 487, 43);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (44, 25274, 44, 199, 244, 44);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (45, 85744, 45, 4, 627, 45);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (46, 81780, 46, 169, 885, 46);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (47, 55438, 47, 89, 530, 47);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (48, 6957, 48, 295, 682, 48);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (49, 19845, 49, 169, 781, 49);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (50, 27794, 50, 259, 227, 50);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (51, 55937, 51, 1, 912, 51);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (52, 47487, 52, 9, 400, 52);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (53, 69366, 53, 109, 857, 53);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (54, 30381, 54, 155, 667, 54);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (55, 39528, 55, 152, 281, 55);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (56, 48615, 56, 189, 880, 56);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (57, 42404, 57, 125, 913, 57);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (58, 62751, 58, 38, 429, 58);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (59, 3099, 59, 241, 505, 59);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (60, 24783, 60, 19, 609, 60);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (61, 54830, 61, 285, 870, 61);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (62, 29030, 62, 95, 117, 62);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (63, 12617, 63, 285, 829, 63);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (64, 8670, 64, 77, 753, 64);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (65, 58330, 65, 135, 112, 65);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (66, 76539, 66, 109, 901, 66);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (67, 71584, 67, 5, 635, 67);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (68, 17234, 68, 55, 471, 68);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (69, 18542, 69, 189, 797, 69);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (70, 5341, 70, 118, 710, 70);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (71, 73252, 71, 69, 613, 71);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (72, 36410, 72, 3, 694, 72);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (73, 4861, 73, 5, 744, 73);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (74, 76815, 74, 20, 166, 74);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (75, 16197, 75, 179, 508, 75);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (76, 4190, 76, 105, 281, 76);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (77, 79847, 77, 68, 756, 77);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (78, 14995, 78, 169, 480, 78);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (79, 79559, 79, 595, 829, 79);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (80, 52665, 80, 235, 213, 80);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (81, 70596, 81, 11, 990, 81);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (82, 14436, 82, 172, 971, 82);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (83, 3122, 83, 199, 824, 83);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (84, 81551, 84, 329, 195, 84);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (85, 17219, 85, 69, 858, 85);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (86, 73154, 86, 185, 525, 86);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (87, 3784, 87, 71, 554, 87);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (88, 3771, 88, 205, 173, 88);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (89, 41583, 89, 17, 965, 89);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (90, 38778, 90, 199, 269, 90);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (91, 38356, 91, 42, 729, 91);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (92, 38031, 92, 5, 587, 92);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (93, 42657, 93, 169, 374, 93);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (94, 12886, 94, 78, 534, 94);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (95, 33044, 95, 71, 480, 95);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (96, 12941, 96, 16, 815, 96);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (97, 78419, 97, 95, 785, 97);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (98, 2454, 98, 9, 646, 98);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (99, 6366, 99, 265, 683, 99);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (100, 38433, 100, 229, 883, 100);
commit;
prompt 100 records committed...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (101, 69476, 101, 44, 555, 101);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (102, 61780, 102, 24, 450, 102);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (103, 70661, 103, 3, 861, 103);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (104, 83432, 104, 99, 949, 104);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (105, 73138, 105, 89, 491, 105);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (106, 29832, 106, 199, 871, 106);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (107, 59721, 107, 188, 428, 107);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (108, 81114, 108, 48, 474, 108);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (109, 65504, 109, 59, 311, 109);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (110, 63164, 110, 99, 158, 110);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (111, 20514, 111, 289, 855, 111);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (112, 44717, 112, 229, 145, 112);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (113, 5108, 113, 399, 931, 113);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (114, 75756, 114, 76, 675, 114);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (115, 63742, 115, 44, 163, 115);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (116, 44052, 116, 289, 819, 116);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (117, 22874, 117, 28, 945, 117);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (118, 20326, 118, 43, 815, 118);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (119, 76778, 119, 398, 183, 119);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (120, 850, 120, 55, 290, 120);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (121, 86326, 121, 255, 191, 121);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (122, 29664, 122, 27, 872, 122);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (123, 83345, 123, 85, 430, 123);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (124, 60319, 124, 45, 616, 124);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (125, 62817, 125, 10, 137, 125);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (126, 62933, 126, 189, 597, 126);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (127, 68671, 127, 72, 386, 127);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (128, 71436, 128, 130, 233, 128);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (129, 4908, 129, 20, 899, 129);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (130, 19504, 130, 49, 600, 130);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (131, 11284, 131, 59, 695, 131);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (132, 13346, 132, 145, 267, 132);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (133, 70660, 133, 125, 402, 133);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (134, 8448, 134, 156, 194, 134);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (135, 20192, 135, 59, 293, 135);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (136, 30001, 136, 11, 611, 136);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (137, 31585, 137, 135, 461, 137);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (138, 51459, 138, 109, 698, 138);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (139, 65794, 139, 43, 250, 139);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (140, 52797, 140, 169, 318, 140);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (141, 70611, 141, 72, 483, 141);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (142, 73748, 142, 239, 922, 142);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (143, 24073, 143, 2, 993, 143);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (144, 49360, 144, 69, 855, 144);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (145, 14797, 145, 145, 278, 145);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (146, 22257, 146, 79, 616, 146);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (147, 84035, 147, 129, 514, 147);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (148, 57430, 148, 189, 180, 148);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (149, 44364, 149, 75, 311, 149);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (150, 58546, 150, 95, 868, 150);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (151, 34717, 151, 245, 515, 151);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (152, 48385, 152, 159, 977, 152);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (153, 65985, 153, 25, 605, 153);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (154, 17699, 154, 2, 552, 154);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (155, 30539, 155, 78, 632, 155);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (156, 32172, 156, 44, 730, 156);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (157, 57483, 157, 145, 625, 157);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (158, 24607, 158, 39, 781, 158);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (159, 12142, 159, 121, 715, 159);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (160, 59375, 160, 78, 939, 160);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (161, 83887, 161, 8, 865, 161);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (162, 33370, 162, 175, 724, 162);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (163, 79049, 163, 149, 798, 163);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (164, 56986, 164, 49, 901, 164);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (165, 2402, 165, 199, 836, 165);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (166, 51569, 166, 155, 773, 166);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (167, 71327, 167, 56, 261, 167);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (168, 60823, 168, 71, 306, 168);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (169, 18631, 169, 159, 926, 169);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (170, 67963, 170, 199, 473, 170);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (171, 8565, 171, 16, 669, 171);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (172, 46740, 172, 289, 843, 172);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (173, 81215, 173, 77, 562, 173);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (174, 19758, 174, 75, 465, 174);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (175, 32155, 175, 239, 742, 175);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (176, 53188, 176, 76, 876, 176);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (177, 11627, 177, 113, 632, 177);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (178, 70795, 178, 169, 792, 178);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (179, 73588, 179, 118, 996, 179);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (180, 13273, 180, 265, 873, 180);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (181, 41073, 181, 105, 307, 181);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (182, 24812, 182, 299, 762, 182);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (183, 11555, 183, 189, 660, 183);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (184, 32059, 184, 135, 586, 184);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (185, 65663, 185, 199, 292, 185);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (186, 2727, 186, 130, 392, 186);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (187, 65364, 187, 35, 347, 187);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (188, 52067, 188, 1, 702, 188);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (189, 13375, 189, 59, 403, 189);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (190, 41694, 190, 79, 955, 190);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (191, 70650, 191, 179, 747, 191);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (192, 31527, 192, 9, 319, 192);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (193, 22797, 193, 59, 321, 193);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (194, 10481, 194, 235, 602, 194);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (195, 20124, 195, 99, 457, 195);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (196, 53517, 196, 65, 744, 196);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (197, 19162, 197, 59, 904, 197);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (198, 47716, 198, 289, 159, 198);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (199, 40096, 199, 179, 784, 199);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (200, 64956, 200, 145, 169, 200);
commit;
prompt 200 records committed...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (201, 22853, 201, 245, 936, 201);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (202, 23162, 202, 769, 189, 202);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (203, 68736, 203, 6, 366, 203);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (204, 2794, 204, 199, 108, 204);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (205, 41513, 205, 39, 642, 205);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (206, 86155, 206, 58, 381, 206);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (207, 42026, 207, 359, 516, 207);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (208, 49545, 208, 5, 499, 208);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (209, 60114, 209, 145, 116, 209);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (210, 66973, 210, 92, 820, 210);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (211, 32539, 211, 265, 970, 211);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (212, 4320, 212, 7, 272, 212);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (213, 60137, 213, 25, 832, 213);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (214, 11271, 214, 27, 417, 214);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (215, 67000, 215, 169, 189, 215);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (216, 60303, 216, 125, 584, 216);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (217, 20612, 217, 165, 617, 217);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (218, 2138, 218, 78, 647, 218);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (219, 61393, 219, 30, 177, 219);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (220, 30831, 220, 119, 932, 220);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (221, 48165, 221, 245, 641, 221);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (222, 37928, 222, 249, 382, 222);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (223, 74740, 223, 219, 680, 223);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (224, 49414, 224, 375, 221, 224);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (225, 27227, 225, 12, 832, 225);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (226, 64415, 226, 205, 336, 226);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (227, 67521, 227, 344, 280, 227);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (228, 1852, 228, 149, 637, 228);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (229, 17549, 229, 44, 907, 229);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (230, 22212, 230, 289, 673, 230);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (231, 13880, 231, 72, 539, 231);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (232, 67807, 232, 159, 741, 232);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (233, 55780, 233, 239, 118, 233);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (234, 51221, 234, 70, 811, 234);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (235, 28755, 235, 24, 513, 235);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (236, 18761, 236, 259, 409, 236);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (237, 26651, 237, 9, 716, 237);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (238, 65048, 238, 35, 758, 238);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (239, 19907, 239, 63, 743, 239);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (240, 38528, 240, 45, 877, 240);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (241, 31722, 241, 49, 585, 241);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (242, 3546, 242, 49, 838, 242);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (243, 37973, 243, 35, 936, 243);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (244, 65259, 244, 149, 438, 244);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (245, 63637, 245, 140, 336, 245);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (246, 19622, 246, 48, 503, 246);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (247, 13706, 247, 135, 942, 247);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (248, 32300, 248, 113, 138, 248);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (249, 61835, 249, 65, 820, 249);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (250, 50874, 250, 59, 742, 250);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (251, 12351, 251, 12, 514, 251);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (252, 37239, 252, 56, 657, 252);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (253, 64875, 253, 369, 610, 253);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (254, 62596, 254, 155, 425, 254);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (255, 83103, 255, 59, 721, 255);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (256, 8504, 256, 239, 648, 256);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (257, 23318, 257, 35, 487, 257);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (258, 23903, 258, 229, 551, 258);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (259, 12802, 259, 399, 209, 259);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (260, 15656, 260, 30, 706, 260);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (261, 68322, 261, 199, 597, 261);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (262, 82730, 262, 35, 880, 262);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (263, 5810, 263, 10, 473, 263);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (264, 58334, 264, 200, 269, 264);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (265, 65488, 265, 43, 478, 265);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (266, 44658, 266, 399, 673, 266);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (267, 50421, 267, 215, 269, 267);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (268, 4792, 268, 39, 172, 268);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (269, 69925, 269, 129, 681, 269);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (270, 46899, 270, 399, 176, 270);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (271, 73765, 271, 30, 965, 271);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (272, 26980, 272, 39, 414, 272);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (273, 36868, 273, 269, 416, 273);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (274, 20418, 274, 19, 605, 274);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (275, 71128, 275, 9, 733, 275);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (276, 86330, 276, 299, 910, 276);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (277, 15009, 277, 16, 322, 277);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (278, 47513, 278, 89, 630, 278);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (279, 22080, 279, 69, 718, 279);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (280, 69984, 280, 165, 628, 280);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (281, 84085, 281, 31, 716, 281);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (282, 28628, 282, 35, 169, 282);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (283, 32114, 283, 8, 637, 283);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (284, 38818, 284, 275, 645, 284);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (285, 11075, 285, 165, 379, 285);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (286, 31333, 286, 59, 937, 286);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (287, 36985, 287, 20, 195, 287);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (288, 70217, 288, 259, 660, 288);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (289, 3360, 289, 219, 204, 289);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (290, 37623, 290, 23, 588, 290);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (291, 70079, 291, 145, 428, 291);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (292, 64141, 292, 58, 359, 292);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (293, 70789, 293, 58, 978, 293);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (294, 73693, 294, 265, 989, 294);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (295, 41166, 295, 48, 193, 295);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (296, 75445, 296, 165, 113, 296);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (297, 23006, 297, 84, 995, 297);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (298, 86339, 298, 34, 881, 298);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (299, 70085, 299, 275, 384, 299);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (300, 28988, 300, 39, 257, 300);
commit;
prompt 300 records committed...
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (301, 76382, 301, 45, 333, 301);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (302, 74919, 302, 5, 215, 302);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (303, 21318, 303, 45, 737, 303);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (304, 28497, 304, 159, 178, 304);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (305, 79316, 305, 199, 816, 305);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (306, 59043, 306, 194, 400, 306);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (307, 17392, 307, 29, 439, 307);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (308, 72521, 308, 119, 513, 308);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (309, 51837, 309, 39, 845, 309);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (310, 2142, 310, 48, 256, 310);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (311, 15478, 311, 10, 484, 311);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (312, 86035, 312, 219, 239, 312);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (313, 5065, 313, 24, 701, 313);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (314, 5442, 314, 595, 296, 314);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (315, 9104, 315, 11, 514, 315);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (316, 74644, 316, 38, 496, 316);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (317, 51688, 317, 147, 825, 317);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (318, 71725, 318, 25, 267, 318);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (319, 19377, 319, 129, 241, 319);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (320, 57124, 320, 439, 177, 320);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (321, 25793, 321, 89, 128, 321);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (322, 55804, 322, 115, 312, 322);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (323, 12014, 323, 215, 460, 323);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (324, 58472, 324, 399, 986, 324);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (325, 12011, 325, 29, 703, 325);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (326, 8275, 326, 49, 155, 326);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (327, 70981, 327, 209, 673, 327);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (328, 35195, 328, 9, 238, 328);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (329, 8711, 329, 139, 324, 329);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (330, 17482, 330, 289, 808, 330);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (331, 57847, 331, 17, 497, 331);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (332, 58200, 332, 23, 356, 332);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (333, 82018, 333, 265, 273, 333);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (334, 58666, 334, 10, 947, 334);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (335, 81235, 335, 198, 528, 335);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (336, 63423, 336, 138, 290, 336);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (337, 56182, 337, 595, 416, 337);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (338, 35226, 338, 239, 121, 338);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (339, 11902, 339, 329, 370, 339);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (340, 57170, 340, 209, 954, 340);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (341, 53854, 341, 267, 509, 341);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (342, 45856, 342, 156, 485, 342);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (343, 15804, 343, 29, 771, 343);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (344, 43087, 344, 66, 266, 344);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (345, 24627, 345, 75, 843, 345);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (346, 68906, 346, 179, 758, 346);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (347, 38298, 347, 209, 804, 347);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (348, 82542, 348, 39, 446, 348);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (349, 50584, 349, 99, 920, 349);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (350, 4906, 350, 129, 664, 350);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (351, 82223, 351, 265, 210, 351);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (352, 57744, 352, 41, 878, 352);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (353, 42408, 353, 1, 528, 353);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (354, 3027, 354, 267, 107, 354);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (355, 33820, 355, 35, 966, 355);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (356, 24562, 356, 229, 560, 356);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (357, 53195, 357, 385, 580, 357);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (358, 68397, 358, 18, 981, 358);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (359, 58434, 359, 99, 648, 359);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (360, 76394, 360, 319, 115, 360);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (361, 39531, 361, 45, 400, 361);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (362, 42453, 362, 56, 801, 362);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (363, 17555, 363, 99, 936, 363);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (364, 44429, 364, 24, 795, 364);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (365, 80981, 365, 142, 102, 365);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (366, 33253, 366, 219, 940, 366);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (367, 9134, 367, 35, 825, 367);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (368, 72454, 368, 179, 834, 368);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (369, 17131, 369, 134, 675, 369);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (370, 11921, 370, 265, 189, 370);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (371, 7543, 371, 219, 184, 371);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (372, 15566, 372, 209, 522, 372);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (373, 74944, 373, 239, 973, 373);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (374, 77755, 374, 42, 466, 374);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (375, 57116, 375, 129, 770, 375);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (376, 40122, 376, 199, 611, 376);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (377, 19974, 377, 18, 890, 377);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (378, 64962, 378, 40, 359, 378);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (379, 75620, 379, 219, 153, 379);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (380, 71890, 380, 75, 460, 380);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (381, 2586, 381, 45, 441, 381);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (382, 36763, 382, 78, 166, 382);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (383, 73617, 383, 44, 367, 383);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (384, 80947, 384, 255, 795, 384);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (385, 71145, 385, 179, 902, 385);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (386, 37420, 386, 10, 880, 386);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (387, 62057, 387, 29, 145, 387);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (388, 16675, 388, 119, 838, 388);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (389, 11300, 389, 235, 867, 389);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (390, 86334, 390, 55, 512, 390);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (391, 65257, 391, 168, 220, 391);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (392, 42198, 392, 25, 525, 392);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (393, 68943, 393, 16, 132, 393);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (394, 37568, 394, 235, 376, 394);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (395, 73209, 395, 159, 916, 395);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (396, 11226, 396, 129, 731, 396);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (397, 25565, 397, 199, 220, 397);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (398, 72940, 398, 156, 858, 398);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (399, 47984, 399, 56, 323, 399);
insert into TICKET (identifying_number, hours, seat, price, filme_number, film_code)
values (400, 3035, 400, 30, 945, 400);
commit;
prompt 400 records loaded
prompt Loading FOOD...
prompt Table is empty
prompt Loading SEAT...
insert into SEAT (seat_number, row_number, room_number)
values (1, 1, 7);
insert into SEAT (seat_number, row_number, room_number)
values (2, 2, 10);
insert into SEAT (seat_number, row_number, room_number)
values (3, 3, 6);
insert into SEAT (seat_number, row_number, room_number)
values (4, 4, 10);
insert into SEAT (seat_number, row_number, room_number)
values (5, 5, 7);
insert into SEAT (seat_number, row_number, room_number)
values (6, 6, 9);
insert into SEAT (seat_number, row_number, room_number)
values (7, 7, 10);
insert into SEAT (seat_number, row_number, room_number)
values (8, 8, 10);
insert into SEAT (seat_number, row_number, room_number)
values (9, 9, 8);
insert into SEAT (seat_number, row_number, room_number)
values (10, 10, 8);
insert into SEAT (seat_number, row_number, room_number)
values (11, 11, 9);
insert into SEAT (seat_number, row_number, room_number)
values (12, 12, 10);
insert into SEAT (seat_number, row_number, room_number)
values (13, 13, 8);
insert into SEAT (seat_number, row_number, room_number)
values (14, 14, 2);
insert into SEAT (seat_number, row_number, room_number)
values (15, 15, 2);
insert into SEAT (seat_number, row_number, room_number)
values (16, 16, 1);
insert into SEAT (seat_number, row_number, room_number)
values (17, 17, 6);
insert into SEAT (seat_number, row_number, room_number)
values (18, 18, 1);
insert into SEAT (seat_number, row_number, room_number)
values (19, 19, 1);
insert into SEAT (seat_number, row_number, room_number)
values (20, 20, 5);
insert into SEAT (seat_number, row_number, room_number)
values (21, 21, 10);
insert into SEAT (seat_number, row_number, room_number)
values (22, 22, 4);
insert into SEAT (seat_number, row_number, room_number)
values (23, 23, 6);
insert into SEAT (seat_number, row_number, room_number)
values (24, 24, 8);
insert into SEAT (seat_number, row_number, room_number)
values (25, 25, 10);
insert into SEAT (seat_number, row_number, room_number)
values (26, 26, 10);
insert into SEAT (seat_number, row_number, room_number)
values (27, 27, 10);
insert into SEAT (seat_number, row_number, room_number)
values (28, 28, 4);
insert into SEAT (seat_number, row_number, room_number)
values (29, 29, 1);
insert into SEAT (seat_number, row_number, room_number)
values (30, 30, 10);
insert into SEAT (seat_number, row_number, room_number)
values (31, 31, 2);
insert into SEAT (seat_number, row_number, room_number)
values (32, 32, 4);
insert into SEAT (seat_number, row_number, room_number)
values (33, 33, 2);
insert into SEAT (seat_number, row_number, room_number)
values (34, 34, 3);
insert into SEAT (seat_number, row_number, room_number)
values (35, 35, 10);
insert into SEAT (seat_number, row_number, room_number)
values (36, 36, 8);
insert into SEAT (seat_number, row_number, room_number)
values (37, 37, 4);
insert into SEAT (seat_number, row_number, room_number)
values (38, 38, 7);
insert into SEAT (seat_number, row_number, room_number)
values (39, 39, 1);
insert into SEAT (seat_number, row_number, room_number)
values (40, 40, 8);
insert into SEAT (seat_number, row_number, room_number)
values (41, 41, 7);
insert into SEAT (seat_number, row_number, room_number)
values (42, 42, 1);
insert into SEAT (seat_number, row_number, room_number)
values (43, 43, 10);
insert into SEAT (seat_number, row_number, room_number)
values (44, 44, 7);
insert into SEAT (seat_number, row_number, room_number)
values (45, 45, 8);
insert into SEAT (seat_number, row_number, room_number)
values (46, 46, 2);
insert into SEAT (seat_number, row_number, room_number)
values (47, 47, 2);
insert into SEAT (seat_number, row_number, room_number)
values (48, 48, 9);
insert into SEAT (seat_number, row_number, room_number)
values (49, 49, 2);
insert into SEAT (seat_number, row_number, room_number)
values (50, 50, 8);
insert into SEAT (seat_number, row_number, room_number)
values (51, 51, 1);
insert into SEAT (seat_number, row_number, room_number)
values (52, 52, 9);
insert into SEAT (seat_number, row_number, room_number)
values (53, 53, 4);
insert into SEAT (seat_number, row_number, room_number)
values (54, 54, 2);
insert into SEAT (seat_number, row_number, room_number)
values (55, 55, 6);
insert into SEAT (seat_number, row_number, room_number)
values (56, 56, 4);
insert into SEAT (seat_number, row_number, room_number)
values (57, 57, 5);
insert into SEAT (seat_number, row_number, room_number)
values (58, 58, 6);
insert into SEAT (seat_number, row_number, room_number)
values (59, 59, 2);
insert into SEAT (seat_number, row_number, room_number)
values (60, 60, 2);
insert into SEAT (seat_number, row_number, room_number)
values (61, 61, 2);
insert into SEAT (seat_number, row_number, room_number)
values (62, 62, 4);
insert into SEAT (seat_number, row_number, room_number)
values (63, 63, 3);
insert into SEAT (seat_number, row_number, room_number)
values (64, 64, 2);
insert into SEAT (seat_number, row_number, room_number)
values (65, 65, 3);
insert into SEAT (seat_number, row_number, room_number)
values (66, 66, 8);
insert into SEAT (seat_number, row_number, room_number)
values (67, 67, 8);
insert into SEAT (seat_number, row_number, room_number)
values (68, 68, 10);
insert into SEAT (seat_number, row_number, room_number)
values (69, 69, 9);
insert into SEAT (seat_number, row_number, room_number)
values (70, 70, 3);
insert into SEAT (seat_number, row_number, room_number)
values (71, 71, 3);
insert into SEAT (seat_number, row_number, room_number)
values (72, 72, 4);
insert into SEAT (seat_number, row_number, room_number)
values (73, 73, 6);
insert into SEAT (seat_number, row_number, room_number)
values (74, 74, 4);
insert into SEAT (seat_number, row_number, room_number)
values (75, 75, 8);
insert into SEAT (seat_number, row_number, room_number)
values (76, 76, 2);
insert into SEAT (seat_number, row_number, room_number)
values (77, 77, 3);
insert into SEAT (seat_number, row_number, room_number)
values (78, 78, 2);
insert into SEAT (seat_number, row_number, room_number)
values (79, 79, 9);
insert into SEAT (seat_number, row_number, room_number)
values (80, 80, 8);
insert into SEAT (seat_number, row_number, room_number)
values (81, 81, 3);
insert into SEAT (seat_number, row_number, room_number)
values (82, 82, 3);
insert into SEAT (seat_number, row_number, room_number)
values (83, 83, 9);
insert into SEAT (seat_number, row_number, room_number)
values (84, 84, 2);
insert into SEAT (seat_number, row_number, room_number)
values (85, 85, 3);
insert into SEAT (seat_number, row_number, room_number)
values (86, 86, 7);
insert into SEAT (seat_number, row_number, room_number)
values (87, 87, 8);
insert into SEAT (seat_number, row_number, room_number)
values (88, 88, 10);
insert into SEAT (seat_number, row_number, room_number)
values (89, 89, 3);
insert into SEAT (seat_number, row_number, room_number)
values (90, 90, 7);
insert into SEAT (seat_number, row_number, room_number)
values (91, 91, 10);
insert into SEAT (seat_number, row_number, room_number)
values (92, 92, 8);
insert into SEAT (seat_number, row_number, room_number)
values (93, 93, 10);
insert into SEAT (seat_number, row_number, room_number)
values (94, 94, 4);
insert into SEAT (seat_number, row_number, room_number)
values (95, 95, 6);
insert into SEAT (seat_number, row_number, room_number)
values (96, 96, 8);
insert into SEAT (seat_number, row_number, room_number)
values (97, 97, 3);
insert into SEAT (seat_number, row_number, room_number)
values (98, 98, 7);
insert into SEAT (seat_number, row_number, room_number)
values (99, 99, 6);
insert into SEAT (seat_number, row_number, room_number)
values (100, 100, 4);
commit;
prompt 100 records committed...
insert into SEAT (seat_number, row_number, room_number)
values (101, 101, 1);
insert into SEAT (seat_number, row_number, room_number)
values (102, 102, 4);
insert into SEAT (seat_number, row_number, room_number)
values (103, 103, 8);
insert into SEAT (seat_number, row_number, room_number)
values (104, 104, 1);
insert into SEAT (seat_number, row_number, room_number)
values (105, 105, 5);
insert into SEAT (seat_number, row_number, room_number)
values (106, 106, 10);
insert into SEAT (seat_number, row_number, room_number)
values (107, 107, 8);
insert into SEAT (seat_number, row_number, room_number)
values (108, 108, 7);
insert into SEAT (seat_number, row_number, room_number)
values (109, 109, 3);
insert into SEAT (seat_number, row_number, room_number)
values (110, 110, 4);
insert into SEAT (seat_number, row_number, room_number)
values (111, 111, 5);
insert into SEAT (seat_number, row_number, room_number)
values (112, 112, 5);
insert into SEAT (seat_number, row_number, room_number)
values (113, 113, 2);
insert into SEAT (seat_number, row_number, room_number)
values (114, 114, 6);
insert into SEAT (seat_number, row_number, room_number)
values (115, 115, 6);
insert into SEAT (seat_number, row_number, room_number)
values (116, 116, 6);
insert into SEAT (seat_number, row_number, room_number)
values (117, 117, 5);
insert into SEAT (seat_number, row_number, room_number)
values (118, 118, 7);
insert into SEAT (seat_number, row_number, room_number)
values (119, 119, 6);
insert into SEAT (seat_number, row_number, room_number)
values (120, 120, 3);
insert into SEAT (seat_number, row_number, room_number)
values (121, 121, 3);
insert into SEAT (seat_number, row_number, room_number)
values (122, 122, 3);
insert into SEAT (seat_number, row_number, room_number)
values (123, 123, 1);
insert into SEAT (seat_number, row_number, room_number)
values (124, 124, 5);
insert into SEAT (seat_number, row_number, room_number)
values (125, 125, 1);
insert into SEAT (seat_number, row_number, room_number)
values (126, 126, 2);
insert into SEAT (seat_number, row_number, room_number)
values (127, 127, 6);
insert into SEAT (seat_number, row_number, room_number)
values (128, 128, 3);
insert into SEAT (seat_number, row_number, room_number)
values (129, 129, 8);
insert into SEAT (seat_number, row_number, room_number)
values (130, 130, 3);
insert into SEAT (seat_number, row_number, room_number)
values (131, 131, 7);
insert into SEAT (seat_number, row_number, room_number)
values (132, 132, 9);
insert into SEAT (seat_number, row_number, room_number)
values (133, 133, 2);
insert into SEAT (seat_number, row_number, room_number)
values (134, 134, 10);
insert into SEAT (seat_number, row_number, room_number)
values (135, 135, 1);
insert into SEAT (seat_number, row_number, room_number)
values (136, 136, 5);
insert into SEAT (seat_number, row_number, room_number)
values (137, 137, 9);
insert into SEAT (seat_number, row_number, room_number)
values (138, 138, 9);
insert into SEAT (seat_number, row_number, room_number)
values (139, 139, 7);
insert into SEAT (seat_number, row_number, room_number)
values (140, 140, 9);
insert into SEAT (seat_number, row_number, room_number)
values (141, 141, 4);
insert into SEAT (seat_number, row_number, room_number)
values (142, 142, 5);
insert into SEAT (seat_number, row_number, room_number)
values (143, 143, 4);
insert into SEAT (seat_number, row_number, room_number)
values (144, 144, 9);
insert into SEAT (seat_number, row_number, room_number)
values (145, 145, 3);
insert into SEAT (seat_number, row_number, room_number)
values (146, 146, 7);
insert into SEAT (seat_number, row_number, room_number)
values (147, 147, 3);
insert into SEAT (seat_number, row_number, room_number)
values (148, 148, 9);
insert into SEAT (seat_number, row_number, room_number)
values (149, 149, 8);
insert into SEAT (seat_number, row_number, room_number)
values (150, 150, 5);
insert into SEAT (seat_number, row_number, room_number)
values (151, 151, 10);
insert into SEAT (seat_number, row_number, room_number)
values (152, 152, 6);
insert into SEAT (seat_number, row_number, room_number)
values (153, 153, 5);
insert into SEAT (seat_number, row_number, room_number)
values (154, 154, 5);
insert into SEAT (seat_number, row_number, room_number)
values (155, 155, 8);
insert into SEAT (seat_number, row_number, room_number)
values (156, 156, 9);
insert into SEAT (seat_number, row_number, room_number)
values (157, 157, 7);
insert into SEAT (seat_number, row_number, room_number)
values (158, 158, 3);
insert into SEAT (seat_number, row_number, room_number)
values (159, 159, 1);
insert into SEAT (seat_number, row_number, room_number)
values (160, 160, 8);
insert into SEAT (seat_number, row_number, room_number)
values (161, 161, 1);
insert into SEAT (seat_number, row_number, room_number)
values (162, 162, 7);
insert into SEAT (seat_number, row_number, room_number)
values (163, 163, 4);
insert into SEAT (seat_number, row_number, room_number)
values (164, 164, 9);
insert into SEAT (seat_number, row_number, room_number)
values (165, 165, 3);
insert into SEAT (seat_number, row_number, room_number)
values (166, 166, 3);
insert into SEAT (seat_number, row_number, room_number)
values (167, 167, 4);
insert into SEAT (seat_number, row_number, room_number)
values (168, 168, 10);
insert into SEAT (seat_number, row_number, room_number)
values (169, 169, 6);
insert into SEAT (seat_number, row_number, room_number)
values (170, 170, 4);
insert into SEAT (seat_number, row_number, room_number)
values (171, 171, 5);
insert into SEAT (seat_number, row_number, room_number)
values (172, 172, 7);
insert into SEAT (seat_number, row_number, room_number)
values (173, 173, 7);
insert into SEAT (seat_number, row_number, room_number)
values (174, 174, 4);
insert into SEAT (seat_number, row_number, room_number)
values (175, 175, 1);
insert into SEAT (seat_number, row_number, room_number)
values (176, 176, 10);
insert into SEAT (seat_number, row_number, room_number)
values (177, 177, 7);
insert into SEAT (seat_number, row_number, room_number)
values (178, 178, 4);
insert into SEAT (seat_number, row_number, room_number)
values (179, 179, 7);
insert into SEAT (seat_number, row_number, room_number)
values (180, 180, 9);
insert into SEAT (seat_number, row_number, room_number)
values (181, 181, 3);
insert into SEAT (seat_number, row_number, room_number)
values (182, 182, 10);
insert into SEAT (seat_number, row_number, room_number)
values (183, 183, 8);
insert into SEAT (seat_number, row_number, room_number)
values (184, 184, 7);
insert into SEAT (seat_number, row_number, room_number)
values (185, 185, 6);
insert into SEAT (seat_number, row_number, room_number)
values (186, 186, 4);
insert into SEAT (seat_number, row_number, room_number)
values (187, 187, 3);
insert into SEAT (seat_number, row_number, room_number)
values (188, 188, 7);
insert into SEAT (seat_number, row_number, room_number)
values (189, 189, 4);
insert into SEAT (seat_number, row_number, room_number)
values (190, 190, 3);
insert into SEAT (seat_number, row_number, room_number)
values (191, 191, 7);
insert into SEAT (seat_number, row_number, room_number)
values (192, 192, 5);
insert into SEAT (seat_number, row_number, room_number)
values (193, 193, 3);
insert into SEAT (seat_number, row_number, room_number)
values (194, 194, 1);
insert into SEAT (seat_number, row_number, room_number)
values (195, 195, 5);
insert into SEAT (seat_number, row_number, room_number)
values (196, 196, 9);
insert into SEAT (seat_number, row_number, room_number)
values (197, 197, 8);
insert into SEAT (seat_number, row_number, room_number)
values (198, 198, 7);
insert into SEAT (seat_number, row_number, room_number)
values (199, 199, 3);
insert into SEAT (seat_number, row_number, room_number)
values (200, 200, 6);
commit;
prompt 200 records committed...
insert into SEAT (seat_number, row_number, room_number)
values (201, 201, 8);
insert into SEAT (seat_number, row_number, room_number)
values (202, 202, 3);
insert into SEAT (seat_number, row_number, room_number)
values (203, 203, 5);
insert into SEAT (seat_number, row_number, room_number)
values (204, 204, 5);
insert into SEAT (seat_number, row_number, room_number)
values (205, 205, 10);
insert into SEAT (seat_number, row_number, room_number)
values (206, 206, 10);
insert into SEAT (seat_number, row_number, room_number)
values (207, 207, 10);
insert into SEAT (seat_number, row_number, room_number)
values (208, 208, 6);
insert into SEAT (seat_number, row_number, room_number)
values (209, 209, 8);
insert into SEAT (seat_number, row_number, room_number)
values (210, 210, 6);
insert into SEAT (seat_number, row_number, room_number)
values (211, 211, 5);
insert into SEAT (seat_number, row_number, room_number)
values (212, 212, 2);
insert into SEAT (seat_number, row_number, room_number)
values (213, 213, 2);
insert into SEAT (seat_number, row_number, room_number)
values (214, 214, 1);
insert into SEAT (seat_number, row_number, room_number)
values (215, 215, 1);
insert into SEAT (seat_number, row_number, room_number)
values (216, 216, 2);
insert into SEAT (seat_number, row_number, room_number)
values (217, 217, 3);
insert into SEAT (seat_number, row_number, room_number)
values (218, 218, 10);
insert into SEAT (seat_number, row_number, room_number)
values (219, 219, 5);
insert into SEAT (seat_number, row_number, room_number)
values (220, 220, 3);
insert into SEAT (seat_number, row_number, room_number)
values (221, 221, 7);
insert into SEAT (seat_number, row_number, room_number)
values (222, 222, 2);
insert into SEAT (seat_number, row_number, room_number)
values (223, 223, 10);
insert into SEAT (seat_number, row_number, room_number)
values (224, 224, 7);
insert into SEAT (seat_number, row_number, room_number)
values (225, 225, 5);
insert into SEAT (seat_number, row_number, room_number)
values (226, 226, 4);
insert into SEAT (seat_number, row_number, room_number)
values (227, 227, 7);
insert into SEAT (seat_number, row_number, room_number)
values (228, 228, 2);
insert into SEAT (seat_number, row_number, room_number)
values (229, 229, 2);
insert into SEAT (seat_number, row_number, room_number)
values (230, 230, 7);
insert into SEAT (seat_number, row_number, room_number)
values (231, 231, 8);
insert into SEAT (seat_number, row_number, room_number)
values (232, 232, 7);
insert into SEAT (seat_number, row_number, room_number)
values (233, 233, 3);
insert into SEAT (seat_number, row_number, room_number)
values (234, 234, 7);
insert into SEAT (seat_number, row_number, room_number)
values (235, 235, 3);
insert into SEAT (seat_number, row_number, room_number)
values (236, 236, 9);
insert into SEAT (seat_number, row_number, room_number)
values (237, 237, 8);
insert into SEAT (seat_number, row_number, room_number)
values (238, 238, 5);
insert into SEAT (seat_number, row_number, room_number)
values (239, 239, 4);
insert into SEAT (seat_number, row_number, room_number)
values (240, 240, 10);
insert into SEAT (seat_number, row_number, room_number)
values (241, 241, 4);
insert into SEAT (seat_number, row_number, room_number)
values (242, 242, 10);
insert into SEAT (seat_number, row_number, room_number)
values (243, 243, 8);
insert into SEAT (seat_number, row_number, room_number)
values (244, 244, 1);
insert into SEAT (seat_number, row_number, room_number)
values (245, 245, 7);
insert into SEAT (seat_number, row_number, room_number)
values (246, 246, 2);
insert into SEAT (seat_number, row_number, room_number)
values (247, 247, 4);
insert into SEAT (seat_number, row_number, room_number)
values (248, 248, 1);
insert into SEAT (seat_number, row_number, room_number)
values (249, 249, 2);
insert into SEAT (seat_number, row_number, room_number)
values (250, 250, 1);
insert into SEAT (seat_number, row_number, room_number)
values (251, 251, 2);
insert into SEAT (seat_number, row_number, room_number)
values (252, 252, 1);
insert into SEAT (seat_number, row_number, room_number)
values (253, 253, 6);
insert into SEAT (seat_number, row_number, room_number)
values (254, 254, 9);
insert into SEAT (seat_number, row_number, room_number)
values (255, 255, 8);
insert into SEAT (seat_number, row_number, room_number)
values (256, 256, 9);
insert into SEAT (seat_number, row_number, room_number)
values (257, 257, 8);
insert into SEAT (seat_number, row_number, room_number)
values (258, 258, 7);
insert into SEAT (seat_number, row_number, room_number)
values (259, 259, 4);
insert into SEAT (seat_number, row_number, room_number)
values (260, 260, 7);
insert into SEAT (seat_number, row_number, room_number)
values (261, 261, 1);
insert into SEAT (seat_number, row_number, room_number)
values (262, 262, 4);
insert into SEAT (seat_number, row_number, room_number)
values (263, 263, 7);
insert into SEAT (seat_number, row_number, room_number)
values (264, 264, 4);
insert into SEAT (seat_number, row_number, room_number)
values (265, 265, 8);
insert into SEAT (seat_number, row_number, room_number)
values (266, 266, 5);
insert into SEAT (seat_number, row_number, room_number)
values (267, 267, 7);
insert into SEAT (seat_number, row_number, room_number)
values (268, 268, 8);
insert into SEAT (seat_number, row_number, room_number)
values (269, 269, 2);
insert into SEAT (seat_number, row_number, room_number)
values (270, 270, 4);
insert into SEAT (seat_number, row_number, room_number)
values (271, 271, 10);
insert into SEAT (seat_number, row_number, room_number)
values (272, 272, 2);
insert into SEAT (seat_number, row_number, room_number)
values (273, 273, 7);
insert into SEAT (seat_number, row_number, room_number)
values (274, 274, 4);
insert into SEAT (seat_number, row_number, room_number)
values (275, 275, 7);
insert into SEAT (seat_number, row_number, room_number)
values (276, 276, 8);
insert into SEAT (seat_number, row_number, room_number)
values (277, 277, 4);
insert into SEAT (seat_number, row_number, room_number)
values (278, 278, 5);
insert into SEAT (seat_number, row_number, room_number)
values (279, 279, 9);
insert into SEAT (seat_number, row_number, room_number)
values (280, 280, 9);
insert into SEAT (seat_number, row_number, room_number)
values (281, 281, 8);
insert into SEAT (seat_number, row_number, room_number)
values (282, 282, 9);
insert into SEAT (seat_number, row_number, room_number)
values (283, 283, 6);
insert into SEAT (seat_number, row_number, room_number)
values (284, 284, 10);
insert into SEAT (seat_number, row_number, room_number)
values (285, 285, 8);
insert into SEAT (seat_number, row_number, room_number)
values (286, 286, 7);
insert into SEAT (seat_number, row_number, room_number)
values (287, 287, 8);
insert into SEAT (seat_number, row_number, room_number)
values (288, 288, 4);
insert into SEAT (seat_number, row_number, room_number)
values (289, 289, 9);
insert into SEAT (seat_number, row_number, room_number)
values (290, 290, 10);
insert into SEAT (seat_number, row_number, room_number)
values (291, 291, 9);
insert into SEAT (seat_number, row_number, room_number)
values (292, 292, 3);
insert into SEAT (seat_number, row_number, room_number)
values (293, 293, 3);
insert into SEAT (seat_number, row_number, room_number)
values (294, 294, 4);
insert into SEAT (seat_number, row_number, room_number)
values (295, 295, 10);
insert into SEAT (seat_number, row_number, room_number)
values (296, 296, 3);
insert into SEAT (seat_number, row_number, room_number)
values (297, 297, 10);
insert into SEAT (seat_number, row_number, room_number)
values (298, 298, 7);
insert into SEAT (seat_number, row_number, room_number)
values (299, 299, 7);
insert into SEAT (seat_number, row_number, room_number)
values (300, 300, 5);
commit;
prompt 300 records committed...
insert into SEAT (seat_number, row_number, room_number)
values (301, 301, 1);
insert into SEAT (seat_number, row_number, room_number)
values (302, 302, 3);
insert into SEAT (seat_number, row_number, room_number)
values (303, 303, 1);
insert into SEAT (seat_number, row_number, room_number)
values (304, 304, 5);
insert into SEAT (seat_number, row_number, room_number)
values (305, 305, 1);
insert into SEAT (seat_number, row_number, room_number)
values (306, 306, 5);
insert into SEAT (seat_number, row_number, room_number)
values (307, 307, 2);
insert into SEAT (seat_number, row_number, room_number)
values (308, 308, 5);
insert into SEAT (seat_number, row_number, room_number)
values (309, 309, 9);
insert into SEAT (seat_number, row_number, room_number)
values (310, 310, 8);
insert into SEAT (seat_number, row_number, room_number)
values (311, 311, 2);
insert into SEAT (seat_number, row_number, room_number)
values (312, 312, 10);
insert into SEAT (seat_number, row_number, room_number)
values (313, 313, 4);
insert into SEAT (seat_number, row_number, room_number)
values (314, 314, 1);
insert into SEAT (seat_number, row_number, room_number)
values (315, 315, 1);
insert into SEAT (seat_number, row_number, room_number)
values (316, 316, 3);
insert into SEAT (seat_number, row_number, room_number)
values (317, 317, 6);
insert into SEAT (seat_number, row_number, room_number)
values (318, 318, 2);
insert into SEAT (seat_number, row_number, room_number)
values (319, 319, 7);
insert into SEAT (seat_number, row_number, room_number)
values (320, 320, 7);
insert into SEAT (seat_number, row_number, room_number)
values (321, 321, 8);
insert into SEAT (seat_number, row_number, room_number)
values (322, 322, 2);
insert into SEAT (seat_number, row_number, room_number)
values (323, 323, 10);
insert into SEAT (seat_number, row_number, room_number)
values (324, 324, 8);
insert into SEAT (seat_number, row_number, room_number)
values (325, 325, 7);
insert into SEAT (seat_number, row_number, room_number)
values (326, 326, 3);
insert into SEAT (seat_number, row_number, room_number)
values (327, 327, 5);
insert into SEAT (seat_number, row_number, room_number)
values (328, 328, 8);
insert into SEAT (seat_number, row_number, room_number)
values (329, 329, 5);
insert into SEAT (seat_number, row_number, room_number)
values (330, 330, 9);
insert into SEAT (seat_number, row_number, room_number)
values (331, 331, 8);
insert into SEAT (seat_number, row_number, room_number)
values (332, 332, 6);
insert into SEAT (seat_number, row_number, room_number)
values (333, 333, 6);
insert into SEAT (seat_number, row_number, room_number)
values (334, 334, 9);
insert into SEAT (seat_number, row_number, room_number)
values (335, 335, 3);
insert into SEAT (seat_number, row_number, room_number)
values (336, 336, 2);
insert into SEAT (seat_number, row_number, room_number)
values (337, 337, 8);
insert into SEAT (seat_number, row_number, room_number)
values (338, 338, 9);
insert into SEAT (seat_number, row_number, room_number)
values (339, 339, 7);
insert into SEAT (seat_number, row_number, room_number)
values (340, 340, 9);
insert into SEAT (seat_number, row_number, room_number)
values (341, 341, 8);
insert into SEAT (seat_number, row_number, room_number)
values (342, 342, 7);
insert into SEAT (seat_number, row_number, room_number)
values (343, 343, 7);
insert into SEAT (seat_number, row_number, room_number)
values (344, 344, 9);
insert into SEAT (seat_number, row_number, room_number)
values (345, 345, 1);
insert into SEAT (seat_number, row_number, room_number)
values (346, 346, 6);
insert into SEAT (seat_number, row_number, room_number)
values (347, 347, 6);
insert into SEAT (seat_number, row_number, room_number)
values (348, 348, 3);
insert into SEAT (seat_number, row_number, room_number)
values (349, 349, 10);
insert into SEAT (seat_number, row_number, room_number)
values (350, 350, 10);
insert into SEAT (seat_number, row_number, room_number)
values (351, 351, 2);
insert into SEAT (seat_number, row_number, room_number)
values (352, 352, 6);
insert into SEAT (seat_number, row_number, room_number)
values (353, 353, 8);
insert into SEAT (seat_number, row_number, room_number)
values (354, 354, 2);
insert into SEAT (seat_number, row_number, room_number)
values (355, 355, 6);
insert into SEAT (seat_number, row_number, room_number)
values (356, 356, 7);
insert into SEAT (seat_number, row_number, room_number)
values (357, 357, 3);
insert into SEAT (seat_number, row_number, room_number)
values (358, 358, 2);
insert into SEAT (seat_number, row_number, room_number)
values (359, 359, 3);
insert into SEAT (seat_number, row_number, room_number)
values (360, 360, 5);
insert into SEAT (seat_number, row_number, room_number)
values (361, 361, 6);
insert into SEAT (seat_number, row_number, room_number)
values (362, 362, 2);
insert into SEAT (seat_number, row_number, room_number)
values (363, 363, 4);
insert into SEAT (seat_number, row_number, room_number)
values (364, 364, 9);
insert into SEAT (seat_number, row_number, room_number)
values (365, 365, 10);
insert into SEAT (seat_number, row_number, room_number)
values (366, 366, 4);
insert into SEAT (seat_number, row_number, room_number)
values (367, 367, 10);
insert into SEAT (seat_number, row_number, room_number)
values (368, 368, 7);
insert into SEAT (seat_number, row_number, room_number)
values (369, 369, 9);
insert into SEAT (seat_number, row_number, room_number)
values (370, 370, 2);
insert into SEAT (seat_number, row_number, room_number)
values (371, 371, 7);
insert into SEAT (seat_number, row_number, room_number)
values (372, 372, 7);
insert into SEAT (seat_number, row_number, room_number)
values (373, 373, 10);
insert into SEAT (seat_number, row_number, room_number)
values (374, 374, 4);
insert into SEAT (seat_number, row_number, room_number)
values (375, 375, 8);
insert into SEAT (seat_number, row_number, room_number)
values (376, 376, 3);
insert into SEAT (seat_number, row_number, room_number)
values (377, 377, 3);
insert into SEAT (seat_number, row_number, room_number)
values (378, 378, 9);
insert into SEAT (seat_number, row_number, room_number)
values (379, 379, 10);
insert into SEAT (seat_number, row_number, room_number)
values (380, 380, 10);
insert into SEAT (seat_number, row_number, room_number)
values (381, 381, 6);
insert into SEAT (seat_number, row_number, room_number)
values (382, 382, 9);
insert into SEAT (seat_number, row_number, room_number)
values (383, 383, 2);
insert into SEAT (seat_number, row_number, room_number)
values (384, 384, 6);
insert into SEAT (seat_number, row_number, room_number)
values (385, 385, 8);
insert into SEAT (seat_number, row_number, room_number)
values (386, 386, 7);
insert into SEAT (seat_number, row_number, room_number)
values (387, 387, 1);
insert into SEAT (seat_number, row_number, room_number)
values (388, 388, 3);
insert into SEAT (seat_number, row_number, room_number)
values (389, 389, 5);
insert into SEAT (seat_number, row_number, room_number)
values (390, 390, 9);
insert into SEAT (seat_number, row_number, room_number)
values (391, 391, 2);
insert into SEAT (seat_number, row_number, room_number)
values (392, 392, 10);
insert into SEAT (seat_number, row_number, room_number)
values (393, 393, 8);
insert into SEAT (seat_number, row_number, room_number)
values (394, 394, 1);
insert into SEAT (seat_number, row_number, room_number)
values (395, 395, 6);
insert into SEAT (seat_number, row_number, room_number)
values (396, 396, 9);
insert into SEAT (seat_number, row_number, room_number)
values (397, 397, 8);
insert into SEAT (seat_number, row_number, room_number)
values (398, 398, 9);
insert into SEAT (seat_number, row_number, room_number)
values (399, 399, 7);
insert into SEAT (seat_number, row_number, room_number)
values (400, 400, 5);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for MOVIE...
alter table MOVIE enable constraint SYS_C008611;
alter table MOVIE enable constraint SYS_C008612;
prompt Enabling foreign key constraints for TICKET...
alter table TICKET enable constraint SYS_C008620;
prompt Enabling foreign key constraints for FOOD...
alter table FOOD enable constraint SYS_C008626;
prompt Enabling foreign key constraints for SEAT...
alter table SEAT enable constraint SYS_C008603;

set feedback on
set define on
prompt Done
