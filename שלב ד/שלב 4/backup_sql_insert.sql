prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by Israel on Sunday, 21 July 2024
set feedback off
set define off

prompt Dropping BASE...
drop table BASE cascade constraints;
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
prompt Dropping GEAR...
drop table GEAR cascade constraints;
prompt Dropping PERSONAL_INFO...
drop table PERSONAL_INFO cascade constraints;
prompt Dropping POSITION...
drop table POSITION cascade constraints;
prompt Dropping SEAT...
drop table SEAT cascade constraints;
prompt Dropping SHIFTS...
drop table SHIFTS cascade constraints;
prompt Dropping VOLUNTEERS...
drop table VOLUNTEERS cascade constraints;
prompt Dropping SIGNED_UP...
drop table SIGNED_UP cascade constraints;
prompt Creating BASE...
create table BASE
(
  base_id     NUMBER not null,
  location    VARCHAR2(1000) not null,
  description VARCHAR2(1000) not null
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
alter table BASE
  add primary key (BASE_ID)
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

prompt Creating CINEMA_ROOM...
create table CINEMA_ROOM
(
  room_number INTEGER not null,
  names       VARCHAR2(20) not null,
  base_id     INTEGER
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
alter table CINEMA_ROOM
  add constraint FK_BASE_ID foreign key (BASE_ID)
  references BASE (BASE_ID);

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
  references CINEMA_ROOM (ROOM_NUMBER) on delete cascade;
alter table MOVIE
  add foreign key (PROJECTOR_CODE)
  references PROJECTOR_EMPLOYEE (PROJECTOR_CODE) on delete cascade;

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
  references MOVIE (FILM_CODE) on delete cascade;

prompt Creating FOOD...
create table FOOD
(
  food_items         VARCHAR2(200) not null,
  price              INTEGER not null,
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
  references TICKET (IDENTIFYING_NUMBER) on delete cascade;

prompt Creating GEAR...
create table GEAR
(
  armor_type VARCHAR2(20) not null,
  gun_type   VARCHAR2(20) not null,
  gear_id    NUMBER not null
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

prompt Creating PERSONAL_INFO...
create table PERSONAL_INFO
(
  address      VARCHAR2(1000) not null,
  phone_number VARCHAR2(20) not null,
  email        VARCHAR2(500) not null
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
alter table PERSONAL_INFO
  add primary key (PHONE_NUMBER)
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

prompt Creating POSITION...
create table POSITION
(
  role_id     NUMBER not null,
  role_name   VARCHAR2(100) not null,
  description VARCHAR2(1000) not null
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
alter table POSITION
  add primary key (ROLE_ID)
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
  references CINEMA_ROOM (ROOM_NUMBER) on delete cascade;

prompt Creating SHIFTS...
create table SHIFTS
(
  shift_id        NUMBER not null,
  start_date_time DATE not null,
  end_date_time   DATE not null,
  base_id         NUMBER not null
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
alter table SHIFTS
  add primary key (SHIFT_ID)
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
alter table SHIFTS
  add foreign key (BASE_ID)
  references BASE (BASE_ID);

prompt Creating VOLUNTEERS...
create table VOLUNTEERS
(
  volunteer_id NUMBER not null,
  join_date    DATE not null,
  name         VARCHAR2(100) not null,
  role_id      NUMBER not null,
  gear_id      NUMBER not null,
  phone_number VARCHAR2(20) not null
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
alter table VOLUNTEERS
  add primary key (VOLUNTEER_ID)
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
alter table VOLUNTEERS
  add foreign key (ROLE_ID)
  references POSITION (ROLE_ID);
alter table VOLUNTEERS
  add foreign key (PHONE_NUMBER)
  references PERSONAL_INFO (PHONE_NUMBER);

prompt Creating SIGNED_UP...
create table SIGNED_UP
(
  volunteer_id NUMBER not null,
  shift_id     NUMBER not null
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
alter table SIGNED_UP
  add primary key (VOLUNTEER_ID, SHIFT_ID)
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
alter table SIGNED_UP
  add foreign key (VOLUNTEER_ID)
  references VOLUNTEERS (VOLUNTEER_ID);
alter table SIGNED_UP
  add foreign key (SHIFT_ID)
  references SHIFTS (SHIFT_ID);

prompt Disabling triggers for BASE...
alter table BASE disable all triggers;
prompt Disabling triggers for CINEMA_ROOM...
alter table CINEMA_ROOM disable all triggers;
prompt Disabling triggers for PROJECTOR_EMPLOYEE...
alter table PROJECTOR_EMPLOYEE disable all triggers;
prompt Disabling triggers for MOVIE...
alter table MOVIE disable all triggers;
prompt Disabling triggers for TICKET...
alter table TICKET disable all triggers;
prompt Disabling triggers for FOOD...
alter table FOOD disable all triggers;
prompt Disabling triggers for GEAR...
alter table GEAR disable all triggers;
prompt Disabling triggers for PERSONAL_INFO...
alter table PERSONAL_INFO disable all triggers;
prompt Disabling triggers for POSITION...
alter table POSITION disable all triggers;
prompt Disabling triggers for SEAT...
alter table SEAT disable all triggers;
prompt Disabling triggers for SHIFTS...
alter table SHIFTS disable all triggers;
prompt Disabling triggers for VOLUNTEERS...
alter table VOLUNTEERS disable all triggers;
prompt Disabling triggers for SIGNED_UP...
alter table SIGNED_UP disable all triggers;
prompt Disabling foreign key constraints for CINEMA_ROOM...
alter table CINEMA_ROOM disable constraint FK_BASE_ID;
prompt Disabling foreign key constraints for MOVIE...
alter table MOVIE disable constraint SYS_C009281;
alter table MOVIE disable constraint SYS_C009282;
prompt Disabling foreign key constraints for TICKET...
alter table TICKET disable constraint SYS_C009290;
prompt Disabling foreign key constraints for FOOD...
alter table FOOD disable constraint SYS_C009296;
prompt Disabling foreign key constraints for SEAT...
alter table SEAT disable constraint SYS_C009302;
prompt Disabling foreign key constraints for SHIFTS...
alter table SHIFTS disable constraint SYS_C009373;
prompt Disabling foreign key constraints for VOLUNTEERS...
alter table VOLUNTEERS disable constraint SYS_C009365;
alter table VOLUNTEERS disable constraint SYS_C009367;
prompt Disabling foreign key constraints for SIGNED_UP...
alter table SIGNED_UP disable constraint SYS_C009377;
alter table SIGNED_UP disable constraint SYS_C009378;
prompt Loading BASE...
insert into BASE (base_id, location, description)
values (532602580, 'Potsdam', 'KIT Keyboard Mouse and Speakers to match Black cases.');
insert into BASE (base_id, location, description)
values (348879817, 'Purley', 'Matrox Dual Head G550 With 32 MB of Double Data Rate (DDR) memory; a 360. MHz primary RAMDAC.OEM package');
insert into BASE (base_id, location, description)
values (919698392, 'Edison', 'Mircosoft Ergonomic Keyboard and Mouse Set.');
insert into BASE (base_id, location, description)
values (764079527, 'Buffalo', 'Antec Plus 660 ATX Mid tower 330w Power Supply');
insert into BASE (base_id, location, description)
values (715652307, 'Visselhövede', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.');
insert into BASE (base_id, location, description)
values (477908730, 'Bethesda', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (639946543, 'Conshohocken', 'Combo AMD XP 2700+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into BASE (base_id, location, description)
values (637102164, 'Augsburg', 'PS2 2 Button Mouse');
insert into BASE (base_id, location, description)
values (115736975, 'Gersthofen', 'Linksys Instant Wireless Network Adapter - Version 3.0 for Notbooks. (Model No. WPC11 ver.3)');
insert into BASE (base_id, location, description)
values (895591429, 'Dinslaken', 'Dynatron MicroFin DC1206BM-l AMD Athlon/Duron Fan w/ Copper Base up to AMD XP (AMD APPROVED!) 3000+.');
insert into BASE (base_id, location, description)
values (883554799, 'Erpe-Mere', 'Biostar U8668D P4 uATX M/B (VIA P4M266 478pin) with AMR ;Support DDR and 533MhZ FSB; onboard Sound & Video & AGP Slot');
insert into BASE (base_id, location, description)
values (686404137, 'New Delhi', 'Intel P4 1.8 Ghz CPU BOX (533Mhz)');
insert into BASE (base_id, location, description)
values (424054287, 'Dinslaken', 'AMD Duron 1.3MHz & Biostar M7VIG-Pro MB w/ 312D case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (271195019, 'Oak Park', 'Black RF Wireless Keyboard Track Ball (USB) w/ Antenna.');
insert into BASE (base_id, location, description)
values (964550125, 'Saint-vincent-de-dur', '512Mb DDRam PC2100 (one piece) Micron');
insert into BASE (base_id, location, description)
values (221935402, 'Irving', 'AMDXP2200/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (467653037, 'Storrington', 'PCI 56K V.92 Fax Modem');
insert into BASE (base_id, location, description)
values (862072713, 'Frederiksberg', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.');
insert into BASE (base_id, location, description)
values (301914323, 'Rueil-Malmaison', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.');
insert into BASE (base_id, location, description)
values (548087467, 'Highton', 'AMD XP 1800+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (507134835, 'Gattico', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.');
insert into BASE (base_id, location, description)
values (571891498, 'Ehningen', 'ATI Radion 7000 64Mb SD CRT+TV-Out');
insert into BASE (base_id, location, description)
values (848103746, 'Peachtree City', 'AMD XP 2200+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (239385242, 'Milton', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (176100852, 'Lisbon', 'Gigabyte GA 7DPXDW-c Dual AMD server board');
insert into BASE (base_id, location, description)
values (240115315, 'Montreal', 'Combo AMD XP 1900+ Gigabyte GA-7VKML M/B + Fan');
insert into BASE (base_id, location, description)
values (786158562, 'Nynäshamn', 'Combo AMD XP 2500+ Biostar M7VIK Skt A MotherBoard; KT400.');
insert into BASE (base_id, location, description)
values (833360432, 'Stuttgart', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)');
insert into BASE (base_id, location, description)
values (360881982, 'Braintree', 'AMD XP 2400+ Retail box.');
insert into BASE (base_id, location, description)
values (247998477, 'Double Oak', '2 Year Warranty On Combo''s.');
insert into BASE (base_id, location, description)
values (321157167, 'Edinburgh', 'Western Digital 20GB 5400RPM ATA100');
insert into BASE (base_id, location, description)
values (828641516, 'Angers', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (551868624, 'Harrisburg', 'YS AMD T-Bird 1.2 Ghz Performance Series');
insert into BASE (base_id, location, description)
values (127010539, 'Caguas', 'Biostar M7TDR P4 M/B Skt 423 (w/30 day limit warranty)');
insert into BASE (base_id, location, description)
values (180135686, 'Miyazaki', '313B Black 300W P4/AMD Fan5 .');
insert into BASE (base_id, location, description)
values (998298150, 'Warrington', '2 Year Warranty On MotherBoards.');
insert into BASE (base_id, location, description)
values (150486491, 'Bellerose', 'AMD XP 2100+ Box & Gigabyte GA-7DXE MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (120720069, 'Unionville', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (503383347, 'Carlin', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.');
insert into BASE (base_id, location, description)
values (120485972, 'Pacific Grove', 'AMDXP1800/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (824057988, 'Miami', '10/100 16 Port Switch');
insert into BASE (base_id, location, description)
values (739366417, 'Birmingham', 'AMD XP 2100+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (172255483, 'Washington', 'AMD XP 2200+ Retail box.');
insert into BASE (base_id, location, description)
values (720971581, 'Villata', 'GigaByte 7N400Pro AntecCase+AMDXP2700');
insert into BASE (base_id, location, description)
values (607064264, 'Charleston', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV');
insert into BASE (base_id, location, description)
values (703854993, 'Media', 'YS Intel P4 2.0Ghz POWER SYSTEM');
insert into BASE (base_id, location, description)
values (506351401, 'Rotterdam', 'Black Sony CD-RW 52x24x52x .');
insert into BASE (base_id, location, description)
values (557463618, 'Cambridge', 'Intel P4 1;6Ghz Bare Bone');
insert into BASE (base_id, location, description)
values (869884759, 'Essen', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)');
insert into BASE (base_id, location, description)
values (295108415, 'Lima', 'AOC 15" Monitor .27mm Pitch');
insert into BASE (base_id, location, description)
values (422208030, 'King of Prussia', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.');
insert into BASE (base_id, location, description)
values (916385807, 'Oyten', 'KIT Keyboard Mouse and Speakers to match Black cases.');
insert into BASE (base_id, location, description)
values (919659941, 'Hermitage', '10ft Cat 5 network cable w/RJ45 connectors');
insert into BASE (base_id, location, description)
values (229155781, 'Neuquen', 'ADS Technologies Firewire External Drive.');
insert into BASE (base_id, location, description)
values (173046916, 'Bellerose', 'AMDXP2400/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (130418894, 'Monterey', '512MB DDR PC2700 Kingston(KVR333X64C25/512)');
insert into BASE (base_id, location, description)
values (174961000, 'Samrand', 'Intel Celeron 1.3Ghz & Biostar M6VLQ MB w/ 312J Color Case. W/ Free PS2 Mouse and AMR Moden.');
insert into BASE (base_id, location, description)
values (617598578, 'Syracuse', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKML MB w/ 312J Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (157087096, 'Ebersdorf', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into BASE (base_id, location, description)
values (820640013, 'Santana do parnaíba', 'ADS USB2000 USB Turbo 2.0 pci Controller card');
insert into BASE (base_id, location, description)
values (941651867, 'Olsztyn', 'Boka 306 Sub Woofer Flat Speaker system');
insert into BASE (base_id, location, description)
values (576284282, 'Malmö', 'Combo Intel P4 1.6Ghz (512k cache) 845WN M/B & Fan (478pin)');
insert into BASE (base_id, location, description)
values (475823720, 'Snoqualmie', '313D Black 400W P4/AMD 2xUSB');
insert into BASE (base_id, location, description)
values (238109118, 'Frankfurt', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV');
insert into BASE (base_id, location, description)
values (655061346, 'Americana', 'ATI RADEON 9200™ SE 128M DDR DVI+TV-Out 8X AGP (R92LE-C3S).');
insert into BASE (base_id, location, description)
values (295264063, 'Cedar Rapids', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into BASE (base_id, location, description)
values (314780983, 'Ashdod', 'Intel Celeron 1.3Ghz & Biostar M6VLQ MB w/ 312J Color Case. W/ Free PS2 Mouse and AMR Moden.');
insert into BASE (base_id, location, description)
values (588943247, 'Mountain View', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV');
insert into BASE (base_id, location, description)
values (693364662, 'Fuerth', 'Mitsumi 1.44 Floppy Drive');
insert into BASE (base_id, location, description)
values (144020162, 'Regina', 'Black Sony CD-RW 52x24x52x .');
insert into BASE (base_id, location, description)
values (532313056, 'Bellerose', '10 Pack CD-R cd''s Color pack');
insert into BASE (base_id, location, description)
values (195263919, 'Pirapora bom Jesus', 'AMD XP 2500+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (257639921, 'Monmouth', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (616864162, 'Oulu', 'Boka 2000 Sub Woofer Speaker System');
insert into BASE (base_id, location, description)
values (923765544, 'Enschede', '4 Port USB 2.0 High-Speed PCI Card');
insert into BASE (base_id, location, description)
values (767251347, 'St Kilda', 'Visioneer 5800 48bit USB Scanner XP compatable');
insert into BASE (base_id, location, description)
values (301115580, 'Ft. Lauderdale', 'Cyber Power 725VA Battery Back Up');
insert into BASE (base_id, location, description)
values (995321596, 'Lakeville', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).');
insert into BASE (base_id, location, description)
values (226262298, 'Bergen', 'Windows XP Pro Registered OEM');
insert into BASE (base_id, location, description)
values (212998157, 'Sidney', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (797368163, 'Coimbra', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (811480017, 'Frederiksberg', 'AMD XP 2700+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (486806623, 'Eschborn', 'ATI Radeon 9600 256MB DVI+CRT+TV 8X .');
insert into BASE (base_id, location, description)
values (864761121, 'Shreveport', '14"/15" Filter Screen');
insert into BASE (base_id, location, description)
values (134146256, 'Westfield', 'Black LG Electronics CD-RW 48x12x48x / DVD 16x Combo Drive.');
insert into BASE (base_id, location, description)
values (319839015, 'Genève', 'CP-691 Stereo Speakers');
insert into BASE (base_id, location, description)
values (696972862, 'Bruneck', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.');
insert into BASE (base_id, location, description)
values (816589551, 'Salt Lake City', 'Linksys USB Wireless (WUSB11)');
insert into BASE (base_id, location, description)
values (129246439, 'Santa Fe', 'Combo AMD XP 2600+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into BASE (base_id, location, description)
values (982025418, 'Hanover', 'ATI Radeon 7000 VIVO 64mb DDR AGP .');
insert into BASE (base_id, location, description)
values (220744448, 'Hannover', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (177904578, 'Limeira', 'AOC 15" Monitor .27mm Pitch');
insert into BASE (base_id, location, description)
values (738509747, 'Chaam', 'AMD XP 1700+ & Biostar M7VKQ w/ 313N case . W/ Free AMR 56k & PS2 Mouse.');
insert into BASE (base_id, location, description)
values (699762206, 'Heubach', 'LG 32x10x40 and 16x CD-RW/DVD OEM');
insert into BASE (base_id, location, description)
values (119813764, 'Barbengo', 'AMD XP 1800+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (597422886, 'Salt Lake City', 'ATI Radeon 7000 VIVO 64mb DDR AGP .');
insert into BASE (base_id, location, description)
values (455226716, 'Tulsa', '512Mb DDR PC2100 Kingston');
insert into BASE (base_id, location, description)
values (858703292, 'Almaty', 'AMD XP 1700+ & Gigabyte GA-7VKMLS MB w/ 313N Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (513974082, 'Chicago', 'AMD XP 2200+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (442322646, 'Oldham', 'Hewlett Packard Color Deskjet HP 3420 .( Comes with Sample of HP Paper. HP Bright White Paper; HP Glossy Paperm; and HP inkjet Paper).');
insert into BASE (base_id, location, description)
values (333012478, 'Heubach', '400 Watt UL ATX Power Supply Support AMD; P3;P4;and with Dual Fan.');
insert into BASE (base_id, location, description)
values (421314721, 'Bozeman', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into BASE (base_id, location, description)
values (358059427, 'Sapporo', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.');
insert into BASE (base_id, location, description)
values (774984509, 'Americana', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKML MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (170767402, 'Breda', 'AMD XP 2100+ CPU (oem)(AXDA2100DUT3C; RevisionB).');
insert into BASE (base_id, location, description)
values (202624974, 'Stafford', 'Boka 2000 Sub Woofer Speaker System');
insert into BASE (base_id, location, description)
values (933727244, 'San Francisco', '500W P4 Dual Fan Codegen Power supply.');
insert into BASE (base_id, location, description)
values (984196853, 'Pretoria', 'YS AMD T-Bird 1.2 Ghz Performance Series');
insert into BASE (base_id, location, description)
values (194815980, 'Nashua', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into BASE (base_id, location, description)
values (865893397, 'Coquitlam', '313B Black 300W P4/AMD Fan5 .');
insert into BASE (base_id, location, description)
values (658285354, 'Paderborn', 'ATX 300W High Quality Switching Power Supply');
insert into BASE (base_id, location, description)
values (875429879, 'Newnan', 'Seagate 40GB 5400RPM ATA100');
insert into BASE (base_id, location, description)
values (936103842, 'Horsham', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (337932609, 'Kaohsiung', 'Intel Pentium4 2.0ghz & Gigabyte GA-8LS533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (609369225, 'Springfield', 'Maxtor 40G 7200RPM ATA133');
insert into BASE (base_id, location, description)
values (508977710, 'Hässleholm', 'Boka 406 Sub Woofer 4 Channel Speaker system');
insert into BASE (base_id, location, description)
values (571031997, 'Waldbronn', '256Mb SDRam PC133 Kingston');
insert into BASE (base_id, location, description)
values (165629463, 'Oosterhout', 'Combo AMD XP 2500+ Biostar M7VIK Skt A MotherBoard; KT400.');
insert into BASE (base_id, location, description)
values (408198599, 'Fort Lewis', '512Mb DDRam PC2100 (one piece) Micron');
insert into BASE (base_id, location, description)
values (877804100, 'Birmingham', 'M7SXF P4 478pin Motherboard (Suppout DDR Max 3GB)(30 day D.O.A Warranty)');
insert into BASE (base_id, location, description)
values (634892479, 'Rocklin', 'Intel Celeron 1.1Ghz & Gigabyte GA6VEML MB w/ 312D Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (968461771, 'Mount Olive', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (785395896, 'Bracknell', 'Hewlett Packard Color Deskjet HP 3420 .( Comes with Sample of HP Paper. HP Bright White Paper; HP Glossy Paperm; and HP inkjet Paper).');
insert into BASE (base_id, location, description)
values (528742004, 'Chaam', 'Creative Sound Blaster');
insert into BASE (base_id, location, description)
values (226210025, 'Mumbai', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.');
insert into BASE (base_id, location, description)
values (936860626, 'Durham', '128Mb RDRam 800Mhz Kingston');
insert into BASE (base_id, location, description)
values (879198449, 'Oldwick', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.');
insert into BASE (base_id, location, description)
values (742524763, 'Bozeman', 'Combo AMD XP 2000+ Gigabyte GA-7VKML MB');
insert into BASE (base_id, location, description)
values (241205406, 'Santiago', 'Intel P4 3.06Ghz (478)pin(HT) 3 Year MFG Warr.');
insert into BASE (base_id, location, description)
values (446697141, 'Shenzhen', 'Intel P4 2.4 Ghz CPU BOX (800Mhz)');
insert into BASE (base_id, location, description)
values (442652819, 'Tilst', '256Mb PC133 SDRam Micron 168 PIN SDRAM - Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into BASE (base_id, location, description)
values (575258987, 'Reno', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (103796669, 'Annandale', 'MITSUMI 54X CD-Rom FX5401W .');
insert into BASE (base_id, location, description)
values (810942013, 'Stony Point', 'Intel Pentium4 1.6Ghz & Biostar M7TDB MB w/ 313M Case.');
insert into BASE (base_id, location, description)
values (628951225, 'Slidel', 'Combo Intel P4 1.6Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into BASE (base_id, location, description)
values (324170665, 'Lake Oswego', 'ATI RADEON 9200™ SE 128M DDR DVI+TV-Out 8X AGP (R92LE-C3S).');
insert into BASE (base_id, location, description)
values (867828763, 'Trumbull', 'AOC 17" Monitor 7FSLK .25mm Dot Pitch TureFlat');
insert into BASE (base_id, location, description)
values (932130069, 'Southend on Sea', '10/100 REALTEK NETWORK CARD 8139 chipset RETAIL BOX');
insert into BASE (base_id, location, description)
values (480443192, 'Battle Creek', '312J ATX color case(translucent blue) with 400Watt P4/P3/AMD Ready PS.');
insert into BASE (base_id, location, description)
values (241295050, 'Johannesburg', 'Mircosoft Ergonomic Keyboard and Mouse Set.');
insert into BASE (base_id, location, description)
values (804325335, 'Toulouse', 'Combo Intel P4 2.0Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.');
insert into BASE (base_id, location, description)
values (209728370, 'Draper', 'LG Goldstar 16X DVD with audio cable OEM');
insert into BASE (base_id, location, description)
values (549057992, 'Brisbane', 'AMD Duron 1.2Ghz OEM');
insert into BASE (base_id, location, description)
values (152485947, 'Birmingham', 'AMD 1.1Ghz Starter Series / Work Station.');
insert into BASE (base_id, location, description)
values (820264412, 'Utrecht', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )');
insert into BASE (base_id, location, description)
values (345660840, 'Bloomington', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into BASE (base_id, location, description)
values (952410652, 'Koblenz', 'Sony 16X DVD-CDRom (OEM)');
insert into BASE (base_id, location, description)
values (917154705, 'Athens', 'ASUS A7N8X Deluxe NVIDIA Force2 .');
insert into BASE (base_id, location, description)
values (598851531, 'Kochi', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)');
insert into BASE (base_id, location, description)
values (807013482, 'Charleston', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (401469090, 'Springfield', '128Mb DDRam PC2100 Kingston');
insert into BASE (base_id, location, description)
values (753821866, 'Toronto', 'Gigabyte GA-8IE800 Intel®845E Chipset.');
insert into BASE (base_id, location, description)
values (924785672, 'Kristiansand', 'Mitsumi 1.44 Floppy Drive');
insert into BASE (base_id, location, description)
values (121785655, 'Leeds', 'AMD XP1800 Biostar M7VKQ Pro');
insert into BASE (base_id, location, description)
values (882903484, 'Sydney', 'GA-7VT600-L VIA KT600 chipset.');
insert into BASE (base_id, location, description)
values (554917367, 'Clark', '256Mb DDRam PC2100 Kingston');
insert into BASE (base_id, location, description)
values (684340759, 'Cle Elum', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into BASE (base_id, location, description)
values (481657222, 'Amherst', 'Biostar M7TDR P4 M/B Skt 423 (w/30 day limit warranty)');
insert into BASE (base_id, location, description)
values (181714456, 'Pearland', 'Combo Intel P4 1.9Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.');
insert into BASE (base_id, location, description)
values (208639306, 'Rimini', 'Combo AMD XP 2000+ Gigabyte GA-7VKML MB');
insert into BASE (base_id, location, description)
values (540888184, 'Batavia', 'Promise Fast Track ATA 100 RAID Controller Kit.');
insert into BASE (base_id, location, description)
values (532384197, 'Freiburg', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (364149523, 'Towson', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.');
insert into BASE (base_id, location, description)
values (364003934, 'Reston', 'Boka 1050 Sub Woofer and Speakers');
insert into BASE (base_id, location, description)
values (359338879, 'Yomgok-dong', 'Intel Celeron 1.8Ghz/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (624938714, 'Lancaster', '10/100 16 Port Switch');
insert into BASE (base_id, location, description)
values (863576824, 'Nordhausen', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (581788088, 'Helsingborg', 'Fast Ethernet 10/100 8 port switching hub');
insert into BASE (base_id, location, description)
values (794034863, 'Gettysburg', 'Combo Intel P4 1.6Ghz (512k cache) 845WN M/B & Fan (478pin)');
insert into BASE (base_id, location, description)
values (272590357, 'El Dorado Hills', 'Black Sony CD-RW 52x24x52x .');
insert into BASE (base_id, location, description)
values (648502287, 'Hercules', 'Intel Celeron 1.7ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.');
insert into BASE (base_id, location, description)
values (322884048, 'West Sussex', 'Gigabyte GA-6VEML skt 370 M/B (With onboard sound and Video and Realtek Lan)');
insert into BASE (base_id, location, description)
values (299789591, 'Hackensack', 'Black Sony CD-RW 52x24x52x .');
insert into BASE (base_id, location, description)
values (559283037, 'Portsmouth', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.');
insert into BASE (base_id, location, description)
values (303319275, 'Norderstedt', 'Cooler Master Socket A CopperHeatSync Fan HSC-V62');
insert into BASE (base_id, location, description)
values (411115157, 'Springville', 'Intel Pentium 4 2.0 GHz 512k 400MHz FSB( Socket 478 )Retail Box');
insert into BASE (base_id, location, description)
values (292702201, 'Pasadena', 'ATA 100 RAID controller card');
insert into BASE (base_id, location, description)
values (178078486, 'Claymont', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into BASE (base_id, location, description)
values (341345744, 'Bonn', 'Cooler Master DP5-6J31C AMD Approved HeatSync.');
insert into BASE (base_id, location, description)
values (280023446, 'Mount Laurel', 'Combo AMD XP 1800+ Gigabyte GA-7VKML M/B + Fan');
insert into BASE (base_id, location, description)
values (600746268, 'Drogenbos', '312B ATX Case with 400Watt P4/P3/AMD Ready PS.');
insert into BASE (base_id, location, description)
values (974144052, 'Oxford', '10ft Cat 5 network cable w/RJ45 connectors');
insert into BASE (base_id, location, description)
values (290932547, 'Wakayama', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (727220792, 'Kerava', 'AMD XP 2200+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (217521794, 'Northbrook', 'Pentiume 4 3.0Ghz 800FSB/512M/80G Black Complete System.');
insert into BASE (base_id, location, description)
values (783763822, 'Altstätten', 'ADS External USB 2.0 Drive Kit');
insert into BASE (base_id, location, description)
values (265088836, 'Johor Bahru', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (534671701, 'Encinitas', 'Logitech Quick Cam W/Free Headset');
insert into BASE (base_id, location, description)
values (771518979, 'Charlotte', 'Combo Intel P4 2.0ghz Gigabyte GA-8LD533 m/b + fan.');
insert into BASE (base_id, location, description)
values (621786165, 'Kaysville', '512Mb DDR 333 PC2700 (samsung)');
insert into BASE (base_id, location, description)
values (307320198, 'St Kilda', 'AOC 19" Monitor .26 9GLR');
insert into BASE (base_id, location, description)
values (697799922, 'Baarn', 'AMD XP 2000+ Box/with AMD Fan');
insert into BASE (base_id, location, description)
values (904262610, 'Caguas', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.');
insert into BASE (base_id, location, description)
values (185037460, 'Leeds', 'Serial ATA Power Connector for the Hard Drive.');
insert into BASE (base_id, location, description)
values (766896778, 'Aracruz', 'AMD XP 1700+ & Gigabyte GA-7DXE MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (384736297, 'Framingham', 'Black Mitsumi CD-RW 52x24x52x.');
insert into BASE (base_id, location, description)
values (361127872, 'Stony Point', '128Mb PC2100 266Mhz DDR Ram ( Micron )');
insert into BASE (base_id, location, description)
values (805639332, 'Tokushima', 'hp scanjet 5550c scanner series (C9919A) (Open Box).');
insert into BASE (base_id, location, description)
values (782195448, 'Snoqualmie', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into BASE (base_id, location, description)
values (418439061, 'Bruxelles', 'Combo AMD XP 2000 Biostar M7VIK Skt A MotherBoard; KT400.');
insert into BASE (base_id, location, description)
values (284104059, 'Cuenca', '512Mb SDRam PC133 Kingston');
insert into BASE (base_id, location, description)
values (444660905, 'Casselberry', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (887134654, 'Stocksbridge', 'SVA-USA VR-15A 15" TFT LCD Display.');
insert into BASE (base_id, location, description)
values (751246552, 'Cheshire', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (133572987, 'Chur', 'Logitech Quick Cam W/Free Headset');
insert into BASE (base_id, location, description)
values (233756485, 'Gauteng', '2 Year Warranty On BareBones.');
insert into BASE (base_id, location, description)
values (543313388, 'Milan', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)');
insert into BASE (base_id, location, description)
values (832653813, 'Alessandria', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.');
insert into BASE (base_id, location, description)
values (550683516, 'Charlotte', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan');
insert into BASE (base_id, location, description)
values (120358256, 'Fambach', 'Achieve Gold Dual Fan 550Watt PowerSupply.');
insert into BASE (base_id, location, description)
values (181008680, 'Uetikon am See', 'ATI RADEON 9200™ SE 128M DDR DVI+TV-Out 8X AGP (R92LE-C3S).');
insert into BASE (base_id, location, description)
values (608878821, 'Schlieren', 'AMDXP2000/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (640556287, 'Rueil-Malmaison', 'Windows 2000 w/Service Pack 3(NEW) OEM Full Version LICENCED');
insert into BASE (base_id, location, description)
values (573928132, 'Atlanta', 'Promise Fast Track ATA 100 RAID Controller Kit.');
insert into BASE (base_id, location, description)
values (623191949, 'Campinas', '128Mb RDRam 800Mhz Kingston');
insert into BASE (base_id, location, description)
values (540476869, 'Erpe-Mere', 'Linksys USB Wireless (WUSB11)');
insert into BASE (base_id, location, description)
values (367974479, 'Shizuoka', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.');
insert into BASE (base_id, location, description)
values (868403959, 'Salvador', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.');
insert into BASE (base_id, location, description)
values (814657903, 'Runcorn', 'Biostar M6TSU M/B(30 day D.O.A Warranty)');
insert into BASE (base_id, location, description)
values (217230965, 'Englewood', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV');
insert into BASE (base_id, location, description)
values (508914852, 'Essex', 'AMD XP 2700+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (736230883, 'Seongnam-si', 'Cooler Master P4 CopperHeatPipe Fan IHC-H71');
insert into BASE (base_id, location, description)
values (582535671, 'El Paso', 'Intel D 850MV P4 M/B RDRam support');
insert into BASE (base_id, location, description)
values (377238393, 'Grand Rapids', 'Combo AMD XP 1900+ Gigabyte GA-7VKML M/B + Fan');
insert into BASE (base_id, location, description)
values (747910964, 'København', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into BASE (base_id, location, description)
values (807078910, 'Enfield', 'USB to Parallel Printer Cable.');
insert into BASE (base_id, location, description)
values (980201317, 'Kyunnam', 'AMD MP 1900+ OEM cpu');
insert into BASE (base_id, location, description)
values (239409163, 'Thalwil', '400 Watt UL ATX Power Supply Support AMD; P3;P4;and with Dual Fan.');
insert into BASE (base_id, location, description)
values (852481514, 'Changwon-si', '10/100 REALTEK NETWORK CARD 8139 chipset RETAIL BOX');
insert into BASE (base_id, location, description)
values (363850587, 'Chapel hill', 'AMD XP 2600+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (953988797, 'Framingham', 'AMD MP 1900+ OEM cpu');
insert into BASE (base_id, location, description)
values (264793465, 'Neustadt', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )');
insert into BASE (base_id, location, description)
values (762877665, 'Wuerzburg', 'Sound Blaster PC128 Sound card');
insert into BASE (base_id, location, description)
values (692313519, 'South Weber', 'Combo Intel P4 1.8ghz Gigabyte GA-8LS533 m/b + fan.');
insert into BASE (base_id, location, description)
values (114408075, 'Chambery', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into BASE (base_id, location, description)
values (567536065, 'Brasília', 'Black Mitsumi CD-RW 52x24x52x.');
insert into BASE (base_id, location, description)
values (549985818, 'Bellerose', 'Biostar M7VKD-Pro AMD Skt A M/B VIA KT133 / 686B 266/200 Mhz FSB SD Ram ATA100(30 day D.O.A Warranty)');
insert into BASE (base_id, location, description)
values (545909293, 'Vilafranca Penedes', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.');
insert into BASE (base_id, location, description)
values (462616341, 'Fairfax', '14"/15" Filter Screen');
insert into BASE (base_id, location, description)
values (462892532, 'Olympia', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into BASE (base_id, location, description)
values (682713201, 'Pétion-ville', '312B ATX Case 250W P4/AMD Ready Power Supply.');
insert into BASE (base_id, location, description)
values (395536995, 'Mogi Guacu', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.');
insert into BASE (base_id, location, description)
values (639974011, 'Sacramento', 'AMD XP 2200+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (893420511, 'Ashdod', 'Fast Ethernet 10/100 8 port switching hub');
insert into BASE (base_id, location, description)
values (704346165, 'Massagno', 'Gigabyte GA-8IRXP ATA133 + onboard Raid + USB2.0 + Lan');
insert into BASE (base_id, location, description)
values (303288269, 'Tempe', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.');
insert into BASE (base_id, location, description)
values (340278678, 'Ludbreg', 'AMD XP 1700+ & Gigabyte GA-7DXE MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (270636415, 'Rimini', 'Boka 306 Sub Woofer Flat Speaker system');
insert into BASE (base_id, location, description)
values (306191302, 'Niles', 'Combo AMD Duron 1.2Ghz cpu Gigabyte GA-7VKMLS m/b fan.');
insert into BASE (base_id, location, description)
values (833378932, 'Glasgow', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into BASE (base_id, location, description)
values (478495693, 'Redondo beach', 'ATA 100 Controller Card PCI');
insert into BASE (base_id, location, description)
values (573083436, 'Claymont', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)');
insert into BASE (base_id, location, description)
values (688394818, 'Fleet', 'AMD XP 1600+ CPU (OEM)');
insert into BASE (base_id, location, description)
values (480543049, 'Rimini', 'Mitsumi 1.44 Floppy Drive (Black)');
insert into BASE (base_id, location, description)
values (637436799, 'Neuchâtel', 'Visioneer 5800 48bit USB Scanner XP compatable');
insert into BASE (base_id, location, description)
values (432946267, 'Budapest', 'Sound Blaster PC128 Sound card');
insert into BASE (base_id, location, description)
values (134982879, 'Harahan', 'AMD XP 2000+ (OEM)');
insert into BASE (base_id, location, description)
values (677534192, 'Birmingham', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan');
insert into BASE (base_id, location, description)
values (281637162, 'Leverkusen', 'Combo Intel P4 1.7ghz CPU + Fan(Box);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into BASE (base_id, location, description)
values (592347002, 'Lodi', 'YS AMD XP 2000+ Performance System');
insert into BASE (base_id, location, description)
values (737223007, 'St Kilda', 'Intel Pentium4 2.0ghz & Gigabyte 8IRXP MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (479095805, 'Gifu', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.');
insert into BASE (base_id, location, description)
values (567722453, 'Bradenton', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (928204730, 'Cannock', 'ATI Radeon 7000 32MB DDR TV-Out4');
insert into BASE (base_id, location, description)
values (415969269, 'Madrid', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.');
insert into BASE (base_id, location, description)
values (589774943, 'Marburg', 'AOC 17" Monitor 7Elr .27mm Dot Pitch');
insert into BASE (base_id, location, description)
values (538720495, 'Karachi', 'Intel Pentium4 2.0ghz & Gigabyte 8IRXP MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (844732289, 'Massagno', 'LG 52x24x52x CD-RW (OEM).');
insert into BASE (base_id, location, description)
values (338606762, 'Freising', 'TV Tuner card PCI (KWorld M878A)');
insert into BASE (base_id, location, description)
values (468291348, 'Irati', 'Combo AMD XP 2600+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into BASE (base_id, location, description)
values (958205576, 'St Jean de Soudain', 'Boka 2000 Sub Woofer Speaker System');
insert into BASE (base_id, location, description)
values (405145468, 'Thame', 'Cable/DSL Broadband Router (w/ 4-port Switch) (EE400-R).');
insert into BASE (base_id, location, description)
values (830270538, 'Albany', 'Intel Pentium4 1.9ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.');
insert into BASE (base_id, location, description)
values (322303650, 'Almaty', 'Sony 48x24x40 and 16x CD-RW/DVD OEM.');
insert into BASE (base_id, location, description)
values (661974959, 'Lowell', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.');
insert into BASE (base_id, location, description)
values (960927506, 'Milford', 'Intel Pentium4 2.4ghz & Gigabyte 8IRXP MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (780264562, 'Waldorf', 'AMD XP 1800+ Biostar M7VIG Pro m/b + Cooler Master fan');
insert into BASE (base_id, location, description)
values (202463670, 'Hochwald', 'Intel Celeron 1.8Ghz/128M/30G Black Complete System.');
insert into BASE (base_id, location, description)
values (311806962, 'Lummen', 'Gigabyte GA-7VAXP AMD Motherboard. VIA KT400 RAID ATA133 with DDR support');
insert into BASE (base_id, location, description)
values (890337452, 'Zaandam', 'Logitech Smart Click 310 Camera');
insert into BASE (base_id, location, description)
values (177885927, 'Fremont', 'Serial ATA Power Connector for the Hard Drive.');
insert into BASE (base_id, location, description)
values (626375289, 'Barueri', 'Combo Intel Celeron 1.3ghz Biostar M6VLQ m/b + fan.');
insert into BASE (base_id, location, description)
values (690025000, 'Stone Mountain', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply');
insert into BASE (base_id, location, description)
values (941343439, 'Birmensdorf', 'W.D 120G 7200RPM (1200JB) 8MB Cache and 3 year MDW');
insert into BASE (base_id, location, description)
values (149834226, 'Kyoto', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into BASE (base_id, location, description)
values (418297667, 'Immenstaad', 'Intel P4 3.06 HT CPU & Intel D845PEBT2 M/B onboard Raid and S-ATA');
insert into BASE (base_id, location, description)
values (860961076, 'Lancaster', 'Combo Intel P4 2.0Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into BASE (base_id, location, description)
values (100832241, 'Fremont', '10ft Cat 5 network cable w/RJ45 connectors');
insert into BASE (base_id, location, description)
values (337825666, 'Matsuyama', 'Cyber Power 725VA Battery Back Up');
insert into BASE (base_id, location, description)
values (103261303, 'Powell River', 'Dynatron CPU Cooler DF1206BH AMD Athlon\Duron Fan. (AMD Recommend)');
insert into BASE (base_id, location, description)
values (201342435, 'Bekescsaba', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (718599414, 'Boucherville', 'ATI Radeon 7500 PCI 64M w/ TV out and DVI.');
insert into BASE (base_id, location, description)
values (717046176, 'Morioka', '256Mb PC133 SDRam Micron 168 PIN SDRAM - Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into BASE (base_id, location, description)
values (742524333, 'Firenze', 'AOC 17" Monitor 7FSLK .25mm Dot Pitch TureFlat');
insert into BASE (base_id, location, description)
values (127120899, 'Duesseldorf', '2 Year Warranty On MotherBoards.');
insert into BASE (base_id, location, description)
values (204402689, 'St-laurent', 'GeForceFX 5200 128MB DDR (Light Version) DVI + TV-out and software DVD.');
insert into BASE (base_id, location, description)
values (718223920, 'Newcastle upon Tyne', 'Combo AMD XP 2400 Biostar M7VIK Skt A MotherBoard; KT400.');
insert into BASE (base_id, location, description)
values (388667905, 'Fort Lewis', 'Black Sony CD-RW 52x24x52x .');
insert into BASE (base_id, location, description)
values (797986115, 'Pétion-ville', 'Combo Intel P4 1.6Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.');
insert into BASE (base_id, location, description)
values (476207224, 'New York', 'ASUS A7N8X Deluxe NVIDIA Force2 .');
insert into BASE (base_id, location, description)
values (881805753, 'Burr Ridge', 'Intel D 850MV P4 M/B RDRam support');
insert into BASE (base_id, location, description)
values (720891949, 'Darmstadt', 'CyberDrive 40X16X48X CD-R/RW Drive.');
insert into BASE (base_id, location, description)
values (333722293, 'Fort Lewis', 'USB Cable 6ft. Long.');
insert into BASE (base_id, location, description)
values (398977486, 'Fairborn', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard.');
insert into BASE (base_id, location, description)
values (399539610, 'Bad Camberg', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.');
insert into BASE (base_id, location, description)
values (970722290, 'Purley', 'Intel Celeron 1.3GHz 256k S370 FCPGA2 (Retail Box)');
insert into BASE (base_id, location, description)
values (170208456, 'New orleans', 'Intel P4 1;6Ghz Box CPU (478pin)(256KB L2 Cache)');
insert into BASE (base_id, location, description)
values (123017180, 'Murray', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )');
insert into BASE (base_id, location, description)
values (626899383, 'Cedar Park', '256Mb DDR PC2100 (Micron)');
insert into BASE (base_id, location, description)
values (553177977, 'Redhill', 'AMD XP2000+ Biostar M7VKQ Pro');
insert into BASE (base_id, location, description)
values (612544846, 'Bellevue', 'Cooler Master DP5-6J31C AMD Approved HeatSync.');
insert into BASE (base_id, location, description)
values (154264878, 'Warrington', 'USB to Parallel Printer Cable.');
insert into BASE (base_id, location, description)
values (873552785, 'Cherepovets', 'Maxtor 40G 7200RPM ATA133');
insert into BASE (base_id, location, description)
values (328155120, 'Fukushima', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (328011200, 'München', 'Intel P4 3.06 HT CPU & Intel D845PEBT2 M/B onboard Raid and S-ATA');
insert into BASE (base_id, location, description)
values (859408959, 'League city', 'ADS USB2000 USB Turbo 2.0 pci Controller card');
insert into BASE (base_id, location, description)
values (242260899, 'Lübeck', 'C Rimm');
insert into BASE (base_id, location, description)
values (105394027, 'Tilburg', 'Black Sony CD-RW 52x24x52x .');
insert into BASE (base_id, location, description)
values (866217071, 'Tadley', 'USB Cable 6ft. Long.');
insert into BASE (base_id, location, description)
values (124161802, 'Harrisburg', '6066-C10 ATX Black Mid case 350W w/ 2 Front USB; 1 Mic; 1 Headset.');
insert into BASE (base_id, location, description)
values (874925934, 'Happy Valley', 'ASUS A7N8X Deluxe NVIDIA Force2 .');
insert into BASE (base_id, location, description)
values (542226644, 'Cherepovets', 'Headphone & Mic');
insert into BASE (base_id, location, description)
values (183710376, 'Halfway house', '128Mb SDRam PC133 Kingston');
insert into BASE (base_id, location, description)
values (539736401, 'Maebashi', 'Linksys Instant Wireless Network Adapter - Version 3.0 for Notbooks. (Model No. WPC11 ver.3)');
insert into BASE (base_id, location, description)
values (300194611, 'Granada Hills', 'Testing of CPU/Fan and Motherboard.');
insert into BASE (base_id, location, description)
values (796944275, 'Amherst', 'Combo Intel Celeron 1.7Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .');
insert into BASE (base_id, location, description)
values (411660075, 'Lake worth', 'Intel Pentium4 1.6Ghz & Biostar M7TDB MB w/ 313M Case.');
insert into BASE (base_id, location, description)
values (927381290, 'Madison', 'CyberPower PhoneSaver');
insert into BASE (base_id, location, description)
values (952157670, 'Golden', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into BASE (base_id, location, description)
values (219490683, 'Columbia', 'ADS USB Turbo 2.0 WebCam.');
insert into BASE (base_id, location, description)
values (806104242, 'Ottawa', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into BASE (base_id, location, description)
values (584831315, 'Seongnam-si', 'Intel Pentium4 2.0ghz & Gigabyte 8IE533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (218780512, 'Ringwood', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan');
insert into BASE (base_id, location, description)
values (117985529, 'Freiburg', 'Combo AMD XP 1900+ cpu Gigabyte GA-7DXE Motherboard + Fan');
insert into BASE (base_id, location, description)
values (184755344, 'Amsterdam', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into BASE (base_id, location, description)
values (640272796, 'Bautzen', 'Boka 306 Sub Woofer Flat Speaker system');
insert into BASE (base_id, location, description)
values (292860183, 'Whitehouse Station', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into BASE (base_id, location, description)
values (591646586, 'Mito', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into BASE (base_id, location, description)
values (150693205, 'Neustadt', '312B ATX Case 250W P4/AMD Ready Power Supply.');
insert into BASE (base_id, location, description)
values (597598130, 'Stellenbosch', '14"/15" Filter Screen');
insert into BASE (base_id, location, description)
values (176172146, 'Greenville', 'AMD XP 2200+ Retail box.');
insert into BASE (base_id, location, description)
values (505932891, 'Lahr', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )');
insert into BASE (base_id, location, description)
values (202104113, 'Fuerth', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server');
insert into BASE (base_id, location, description)
values (239501192, 'Tyne & Wear', 'ASUS P4SDX SiS655 Chipset Dual Channel DDR333.');
insert into BASE (base_id, location, description)
values (220247947, 'Carson City', 'Biostar M7TDR P4 M/B Skt 423 (w/30 day limit warranty)');
insert into BASE (base_id, location, description)
values (290502901, 'Thames Ditton', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan');
insert into BASE (base_id, location, description)
values (736028738, 'Waldbronn', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.');
insert into BASE (base_id, location, description)
values (300651147, 'Warrington', 'Mitsumi PS/2 Net scroll 5 button mouse');
insert into BASE (base_id, location, description)
values (822098469, 'Anières', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (951710096, 'Milano', 'KIT Keyboard Mouse and Speakers to match color case');
insert into BASE (base_id, location, description)
values (513491874, 'Barnegat', 'SVA-USA VR-15A 15" TFT LCD Display.');
insert into BASE (base_id, location, description)
values (336715636, 'Wageningen', 'Boka 306 Sub Woofer Flat Speaker system');
insert into BASE (base_id, location, description)
values (630914533, 'Wien', 'SIS Xabre200 64MB DDR AGP 8X DVI+TV+CRT by Power Color');
insert into BASE (base_id, location, description)
values (669524357, 'Carlsbad', 'Mircosoft Ergonomic Keyboard and Mouse Set.');
insert into BASE (base_id, location, description)
values (501862641, 'South Weber', 'YS AMD XP 2000+ Performance System');
insert into BASE (base_id, location, description)
values (250719097, 'Antwerpen', '312J ATX color case(translucent blue) with 400Watt P4/P3/AMD Ready PS.');
insert into BASE (base_id, location, description)
values (287669401, 'Irkutsk', 'OptoRite 48X16X48X CDRW Retail Box');
insert into BASE (base_id, location, description)
values (359440647, 'Tilst', 'ATI Radeon 7000 VIVO 64mb DDR AGP .');
insert into BASE (base_id, location, description)
values (841770665, 'Oldenburg', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into BASE (base_id, location, description)
values (178283057, 'Agoncillo', 'Linksys Instant Wireless Network Adapter - Version 3.0 for Notbooks. (Model No. WPC11 ver.3)');
insert into BASE (base_id, location, description)
values (694410389, 'Marlboro', 'Black LG Electronics CD-RW 48x12x48x / DVD 16x Combo Drive.');
insert into BASE (base_id, location, description)
values (963478068, 'South Hadley', 'Pentiume 4 3.0Ghz 800FSB/512M/80G Black Complete System.');
insert into BASE (base_id, location, description)
values (301057456, 'Bend', 'Combo AMD XP 1900+ cpu Gigabyte GA-7DXE Motherboard + Fan');
insert into BASE (base_id, location, description)
values (781457065, 'Paderborn', 'Combo AMD Duron 1.1Ghz CPU and Cooler Fan w/Biostar M7VKQ-Pro M/b (Support DDR) and (Free Modem.)');
insert into BASE (base_id, location, description)
values (425239658, 'Middleburg Heights', 'GA-8LD533 Intel®845GL Chipset VC/SC/Lan.');
insert into BASE (base_id, location, description)
values (979595956, 'Paraju', 'AMD XP 2100+ Box & Gigabyte GA-7DXE MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (466416494, 'Americana', 'Intel Pentium4 2.0ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (276507256, 'London', 'Combo AMD XP 2600+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into BASE (base_id, location, description)
values (999279568, 'Portland', 'Intel P4 2.4ghz');
insert into BASE (base_id, location, description)
values (870144988, 'King of Prussia', 'DVI to 15pin CRT adapter');
insert into BASE (base_id, location, description)
values (399140995, 'Maserada sul Piave', 'Intel Pentium4 1.8ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.');
insert into BASE (base_id, location, description)
values (534041390, 'Kozani', 'Boka 1050 Sub Woofer and Speakers');
insert into BASE (base_id, location, description)
values (448327063, 'Warsaw', 'Intel Celeron 1.7Ghz 478 pin Box cpu + fan');
insert into BASE (base_id, location, description)
values (686407467, 'Groton', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan');
insert into BASE (base_id, location, description)
values (669928170, 'Mumbai', 'AMD XP 3000+ Barton Box. (with 333Mhz Front Side Bus w/ 512k Cache).');
insert into BASE (base_id, location, description)
values (669857753, 'Saga', 'TV Tuner card PCI (KWorld M878A)');
insert into BASE (base_id, location, description)
values (295691441, 'Aracruz', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )');
insert into BASE (base_id, location, description)
values (281916454, 'Chiba', 'AMD XP 1900+ & Gigabyte GA-7VKML MB w/ 313M case');
insert into BASE (base_id, location, description)
values (855309104, 'Chambersburg', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into BASE (base_id, location, description)
values (842874049, 'Shelton', 'Fast Ethernet 10/100 8 port switching hub');
insert into BASE (base_id, location, description)
values (184895509, 'Koeln', 'AMD XP 2600+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (250670155, 'Ellicott City', 'Biostar M7VKB Ver2.0 ATA100 socket A (w/30 day limit warranty)');
insert into BASE (base_id, location, description)
values (185381072, 'Portsmouth', 'AMD XP 1900+ OEM');
insert into BASE (base_id, location, description)
values (936184899, 'Melbourne', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.');
insert into BASE (base_id, location, description)
values (694588776, 'Padova', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)');
insert into BASE (base_id, location, description)
values (345246294, 'Augst', 'AMD 1.3Ghz BareBone System Free Mouse');
insert into BASE (base_id, location, description)
values (422155493, 'Duesseldorf', 'Combo AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into BASE (base_id, location, description)
values (808703582, 'Pittsburgh', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into BASE (base_id, location, description)
values (637136262, 'Samrand', 'Antec Plus 660 ATX Mid tower 330w Power Supply');
insert into BASE (base_id, location, description)
values (420409127, 'Calcutta', 'AMD XP 2400+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (844213735, 'Peine', 'Pentiume 4 3.0Ghz 800FSB/512M/80G Black Complete System.');
insert into BASE (base_id, location, description)
values (545162663, 'Carlingford', 'AMD XP 1800+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (735081362, 'New boston', 'AMD XP 1800+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into BASE (base_id, location, description)
values (450555098, 'Bay Shore', '312D ATX translucent blue color case with 300W P4/AMD with(front USB ready) .');
insert into BASE (base_id, location, description)
values (592975208, 'Durham', 'Intel Pentium 4 2.0 GHz 512k 400MHz FSB( Socket 478 )Retail Box');
insert into BASE (base_id, location, description)
values (879336562, 'Horb', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VA M/B.');
insert into BASE (base_id, location, description)
values (999859046, 'Kaohsiung', 'Logitech Optical Mouse');
insert into BASE (base_id, location, description)
values (873431419, 'Mason', '14inch LCD MG-015A Xgen2 Monitor.');
insert into BASE (base_id, location, description)
values (332707650, 'Aurora', 'Intel P4 2.4ghz');
insert into BASE (base_id, location, description)
values (711395804, 'Ferraz  vasconcelos', 'Intel Celeron 1.8ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.');
commit;
prompt 400 records loaded
prompt Loading CINEMA_ROOM...
insert into CINEMA_ROOM (room_number, names, base_id)
values (1, 'Becki', 995321596);
insert into CINEMA_ROOM (room_number, names, base_id)
values (2, 'Rodd', 364149523);
insert into CINEMA_ROOM (room_number, names, base_id)
values (3, 'Mahmoud', 202624974);
insert into CINEMA_ROOM (room_number, names, base_id)
values (4, 'Riannon', 980201317);
insert into CINEMA_ROOM (room_number, names, base_id)
values (5, 'Ilyse', 271195019);
insert into CINEMA_ROOM (room_number, names, base_id)
values (6, 'Stafford', 811480017);
insert into CINEMA_ROOM (room_number, names, base_id)
values (7, 'Marcie', 621786165);
insert into CINEMA_ROOM (room_number, names, base_id)
values (8, 'Petronia', 865893397);
insert into CINEMA_ROOM (room_number, names, base_id)
values (9, 'Kimberlee', 783763822);
insert into CINEMA_ROOM (room_number, names, base_id)
values (10, 'Pembroke', 811480017);
insert into CINEMA_ROOM (room_number, names, base_id)
values (11, 'Dorice', 697799922);
insert into CINEMA_ROOM (room_number, names, base_id)
values (12, 'Susannah', 738509747);
insert into CINEMA_ROOM (room_number, names, base_id)
values (13, 'Eimile', 479095805);
insert into CINEMA_ROOM (room_number, names, base_id)
values (14, 'Mandel', 508914852);
insert into CINEMA_ROOM (room_number, names, base_id)
values (15, 'Virge', 794034863);
insert into CINEMA_ROOM (room_number, names, base_id)
values (16, 'Reeta', 178283057);
insert into CINEMA_ROOM (room_number, names, base_id)
values (17, 'Elsa', 513491874);
insert into CINEMA_ROOM (room_number, names, base_id)
values (18, 'Konstantine', 762877665);
insert into CINEMA_ROOM (room_number, names, base_id)
values (19, 'Tandi', 177904578);
insert into CINEMA_ROOM (room_number, names, base_id)
values (20, 'Rory', 345246294);
insert into CINEMA_ROOM (room_number, names, base_id)
values (21, 'Yvor', 120485972);
insert into CINEMA_ROOM (room_number, names, base_id)
values (22, 'Darlleen', 220247947);
insert into CINEMA_ROOM (room_number, names, base_id)
values (23, 'Molli', 879336562);
insert into CINEMA_ROOM (room_number, names, base_id)
values (24, 'Haslett', 571891498);
insert into CINEMA_ROOM (room_number, names, base_id)
values (25, 'Agnola', 120720069);
insert into CINEMA_ROOM (room_number, names, base_id)
values (26, 'Francesca', 589774943);
insert into CINEMA_ROOM (room_number, names, base_id)
values (27, 'Annamarie', 820264412);
insert into CINEMA_ROOM (room_number, names, base_id)
values (28, 'Siegfried', 360881982);
insert into CINEMA_ROOM (room_number, names, base_id)
values (29, 'Blake', 528742004);
insert into CINEMA_ROOM (room_number, names, base_id)
values (30, 'Conrad', 184895509);
insert into CINEMA_ROOM (room_number, names, base_id)
values (31, 'Tessy', 120720069);
insert into CINEMA_ROOM (room_number, names, base_id)
values (32, 'Gisella', 694410389);
insert into CINEMA_ROOM (room_number, names, base_id)
values (33, 'Chip', 513491874);
insert into CINEMA_ROOM (room_number, names, base_id)
values (34, 'Karil', 904262610);
insert into CINEMA_ROOM (room_number, names, base_id)
values (35, 'Baxter', 936860626);
insert into CINEMA_ROOM (room_number, names, base_id)
values (36, 'Locke', 782195448);
insert into CINEMA_ROOM (room_number, names, base_id)
values (37, 'Riva', 421314721);
insert into CINEMA_ROOM (room_number, names, base_id)
values (38, 'Arden', 737223007);
insert into CINEMA_ROOM (room_number, names, base_id)
values (39, 'Reagen', 968461771);
insert into CINEMA_ROOM (room_number, names, base_id)
values (40, 'Goober', 785395896);
insert into CINEMA_ROOM (room_number, names, base_id)
values (41, 'Di', 621786165);
insert into CINEMA_ROOM (room_number, names, base_id)
values (42, 'Kellyann', 554917367);
insert into CINEMA_ROOM (room_number, names, base_id)
values (43, 'Lief', 982025418);
insert into CINEMA_ROOM (room_number, names, base_id)
values (44, 'Shannen', 422155493);
insert into CINEMA_ROOM (room_number, names, base_id)
values (45, 'Sarette', 682713201);
insert into CINEMA_ROOM (room_number, names, base_id)
values (46, 'Cooper', 127010539);
insert into CINEMA_ROOM (room_number, names, base_id)
values (47, 'Letti', 592347002);
insert into CINEMA_ROOM (room_number, names, base_id)
values (48, 'Alf', 916385807);
insert into CINEMA_ROOM (room_number, names, base_id)
values (49, 'Karleen', 219490683);
insert into CINEMA_ROOM (room_number, names, base_id)
values (50, 'Darell', 361127872);
insert into CINEMA_ROOM (room_number, names, base_id)
values (51, 'Maris', 221935402);
insert into CINEMA_ROOM (room_number, names, base_id)
values (52, 'Dory', 796944275);
insert into CINEMA_ROOM (room_number, names, base_id)
values (53, 'Cary', 781457065);
insert into CINEMA_ROOM (room_number, names, base_id)
values (54, 'Aldous', 333012478);
insert into CINEMA_ROOM (room_number, names, base_id)
values (55, 'Boy', 265088836);
insert into CINEMA_ROOM (room_number, names, base_id)
values (56, 'Antone', 226210025);
insert into CINEMA_ROOM (room_number, names, base_id)
values (57, 'Honey', 919698392);
insert into CINEMA_ROOM (room_number, names, base_id)
values (58, 'Marin', 513974082);
insert into CINEMA_ROOM (room_number, names, base_id)
values (59, 'Ogden', 742524333);
insert into CINEMA_ROOM (room_number, names, base_id)
values (60, 'Llywellyn', 542226644);
insert into CINEMA_ROOM (room_number, names, base_id)
values (61, 'Burg', 364003934);
insert into CINEMA_ROOM (room_number, names, base_id)
values (62, 'Mercie', 753821866);
insert into CINEMA_ROOM (room_number, names, base_id)
values (63, 'Thorndike', 174961000);
insert into CINEMA_ROOM (room_number, names, base_id)
values (64, 'Husain', 924785672);
insert into CINEMA_ROOM (room_number, names, base_id)
values (65, 'Annalee', 979595956);
insert into CINEMA_ROOM (room_number, names, base_id)
values (66, 'Pinchas', 575258987);
insert into CINEMA_ROOM (room_number, names, base_id)
values (67, 'Grier', 328011200);
insert into CINEMA_ROOM (room_number, names, base_id)
values (68, 'Benita', 534041390);
insert into CINEMA_ROOM (room_number, names, base_id)
values (69, 'Bernelle', 781457065);
insert into CINEMA_ROOM (room_number, names, base_id)
values (70, 'Garrek', 345246294);
insert into CINEMA_ROOM (room_number, names, base_id)
values (71, 'Tedda', 513491874);
insert into CINEMA_ROOM (room_number, names, base_id)
values (72, 'Paige', 295691441);
insert into CINEMA_ROOM (room_number, names, base_id)
values (73, 'Hollis', 270636415);
insert into CINEMA_ROOM (room_number, names, base_id)
values (74, 'Aharon', 303319275);
insert into CINEMA_ROOM (room_number, names, base_id)
values (75, 'Birdie', 117985529);
insert into CINEMA_ROOM (room_number, names, base_id)
values (76, 'Koralle', 893420511);
insert into CINEMA_ROOM (room_number, names, base_id)
values (77, 'Zorine', 466416494);
insert into CINEMA_ROOM (room_number, names, base_id)
values (78, 'Reed', 384736297);
insert into CINEMA_ROOM (room_number, names, base_id)
values (79, 'Benedetta', 314780983);
insert into CINEMA_ROOM (room_number, names, base_id)
values (80, 'Alexis', 467653037);
insert into CINEMA_ROOM (room_number, names, base_id)
values (81, 'Arlina', 575258987);
insert into CINEMA_ROOM (room_number, names, base_id)
values (82, 'Erek', 442652819);
insert into CINEMA_ROOM (room_number, names, base_id)
values (83, 'Stephani', 467653037);
insert into CINEMA_ROOM (room_number, names, base_id)
values (84, 'Marijn', 303319275);
insert into CINEMA_ROOM (room_number, names, base_id)
values (85, 'Kimmy', 333012478);
insert into CINEMA_ROOM (room_number, names, base_id)
values (86, 'Elwin', 696972862);
insert into CINEMA_ROOM (room_number, names, base_id)
values (87, 'Alexa', 882903484);
insert into CINEMA_ROOM (room_number, names, base_id)
values (88, 'Monroe', 486806623);
insert into CINEMA_ROOM (room_number, names, base_id)
values (89, 'Babbette', 299789591);
insert into CINEMA_ROOM (room_number, names, base_id)
values (90, 'Melissa', 810942013);
insert into CINEMA_ROOM (room_number, names, base_id)
values (91, 'Wilbur', 764079527);
insert into CINEMA_ROOM (room_number, names, base_id)
values (92, 'Delphine', 324170665);
insert into CINEMA_ROOM (room_number, names, base_id)
values (93, 'Roxie', 364003934);
insert into CINEMA_ROOM (room_number, names, base_id)
values (94, 'Talbot', 968461771);
insert into CINEMA_ROOM (room_number, names, base_id)
values (95, 'Glynnis', 220247947);
insert into CINEMA_ROOM (room_number, names, base_id)
values (96, 'Zora', 103261303);
insert into CINEMA_ROOM (room_number, names, base_id)
values (97, 'Malachi', 688394818);
insert into CINEMA_ROOM (room_number, names, base_id)
values (98, 'Nat', 584831315);
insert into CINEMA_ROOM (room_number, names, base_id)
values (99, 'Mame', 195263919);
insert into CINEMA_ROOM (room_number, names, base_id)
values (100, 'Carolee', 241295050);
insert into CINEMA_ROOM (room_number, names, base_id)
values (101, 'Madelina', 554917367);
insert into CINEMA_ROOM (room_number, names, base_id)
values (102, 'Lorelei', 281637162);
insert into CINEMA_ROOM (room_number, names, base_id)
values (103, 'Carter', 336715636);
insert into CINEMA_ROOM (room_number, names, base_id)
values (104, 'Charis', 421314721);
insert into CINEMA_ROOM (room_number, names, base_id)
values (105, 'Wolfgang', 637136262);
insert into CINEMA_ROOM (room_number, names, base_id)
values (106, 'Katleen', 257639921);
insert into CINEMA_ROOM (room_number, names, base_id)
values (107, 'Arden', 361127872);
insert into CINEMA_ROOM (room_number, names, base_id)
values (108, 'Laurene', 968461771);
insert into CINEMA_ROOM (room_number, names, base_id)
values (109, 'Glenda', 134146256);
insert into CINEMA_ROOM (room_number, names, base_id)
values (110, 'Rollin', 247998477);
insert into CINEMA_ROOM (room_number, names, base_id)
values (111, 'Huberto', 883554799);
insert into CINEMA_ROOM (room_number, names, base_id)
values (112, 'Lenci', 874925934);
insert into CINEMA_ROOM (room_number, names, base_id)
values (113, 'Karna', 736028738);
insert into CINEMA_ROOM (room_number, names, base_id)
values (114, 'Merry', 964550125);
insert into CINEMA_ROOM (room_number, names, base_id)
values (115, 'Annmaria', 204402689);
insert into CINEMA_ROOM (room_number, names, base_id)
values (116, 'Arch', 797368163);
insert into CINEMA_ROOM (room_number, names, base_id)
values (117, 'Niles', 415969269);
insert into CINEMA_ROOM (room_number, names, base_id)
values (118, 'Bride', 764079527);
insert into CINEMA_ROOM (room_number, names, base_id)
values (119, 'Benedetta', 133572987);
insert into CINEMA_ROOM (room_number, names, base_id)
values (120, 'Denise', 513974082);
insert into CINEMA_ROOM (room_number, names, base_id)
values (121, 'Emory', 548087467);
insert into CINEMA_ROOM (room_number, names, base_id)
values (122, 'Joye', 933727244);
insert into CINEMA_ROOM (room_number, names, base_id)
values (123, 'Willabella', 738509747);
insert into CINEMA_ROOM (room_number, names, base_id)
values (124, 'Kermit', 301914323);
insert into CINEMA_ROOM (room_number, names, base_id)
values (125, 'Vinson', 807013482);
insert into CINEMA_ROOM (room_number, names, base_id)
values (126, 'Cherri', 559283037);
insert into CINEMA_ROOM (room_number, names, base_id)
values (127, 'Israel', 345660840);
insert into CINEMA_ROOM (room_number, names, base_id)
values (128, 'Aluin', 576284282);
insert into CINEMA_ROOM (room_number, names, base_id)
values (129, 'Christin', 597422886);
insert into CINEMA_ROOM (room_number, names, base_id)
values (130, 'Luciano', 290502901);
insert into CINEMA_ROOM (room_number, names, base_id)
values (131, 'Karim', 875429879);
insert into CINEMA_ROOM (room_number, names, base_id)
values (132, 'Rania', 424054287);
insert into CINEMA_ROOM (room_number, names, base_id)
values (133, 'Shawnee', 623191949);
insert into CINEMA_ROOM (room_number, names, base_id)
values (134, 'Sindee', 860961076);
insert into CINEMA_ROOM (room_number, names, base_id)
values (135, 'Phaedra', 984196853);
insert into CINEMA_ROOM (room_number, names, base_id)
values (136, 'Elvina', 860961076);
insert into CINEMA_ROOM (room_number, names, base_id)
values (137, 'Shayla', 174961000);
insert into CINEMA_ROOM (room_number, names, base_id)
values (138, 'Shelly', 219490683);
insert into CINEMA_ROOM (room_number, names, base_id)
values (139, 'Monroe', 418439061);
insert into CINEMA_ROOM (room_number, names, base_id)
values (140, 'Sofia', 848103746);
insert into CINEMA_ROOM (room_number, names, base_id)
values (141, 'Ulric', 828641516);
insert into CINEMA_ROOM (room_number, names, base_id)
values (142, 'Jeremiah', 868403959);
insert into CINEMA_ROOM (room_number, names, base_id)
values (143, 'Onfre', 284104059);
insert into CINEMA_ROOM (room_number, names, base_id)
values (144, 'Diego', 152485947);
insert into CINEMA_ROOM (room_number, names, base_id)
values (145, 'Kenneth', 859408959);
insert into CINEMA_ROOM (room_number, names, base_id)
values (146, 'Blanch', 442322646);
insert into CINEMA_ROOM (room_number, names, base_id)
values (147, 'Monte', 626899383);
insert into CINEMA_ROOM (room_number, names, base_id)
values (148, 'Gerhardt', 384736297);
insert into CINEMA_ROOM (room_number, names, base_id)
values (149, 'Eleanore', 121785655);
insert into CINEMA_ROOM (room_number, names, base_id)
values (150, 'Garret', 573083436);
insert into CINEMA_ROOM (room_number, names, base_id)
values (151, 'Hobart', 895591429);
insert into CINEMA_ROOM (room_number, names, base_id)
values (152, 'Darell', 332707650);
insert into CINEMA_ROOM (room_number, names, base_id)
values (153, 'Janella', 442652819);
insert into CINEMA_ROOM (room_number, names, base_id)
values (154, 'Efren', 820264412);
insert into CINEMA_ROOM (room_number, names, base_id)
values (155, 'Andriana', 684340759);
insert into CINEMA_ROOM (room_number, names, base_id)
values (156, 'Tracey', 848103746);
insert into CINEMA_ROOM (room_number, names, base_id)
values (157, 'Kristina', 688394818);
insert into CINEMA_ROOM (room_number, names, base_id)
values (158, 'Lydia', 528742004);
insert into CINEMA_ROOM (room_number, names, base_id)
values (159, 'Yuma', 507134835);
insert into CINEMA_ROOM (room_number, names, base_id)
values (160, 'Annamarie', 361127872);
insert into CINEMA_ROOM (room_number, names, base_id)
values (161, 'Kurt', 858703292);
insert into CINEMA_ROOM (room_number, names, base_id)
values (162, 'Henry', 361127872);
insert into CINEMA_ROOM (room_number, names, base_id)
values (163, 'Thomasine', 804325335);
insert into CINEMA_ROOM (room_number, names, base_id)
values (164, 'Foss', 639946543);
insert into CINEMA_ROOM (room_number, names, base_id)
values (165, 'Gothart', 303288269);
insert into CINEMA_ROOM (room_number, names, base_id)
values (166, 'Dulcy', 307320198);
insert into CINEMA_ROOM (room_number, names, base_id)
values (167, 'Upton', 958205576);
insert into CINEMA_ROOM (room_number, names, base_id)
values (168, 'Mohandis', 796944275);
insert into CINEMA_ROOM (room_number, names, base_id)
values (169, 'Fred', 170208456);
insert into CINEMA_ROOM (room_number, names, base_id)
values (170, 'Neda', 742524763);
insert into CINEMA_ROOM (room_number, names, base_id)
values (171, 'Marilin', 250670155);
insert into CINEMA_ROOM (room_number, names, base_id)
values (172, 'Vanna', 870144988);
insert into CINEMA_ROOM (room_number, names, base_id)
values (173, 'Ekaterina', 221935402);
insert into CINEMA_ROOM (room_number, names, base_id)
values (174, 'Natasha', 919659941);
insert into CINEMA_ROOM (room_number, names, base_id)
values (175, 'Perkin', 424054287);
insert into CINEMA_ROOM (room_number, names, base_id)
values (176, 'Stoddard', 307320198);
insert into CINEMA_ROOM (room_number, names, base_id)
values (177, 'Arlana', 178078486);
insert into CINEMA_ROOM (room_number, names, base_id)
values (178, 'Sukey', 822098469);
insert into CINEMA_ROOM (room_number, names, base_id)
values (179, 'Si', 964550125);
insert into CINEMA_ROOM (room_number, names, base_id)
values (180, 'Leopold', 742524333);
insert into CINEMA_ROOM (room_number, names, base_id)
values (181, 'Cindi', 250670155);
insert into CINEMA_ROOM (room_number, names, base_id)
values (182, 'Karyl', 120358256);
insert into CINEMA_ROOM (room_number, names, base_id)
values (183, 'Ramon', 968461771);
insert into CINEMA_ROOM (room_number, names, base_id)
values (184, 'Gillie', 420409127);
insert into CINEMA_ROOM (room_number, names, base_id)
values (185, 'Wallie', 337825666);
insert into CINEMA_ROOM (room_number, names, base_id)
values (186, 'Marilin', 742524763);
insert into CINEMA_ROOM (room_number, names, base_id)
values (187, 'Tim', 808703582);
insert into CINEMA_ROOM (room_number, names, base_id)
values (188, 'Natasha', 933727244);
insert into CINEMA_ROOM (room_number, names, base_id)
values (189, 'Dermot', 299789591);
insert into CINEMA_ROOM (room_number, names, base_id)
values (190, 'Durante', 319839015);
insert into CINEMA_ROOM (room_number, names, base_id)
values (191, 'Cherida', 119813764);
insert into CINEMA_ROOM (room_number, names, base_id)
values (192, 'Sheppard', 720971581);
insert into CINEMA_ROOM (room_number, names, base_id)
values (193, 'Neilla', 303288269);
insert into CINEMA_ROOM (room_number, names, base_id)
values (194, 'Herc', 208639306);
insert into CINEMA_ROOM (room_number, names, base_id)
values (195, 'Remy', 220247947);
insert into CINEMA_ROOM (room_number, names, base_id)
values (196, 'Mil', 290932547);
insert into CINEMA_ROOM (room_number, names, base_id)
values (197, 'Genevra', 328011200);
insert into CINEMA_ROOM (room_number, names, base_id)
values (198, 'Ada', 229155781);
insert into CINEMA_ROOM (room_number, names, base_id)
values (199, 'Kalvin', 221935402);
insert into CINEMA_ROOM (room_number, names, base_id)
values (200, 'Alvie', 589774943);
insert into CINEMA_ROOM (room_number, names, base_id)
values (201, 'Carlin', 598851531);
insert into CINEMA_ROOM (room_number, names, base_id)
values (202, 'Mara', 551868624);
insert into CINEMA_ROOM (room_number, names, base_id)
values (203, 'Nana', 480543049);
insert into CINEMA_ROOM (room_number, names, base_id)
values (204, 'Glennis', 411115157);
insert into CINEMA_ROOM (room_number, names, base_id)
values (205, 'Mylo', 916385807);
insert into CINEMA_ROOM (room_number, names, base_id)
values (206, 'Roze', 209728370);
insert into CINEMA_ROOM (room_number, names, base_id)
values (207, 'Marian', 295691441);
insert into CINEMA_ROOM (room_number, names, base_id)
values (208, 'Lyda', 739366417);
insert into CINEMA_ROOM (room_number, names, base_id)
values (209, 'Tamma', 573928132);
insert into CINEMA_ROOM (room_number, names, base_id)
values (210, 'Richart', 176100852);
insert into CINEMA_ROOM (room_number, names, base_id)
values (211, 'Lynette', 411115157);
insert into CINEMA_ROOM (room_number, names, base_id)
values (212, 'Gavrielle', 780264562);
insert into CINEMA_ROOM (room_number, names, base_id)
values (213, 'Rakel', 538720495);
insert into CINEMA_ROOM (room_number, names, base_id)
values (214, 'Abby', 822098469);
insert into CINEMA_ROOM (room_number, names, base_id)
values (215, 'Hedda', 693364662);
insert into CINEMA_ROOM (room_number, names, base_id)
values (216, 'Ignaz', 699762206);
insert into CINEMA_ROOM (room_number, names, base_id)
values (217, 'Brittani', 960927506);
insert into CINEMA_ROOM (room_number, names, base_id)
values (218, 'Gradeigh', 739366417);
insert into CINEMA_ROOM (room_number, names, base_id)
values (219, 'Carlin', 554917367);
insert into CINEMA_ROOM (room_number, names, base_id)
values (220, 'Addy', 859408959);
insert into CINEMA_ROOM (room_number, names, base_id)
values (221, 'Antin', 337825666);
insert into CINEMA_ROOM (room_number, names, base_id)
values (222, 'Immanuel', 220744448);
insert into CINEMA_ROOM (room_number, names, base_id)
values (223, 'Hartwell', 982025418);
insert into CINEMA_ROOM (room_number, names, base_id)
values (224, 'Marysa', 690025000);
insert into CINEMA_ROOM (room_number, names, base_id)
values (225, 'Edmund', 364149523);
insert into CINEMA_ROOM (room_number, names, base_id)
values (226, 'Kaspar', 623191949);
insert into CINEMA_ROOM (room_number, names, base_id)
values (227, 'Suzy', 332707650);
insert into CINEMA_ROOM (room_number, names, base_id)
values (228, 'Judas', 399140995);
insert into CINEMA_ROOM (room_number, names, base_id)
values (229, 'Ethyl', 551868624);
insert into CINEMA_ROOM (room_number, names, base_id)
values (230, 'Rozamond', 170208456);
insert into CINEMA_ROOM (room_number, names, base_id)
values (231, 'Demetre', 481657222);
insert into CINEMA_ROOM (room_number, names, base_id)
values (232, 'Abelard', 300194611);
insert into CINEMA_ROOM (room_number, names, base_id)
values (233, 'Ashlen', 311806962);
insert into CINEMA_ROOM (room_number, names, base_id)
values (234, 'Michaela', 264793465);
insert into CINEMA_ROOM (room_number, names, base_id)
values (235, 'Gerda', 290502901);
insert into CINEMA_ROOM (room_number, names, base_id)
values (236, 'Shelley', 953988797);
insert into CINEMA_ROOM (room_number, names, base_id)
values (237, 'Gus', 361127872);
insert into CINEMA_ROOM (room_number, names, base_id)
values (238, 'Felicity', 616864162);
insert into CINEMA_ROOM (room_number, names, base_id)
values (239, 'Emmy', 202104113);
insert into CINEMA_ROOM (room_number, names, base_id)
values (240, 'Rodd', 796944275);
insert into CINEMA_ROOM (room_number, names, base_id)
values (241, 'Lyn', 265088836);
insert into CINEMA_ROOM (room_number, names, base_id)
values (242, 'Shayne', 617598578);
insert into CINEMA_ROOM (room_number, names, base_id)
values (243, 'Marylinda', 919698392);
insert into CINEMA_ROOM (room_number, names, base_id)
values (244, 'Eamon', 508914852);
insert into CINEMA_ROOM (room_number, names, base_id)
values (245, 'Nedi', 503383347);
insert into CINEMA_ROOM (room_number, names, base_id)
values (246, 'Caria', 630914533);
insert into CINEMA_ROOM (room_number, names, base_id)
values (247, 'Lilian', 573083436);
insert into CINEMA_ROOM (room_number, names, base_id)
values (248, 'Tuckie', 742524763);
insert into CINEMA_ROOM (room_number, names, base_id)
values (249, 'Adina', 895591429);
insert into CINEMA_ROOM (room_number, names, base_id)
values (250, 'Claire', 100832241);
insert into CINEMA_ROOM (room_number, names, base_id)
values (251, 'Avie', 780264562);
insert into CINEMA_ROOM (room_number, names, base_id)
values (252, 'Roselia', 173046916);
insert into CINEMA_ROOM (room_number, names, base_id)
values (253, 'Rabbi', 358059427);
insert into CINEMA_ROOM (room_number, names, base_id)
values (254, 'Raven', 540476869);
insert into CINEMA_ROOM (room_number, names, base_id)
values (255, 'Elayne', 405145468);
insert into CINEMA_ROOM (room_number, names, base_id)
values (256, 'Heda', 395536995);
insert into CINEMA_ROOM (room_number, names, base_id)
values (257, 'Dallas', 814657903);
insert into CINEMA_ROOM (room_number, names, base_id)
values (259, 'Phaidra', 877804100);
insert into CINEMA_ROOM (room_number, names, base_id)
values (262, 'Minne', 553177977);
insert into CINEMA_ROOM (room_number, names, base_id)
values (264, 'Elmer', 398977486);
insert into CINEMA_ROOM (room_number, names, base_id)
values (266, 'Linda', 582535671);
insert into CINEMA_ROOM (room_number, names, base_id)
values (269, 'Andee', 477908730);
insert into CINEMA_ROOM (room_number, names, base_id)
values (271, 'Patricio', 639946543);
insert into CINEMA_ROOM (room_number, names, base_id)
values (274, 'Sanderson', 421314721);
insert into CINEMA_ROOM (room_number, names, base_id)
values (276, 'Margy', 694588776);
insert into CINEMA_ROOM (room_number, names, base_id)
values (277, 'Alan', 696972862);
insert into CINEMA_ROOM (room_number, names, base_id)
values (280, 'Shannah', 542226644);
insert into CINEMA_ROOM (room_number, names, base_id)
values (282, 'Rubi', 804325335);
insert into CINEMA_ROOM (room_number, names, base_id)
values (285, 'Sheilah', 240115315);
insert into CINEMA_ROOM (room_number, names, base_id)
values (286, 'Anallise', 866217071);
insert into CINEMA_ROOM (room_number, names, base_id)
values (289, 'Virgil', 592347002);
insert into CINEMA_ROOM (room_number, names, base_id)
values (292, 'Gary', 425239658);
insert into CINEMA_ROOM (room_number, names, base_id)
values (294, 'Etti', 811480017);
insert into CINEMA_ROOM (room_number, names, base_id)
values (297, 'Darn', 600746268);
insert into CINEMA_ROOM (room_number, names, base_id)
values (300, 'Nevsa', 384736297);
insert into CINEMA_ROOM (room_number, names, base_id)
values (303, 'Emmanuel', 637136262);
insert into CINEMA_ROOM (room_number, names, base_id)
values (305, 'Dwain', 444660905);
insert into CINEMA_ROOM (room_number, names, base_id)
values (307, 'Tabbitha', 241295050);
insert into CINEMA_ROOM (room_number, names, base_id)
values (310, 'Teriann', 281916454);
insert into CINEMA_ROOM (room_number, names, base_id)
values (313, 'Gibbie', 333012478);
insert into CINEMA_ROOM (room_number, names, base_id)
values (315, 'Prudi', 301115580);
insert into CINEMA_ROOM (room_number, names, base_id)
values (317, 'Nonna', 250719097);
insert into CINEMA_ROOM (room_number, names, base_id)
values (320, 'Wallie', 742524333);
insert into CINEMA_ROOM (room_number, names, base_id)
values (322, 'Sunny', 280023446);
insert into CINEMA_ROOM (room_number, names, base_id)
values (325, 'Christean', 584831315);
insert into CINEMA_ROOM (room_number, names, base_id)
values (328, 'Gretel', 873431419);
insert into CINEMA_ROOM (room_number, names, base_id)
values (331, 'Orrin', 542226644);
insert into CINEMA_ROOM (room_number, names, base_id)
values (334, 'Jarib', 241295050);
insert into CINEMA_ROOM (room_number, names, base_id)
values (336, 'Montague', 751246552);
insert into CINEMA_ROOM (room_number, names, base_id)
values (339, 'Dotty', 300651147);
insert into CINEMA_ROOM (room_number, names, base_id)
values (341, 'Sol', 133572987);
insert into CINEMA_ROOM (room_number, names, base_id)
values (344, 'Lorin', 359338879);
insert into CINEMA_ROOM (room_number, names, base_id)
values (346, 'Yvon', 608878821);
insert into CINEMA_ROOM (room_number, names, base_id)
values (348, 'Chrisy', 727220792);
insert into CINEMA_ROOM (room_number, names, base_id)
values (351, 'Roshelle', 336715636);
insert into CINEMA_ROOM (room_number, names, base_id)
values (353, 'Madlin', 694410389);
insert into CINEMA_ROOM (room_number, names, base_id)
values (355, 'Natividad', 804325335);
insert into CINEMA_ROOM (room_number, names, base_id)
values (357, 'Cherye', 226210025);
insert into CINEMA_ROOM (room_number, names, base_id)
values (360, 'Marlena', 240115315);
insert into CINEMA_ROOM (room_number, names, base_id)
values (362, 'Tabbie', 424054287);
insert into CINEMA_ROOM (room_number, names, base_id)
values (364, 'Stacy', 307320198);
insert into CINEMA_ROOM (room_number, names, base_id)
values (366, 'Abramo', 367974479);
insert into CINEMA_ROOM (room_number, names, base_id)
values (369, 'Krystal', 717046176);
insert into CINEMA_ROOM (room_number, names, base_id)
values (371, 'Evanne', 144020162);
insert into CINEMA_ROOM (room_number, names, base_id)
values (373, 'Ilene', 684340759);
insert into CINEMA_ROOM (room_number, names, base_id)
values (376, 'Staford', 348879817);
insert into CINEMA_ROOM (room_number, names, base_id)
values (378, 'Malynda', 814657903);
insert into CINEMA_ROOM (room_number, names, base_id)
values (380, 'Bibbye', 767251347);
insert into CINEMA_ROOM (room_number, names, base_id)
values (383, 'Raimondo', 361127872);
insert into CINEMA_ROOM (room_number, names, base_id)
values (385, 'Barnie', 600746268);
insert into CINEMA_ROOM (room_number, names, base_id)
values (388, 'Marijo', 336715636);
insert into CINEMA_ROOM (room_number, names, base_id)
values (389, 'Reginauld', 591646586);
insert into CINEMA_ROOM (room_number, names, base_id)
values (392, 'Collin', 411115157);
insert into CINEMA_ROOM (room_number, names, base_id)
values (393, 'Doralynn', 711395804);
insert into CINEMA_ROOM (room_number, names, base_id)
values (396, 'Chico', 968461771);
insert into CINEMA_ROOM (room_number, names, base_id)
values (398, 'Franklyn', 715652307);
insert into CINEMA_ROOM (room_number, names, base_id)
values (258, 'Chic', 170208456);
insert into CINEMA_ROOM (room_number, names, base_id)
values (260, 'Gert', 348879817);
insert into CINEMA_ROOM (room_number, names, base_id)
values (261, 'Zacharias', 982025418);
insert into CINEMA_ROOM (room_number, names, base_id)
values (263, 'Nickey', 780264562);
insert into CINEMA_ROOM (room_number, names, base_id)
values (265, 'Darbie', 877804100);
insert into CINEMA_ROOM (room_number, names, base_id)
values (267, 'Shanta', 324170665);
insert into CINEMA_ROOM (room_number, names, base_id)
values (268, 'Lukas', 697799922);
insert into CINEMA_ROOM (room_number, names, base_id)
values (270, 'Odella', 127010539);
insert into CINEMA_ROOM (room_number, names, base_id)
values (272, 'Gerard', 432946267);
insert into CINEMA_ROOM (room_number, names, base_id)
values (273, 'Carolynn', 411115157);
insert into CINEMA_ROOM (room_number, names, base_id)
values (275, 'Michaelina', 281637162);
insert into CINEMA_ROOM (room_number, names, base_id)
values (278, 'Jennie', 178283057);
insert into CINEMA_ROOM (room_number, names, base_id)
values (279, 'Kristos', 532602580);
insert into CINEMA_ROOM (room_number, names, base_id)
values (281, 'Ivett', 984196853);
insert into CINEMA_ROOM (room_number, names, base_id)
values (283, 'Anetta', 202463670);
insert into CINEMA_ROOM (room_number, names, base_id)
values (284, 'Brittaney', 875429879);
insert into CINEMA_ROOM (room_number, names, base_id)
values (287, 'Read', 816589551);
insert into CINEMA_ROOM (room_number, names, base_id)
values (288, 'Odessa', 980201317);
insert into CINEMA_ROOM (room_number, names, base_id)
values (290, 'Gerome', 242260899);
insert into CINEMA_ROOM (room_number, names, base_id)
values (291, 'Derril', 446697141);
insert into CINEMA_ROOM (room_number, names, base_id)
values (293, 'Orsa', 968461771);
insert into CINEMA_ROOM (room_number, names, base_id)
values (295, 'Roderic', 865893397);
insert into CINEMA_ROOM (room_number, names, base_id)
values (296, 'Bary', 549057992);
insert into CINEMA_ROOM (room_number, names, base_id)
values (298, 'Che', 808703582);
insert into CINEMA_ROOM (room_number, names, base_id)
values (299, 'Kass', 860961076);
insert into CINEMA_ROOM (room_number, names, base_id)
values (301, 'Adler', 201342435);
insert into CINEMA_ROOM (room_number, names, base_id)
values (302, 'Izabel', 711395804);
insert into CINEMA_ROOM (room_number, names, base_id)
values (304, 'Cordelie', 221935402);
insert into CINEMA_ROOM (room_number, names, base_id)
values (306, 'Johnath', 257639921);
insert into CINEMA_ROOM (room_number, names, base_id)
values (308, 'Lexi', 204402689);
insert into CINEMA_ROOM (room_number, names, base_id)
values (309, 'Perry', 658285354);
insert into CINEMA_ROOM (room_number, names, base_id)
values (311, 'Violet', 301115580);
insert into CINEMA_ROOM (room_number, names, base_id)
values (312, 'Liane', 824057988);
insert into CINEMA_ROOM (room_number, names, base_id)
values (314, 'Olvan', 916385807);
insert into CINEMA_ROOM (room_number, names, base_id)
values (316, 'Phillipp', 893420511);
insert into CINEMA_ROOM (room_number, names, base_id)
values (318, 'Darnall', 446697141);
insert into CINEMA_ROOM (room_number, names, base_id)
values (319, 'Meyer', 290502901);
insert into CINEMA_ROOM (room_number, names, base_id)
values (321, 'Darill', 545909293);
insert into CINEMA_ROOM (room_number, names, base_id)
values (323, 'Veda', 805639332);
insert into CINEMA_ROOM (room_number, names, base_id)
values (324, 'Elie', 229155781);
insert into CINEMA_ROOM (room_number, names, base_id)
values (326, 'Codi', 797986115);
insert into CINEMA_ROOM (room_number, names, base_id)
values (327, 'Natasha', 811480017);
insert into CINEMA_ROOM (room_number, names, base_id)
values (329, 'Sula', 711395804);
insert into CINEMA_ROOM (room_number, names, base_id)
values (330, 'Winnie', 422155493);
insert into CINEMA_ROOM (room_number, names, base_id)
values (332, 'Jake', 184755344);
insert into CINEMA_ROOM (room_number, names, base_id)
values (333, 'Enrico', 753821866);
insert into CINEMA_ROOM (room_number, names, base_id)
values (335, 'Nanete', 592975208);
insert into CINEMA_ROOM (room_number, names, base_id)
values (337, 'Robyn', 780264562);
insert into CINEMA_ROOM (room_number, names, base_id)
values (338, 'Juana', 589774943);
insert into CINEMA_ROOM (room_number, names, base_id)
values (340, 'Kelci', 300194611);
insert into CINEMA_ROOM (room_number, names, base_id)
values (342, 'Kanya', 686404137);
insert into CINEMA_ROOM (room_number, names, base_id)
values (343, 'Skipton', 360881982);
insert into CINEMA_ROOM (room_number, names, base_id)
values (345, 'Wendell', 575258987);
insert into CINEMA_ROOM (room_number, names, base_id)
values (347, 'Zebulen', 299789591);
insert into CINEMA_ROOM (room_number, names, base_id)
values (349, 'Grover', 195263919);
insert into CINEMA_ROOM (room_number, names, base_id)
values (350, 'Andris', 543313388);
insert into CINEMA_ROOM (room_number, names, base_id)
values (352, 'Rusty', 364003934);
insert into CINEMA_ROOM (room_number, names, base_id)
values (354, 'Nicolai', 970722290);
insert into CINEMA_ROOM (room_number, names, base_id)
values (356, 'Iolanthe', 718223920);
insert into CINEMA_ROOM (room_number, names, base_id)
values (358, 'Norean', 567536065);
insert into CINEMA_ROOM (room_number, names, base_id)
values (359, 'Brewster', 542226644);
insert into CINEMA_ROOM (room_number, names, base_id)
values (361, 'Prissie', 359440647);
insert into CINEMA_ROOM (room_number, names, base_id)
values (363, 'Mendy', 999859046);
insert into CINEMA_ROOM (room_number, names, base_id)
values (365, 'Rogerio', 844213735);
insert into CINEMA_ROOM (room_number, names, base_id)
values (367, 'Terri', 549057992);
insert into CINEMA_ROOM (room_number, names, base_id)
values (368, 'Renaud', 418297667);
insert into CINEMA_ROOM (room_number, names, base_id)
values (370, 'Sharline', 241295050);
insert into CINEMA_ROOM (room_number, names, base_id)
values (372, 'Sharity', 862072713);
insert into CINEMA_ROOM (room_number, names, base_id)
values (374, 'Daphna', 607064264);
insert into CINEMA_ROOM (room_number, names, base_id)
values (375, 'Janis', 848103746);
insert into CINEMA_ROOM (room_number, names, base_id)
values (377, 'Lenard', 774984509);
insert into CINEMA_ROOM (room_number, names, base_id)
values (379, 'Cosette', 322303650);
insert into CINEMA_ROOM (room_number, names, base_id)
values (381, 'Nat', 963478068);
insert into CINEMA_ROOM (room_number, names, base_id)
values (382, 'Scarlett', 345660840);
insert into CINEMA_ROOM (room_number, names, base_id)
values (384, 'Charisse', 718599414);
insert into CINEMA_ROOM (room_number, names, base_id)
values (386, 'Alvin', 557463618);
insert into CINEMA_ROOM (room_number, names, base_id)
values (387, 'Josephina', 952410652);
insert into CINEMA_ROOM (room_number, names, base_id)
values (390, 'Annnora', 807078910);
insert into CINEMA_ROOM (room_number, names, base_id)
values (391, 'Simonette', 963478068);
insert into CINEMA_ROOM (room_number, names, base_id)
values (394, 'Whitby', 736028738);
insert into CINEMA_ROOM (room_number, names, base_id)
values (395, 'Rayshell', 624938714);
insert into CINEMA_ROOM (room_number, names, base_id)
values (397, 'Keefer', 693364662);
insert into CINEMA_ROOM (room_number, names, base_id)
values (399, 'Rivi', 295691441);
insert into CINEMA_ROOM (room_number, names, base_id)
values (400, 'Paton', 384736297);
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
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon', 15, 1, 1);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Juice,Bagel', 6, 2, 2);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soup,Tea,Steak,Salmon,Pizza,Soda,Bagel', 61, 3, 3);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Salmon', 31, 4, 4);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pizza,Juice,Burger,Steak', 42, 5, 5);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Latte,Tea,Salad', 20, 6, 6);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Soda,Muffin,Bagel', 21, 7, 7);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup', 7, 8, 8);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Steak,Pizza', 44, 9, 9);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Pasta,Salmon,Smoothie,Muffin,Soup,Salad,Juice,Tea', 62, 10, 10);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Latte,Burger,Pizza,Pasta,Smoothie,Muffin,Soda', 50, 11, 11);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Smoothie,Bagel,Pasta,Soda', 23, 12, 12);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda', 1, 13, 13);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Salad,Soup,Pasta,Latte,Muffin,Juice,Salmon,Soda,Smoothie', 76, 14, 14);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Salad,Soup,Soda', 23, 15, 15);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Latte', 10, 16, 16);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea', 3, 17, 17);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Bagel,Soda', 9, 18, 18);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soup,Salad,Pasta,Juice,Latte,Tea,Steak', 61, 19, 19);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Pizza,Muffin,Juice,Steak,Soup', 47, 20, 20);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Smoothie,Tea,Salmon,Soda', 38, 21, 21);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Salad,Bagel,Juice,Soup,Steak,Soda,Muffin,Latte,Burger', 58, 22, 22);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soup,Muffin,Juice,Smoothie', 19, 23, 23);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Muffin', 4, 24, 24);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Muffin,Latte,Juice,Soda,Burger,Soup,Pasta,Steak', 68, 25, 25);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Tea,Juice,Pizza', 21, 26, 26);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Pasta,Smoothie,Burger,Salmon,Soda,Juice,Bagel,Soup', 69, 27, 27);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Salmon,Smoothie,Soup,Pasta,Juice,Muffin,Pizza,Salad', 74, 28, 28);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Steak,Soda,Salad,Salmon,Tea,Smoothie,Juice', 60, 29, 29);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Soda', 16, 30, 30);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Bagel,Juice,Salmon,Latte,Smoothie', 32, 31, 31);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Soda,Soup,Juice,Pasta,Muffin,Latte', 40, 32, 32);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Tea,Muffin,Pasta,Burger,Juice,Smoothie,Bagel,Soda', 46, 33, 33);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Soup,Salmon,Salad,Burger,Pasta,Steak,Soda', 74, 34, 34);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Pizza', 21, 35, 35);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Salad', 25, 36, 36);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger', 8, 37, 37);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Juice,Salad', 13, 38, 38);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Latte,Soda,Soup,Burger,Salmon,Steak,Bagel,Salad,Pasta', 78, 39, 39);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Smoothie,Bagel,Steak,Soup,Latte,Salmon,Soda,Tea,Pasta', 70, 40, 40);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte', 5, 41, 41);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Pasta,Burger,Pizza,Latte,Tea,Smoothie,Bagel,Juice', 53, 42, 42);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Muffin,Steak,Salad,Pasta,Juice', 49, 43, 43);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pasta,Salad,Juice,Soup,Muffin,Soda,Latte,Tea,Bagel', 61, 44, 44);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Bagel,Smoothie,Soup,Tea,Juice,Pasta', 34, 45, 45);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Soda,Pasta,Salad,Burger', 43, 46, 46);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Soda,Muffin', 17, 47, 47);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Tea,Juice', 12, 48, 48);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Soda,Salad', 17, 49, 49);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soup,Muffin,Tea,Steak,Salad,Pizza,Burger', 64, 50, 50);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Salad', 16, 51, 51);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Soda,Pizza,Bagel,Salad,Soup,Steak,Pasta,Burger,Salmon', 86, 52, 52);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Salad,Soup,Burger,Bagel,Latte,Pizza,Muffin', 63, 53, 53);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Smoothie,Pasta,Soup,Pizza,Soda,Salad,Bagel,Juice', 60, 54, 54);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Juice,Salmon,Pasta,Soup,Tea,Smoothie', 48, 55, 55);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Salad,Smoothie,Juice,Latte,Steak,Soda,Pizza,Muffin', 67, 56, 56);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Soup,Juice,Smoothie,Tea,Pizza,Latte,Pasta,Muffin,Soda', 68, 57, 57);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup', 7, 58, 58);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie', 5, 59, 59);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Smoothie,Steak,Salmon,Burger,Pasta,Soup', 76, 60, 60);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Juice,Soup,Latte,Pasta,Pizza,Burger,Soda', 59, 61, 61);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Soup,Steak,Juice,Pasta,Tea,Bagel,Smoothie,Pizza', 63, 62, 62);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Bagel,Burger,Muffin', 14, 63, 63);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Bagel,Pizza,Smoothie,Soup,Steak,Tea,Pasta', 73, 64, 64);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Juice,Salmon,Pasta,Salad', 52, 65, 65);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Juice,Tea,Latte,Salad,Pizza,Burger,Steak', 70, 66, 66);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Latte,Juice', 11, 67, 67);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Juice,Muffin,Pizza,Smoothie,Soup,Salmon,Tea,Pasta,Bagel', 79, 68, 68);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Bagel,Salmon,Steak,Muffin', 44, 69, 69);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Salmon,Salad,Steak,Pizza,Pasta,Soup,Smoothie', 80, 70, 70);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Pasta,Salmon', 36, 71, 71);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Smoothie,Steak,Salmon,Muffin,Soup,Tea,Bagel,Burger', 72, 72, 72);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Salad,Juice,Pasta,Soda', 30, 73, 73);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Latte', 12, 74, 74);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Pasta,Pizza', 41, 75, 75);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Latte,Juice,Tea,Muffin,Pizza,Steak,Salad', 57, 76, 76);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Smoothie,Salmon,Bagel,Soup,Pizza,Juice,Pasta', 73, 77, 77);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Steak,Soup', 35, 78, 78);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Smoothie,Pizza,Pasta', 46, 79, 79);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Bagel,Salmon,Latte', 25, 80, 80);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pasta,Soup,Salad,Burger,Soda,Latte,Steak,Juice,Smoothie', 82, 81, 81);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Pizza,Bagel,Steak,Smoothie', 45, 82, 82);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Burger,Steak,Salmon,Soup,Muffin', 53, 83, 83);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice', 3, 84, 84);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Pasta,Salmon,Muffin,Pizza,Bagel,Soda,Soup', 62, 85, 85);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Juice,Tea,Salmon,Latte', 28, 86, 86);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Salmon,Soda,Latte,Steak,Burger,Bagel,Smoothie,Pasta,Pizza', 81, 87, 87);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Soda,Pizza,Muffin,Salmon,Soup,Steak,Burger', 75, 88, 88);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad', 9, 89, 89);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soup', 9, 90, 90);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Salmon,Soda,Salad,Soup,Muffin,Smoothie,Bagel', 45, 91, 91);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Tea,Burger,Salmon,Bagel,Salad,Smoothie', 48, 92, 92);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Soup,Bagel,Juice', 25, 93, 93);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Salmon,Smoothie,Pizza,Juice,Latte,Soda,Muffin,Bagel', 56, 94, 94);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Burger', 15, 95, 95);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soda,Tea,Steak,Bagel,Burger,Salmon,Salad,Muffin,Pasta', 72, 96, 96);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Muffin,Pizza,Bagel,Smoothie,Salmon,Soda,Tea,Salad', 54, 97, 97);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Salad,Soda,Bagel,Muffin', 31, 98, 98);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Soup,Salmon,Pasta,Smoothie', 55, 99, 99);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Muffin,Soda', 7, 100, 100);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Smoothie,Burger,Bagel,Latte', 35, 101, 101);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Bagel', 7, 102, 102);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Steak,Pizza,Soup,Salad,Smoothie,Latte,Salmon', 78, 103, 103);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Latte,Bagel,Tea,Burger,Juice,Salad,Smoothie,Soda', 49, 104, 104);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza', 13, 105, 105);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Soup,Bagel,Tea', 18, 106, 106);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Pasta,Smoothie,Muffin,Soda,Burger', 36, 107, 107);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soda,Tea,Burger,Pizza,Steak,Latte,Salad,Muffin,Soup', 68, 108, 108);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Tea,Pasta,Burger,Salmon,Pizza,Salad,Muffin,Smoothie,Steak', 87, 109, 109);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Juice,Soda,Salad', 20, 110, 110);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Latte', 21, 111, 111);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Pasta,Juice,Soda,Soup,Smoothie,Bagel,Muffin,Burger', 46, 112, 112);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger', 8, 113, 113);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Latte,Tea', 11, 114, 114);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Pasta,Latte,Salmon,Tea,Salad,Smoothie', 66, 115, 115);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Juice,Salad,Latte', 22, 116, 116);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin', 2, 117, 117);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Latte,Juice,Pasta,Soda,Soup,Muffin', 39, 118, 118);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Salmon,Steak,Bagel,Muffin,Tea', 47, 119, 119);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pasta,Smoothie,Juice,Pizza,Steak,Bagel,Tea,Latte,Burger', 83, 120, 120);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Muffin,Latte,Steak,Soup,Soda,Salad,Tea,Smoothie,Bagel', 67, 121, 121);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte', 5, 122, 122);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Steak', 25, 123, 123);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Steak', 19, 124, 124);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie', 5, 125, 125);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Smoothie,Soup,Muffin,Bagel,Salad', 40, 126, 126);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Soda,Salmon,Muffin,Bagel,Burger,Smoothie,Steak,Pasta', 71, 127, 127);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Soup,Latte,Steak,Muffin,Salmon,Juice,Smoothie', 66, 128, 128);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Bagel,Tea,Muffin,Soup,Smoothie,Latte,Pizza,Steak', 56, 129, 129);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad', 9, 130, 130);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Latte', 8, 131, 131);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Bagel,Pizza,Salad,Salmon,Latte,Smoothie,Steak,Soup,Muffin', 83, 132, 132);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Soda,Smoothie,Soup,Juice,Muffin', 31, 133, 133);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte', 5, 134, 134);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Pasta,Soda,Salad,Soup,Burger', 39, 135, 135);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Salad,Juice,Muffin,Tea', 25, 136, 136);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Tea,Bagel,Smoothie,Steak,Salad,Soup,Pizza,Juice,Burger', 72, 137, 137);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Bagel,Muffin,Juice,Salmon,Soda,Latte,Pasta,Burger', 56, 138, 138);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad', 9, 139, 139);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pizza,Soda,Latte', 22, 140, 140);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Smoothie,Bagel', 12, 141, 141);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta', 12, 142, 142);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Salmon,Bagel,Salad,Pasta,Tea', 54, 143, 143);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pizza,Muffin,Latte,Juice', 39, 144, 144);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Juice,Latte,Muffin,Steak', 29, 145, 145);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie', 5, 146, 146);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Smoothie,Soda,Tea,Pizza', 31, 147, 147);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Juice,Tea', 14, 148, 148);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza', 13, 149, 149);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Smoothie,Pasta,Pizza,Juice,Tea,Salad,Soup,Muffin', 56, 150, 150);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Steak,Tea,Salad,Juice,Salmon,Soda,Smoothie,Pizza', 68, 151, 151);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Muffin,Tea,Smoothie,Pizza,Steak,Salmon,Latte', 67, 152, 152);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Latte,Salad', 26, 153, 153);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Latte', 10, 154, 154);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Juice', 5, 155, 155);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Smoothie,Tea,Soup,Pizza,Latte', 35, 156, 156);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Burger,Soup,Pasta,Steak', 52, 157, 157);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soup,Latte,Juice,Tea', 24, 158, 158);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Steak,Pasta,Smoothie,Burger,Soda,Juice', 49, 159, 159);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Smoothie', 18, 160, 160);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Burger,Juice,Smoothie,Bagel,Pasta,Salad,Latte,Muffin,Pizza', 67, 161, 161);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soda,Latte,Tea,Salmon,Steak,Salad,Burger,Smoothie', 66, 162, 162);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Burger', 13, 163, 163);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Steak', 29, 164, 164);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Juice,Pasta', 28, 165, 165);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Bagel,Soup,Salad,Juice,Pasta,Burger,Soda,Latte', 53, 166, 166);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Soup,Tea,Salmon,Steak,Juice', 57, 167, 167);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Smoothie,Latte,Tea,Pasta', 33, 168, 168);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Muffin,Steak,Tea,Latte', 35, 169, 169);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Smoothie,Latte', 14, 170, 170);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Soup,Steak,Pizza,Salad,Tea,Smoothie', 59, 171, 171);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Juice,Pasta,Salmon,Muffin,Pizza,Latte', 53, 172, 172);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte', 5, 173, 173);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Salmon,Juice,Salad', 29, 174, 174);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Juice,Bagel,Steak,Salad,Smoothie,Latte,Burger', 63, 175, 175);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza', 13, 176, 176);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Tea,Soda,Salad,Steak,Soup,Burger,Salmon,Bagel', 67, 177, 177);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Salad,Bagel,Soda,Pizza,Smoothie', 42, 178, 178);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Pasta', 19, 179, 179);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Tea,Steak,Latte,Pasta,Burger,Smoothie,Soda', 66, 180, 180);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Juice,Soda,Soup,Tea,Pizza', 33, 181, 181);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Pizza,Salad,Pasta,Latte,Muffin,Soda,Smoothie,Juice,Salmon', 70, 182, 182);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Bagel,Latte,Steak,Burger,Salad,Tea,Soup,Salmon,Muffin', 81, 183, 183);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pasta,Soda,Juice,Burger,Steak,Bagel,Smoothie', 50, 184, 184);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Tea,Steak,Burger', 32, 185, 185);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Salad,Pasta,Pizza,Muffin,Smoothie,Bagel,Steak,Burger', 82, 186, 186);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Burger,Salmon,Juice,Pasta,Salad,Latte,Tea,Bagel,Muffin', 73, 187, 187);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Salad,Soup', 32, 188, 188);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Muffin,Salad,Juice,Latte,Steak,Burger,Salmon,Pizza,Soup', 84, 189, 189);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Burger,Pasta,Juice,Soda,Bagel,Salad,Steak', 55, 190, 190);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda', 1, 191, 191);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak', 16, 192, 192);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Muffin,Tea,Soda,Pizza,Soup', 43, 193, 193);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pizza,Burger,Salad,Tea,Soda', 37, 194, 194);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Salad,Soup,Pizza,Juice,Tea,Smoothie', 42, 195, 195);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Salmon,Steak,Juice,Bagel,Muffin,Burger', 58, 196, 196);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda', 1, 197, 197);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Smoothie,Muffin,Steak,Tea', 36, 198, 198);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Pizza,Steak,Muffin,Latte,Salmon,Burger,Juice,Salad,Tea', 80, 199, 199);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soup,Bagel,Latte,Pizza', 30, 200, 200);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Muffin,Latte,Tea,Pizza,Salmon,Bagel,Pasta,Salad,Steak', 86, 201, 201);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soda,Smoothie,Pasta,Steak,Latte,Pizza,Salmon,Muffin,Tea', 76, 202, 202);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Pizza,Salmon', 31, 203, 203);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Muffin,Soda,Smoothie,Pasta,Pizza,Burger,Juice,Latte,Salmon', 81, 204, 204);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Salmon,Pizza,Burger,Salad,Soda,Soup,Smoothie,Bagel,Steak', 82, 205, 205);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Steak,Burger,Pizza,Pasta,Tea,Salmon,Soda,Latte', 79, 206, 206);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Latte', 7, 207, 207);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Salmon,Steak,Soup,Muffin,Pizza,Juice,Smoothie,Pasta,Bagel', 83, 208, 208);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Salmon,Juice,Soda,Bagel,Smoothie', 34, 209, 209);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Soda,Pasta,Salad,Tea', 33, 210, 210);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Tea,Muffin,Smoothie', 13, 211, 211);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon', 15, 212, 212);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Steak,Pizza,Salad', 40, 213, 213);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Salad,Soup,Pasta,Tea,Soda,Latte,Pizza,Burger', 62, 214, 214);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Soda,Bagel,Juice,Burger,Pasta,Latte', 39, 215, 215);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza', 13, 216, 216);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Pizza,Bagel,Latte,Tea,Salmon', 47, 217, 217);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Salmon,Salad', 27, 218, 218);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Burger', 20, 219, 219);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Burger,Juice,Muffin,Tea', 30, 220, 220);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Juice,Latte,Steak,Soda,Salmon,Tea', 53, 221, 221);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Soup,Salmon', 25, 222, 222);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie', 5, 223, 223);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Pasta,Soup,Tea,Pizza,Steak', 59, 224, 224);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Steak', 28, 225, 225);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Juice,Muffin,Salad,Bagel,Soda,Tea,Soup,Pizza', 46, 226, 226);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Steak,Soup,Smoothie,Juice,Pizza,Bagel,Salad,Salmon', 73, 227, 227);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Bagel,Salmon,Muffin,Smoothie', 32, 228, 228);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Soup,Burger,Bagel,Juice,Soda,Salad,Muffin,Salmon,Pasta', 63, 229, 229);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Bagel,Soda,Soup,Burger,Salad,Tea,Juice,Smoothie', 55, 230, 230);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Latte,Pasta,Salad,Juice,Muffin,Soup,Steak,Smoothie', 75, 231, 231);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Soup,Muffin', 22, 232, 232);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad', 9, 233, 233);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Pasta,Pizza,Salmon,Juice,Salad', 55, 234, 234);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Juice,Pizza,Steak,Burger,Muffin,Bagel,Tea', 57, 235, 235);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Bagel', 7, 236, 236);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Tea,Bagel,Salmon,Latte,Juice', 45, 237, 237);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Salmon,Soup,Tea,Bagel,Steak,Muffin,Salad,Burger,Pizza', 77, 238, 238);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice', 3, 239, 239);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Soda,Steak,Juice,Muffin,Salad,Burger,Soup,Pasta,Salmon', 77, 240, 240);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin', 2, 241, 241);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Bagel,Steak,Salad,Muffin,Pasta', 43, 242, 242);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Salad,Pasta,Juice,Steak,Burger,Muffin,Bagel,Latte', 73, 243, 243);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Juice,Muffin,Soda,Steak,Pasta,Tea', 40, 244, 244);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Burger,Salad,Muffin,Soda,Soup,Tea,Steak,Latte,Smoothie', 60, 245, 245);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Pizza,Salad', 25, 246, 246);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soda,Soup', 13, 247, 247);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soda,Steak,Tea,Pizza,Pasta,Latte,Muffin,Bagel', 59, 248, 248);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Burger', 21, 249, 249);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Soup,Smoothie', 17, 250, 250);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Juice,Salmon,Pizza,Tea,Salad', 45, 251, 251);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Pasta,Tea,Soda,Pizza,Salmon,Muffin', 53, 252, 252);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Soup,Soda,Pizza,Muffin,Pasta,Salmon,Juice,Burger', 71, 253, 253);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Muffin,Salmon,Pasta,Smoothie', 37, 254, 254);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin', 2, 255, 255);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soda,Pizza,Muffin,Pasta', 31, 256, 256);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Juice,Pasta,Burger,Soup,Salmon,Pizza', 61, 257, 257);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Tea', 15, 258, 258);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Latte,Burger,Pizza,Smoothie,Soup,Juice,Salmon,Bagel,Tea', 71, 259, 259);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Muffin,Tea,Burger,Steak', 31, 260, 260);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Soup,Salmon,Smoothie,Tea', 33, 261, 261);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Soup,Tea', 19, 262, 262);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soda,Tea,Salmon,Burger,Juice,Pizza', 46, 263, 263);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Burger,Soup,Latte,Smoothie,Juice', 41, 264, 264);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Latte', 18, 265, 265);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Smoothie,Tea,Soup', 30, 266, 266);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Pizza,Muffin,Bagel,Soda', 24, 267, 267);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Pasta,Bagel,Smoothie,Latte,Pizza', 44, 268, 268);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Soup,Steak', 24, 269, 269);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Muffin,Bagel,Pasta,Soda,Latte,Tea,Steak', 56, 270, 270);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Tea,Pizza,Salmon', 33, 271, 271);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Soup,Salad,Burger', 26, 272, 272);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Smoothie', 18, 273, 273);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Salmon,Muffin', 21, 274, 274);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Tea,Soda,Bagel,Pasta,Salmon,Muffin,Salad,Pizza', 61, 275, 275);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea', 3, 276, 276);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Steak,Bagel,Salmon,Pasta,Burger,Soda,Muffin', 66, 277, 277);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soda,Muffin,Soup,Salad,Steak', 41, 278, 278);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Tea,Soda,Steak,Salad,Salmon', 47, 279, 279);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Soup,Muffin,Latte,Salad,Smoothie,Burger,Pizza,Pasta,Salmon', 78, 280, 280);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta', 12, 281, 281);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soda,Pizza,Burger', 27, 282, 282);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Tea,Salad,Soda,Burger,Pasta,Latte,Muffin,Bagel,Soup', 64, 283, 283);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Juice,Salad,Soda,Soup', 25, 284, 284);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Tea,Smoothie,Latte', 15, 285, 285);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Juice,Soda,Bagel,Latte,Tea,Salad', 39, 286, 286);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Latte,Juice,Bagel,Smoothie,Steak', 35, 287, 287);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Muffin,Bagel,Steak,Juice,Soup,Burger,Tea,Smoothie,Latte', 65, 288, 288);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Smoothie,Steak,Tea,Burger,Pizza,Salad,Muffin', 64, 289, 289);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Muffin,Pasta,Salad,Latte,Soda,Steak,Pizza', 61, 290, 290);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Salmon', 16, 291, 291);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Salad,Pizza,Juice,Soda,Pasta,Muffin,Bagel', 58, 292, 292);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soup,Soda,Bagel,Salmon,Latte,Salad', 45, 293, 293);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Latte,Muffin,Soda,Steak,Pasta,Juice', 53, 294, 294);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Steak,Juice', 20, 295, 295);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Bagel', 7, 296, 296);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Latte,Pizza,Muffin', 23, 297, 297);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Tea,Pasta,Muffin,Steak,Salmon,Bagel', 59, 298, 298);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Burger,Steak,Tea,Soup,Latte,Pasta,Salad', 76, 299, 299);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Soda', 3, 300, 300);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte', 5, 301, 301);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soda', 4, 302, 302);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak', 16, 303, 303);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Soda,Tea', 13, 304, 304);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Muffin', 15, 305, 305);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Salad', 14, 306, 306);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte', 5, 307, 307);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Steak,Latte,Salad,Juice,Tea,Burger,Pasta,Soup,Muffin', 68, 308, 308);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Smoothie,Juice,Pasta,Latte,Steak,Burger,Salmon,Pizza', 84, 309, 309);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Soda', 5, 310, 310);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Salad,Pasta,Steak,Tea,Latte,Salmon,Muffin,Soup,Juice', 75, 311, 311);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Bagel,Pizza,Pasta,Juice,Soup,Steak', 58, 312, 312);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Bagel,Steak,Pasta,Smoothie', 40, 313, 313);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pasta,Tea,Smoothie,Latte,Soup', 48, 314, 314);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Soup,Steak,Bagel,Pizza,Salmon', 56, 315, 315);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Latte,Smoothie,Bagel,Salad,Salmon,Soda,Muffin,Juice', 55, 316, 316);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Bagel,Tea,Smoothie,Salad,Salmon,Burger,Pasta', 60, 317, 317);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soup,Bagel,Muffin,Steak,Smoothie', 35, 318, 318);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta,Muffin,Soda', 16, 319, 319);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Tea,Muffin,Smoothie,Burger,Pasta,Juice,Soup,Pizza', 55, 320, 320);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Soup,Pizza,Steak,Tea,Salad,Pasta,Soda,Smoothie,Juice', 78, 321, 321);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Pizza,Soup,Pasta', 33, 322, 322);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Latte,Salad,Tea,Pasta,Soup,Burger,Pizza,Soda,Muffin', 77, 323, 323);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Juice,Pasta,Tea,Salmon', 38, 324, 324);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Pizza,Steak,Soda,Juice', 37, 325, 325);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Salmon,Burger,Pizza,Tea,Smoothie,Steak,Juice', 70, 326, 326);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Soda,Bagel,Salmon,Soup,Salad,Juice,Muffin,Pizza,Pasta', 70, 327, 327);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger', 8, 328, 328);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Salmon,Pizza,Salad,Soda,Steak,Bagel,Latte,Soup,Tea', 75, 329, 329);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup', 7, 330, 330);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Latte,Pizza,Burger', 35, 331, 331);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda', 1, 332, 332);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Bagel,Pasta', 17, 333, 333);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Salmon,Bagel,Burger,Soup,Smoothie,Tea', 42, 334, 334);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Burger,Steak,Pasta,Muffin,Pizza,Juice', 56, 335, 335);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad', 9, 336, 336);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Burger,Smoothie,Juice,Muffin,Latte,Pasta', 49, 337, 337);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Salad,Smoothie,Soda,Juice,Burger,Pasta,Latte,Pizza', 72, 338, 338);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Salad,Bagel,Steak,Latte,Tea,Pizza,Smoothie,Pasta,Burger', 89, 339, 339);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel,Salmon,Salad', 26, 340, 340);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Smoothie,Salad,Muffin,Tea', 36, 341, 341);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Pasta,Bagel', 19, 342, 342);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Steak,Smoothie,Latte,Salmon,Tea,Pizza', 60, 343, 343);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Pasta,Muffin,Soda,Latte,Pizza,Steak,Juice,Salmon,Salad', 81, 344, 344);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea', 3, 345, 345);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Salad,Muffin,Pizza,Salmon,Juice,Smoothie,Burger', 61, 346, 346);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Bagel', 2, 347, 347);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Tea,Bagel,Salad,Smoothie,Muffin,Juice,Soup,Pasta,Salmon', 67, 348, 348);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Latte,Soda', 15, 349, 349);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pizza,Latte,Pasta,Salmon,Bagel,Smoothie,Juice,Soup', 65, 350, 350);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Tea,Smoothie', 15, 351, 351);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Smoothie,Salad,Juice,Latte', 24, 352, 352);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pizza,Juice,Latte,Muffin,Salmon', 39, 353, 353);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Steak', 23, 354, 354);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Salad,Salmon,Pasta,Juice,Tea,Steak,Latte,Pizza', 85, 355, 355);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Pasta', 13, 356, 356);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin', 2, 357, 357);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Pasta', 13, 358, 358);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pasta,Juice,Salmon,Pizza', 45, 359, 359);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Bagel,Burger,Tea,Latte,Salmon,Smoothie', 46, 360, 360);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Bagel,Muffin,Smoothie', 13, 361, 361);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup', 7, 362, 362);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Burger,Salad,Tea,Salmon', 37, 363, 363);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Juice,Burger,Salad,Soup,Pasta,Latte,Steak,Smoothie', 80, 364, 364);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Bagel,Steak,Pizza,Salad,Soda,Juice,Latte,Muffin', 67, 365, 365);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Bagel', 7, 366, 366);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Soda,Steak,Salmon,Tea,Muffin,Smoothie,Soup,Juice', 59, 367, 367);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Tea,Latte,Bagel,Muffin,Steak,Pizza,Salad', 58, 368, 368);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Soup,Latte,Smoothie,Tea,Steak,Bagel', 40, 369, 369);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Pasta', 12, 370, 370);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pizza,Juice,Burger,Smoothie,Muffin,Tea,Soup,Soda,Steak', 74, 371, 371);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Pizza,Burger,Bagel,Latte,Muffin,Salmon,Steak,Smoothie', 70, 372, 372);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Juice,Latte,Tea,Soda,Pizza,Salmon,Salad', 66, 373, 373);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Tea,Steak,Juice,Smoothie,Bagel,Soup,Soda,Burger,Salmon,Salad', 70, 374, 374);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Bagel,Salad,Latte,Burger,Salmon', 42, 375, 375);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Burger,Bagel,Salad,Pizza,Juice,Smoothie,Tea,Latte', 49, 376, 376);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Tea,Soup,Muffin,Latte,Soda', 29, 377, 377);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Soda,Pasta,Latte,Steak', 42, 378, 378);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Bagel,Latte,Soda,Pizza,Burger,Pasta,Smoothie,Steak', 70, 379, 379);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Soda,Muffin,Smoothie,Bagel,Pizza,Pasta,Burger,Latte,Soup', 72, 380, 380);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Soup,Soda,Steak,Smoothie', 32, 381, 381);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup,Burger,Soda,Salad,Latte,Muffin,Tea', 37, 382, 382);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Smoothie,Pasta,Tea,Bagel,Salmon,Latte,Burger', 60, 383, 383);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Smoothie,Steak', 36, 384, 384);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Smoothie', 21, 385, 385);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Soup,Smoothie,Juice,Tea,Pasta,Burger,Soda', 45, 386, 386);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Muffin,Pasta,Bagel,Soup,Juice,Tea', 35, 387, 387);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salad,Pizza,Soup,Smoothie,Salmon,Steak,Latte', 70, 388, 388);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soup', 7, 389, 389);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Steak,Soup,Muffin,Latte', 31, 390, 390);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Latte,Soup', 27, 391, 391);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Bagel,Muffin,Latte,Tea,Salmon,Juice,Steak,Pasta', 64, 392, 392);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Bagel,Steak,Salmon,Soup,Smoothie,Pizza,Tea,Salad,Pasta', 88, 393, 393);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Juice,Soda,Soup,Pizza,Smoothie,Salad,Muffin,Tea', 44, 394, 394);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Salmon,Pasta,Burger,Latte,Soda,Steak,Soup,Bagel,Pizza,Juice', 83, 395, 395);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Salmon,Muffin,Salad,Bagel', 33, 396, 396);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Smoothie,Salad,Muffin,Soda,Burger,Pasta,Bagel,Latte', 45, 397, 397);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Latte,Salmon,Smoothie,Pizza,Burger,Muffin', 49, 398, 398);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Muffin,Pasta,Bagel,Smoothie,Soup,Salmon,Steak,Pizza,Salad', 81, 399, 399);
insert into FOOD (food_items, price, receipt, identifying_number)
values ('Soda,Soup,Bagel', 10, 400, 400);
commit;
prompt 400 records loaded
prompt Loading GEAR...
insert into GEAR (armor_type, gun_type, gear_id)
values ('Garland', 'Rapaport', 781175803);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Thora', 'Kutcher', 762708704);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Clarence', 'Magnuson', 319604370);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Scott', 'Garr', 931468491);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Paul', 'Ratzenberger', 368516579);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gordie', 'LaSalle', 203130083);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Dan', 'Stone', 991047259);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Wesley', 'Curtis-Hall', 623474619);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Beth', 'Briscoe', 691415264);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Christian', 'Tah', 395051296);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Brooke', 'Sarandon', 852927973);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bryan', 'Cummings', 216606274);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Talvin', 'Wills', 574992427);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cate', 'Johnson', 859280680);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Richard', 'Arquette', 223451987);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mira', 'Dale', 556933675);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mika', 'Magnuson', 801243102);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anna', 'Kravitz', 472419194);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Quentin', 'Warburton', 805448878);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rutger', 'Robinson', 486898882);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Brenda', 'Reinhold', 193564376);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Vincent', 'Mulroney', 951558898);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Dorry', 'McNarland', 217433112);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mia', 'Sanchez', 996664672);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Micky', 'Pearce', 129115012);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hugo', 'Spader', 917985350);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bruce', 'Stoltz', 500153117);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Spike', 'Knight', 411498575);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Andy', 'Carrey', 955569593);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jamie', 'Liotta', 410196403);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mary-Louise', 'Woodward', 687691141);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Etta', 'McCoy', 148004561);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Judy', 'Langella', 113829708);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gabriel', 'Travers', 841549911);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Christopher', 'Kimball', 457176379);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Juliet', 'Heslov', 297014888);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lorraine', 'Ferrer', 193254665);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jake', 'MacDowell', 922852841);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Eric', 'Aglukark', 696173897);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Michael', 'Cross', 515954602);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kelli', 'Bacon', 270974234);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Alec', 'Farina', 995204286);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Melba', 'Thewlis', 551811823);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Miguel', 'Seagal', 338491196);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Balthazar', 'Walker', 811845920);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ming-Na', 'Barnett', 543404897);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Wallace', 'Church', 650709329);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Liquid', 'Rivers', 434281923);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Will', 'Buscemi', 430619276);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Eileen', 'Kershaw', 885245205);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sona', 'Flack', 803767891);
insert into GEAR (armor_type, gun_type, gear_id)
values ('John', 'Caan', 276631270);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gabriel', 'Ryder', 842869733);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Marc', 'Burmester', 956985362);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Claude', 'Jackson', 534888327);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sheena', 'Richter', 500871083);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Robbie', 'Benson', 556264475);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Isabella', 'Ronstadt', 440338782);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Carole', 'Dayne', 197676122);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Liquid', 'Brooke', 461275848);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Merillee', 'Borden', 378722839);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Uma', 'Cromwell', 401272191);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rawlins', 'Quinlan', 669197531);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Katrin', 'Carrington', 619325635);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Balthazar', 'Madonna', 845033741);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sonny', 'Cassidy', 835934579);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cary', 'Huston', 734848963);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Oded', 'Keen', 721129191);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kazem', 'Davies', 688492648);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Patti', 'McCann', 144027567);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Avenged', 'Palin', 503402147);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Vickie', 'Rollins', 246819691);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jill', 'Klein', 309120563);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gilbert', 'Perlman', 874929669);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Alfie', 'Hurley', 516287580);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Elijah', 'Pigott-Smith', 639735649);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Beth', 'Hoskins', 915027557);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Amy', 'McKean', 216886967);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ali', 'Davison', 840178757);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kenneth', 'Englund', 948199480);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Isabella', 'Tomei', 138483323);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hikaru', 'Danes', 624582695);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kasey', 'Keeslar', 156939675);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Stanley', 'Dunaway', 337706222);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lenny', 'Jolie', 453257261);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Blair', 'Plummer', 605398219);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Trace', 'O''Hara', 489998132);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Nicole', 'Bale', 456334913);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Clay', 'Bragg', 144790606);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Pete', 'Feore', 609677936);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hookah', 'Callow', 931207294);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Clive', 'Arthur', 861195123);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gwyneth', 'Hewett', 709763067);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chi', 'Harry', 695310568);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gerald', 'Diehl', 857258048);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rhona', 'Meyer', 738721145);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Leo', 'Lennix', 886616517);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Carole', 'Himmelman', 161939368);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jesse', 'Kahn', 949704640);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kurt', 'Cara', 576626340);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Breckin', 'Mantegna', 843598204);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rufus', 'Rosas', 575113736);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Curtis', 'Gyllenhaal', 457666091);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Emmylou', 'Idle', 370330139);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lucy', 'Blossoms', 675885992);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lauren', 'Reeves', 325694728);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Judge', 'Redford', 167265890);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Seth', 'Barkin', 171670200);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Etta', 'Flatts', 988358139);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Temuera', 'Dillon', 594826988);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kirsten', 'Garza', 966872477);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lorraine', 'Steiger', 912712225);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Vickie', 'Dooley', 965570106);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Frances', 'Studi', 519789573);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Shirley', 'Ponty', 722203001);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kris', 'Barry', 962469929);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Austin', 'Caan', 355500888);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sylvester', 'O''Connor', 981038192);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Curtis', 'Mitchell', 500352861);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Marie', 'Kirshner', 299347667);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Doug', 'Gough', 318631392);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Joan', 'Daniels', 655751347);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Dylan', 'Holeman', 806813527);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Fats', 'Tillis', 107118217);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Johnette', 'Mazar', 118917328);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Zooey', 'Leoni', 608192881);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chalee', 'Robinson', 224541148);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lennie', 'Pride', 227248220);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Angie', 'Suchet', 358219149);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sarah', 'Fisher', 612203439);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Nathan', 'McLachlan', 969138432);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gabriel', 'Washington', 725383778);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Pierce', 'Lennox', 280751508);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Omar', 'Tate', 326133319);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rose', 'Slater', 899212311);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Merillee', 'Sweeney', 554808700);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Oliver', 'Stamp', 299114757);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ricky', 'Trevino', 665529249);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Wayne', 'Pitt', 345969896);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Debby', 'Johnson', 924687916);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hope', 'Cassidy', 418470967);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anne', 'Crowell', 943887557);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Annie', 'Hagerty', 151115197);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Andrae', 'Gaynor', 505908538);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Dorry', 'Gatlin', 760426989);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Curtis', 'Warren', 176786250);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jackie', 'Gracie', 827109138);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Diane', 'Durning', 432331083);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Taye', 'Ermey', 713187039);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bradley', 'Raye', 369708503);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Art', 'Warden', 378855344);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Morris', 'Carter', 380263348);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Marley', 'Speaks', 659537321);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gates', 'Collins', 834870049);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rascal', 'Kinney', 250874217);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jamie', 'Sheen', 533969445);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lari', 'Phillippe', 559225172);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jessica', 'Bracco', 707362980);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Vonda', 'Gallagher', 289027790);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Grant', 'Thomas', 170026490);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chrissie', 'Basinger', 687295249);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Busta', 'Price', 955928450);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mili', 'Tucker', 730857856);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sean', 'Keitel', 918341445);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Pam', 'Hersh', 154945237);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Vanessa', 'Driver', 108670789);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kid', 'Buffalo', 663599890);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Natascha', 'Atkins', 482640628);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Nick', 'Duchovny', 764463597);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Amy', 'Kurtz', 639025517);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Christine', 'Patrick', 613935244);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anna', 'Aaron', 628244362);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hookah', 'Brando', 574811841);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cheech', 'Reno', 882293772);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Blair', 'Withers', 958544124);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Debi', 'Curtis-Hall', 369939296);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Judd', 'Donovan', 479413834);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kathleen', 'Diffie', 678055636);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ray', 'Plummer', 669521854);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Dianne', 'Olin', 417760874);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Adina', 'Michaels', 522714640);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Davy', 'Gayle', 558774875);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Avril', 'Mahood', 233720913);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mary', 'Drive', 163498461);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Teri', 'Watson', 707071382);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Tommy', 'Mohr', 629907579);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Murray', 'Craig', 210081258);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Todd', 'Gill', 215735625);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kevin', 'Lloyd', 566538651);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Julie', 'Palmieri', 111827211);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Laurie', 'Paxton', 614011429);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ted', 'Diggs', 316238082);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chet', 'Ferry', 109110931);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Denise', 'Thewlis', 538878563);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gina', 'Kramer', 242882933);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gabriel', 'Cetera', 695501784);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Brendan', 'Pleasence', 453984566);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lloyd', 'Rush', 535873119);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Franz', 'Irons', 681700409);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Oliver', 'Whitman', 750273676);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Johnny', 'Brickell', 915401751);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Toshiro', 'McLachlan', 917338317);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hex', 'McCabe', 153010076);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Tcheky', 'Cumming', 850857605);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mary-Louise', 'Withers', 309639062);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Wesley', 'Easton', 379833230);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Brad', 'Maxwell', 400108965);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Murray', 'Platt', 711017879);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jaime', 'Wilkinson', 586703006);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Thomas', 'Tilly', 982643141);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Richie', 'Busey', 517617421);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Charlie', 'Visnjic', 578292995);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bette', 'Taha', 313295116);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Geoff', 'Hawkins', 537165531);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Demi', 'McLean', 468477402);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rory', 'Fonda', 927532008);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Solomon', 'Holiday', 858609063);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Malcolm', 'Soda', 550299971);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jesus', 'Wells', 351439044);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Buddy', 'Jones', 165466073);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Merrilee', 'Jessee', 659522315);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Charles', 'Ward', 992154421);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Leslie', 'Heche', 608098023);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anjelica', 'McFerrin', 879127626);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rutger', 'Saxon', 866744809);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rhona', 'Harper', 183380438);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Tom', 'Hedaya', 483546182);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ed', 'Henstridge', 285929734);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Peabo', 'Baldwin', 898487171);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cledus', 'Whitford', 322449781);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Nancy', 'Heatherly', 379697950);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mitchell', 'Arjona', 168218099);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Angie', 'Marley', 453210957);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Xander', 'Crosby', 498184934);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Nickel', 'Santa Rosa', 465355040);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Emmylou', 'Beck', 700108211);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ralph', 'Ermey', 458023431);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Frank', 'Cross', 657856030);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Judy', 'Gambon', 732071927);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ben', 'Remar', 399420166);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Illeana', 'Hackman', 154279368);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jason', 'Herndon', 626156675);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kevn', 'Tomei', 709884607);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Victoria', 'Redford', 362523636);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Nelly', 'Beckham', 346952393);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Allan', 'Hutton', 995371193);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Albertina', 'Levin', 881965141);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Elias', 'Weiland', 364905495);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Fiona', 'Haynes', 569338353);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jet', 'Willis', 332045760);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Debi', 'Pierce', 862264471);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Carl', 'Miles', 735272605);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kelli', 'Lange', 639653214);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Javon', 'Murphy', 470475959);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Merle', 'Robards', 425206029);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Pam', 'Kane', 736002250);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Loretta', 'Moss', 211087995);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Melba', 'Benson', 388323234);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rosanne', 'Rippy', 701492622);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mel', 'Moreno', 607752739);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ian', 'Cheadle', 941883227);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Roy', 'Stevens', 784672748);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lizzy', 'Russo', 379089095);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Carolyn', 'Pepper', 261046651);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kay', 'England', 836985453);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jason', 'Benoit', 305845154);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sinead', 'Dunst', 873443277);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kyle', 'Whitaker', 422639247);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rob', 'Brando', 237848249);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Talvin', 'Bentley', 589274768);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mary-Louise', 'Connery', 456007716);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Colleen', 'Wiest', 569484536);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Harvey', 'Cummings', 461940282);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Donald', 'Lovitz', 620766649);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cornell', 'Kelly', 755124683);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bill', 'Payton', 808111489);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Don', 'Conley', 618522898);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hex', 'Masur', 725445084);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gene', 'Zappacosta', 668336963);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Martin', 'Benoit', 682222925);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bernie', 'Idol', 152259740);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Frederic', 'Wakeling', 737705982);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sinead', 'Snow', 650186931);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Albertina', 'Postlethwaite', 716329537);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ali', 'Gershon', 491220901);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Harrison', 'Mac', 520485673);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Holland', 'Stoltz', 964566404);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Brittany', 'Borgnine', 128231585);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Harris', 'Quatro', 300844103);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Tara', 'Chinlund', 429158612);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Marianne', 'Platt', 215679774);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ricardo', 'Charles', 568160739);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Martha', 'Vassar', 670415411);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chanté', 'Carrey', 440376493);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Henry', 'Peet', 696682926);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Faye', 'Plowright', 767394585);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anthony', 'de Lancie', 783631977);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Denzel', 'Sarandon', 491161262);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gran', 'Holliday', 320060434);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Taylor', 'Shelton', 504156280);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Avril', 'Cetera', 849809317);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Leonardo', 'Keener', 298564543);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rueben', 'Sirtis', 618803541);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Wade', 'Perlman', 119611867);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rupert', 'Carnes', 497295612);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Suzi', 'Ingram', 755205972);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Elias', 'Colman', 232451416);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Eugene', 'Gano', 941777746);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Val', 'Kidman', 855655555);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Andie', 'Krieger', 221002926);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lena', 'Adler', 217058199);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chuck', 'Payne', 500150802);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Christina', 'King', 778186211);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Samantha', 'Lloyd', 856404171);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Vickie', 'Giamatti', 943148321);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Pelvic', 'Chan', 938873687);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ivan', 'Farris', 381327425);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anita', 'McAnally', 767439909);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gil', 'MacNeil', 270722605);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jamie', 'Hatchet', 661247757);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Patty', 'Warwick', 102529246);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Viggo', 'Cross', 157900733);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Buddy', 'Griffiths', 215377657);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jill', 'Donovan', 663406175);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rhona', 'Horton', 803138898);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Diane', 'Womack', 408957989);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Trey', 'Johansen', 744601026);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Anne', 'Woodard', 539959655);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ted', 'Rubinek', 767869768);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Clea', 'Soda', 431538042);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Geoff', 'Dalley', 968304655);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Laurence', 'Winger', 769427375);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Crispin', 'Shandling', 977414934);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Bradley', 'Branch', 261762953);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Hank', 'Roundtree', 312659107);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Keith', 'Weisberg', 212265538);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Shannon', 'Palmieri', 555767722);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Carole', 'Marie', 494770055);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ike', 'Holland', 591291078);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rawlins', 'Condition', 479306098);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Saul', 'Ferrer', 518811791);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Billy', 'Janssen', 777222943);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Julio', 'Rifkin', 212906683);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ruth', 'Byrd', 253418130);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Madeline', 'Singh', 875743256);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jarvis', 'Garcia', 803826363);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Phoebe', 'Nivola', 789403034);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Charles', 'Paymer', 672204369);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Don', 'Fiorentino', 659887337);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Juliette', 'Pfeiffer', 288157516);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Willie', 'Hidalgo', 733530589);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Betty', 'Allen', 804545398);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rod', 'Atlas', 790472038);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Johnny', 'Biehn', 903126255);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Freddy', 'Taylor', 160168790);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Patrick', 'Coltrane', 278803990);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Buddy', 'Sarandon', 891921364);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Powers', 'Delta', 811376707);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Lennie', 'Pantoliano', 230277477);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Shirley', 'Nielsen', 245502116);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Javon', 'Presley', 322230564);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Reese', 'King', 530942780);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Miki', 'Capshaw', 101586584);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Juice', 'Culkin', 382283099);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cloris', 'Clark', 386985903);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gena', 'Paymer', 406470094);
insert into GEAR (armor_type, gun_type, gear_id)
values ('John', 'Diddley', 275086623);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Alice', 'Lang', 673971429);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Carl', 'Esposito', 440591474);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Wade', 'Pepper', 781316808);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Joan', 'Milsap', 651382437);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Boz', 'Peniston', 725542736);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rosco', 'Chapman', 601265531);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Colm', 'Farris', 890845856);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jean-Luc', 'Robinson', 735972745);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Crystal', 'Scorsese', 390816412);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Kenny', 'DeVita', 631368862);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Debi', 'Romijn-Stamos', 822221093);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Deborah', 'Reynolds', 657517965);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ty', 'Moraz', 324683402);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Javon', 'Wiedlin', 959627688);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rosanna', 'Weir', 311019840);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Rich', 'Sevigny', 988158813);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mary Beth', 'Farris', 391681634);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Emma', 'McDowall', 346813591);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Geena', 'Webb', 969974341);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Jeroen', 'Karyo', 479948193);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Chubby', 'Burstyn', 388731624);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Mary', 'Haggard', 221442985);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ryan', 'Dillane', 770154621);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ving', 'D''Onofrio', 956458859);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Tea', 'Arkin', 564844721);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Adrien', 'Culkin', 737058603);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gilberto', 'Rock', 419905261);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ted', 'Cattrall', 923629366);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Meryl', 'Reilly', 545616519);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Gates', 'Schneider', 827655524);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Cameron', 'Buckingham', 111848564);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Ethan', 'Def', 188910795);
insert into GEAR (armor_type, gun_type, gear_id)
values ('Sigourney', 'Reeves', 895317919);
commit;
prompt 400 records loaded
prompt Loading PERSONAL_INFO...
insert into PERSONAL_INFO (address, phone_number, email)
values ('7P8 7C1', '536359279', 'cates@abatix.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2298', '536519815', 'w.dzundza@signalperfection.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30297', '538627138', 'mickeyk@gna.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15315', '532575001', 'debra@americanvanguard.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1648', '530553860', 'jhersh@nha.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39771', '530626715', 'geraldh@nhr.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4390', '532102815', 'night.vicious@jma.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36134', '535208744', 'jet@smg.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36389', '536680280', 'cece@jlphor.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16231', '539119817', 'mindy.crimson@trc.dk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15887', '532145736', 'fisher@dillards.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13786', '539601284', 'n.rucker@ultimus.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15647', '530878034', 'danni.danger@woronocobancorp.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8476', '534543703', 'mcaviezel@ipsadvisory.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11145', '539411393', 'patti.hyde@pearllawgroup.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5310', '533488874', 'peter.ricci@ceb.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25807', '534740622', 'stellan.pollack@caliber.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8749', '533417514', 'rosanne.shannon@egroup.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31804', '538851007', 'lin.k@ivci.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2W8 6O1', '534501042', 'maura.n@fmt.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8926', '535245994', 'alana.hanks@signalperfection.se');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9313', '532215442', 'pherndon@montpelierplastics.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16457', '532715079', 'linda.cumming@pearllawgroup.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16646', '531601282', 'leslie.arkenstone@evergreenresources.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38172', '533926002', 'ellec@doctorsassociates.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2X8 0O9', '538554231', 'giovannia@printingforlesscom.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6468', '535786267', 'marden@woronocobancorp.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('34582', '532635955', 'adam.m@aoe.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29784', '539197564', 'hal.daniels@kingland.fi');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3P1 0X2', '539009310', 'nikka.bacon@directdata.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35991', '537484307', 'moe.ifans@stonebrewing.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9485', '531556679', 'hsummer@serentec.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('21381', '538419385', 'vivica.marsden@peerlessmanufacturing.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16305', '538750239', 'brothers.vance@johnson.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3533', '530360488', 'bobby.hartnett@oriservices.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10037', '535733442', 'h.rourke@advancedneuromodulation.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9999', '536587229', 'brenda.heatherly@dbprofessionals.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8044JE', '530970781', 'carolyn.griffin@bradleypharmaceuticals.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40277', '530364944', 'halle.d@prometheuslaboratories.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6637', '536982267', 'buffy.martin@terrafirma.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26628', '533663234', 'guy.harper@signalperfection.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30936', '539994509', 'wally.r@msdw.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('37902', '535839402', 'v.levin@verizon.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('37836', '538021025', 'toni.akins@nexxtworks.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20953', '532258994', 'terrence.d@cis.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40586', '532781118', 'alfiec@caliber.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('34419', '536819050', 'mrudd@tmaresources.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3Y2 2Z9', '531427421', 'vivica.zane@chipssolutions.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35567', '535144823', 'nkoyana@activeservices.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1S4 7H9', '531764369', 'm.stevens@healthscribe.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36443', '536860466', 'stockardb@lms.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9384', '534993864', 'madeleinek@ceb.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27468', '539494561', 'cary.thomas@bestbuy.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29279', '536946863', 'nicole.kudrow@diamondtechnologies.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4069', '535893609', 'cece.pepper@mms.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1572', '532143437', 'miles@lloydgroup.tw');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28535', '531694270', 'rowan.frakes@tigris.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9H8 1N3', '531959351', 'lari.whitman@inzone.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16296', '538889519', 'alicia.s@dbprofessionals.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35698', '530473818', 'daryle.lovitz@integratelecom.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20868', '532306060', 'jarvis.gano@cardinalcartridge.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39683', '537742413', 'cdonofrio@mosaic.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23347', '536176634', 'rickyc@nmr.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20100', '533637886', 'brent.wilder@kingston.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22553', '536133507', 'alessandro@priorityexpress.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13650', '534083365', 'd.snider@ivci.pt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33454', '532066280', 'cherry.d@tastefullysimple.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36495', '535350436', 'melba.todd@visionarysystems.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22047', '532780207', 'gaby.davidtz@verizon.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31230', '532896127', 'desmond.aglukark@microtek.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26800', '533366830', 'cmcginley@sfgo.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9543', '537828436', 'vondie.luongo@montpelierplastics.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35215', '538555151', 'illeana@americanvanguard.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9D1 9S9', '534174087', 'gary.wopat@perfectorder.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1P9 4Y0', '535676321', 'ahmad@base.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('18018', '536853306', 'dmacy@hudsonriverbancorp.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28761', '531320992', 'liam.wainwright@conquestsystems.hu');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24463', '535009442', 'casey.difranco@gentrasystems.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15658', '536625785', 'cameron@sds.za');
insert into PERSONAL_INFO (address, phone_number, email)
values ('17856', '531124169', 'nikki.sellers@digitalmotorworks.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29848', '530206054', 'stanley.gaynor@slt.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29800', '532741911', 'loren.brosnan@aventis.se');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27513', '537015997', 'nicholas.f@netnumina.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7Q7 9M9', '532149124', 'thomasc@studiobproductions.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1527', '538263523', 'r.speaks@trafficmanagement.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5Z5 0U4', '532528726', 'sonny.tsettos@gra.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13572', '532452791', 'george@accessus.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10809', '531851116', 'emollard@fsffinancial.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29758', '536525677', 'aharnes@prosum.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36726', '532074392', 'cmay@fmi.cy');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39637', '539002808', 'roy.witherspoon@knightsbridge.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('19517', '539943439', 'rutger.hatosy@netnumina.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31522', '538366259', 'burton.hurt@hps.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31771', '532863999', 'rascal.spacey@conquest.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24258', '535540140', 'dorry.cruz@lloydgroup.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33210', '539562266', 'marylouise.cartlidge@gillani.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3S6 5H2', '531354291', 'nora.w@spectrum.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6860', '537287970', 'brooke@solutionbuilders.be');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40302', '535740372', 'giovanni.posener@merck.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2101', '537037527', 'm.mills@aquickdelivery.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6717', '530898984', 'murray.saxon@abatix.li');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39706', '536217600', 'helen.c@aristotle.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('14055', '532583764', 'preubens@fmb.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25196', '531478470', 'sheena.pantoliano@trusecure.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30077', '539740254', 'patrick.benet@mindiq.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31488', '535164136', 'gvaughan@contract.cn');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8Z4 5V3', '536654696', 'w.shepherd@ctg.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26014', '539556433', 'dom.rio@data.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4W6 4C0', '538626842', 'kmccready@circuitcitystores.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1605', '534677629', 'buffy.rodriguez@saltgroup.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28196', '536020063', 'sgriggs@mre.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10925', '538830110', 'robert.w@arkidata.es');
insert into PERSONAL_INFO (address, phone_number, email)
values ('21492', '534703725', 'jonny.minogue@unit.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('18362', '532693445', 'regina.paige@sfmai.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27229', '539566983', 'goldie.clinton@computersource.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5975', '532787441', 'geena.w@wci.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39819', '537857097', 'l.martinez@gcd.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11619', '530896666', 'heathr@spectrum.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('34332', '531062013', 'danny.askew@intel.lt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4X6 2N8', '530109419', 'jesus.caan@stiknowledge.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23196', '537774173', 'sam.carrere@keymark.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9798YQ', '534859721', 'johnette.berkoff@dbprofessionals.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35177', '536966344', 'queen.boyle@printcafesoftware.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7H5 1F9', '535231563', 'j.davison@gagwear.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40637', '539809307', 'brent.arnold@dsp.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25722', '539990765', 'g.barry@wellsfinancial.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13786', '534900051', 'tramaine.lonsdale@aldensystems.hu');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23824', '538124887', 'julio.close@morganresearch.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15052', '537711932', 'cloris.cheadle@americanhealthways.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38904', '531661327', 'l.carlton@sourcegear.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2T4 0Q1', '531330276', 'toshiro.roundtree@mission.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2504', '530057706', 'f.heald@target.au');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2864', '531127749', 'morris.krumholtz@gateway.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26664', '533347394', 'raul.kravitz@chhc.se');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26317', '530800763', 'whoopi.s@trekequipment.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4507', '531281568', 'paul.mcintosh@coadvantageresources.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4232', '536733168', 'tamala.affleck@universalsolutions.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6429', '533418877', 'hope@volkswagen.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('12344', '536503310', 'april.ryder@carboceramics.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24830', '538428492', 'caroline.johnson@shar.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26049', '535326584', 'dylan@mindworks.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30464', '539899380', 'pelvic.macdowell@saralee.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31419', '536783116', 'johnnie.wine@horizonorganic.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2473', '538195033', 'ninar@terrafirma.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('34998', '532104871', 'juliette.tempest@hiltonhotels.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31959', '537314547', 'pamela.spall@operationaltechnologies.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4607', '532497649', 'jgallagher@spenser.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10950', '539554324', 'terrik@infopros.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15210', '537132620', 'mindy.connelly@adeasolutions.dk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29982', '530433422', 'charlize.g@ptg.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1342', '536594956', 'jodie.saucedo@ufs.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11084', '538373557', 'g.kenoly@codykramerimports.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6483GD', '536105286', 'mark.w@waltdisney.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20352', '537451318', 'bridget.hall@montpelierplastics.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9748', '534215157', 'michelle.foster@quakercitybancorp.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8877', '536549800', 'jeffery.shocked@data.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('17715', '536458121', 'wdolenz@amerisourcefunding.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7898', '531910950', 'matthew.swank@fns.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('12770', '533506677', 'heather.solido@kimberlyclark.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5B5 2Q0', '536314927', 'jjackson@gillette.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3R8 8K1', '534624249', 'cornell@americanexpress.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4F2 9V0', '530988023', 'eugene@morganresearch.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('34458', '530574898', 's.nugent@ultimus.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39856', '536939397', 'omar.minogue@americanland.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29468', '533187846', 'guy.sinatra@progressivemedical.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2168', '535889865', 'lin.oconnor@telwares.hu');
insert into PERSONAL_INFO (address, phone_number, email)
values ('21794', '534147067', 'ndelancie@pra.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6458', '530422233', 'daniel.t@spas.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6D5 9I3', '533028576', 'sarah.kurtz@bigdoughcom.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9329', '536161418', 'susanr@dbprofessionals.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('19214', '531883110', 'buddy.mitra@kellogg.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20031', '533403509', 'chet.cartlidge@chipssolutions.pl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33438', '530445943', 'r.gleeson@3tsystems.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5092', '539379627', 'fmacy@sms.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24946', '531315717', 'm.moraz@sci.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40568', '533943518', 'jonm@kwraf.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16604', '533330969', 'mykelti@accucode.th');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9T3 2E6', '530696561', 'kbyrne@aci.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35018', '539933732', 'kim.mellencamp@quicksilverresources.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1519', '533664399', 'nathan.holy@printcafesoftware.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4B5 0Z5', '534962180', 'alicia.esposito@astute.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('17365', '533451053', 'dwong@creditorsinterchange.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13607', '534468917', 'charlesb@wellsfinancial.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38597', '537553593', 'charlie@bradleypharmaceuticals.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26142', '532080673', 'jim@harrison.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35721', '538154039', 'davy.blades@solipsys.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6386', '536726717', 'tym@angieslist.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13895', '534442449', 'gates.popper@qas.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13171', '530566278', 'al18@innovativelighting.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('21859', '538895511', 'jmarie@yes.se');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15909', '533792097', 'eugene.coverdale@grt.es');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33084', '536870854', 'j.allan@thinktanksystems.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16400', '539341331', 'austin.lee@nha.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24718', '534830185', 'powersg@pscinfogroup.dk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11369', '533585607', 'leslie@spd.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3042', '530681069', 'c.ricci@prosum.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11364', '535086098', 'hazel.mcdormand@fns.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1170', '535752445', 'rachid@diamondgroup.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('34153', '539046012', 'e.senior@multimedialive.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9L0 6D3', '533295403', 'bob.balaban@hfn.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38939', '534795101', 'eddie.t@pioneerdatasystems.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13255', '530863842', 'max.bratt@credopetroleum.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10319', '532438113', 'ricardo.raye@aoe.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28104', '532622294', 'sean.santarosa@accesssystems.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11055', '537532068', 'rita.k@arkidata.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35166', '538177049', 'miguel.elizabeth@diageo.pt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7W1 0L6', '535297001', 'marlon.f@conquest.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('21502', '537075192', 'b.english@voicelog.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23680', '534078524', 'holland.b@viacell.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4097', '535394978', 'julie.hartnett@aventis.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('37538', '533452802', 'buffy.eastwood@palmbeachtan.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25116', '531283878', 'roberta.mcdowell@coldstonecreamery.es');
insert into PERSONAL_INFO (address, phone_number, email)
values ('12139', '533391906', 'isaac.uggams@cowlitzbancorp.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('17694', '532996790', 'sal.tempest@directdata.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40298', '532629409', 'nicolas@owm.cr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22280', '534210530', 'kim.heston@pra.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4771', '534588262', 'charlie.rickles@marsinc.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26587', '537762116', 'wayman.duchovny@career.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7030', '532203518', 'gladys.geldof@inzone.be');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24956', '537360919', 'lindsey.affleck@topicsentertainment.au');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28284', '535870790', 'kenny.phoenix@portageenvironmental.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4846MU', '538389533', 'adrien@hotmail.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9219', '530597587', 'pelvic.d@unilever.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30888', '536909845', 'rolandom@businessplus.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16249', '536592127', 'sam.coward@at.pl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24672', '530418797', 'hrundgren@limitedbrands.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5272', '530288264', 'rodney@ibm.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38543', '533618420', 'frankr@daimlerchrysler.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28196', '537344788', 'ozzy.hedaya@quicksilverresources.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6284', '532392489', 'christopher@esoftsolutions.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13961', '532460760', 'maureen.favreau@formatech.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2009XA', '532528545', 'thomas.utada@gha.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11570', '532083490', 'stephanie.neville@palmbeachtan.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4K3 6L6', '536160158', 'frederic.devita@dsp.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2258', '531874959', 'r.stiles@restaurantpartners.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3411', '537141199', 'pamela.baker@bashen.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5857', '537885427', 'j.shepherd@meritagetechnologies.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('14676', '531910414', 'stanley.sarandon@solipsys.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36202', '532465849', 'harrison.cube@granitesystems.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3468', '539337395', 'robbyw@gulfmarkoffshore.id');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38028', '537302626', 'lynettem@aristotle.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('13050', '537055136', 'dennis.conners@atlanticnet.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9H6 2T9', '532006348', 'gquinones@campbellsoup.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31856', '532001016', 'lennie.eckhart@cascadebancorp.se');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35350', '534345009', 'seth.rains@capstone.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25591', '534925671', 'ripl@providentbancorp.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8Y6 5K1', '532775620', 'c.berkoff@pearllawgroup.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2050', '530442051', 'jessica.keaton@microtek.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11747', '535551459', 'hpatillo@bowman.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20763', '534284901', 'pete.p@montpelierplastics.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7329', '539221103', 'mindy.phillips@chhc.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15381', '531400407', 'jose.makeba@novartis.be');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2A6 0J1', '531714622', 'crispin@privatebancorp.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('19949', '538744918', 't.mccann@healthscribe.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('32066', '537159592', 'saffron@kmart.se');
insert into PERSONAL_INFO (address, phone_number, email)
values ('32703', '539871135', 'johnette.murdock@ivci.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15090', '539906432', 'carol.ceasar@dynacqinternational.pt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5I5 9M1', '531227462', 'dstone@mcdonalds.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('12150', '536797922', 'jodie.dern@viacom.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25560', '531128030', 'thelmam@paisley.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28305', '534216956', 'marybethw@parker.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29059', '536075933', 'g.stone@nsd.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26782', '533447551', 'jmcgill@pscinfogroup.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29494', '533761432', 's.chestnut@gateway.dk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39365', '538929152', 'bo.detmer@hersheyfoods.es');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9N3 7U6', '530568503', 'pfarrell@sis.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2343', '532836735', 'joshua@mds.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5302', '535578896', 's.quatro@nestle.il');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9N4 1U1', '539485186', 'burton.gary@virbac.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8M9 7P1', '539759533', 'h.benoit@nha.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('19872', '535068939', 'bdorn@ccb.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7889', '532829331', 'davey@boldtechsystems.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('0B1 2N9', '536492762', 'adina.bragg@eagleone.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('32189', '536825728', 'bette@sony.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29667', '533612624', 'tracy.jonze@signature.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6973', '532127075', 'parker.lindley@dynacqinternational.es');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1Z4 6Q1', '534415071', 'jesus.ramirez@mattel.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8315', '531615404', 'k.rucker@biosite.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('37927', '536310044', 'sigourney.vandamme@securitycheck.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26393', '534132088', 'tea.g@nmr.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2496', '534350567', 'irene.nolte@fmt.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10109', '530863511', 'busta.paige@esteelauder.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26923', '535998802', 'lari@shufflemaster.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25057', '536953321', 'fiona.mould@fmt.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('32565', '539486991', 'loretta@hudsonriverbancorp.dk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6644', '535398015', 'joy.thompson@oriservices.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4373', '531345003', 'collin.murray@creditorsinterchange.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6139', '532270603', 'richard.dolenz@chipssolutions.ht');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3N7 0X9', '539138001', 'fmcgovern@investmentscorecard.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2611', '531031805', 'sherylh@sms.in');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36541', '534308584', 'neve.cage@walmartstores.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9766', '538919287', 'harriet.moraz@tilsonhr.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4238', '532475396', 'chaka.vassar@elitemedical.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39890', '538364304', 'b.baker@qssgroup.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5168', '531554530', 'marybeth.b@comnetinternational.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1664', '536958498', 'rod.stallone@tama.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3194', '537876021', 'curtis.michael@cynergydata.pt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29239', '534227964', 'tramaine.skerritt@baesch.in');
insert into PERSONAL_INFO (address, phone_number, email)
values ('17204', '533536177', 'vincent.mahood@creditorsinterchange.il');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27377', '530502678', 'mike.wilson@aoe.no');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38212', '532844612', 'jeroen.akins@seiaarons.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38699', '533199173', 'irene.tripplehorn@gillette.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6C7 1J8', '538872326', 'luke.reilly@aquickdelivery.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3127', '539554104', 'lindsey@marketfirst.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15111', '530612508', 'lidol@carboceramics.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15626', '531175714', 'teri@fpf.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('14986', '536042736', 'lydia.woodard@progressivedesigns.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9751HI', '534176812', 'jackiec@apexsystems.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25216', '534001996', 'madeleines@techrx.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('12665', '533788470', 'jeff@ogi.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27768', '535163131', 'dar.berenger@timberlanewoodcrafters.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11369', '534400894', 'bustaf@ach.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6M3 2W8', '533161926', 'raul.botti@pioneerdatasystems.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30424', '536302023', 'rose@perfectorder.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35441', '539088616', 'gladys.tomei@sysconmedia.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40068', '531502627', 'embeth@younginnovations.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33234', '539764604', 'rawlins.diggs@kramontrealty.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4827', '538109133', 'adrien.d@vspan.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9F8 1V0', '531818898', 'philip@gateway.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('37941', '535456368', 'will.marley@deutschetelekom.ve');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27882', '538823831', 'malcolm.palmieri@allstar.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4386', '531490743', 'mgilley@consultants.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35248', '533714123', 'mia@randomwalk.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('15291', '532448737', 'suzannes@microtek.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7S6 3V1', '537576336', 'ewan.moss@conquest.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22985', '537082440', 'spike@onesourceprinting.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27591', '533273414', 'peabo.gunton@talx.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('14248', '536756941', 'brendans@accessus.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('26218', '538231723', 'kay.jackman@netnumina.no');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22804', '535009932', 'fisher.eckhart@asa.br');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23556', '538922386', 'donald.forster@volkswagen.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('25142', '537647955', 'joy.cobbs@greenmountain.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1843', '535787086', 'roger.ruiz@nsd.lt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33093', '533657417', 'rachael@alohanysystems.at');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3149', '533110954', 'tilda.simpson@hospitalsolutions.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('35077', '536864889', 'davis.stevenson@tastefullysimple.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6L1 3B1', '531384095', 'n.gertner@extremepizza.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31106', '537239687', 'queenl@carboceramics.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('19472', '533283024', 'geggy@royalgold.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24698', '539856383', 'l.pesci@ach.pt');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24865', '535555392', 'howie.smurfit@carboceramics.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('36322', '534943196', 'adrien.dicaprio@ultimus.jp');
insert into PERSONAL_INFO (address, phone_number, email)
values ('37090', '539629086', 'edie.nunn@ubp.ar');
insert into PERSONAL_INFO (address, phone_number, email)
values ('39715', '539898546', 'penelope.head@microtek.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4950', '539006102', 'lucinda@fds.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5937MV', '531168576', 'jill.dean@atlanticnet.nl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('8T0 0B2', '533183931', 'nina.ratzenberger@abs.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30533', '536222102', 'miles.leigh@pra.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('32726', '531216529', 'eric.bedelia@paintedword.pl');
insert into PERSONAL_INFO (address, phone_number, email)
values ('40654', '539488601', 'paul.dern@mindworks.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22182', '535613648', 'kasey.finn@yumbrands.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30508', '533405730', 'j.newton@allegiantbancorp.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('18698', '539355730', 'milla.green@ciwservices.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3895', '533692843', 'rich.redgrave@shirtfactory.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33848', '537303277', 'rachael.hauser@stm.no');
insert into PERSONAL_INFO (address, phone_number, email)
values ('18639', '537374741', 'eshannon@nissanmotor.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20031', '538181763', 'owen.d@voicelog.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5170', '538215644', 'kenneth.rapaport@ultimus.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('2492', '535458382', 'vivica.s@ctg.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('1863', '535214211', 'belinda.epps@prosum.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22493', '535638310', 'coleyd@americanvanguard.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('29869', '534364153', 'christina.lonsdale@montpelierplastics.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16205', '538969555', 'austin.leigh@tama.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('30188', '534123371', 'clive.h@capellaeducation.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23776', '531829061', 'murray.l@usdairyproducers.es');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5G5 9R5', '538313853', 'jake.kirshner@deutschetelekom.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3218', '535916111', 'ruth.brooks@johnson.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('32757', '538324324', 'bblaine@componentgraphics.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28108', '533021183', 'clint.banderas@amerisourcefunding.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('23324', '535050497', 'sean.mccain@sht.be');
insert into PERSONAL_INFO (address, phone_number, email)
values ('0K4 1Y1', '530149999', 'rhona.hawkins@meridiangold.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('14103', '534051940', 'carole.mitra@palmbeachtan.at');
insert into PERSONAL_INFO (address, phone_number, email)
values ('0M4 7F7', '539101442', 'n.winwood@ceom.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7M8 0X0', '535826927', 'nancy@hiltonhotels.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('28370', '539900074', 'jonnylee.mcginley@insurmark.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('33012', '536045030', 'celiap@electricalsolutions.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('38815', '537729969', 'richard@americanexpress.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('5953', '530214472', 'jeremy@sfgo.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20625', '535969551', 'lynn.steenburgen@webgroup.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9526', '532355555', 'svanshelton@target.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('3I5 3R9', '531693540', 'cece.schwimmer@creditorsinterchange.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('31407', '534063736', 'vmcpherson@americanhealthways.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9648', '536686821', 'l.matarazzo@procter.dk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('7947', '534736079', 'm.hedaya@sbc.de');
insert into PERSONAL_INFO (address, phone_number, email)
values ('17801', '530414372', 'ben.marshall@astafunding.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('12544', '534600512', 'jody.cherry@deutschetelekom.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('6M2 8T1', '531210525', 'marina.jay@ccb.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('22441', '530517617', 'leonardo.l@ntas.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9H3 3N8', '534849016', 'gina.banderas@esteelauder.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('4H7 5G3', '532796638', 'jmoss@at.ca');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20050', '533237759', 'jamie.richter@ptg.ch');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11390', '530922703', 'tom.c@genghisgrill.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11750', '538804908', 'marc.borden@chipssolutions.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('27000', '536210601', 'lydia.franklin@aventis.hu');
insert into PERSONAL_INFO (address, phone_number, email)
values ('16186', '532014907', 'fbruce@gdatechnologies.com');
insert into PERSONAL_INFO (address, phone_number, email)
values ('20773', '532940389', 'winona.holmes@logisticare.it');
insert into PERSONAL_INFO (address, phone_number, email)
values ('11519', '531491418', 'lindsay.weisz@kimberlyclark.fr');
insert into PERSONAL_INFO (address, phone_number, email)
values ('9P8 4N1', '530640076', 'slaws@vitacostcom.uk');
insert into PERSONAL_INFO (address, phone_number, email)
values ('10862', '530421723', 'mira.l@linacsystems.za');
insert into PERSONAL_INFO (address, phone_number, email)
values ('24948', '537455459', 'burton.chandler@aquascapedesigns.fr');
commit;
prompt 400 records loaded
prompt Loading POSITION...
insert into POSITION (role_id, role_name, description)
values (776038542, 'iridium', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (666947055, 'rhenium', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (789574198, 'bismuth', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into POSITION (role_id, role_name, description)
values (333920779, 'antimony', 'Biostar Mini BareBone PC > iDEQ 200N.');
insert into POSITION (role_id, role_name, description)
values (231594698, 'titanium', 'CyberPower Surge Protector 850 with 8 Outlet.');
insert into POSITION (role_id, role_name, description)
values (676221307, 'erbium', 'Headset with Mircophone.');
insert into POSITION (role_id, role_name, description)
values (487831062, 'zinc', 'Logitech Cordless Elite Duo Optical Kit(KB/MS)');
insert into POSITION (role_id, role_name, description)
values (766570814, 'neptunium', 'Biostar M7VKQ Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.');
insert into POSITION (role_id, role_name, description)
values (657255818, 'calcium', 'AMD XP 2000+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (667230265, 'nobelium', 'Allied 400watt Powersupply; Intel and AMD approved.');
insert into POSITION (role_id, role_name, description)
values (550013332, 'zinc', 'Intel Pentium4 2.0ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (714846100, 'ytterbium', 'ATX 300W High Quality Switching Power Supply');
insert into POSITION (role_id, role_name, description)
values (637591666, 'plutonium', '128Mb SDRAM PC133 Micron;Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into POSITION (role_id, role_name, description)
values (633923938, 'calcium', 'Intel P4 2.4G BareBone System W/ Free Mouse.');
insert into POSITION (role_id, role_name, description)
values (986058697, 'krypton', 'Intel Pentium4 2.0ghz & Gigabyte 8IE533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (219273529, 'silicon', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan');
insert into POSITION (role_id, role_name, description)
values (152892297, 'indium', '6072-1 case with side window 400W Powersupply.');
insert into POSITION (role_id, role_name, description)
values (741148104, 'thallium', '312D ATX color case translucent blue(No PowerSupply).');
insert into POSITION (role_id, role_name, description)
values (200297628, 'lutetium', 'Microsoft Office XP Small Business Edition');
insert into POSITION (role_id, role_name, description)
values (272211428, 'tin', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (554174162, 'carbon', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).');
insert into POSITION (role_id, role_name, description)
values (169157246, 'californium', '512MB DDR PC2700 Kingston(KVR333X64C25/512)');
insert into POSITION (role_id, role_name, description)
values (349320800, 'antimony', 'AMD XP 2200+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (870028514, 'osmium', '313K 300W P4/AMD and 2 Front USB.');
insert into POSITION (role_id, role_name, description)
values (429299490, 'chlorine', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001');
insert into POSITION (role_id, role_name, description)
values (747287649, 'curium', 'KIT with Mistumi Internet Keyboard & Optical Mouse & 54X CDrom to match Black case .');
insert into POSITION (role_id, role_name, description)
values (244866060, 'holmium', 'Gigabyte GA-8IE533 Intel®845E Chipset');
insert into POSITION (role_id, role_name, description)
values (992724258, 'cerium', '312B ATX Case with 250W P4/P3/AMD PS.');
insert into POSITION (role_id, role_name, description)
values (199271455, 'cobalt', 'Mitsumi optical mouse.');
insert into POSITION (role_id, role_name, description)
values (259603153, 'iridium', 'Maxtor 40Gb ATA100 5400rpm H/D');
insert into POSITION (role_id, role_name, description)
values (453287420, 'iron', 'CyberPower 525VA(525SL)');
insert into POSITION (role_id, role_name, description)
values (356303152, 'oxygen', 'Logitech Smart Click 310 Camera');
insert into POSITION (role_id, role_name, description)
values (608767626, 'plutonium', 'Epson Stylus C42UX - C11C482001.');
insert into POSITION (role_id, role_name, description)
values (130326060, 'americium', 'LG 52x24x52x CD-RW (OEM).');
insert into POSITION (role_id, role_name, description)
values (468168585, 'europium', 'Biostar Mini BareBone PC > iDEQ 200S.');
insert into POSITION (role_id, role_name, description)
values (308215380, 'europium', 'Antec Plus 660 ATX Mid tower 330w Power Supply');
insert into POSITION (role_id, role_name, description)
values (299974190, 'praseodymium', 'LG 32x10x40 and 16x CD-RW/DVD OEM');
insert into POSITION (role_id, role_name, description)
values (221865701, 'terbium', 'Seagate 60GB 7200rpm EIDE Hard Drive Barracuda V ST360015A (OEM).');
insert into POSITION (role_id, role_name, description)
values (457643504, 'tantalum', 'Seagate 40GB 5400RPM ATA100');
insert into POSITION (role_id, role_name, description)
values (561176400, 'palladium', 'GA-7VA VIA KT400 chipset 8X AGP DDR400 onboard Sound.');
insert into POSITION (role_id, role_name, description)
values (583783467, 'helium', 'Combo AMD XP 1800+ Gigabyte GA-7VKML M/B + Fan');
insert into POSITION (role_id, role_name, description)
values (503257151, 'scandium', 'ADS USB2000 USB Turbo 2.0 pci Controller card');
insert into POSITION (role_id, role_name, description)
values (512986462, 'sulfur', 'AMD XP 2100+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (385677933, 'palladium', '10/100 REALTEK NETWORK CARD 8139 chipset RETAIL BOX');
insert into POSITION (role_id, role_name, description)
values (547417200, 'vanadium', 'ATI Radeon 9600 256MB DVI+CRT+TV 8X .');
insert into POSITION (role_id, role_name, description)
values (771822614, 'hafnium', 'LG 48x24x40 and 16x CD-RW/DVD OEM.');
insert into POSITION (role_id, role_name, description)
values (450034199, 'palladium', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into POSITION (role_id, role_name, description)
values (506502850, 'bismuth', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan');
insert into POSITION (role_id, role_name, description)
values (962538124, 'erbium', 'TV Tuner card PCI (KWorld M878A)');
insert into POSITION (role_id, role_name, description)
values (635867947, 'dysprosium', 'Combo AMD Duron 1.3Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.');
insert into POSITION (role_id, role_name, description)
values (740002560, 'mercury', 'Intel Celeron 1.1Ghz & Gigabyte GA6VEML MB w/ 312D Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (373556476, 'krypton', 'Combo Intel Celeron 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (582912322, 'neon', '512Mb SDRam PC133 Kingston');
insert into POSITION (role_id, role_name, description)
values (391226859, 'fluorine', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan');
insert into POSITION (role_id, role_name, description)
values (871260173, 'ruthenium', 'LABTEC Internet Keyboard (Spanish Edition).');
insert into POSITION (role_id, role_name, description)
values (102326790, 'aluminum', 'Combo AMD XP 1900+ cpu Gigabyte GA-7ZXE Motherboard + Fan');
insert into POSITION (role_id, role_name, description)
values (145684861, 'gold', 'Intel Pentium4 1.7ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (949465249, 'lanthanum', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into POSITION (role_id, role_name, description)
values (668621670, 'tellurium', '312D ATX color case(translucent blue) with 400Watt P4/P3/AMD Support PS.');
insert into POSITION (role_id, role_name, description)
values (404286043, 'thulium', '6072-1 case with side window 400W Powersupply.');
insert into POSITION (role_id, role_name, description)
values (815331207, 'lawrencium', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (300558211, 'iron', 'AMDXP1800/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (421722923, 'lawrencium', 'AMD XP 2800+ Retail box.');
insert into POSITION (role_id, role_name, description)
values (352546269, 'yttrium', 'Combo Intel P4 1.8Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan');
insert into POSITION (role_id, role_name, description)
values (234346918, 'lawrencium', 'YS AMD XP 2000+ Performance System');
insert into POSITION (role_id, role_name, description)
values (417852195, 'indium', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into POSITION (role_id, role_name, description)
values (399040823, 'neodymium', 'Combo Intel Celeron 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (253081212, 'terbium', 'Mircosoft Ergonomic Keyboard and Mouse Set.');
insert into POSITION (role_id, role_name, description)
values (369738131, 'thulium', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)');
insert into POSITION (role_id, role_name, description)
values (938124815, 'cerium', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan');
insert into POSITION (role_id, role_name, description)
values (549120088, 'ytterbium', 'Biostar M6TWL skt 370 Motherboard. (D.O.A 30 days)');
insert into POSITION (role_id, role_name, description)
values (916827157, 'praseodymium', 'AMD Duron 1.1/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (169375315, 'carbon', '256MB DDR PC2700 Kingston');
insert into POSITION (role_id, role_name, description)
values (274554825, 'rhodium', '512MB DDR400 PC3200 Kingston(KVR400X64C3/512 )');
insert into POSITION (role_id, role_name, description)
values (515569597, 'phosphorus', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into POSITION (role_id, role_name, description)
values (752975163, 'nobelium', 'AMD XP 2500+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.');
insert into POSITION (role_id, role_name, description)
values (267272813, 'yttrium', 'ASUS P4SDX SiS655 Chipset Dual Channel DDR333.');
insert into POSITION (role_id, role_name, description)
values (745414744, 'yttrium', 'ADS Technologies Firewire 1394 3 Port PCI');
insert into POSITION (role_id, role_name, description)
values (317390763, 'californium', 'Dynatron MicroFin DC1206BM-l AMD Athlon/Duron Fan w/ Copper Base up to AMD XP (AMD APPROVED!) 3000+.');
insert into POSITION (role_id, role_name, description)
values (428767209, 'potassium', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (401856668, 'silver', 'Combo Intel Celeron 1.1 Ghz (Box)w/Fan + Biostar M6VLQ skt 370 M/B (With / Video;sound)');
insert into POSITION (role_id, role_name, description)
values (126298640, 'calcium', 'Biostar M6VLB Intel PPGA (w/30day limit warranty)');
insert into POSITION (role_id, role_name, description)
values (471200430, 'silicon', 'Combo Intel P4 1.9Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.');
insert into POSITION (role_id, role_name, description)
values (766108742, 'thorium', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (136283222, 'gadolinium', 'Cooler Master DP5-6J31C AMD Approved HeatSync.');
insert into POSITION (role_id, role_name, description)
values (858697568, 'fermium', 'Maxtor 40G 7200RPM ATA133');
insert into POSITION (role_id, role_name, description)
values (556910809, 'lead', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into POSITION (role_id, role_name, description)
values (470310129, 'lawrencium', 'AMD XP 2100+ Box w/Fan');
insert into POSITION (role_id, role_name, description)
values (194871002, 'iodine', 'Combo Intel P4 1.8ghz Gigabyte GA-8LS533 m/b + fan.');
insert into POSITION (role_id, role_name, description)
values (872735168, 'neon', 'AMD XP 1700+ & Gigabyte GA-7DXE MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (853428936, 'sodium', 'PCI 56K V.92 Fax Modem');
insert into POSITION (role_id, role_name, description)
values (511269524, 'rutherfordium', 'Intel P4 1;6Ghz Box CPU (478pin)(256KB L2 Cache)');
insert into POSITION (role_id, role_name, description)
values (154708390, 'thulium', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (406875914, 'lanthanum', 'Double RJ45 Surface Mount');
insert into POSITION (role_id, role_name, description)
values (195938169, 'nitrogen', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (602409629, 'tellurium', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into POSITION (role_id, role_name, description)
values (156499563, 'rhodium', 'AOC 19" Monitor .26 9GLR');
insert into POSITION (role_id, role_name, description)
values (932418525, 'bismuth', 'Linksys Wireless Access Point (WAP11)');
insert into POSITION (role_id, role_name, description)
values (531324214, 'rhenium', 'AMD XP 1600+ CPU (OEM)');
insert into POSITION (role_id, role_name, description)
values (447680874, 'argon', '6072-1 case with side window 400W Powersupply.');
insert into POSITION (role_id, role_name, description)
values (123711229, 'zinc', 'C Rimm');
insert into POSITION (role_id, role_name, description)
values (415587027, 'iodine', 'AMDXP2200/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (973308178, 'plutonium', 'AMD XP 1800+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (651943493, 'selenium', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.');
insert into POSITION (role_id, role_name, description)
values (104082629, 'neodymium', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into POSITION (role_id, role_name, description)
values (175031975, 'carbon', 'AOC LM520 Flat Screen (LCD) 15" Monitor');
insert into POSITION (role_id, role_name, description)
values (383849162, 'mercury', 'Intel D 850MV P4 M/B RDRam support');
insert into POSITION (role_id, role_name, description)
values (215041012, 'oxygen', 'AMD XP 2200+ & Gigabyte 7DXE w/ 313M case . W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (172561338, 'titanium', 'Combo Intel P4 1.6Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (117554332, 'copper', 'Matrox Dual Head G550 With 32 MB of Double Data Rate (DDR) memory; a 360. MHz primary RAMDAC.OEM package');
insert into POSITION (role_id, role_name, description)
values (732378876, 'yttrium', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan');
insert into POSITION (role_id, role_name, description)
values (354877642, 'californium', 'Creative Sound Blaster');
insert into POSITION (role_id, role_name, description)
values (359727325, 'platinum', 'ADS Technologies Firewire 1394 3 Port PCI');
insert into POSITION (role_id, role_name, description)
values (759864499, 'sodium', 'Iomega Internal EIDE 250MB Zip Drive - OEM Version .');
insert into POSITION (role_id, role_name, description)
values (109430790, 'lead', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (329812074, 'rutherfordium', 'ATI Radeon 7000 VIVO 64mb DDR AGP .');
insert into POSITION (role_id, role_name, description)
values (394767818, 'cerium', 'AMD XP 1800+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (969189003, 'iridium', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (496226319, 'gold', 'KDS 15" Flat Screen LCD monitor (black).');
insert into POSITION (role_id, role_name, description)
values (855680191, 'fermium', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into POSITION (role_id, role_name, description)
values (177065433, 'erbium', 'Sony 48x24x48 and 16x CD-RW/DVD OEM.');
insert into POSITION (role_id, role_name, description)
values (380537348, 'iridium', 'hp scanjet 5550c scanner series (C9919A) (Open Box).');
insert into POSITION (role_id, role_name, description)
values (716780532, 'thulium', '512Mb SDRam PC133');
insert into POSITION (role_id, role_name, description)
values (337759173, 'xenon', '6072-1 case with side window 400W Powersupply.');
insert into POSITION (role_id, role_name, description)
values (315462088, 'indium', 'ASUS P4SDX SiS655 Chipset Dual Channel DDR333.');
insert into POSITION (role_id, role_name, description)
values (373441515, 'uranium', 'Seagate 120GB Serial ATA150 7200RPM.');
insert into POSITION (role_id, role_name, description)
values (124089897, 'technetium', 'xAMD XP 1600+ Biostar M7VIB M/B + Cooler master fan');
insert into POSITION (role_id, role_name, description)
values (862985517, 'molybdenum', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into POSITION (role_id, role_name, description)
values (499261206, 'gallium', 'GigaByte G-Max AMD Flex ATX Platform .');
insert into POSITION (role_id, role_name, description)
values (415980616, 'strontium', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into POSITION (role_id, role_name, description)
values (996964557, 'radon', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into POSITION (role_id, role_name, description)
values (622739463, 'thulium', '256Mb DDR PC2100 (Micron)');
insert into POSITION (role_id, role_name, description)
values (890030689, 'krypton', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (308903216, 'helium', '313H ATX 400w Case W/ case Fan P4/P3/AMD.');
insert into POSITION (role_id, role_name, description)
values (549067637, 'lawrencium', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Biostar U8668 P4 M/B Socket 478 Support SD.');
insert into POSITION (role_id, role_name, description)
values (961508320, 'cobalt', 'Intel Celeron 1.8ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (248269181, 'silver', 'AMD Duron 1.1/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (187659795, 'oxygen', 'Linksys Wireless PCI card (WMP11)');
insert into POSITION (role_id, role_name, description)
values (576724083, 'cesium', 'ATI Radion 7000 64Mb SD CRT+TV-Out');
insert into POSITION (role_id, role_name, description)
values (671741204, 'tellurium', '512Mb DDRam PC2100 (one piece) Micron');
insert into POSITION (role_id, role_name, description)
values (933998105, 'phosphorus', 'hp scanjet 5550c scanner series (C9919A) (Open Box).');
insert into POSITION (role_id, role_name, description)
values (265157884, 'holmium', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into POSITION (role_id, role_name, description)
values (897061527, 'samarium', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into POSITION (role_id, role_name, description)
values (780207682, 'vanadium', 'Cyber Power 1250VA Back Up.');
insert into POSITION (role_id, role_name, description)
values (545341989, 'einsteinium', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (723052340, 'silicon', 'AMD XP 2000+ & Biostar M7VKQ Pro MB w/ 313M case. W/ PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (553045691, 'nobelium', 'Intel Celeron 1.1Ghz & Gigabyte GA6VEML MB w/ 312D Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (996172820, 'helium', 'Antec PFII Series 1040BII 400W PSU.');
insert into POSITION (role_id, role_name, description)
values (584159569, 'uranium', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan');
insert into POSITION (role_id, role_name, description)
values (584383291, 'molybdenum', 'Combo Intel P4 1.8ghz Gigabyte GA-8LS533 m/b + fan.');
insert into POSITION (role_id, role_name, description)
values (386972818, 'tantalum', 'Sound Blaster PC128 Sound card');
insert into POSITION (role_id, role_name, description)
values (716701135, 'calcium', '2 Year Warranty On Combo''s.');
insert into POSITION (role_id, role_name, description)
values (662788172, 'curium', 'Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.');
insert into POSITION (role_id, role_name, description)
values (925374231, 'rhodium', '313F-B ATX case 400W P4/AMD Free LED Fan.');
insert into POSITION (role_id, role_name, description)
values (808981635, 'francium', 'BIOSTAR M6TSL skt370 m/b (30 day D.O.A Warranty)');
insert into POSITION (role_id, role_name, description)
values (609401963, 'calcium', 'AMDXP2400/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (990963882, 'fluorine', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (909202768, 'molybdenum', 'ATI Radion 7000 64Mb SD CRT+TV-Out');
insert into POSITION (role_id, role_name, description)
values (512147344, 'bromine', 'Combo AMD XP 2400 Biostar M7VIK Skt A MotherBoard; KT400.');
insert into POSITION (role_id, role_name, description)
values (117928719, 'uranium', 'ASUS P4SDX SiS655 Chipset Dual Channel DDR333.');
insert into POSITION (role_id, role_name, description)
values (106979990, 'tin', 'Intel Pentium4 1.7ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (549556536, 'molybdenum', 'Black Complete Computer System w/ Mouse KeyBoard and Speakers(Free AMR Moden). (Duron 1.3)');
insert into POSITION (role_id, role_name, description)
values (310720153, 'hydrogen', 'ASUS A7N8X Deluxe NVIDIA Force2 .');
insert into POSITION (role_id, role_name, description)
values (860544577, 'neon', 'Boka 406 Sub Woofer 4 Channel Speaker system');
insert into POSITION (role_id, role_name, description)
values (242146220, 'tellurium', 'ATI Radeon 7500 PCI 64M w/ TV out and DVI.');
insert into POSITION (role_id, role_name, description)
values (936786761, 'lead', 'Linksys Wireless PCI card (WMP11)');
insert into POSITION (role_id, role_name, description)
values (303070829, 'chlorine', 'AMD 1.1Ghz Starter Series / Work Station.');
insert into POSITION (role_id, role_name, description)
values (917067047, 'lanthanum', 'Intel Pentium4 2.0ghz & Gigabyte 8IRXP MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (532611238, 'rubidium', 'Antec Plus 660 ATX Mid tower 330w Power Supply');
insert into POSITION (role_id, role_name, description)
values (984471976, 'iron', 'Testing of CPU/Fan and Motherboard.');
insert into POSITION (role_id, role_name, description)
values (385905786, 'sodium', '128Mb SDRAM PC133 Micron;Lifetime Warranty! We offer a 100% Compatibility Guarantee. 7.5ns PC133');
insert into POSITION (role_id, role_name, description)
values (324503961, 'yttrium', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into POSITION (role_id, role_name, description)
values (817610947, 'osmium', 'Antec PlusView1000AMG Metallic Gray SOHO File Server without PowerSupply.');
insert into POSITION (role_id, role_name, description)
values (779204402, 'rutherfordium', 'xAMD XP 1600+ Biostar M7VIB M/B + Cooler master fan');
insert into POSITION (role_id, role_name, description)
values (871314205, 'zirconium', 'ATI Radeon 7000 VIVO 64mb DDR AGP .');
insert into POSITION (role_id, role_name, description)
values (526693366, 'bromine', '512Mb SDRam PC133 Kingston');
insert into POSITION (role_id, role_name, description)
values (288205055, 'astatine', 'Cable/DSL Broadband Router (w/ 4-port Switch) (EE400-R).');
insert into POSITION (role_id, role_name, description)
values (241411480, 'yttrium', '6066-C10 ATX Black Mid case 350W w/ 2 Front USB; 1 Mic; 1 Headset.');
insert into POSITION (role_id, role_name, description)
values (183209683, 'gold', 'Biostar M7VIK SKT A AMD® DDR400 AGP 8x ;onboard Raid & Sound & 1394 .');
insert into POSITION (role_id, role_name, description)
values (548259826, 'zirconium', 'AMD Duron 1.1Ghz (1100 Mhz) OEM');
insert into POSITION (role_id, role_name, description)
values (675564431, 'osmium', 'Combo Intel Celeron 1.1 Ghz (Box)w/Fan + Biostar M6VLQ skt 370 M/B (With / Video;sound)');
insert into POSITION (role_id, role_name, description)
values (930025063, 'arsenic', '313B Black 300W P4/AMD Fan5 .');
insert into POSITION (role_id, role_name, description)
values (334728919, 'radium', 'Serial ATA Power Connector for the Hard Drive.');
insert into POSITION (role_id, role_name, description)
values (988199622, 'tantalum', '313D Black Case 300W P4/AMD');
insert into POSITION (role_id, role_name, description)
values (492871740, 'zinc', 'WD Caviar 20.0G 7200rpm Hard Drive');
insert into POSITION (role_id, role_name, description)
values (148810757, 'antimony', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (513149919, 'protactinium', 'AMD Duron 1.2Ghz OEM');
insert into POSITION (role_id, role_name, description)
values (153407366, 'lanthanum', 'ADS USB2000 USB Turbo 2.0 pci Controller card');
insert into POSITION (role_id, role_name, description)
values (369897855, 'protactinium', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into POSITION (role_id, role_name, description)
values (937169926, 'silicon', 'Biostar M7SXD P4 M/B Socket 478 Support SD/DDR (30 day D.O.A Warranty)');
insert into POSITION (role_id, role_name, description)
values (723892249, 'ytterbium', 'Visioneer 5800 48bit USB Scanner XP compatable');
insert into POSITION (role_id, role_name, description)
values (177456519, 'silicon', 'ATI Radeon 7000 VIVO 64mb DDR AGP .');
insert into POSITION (role_id, role_name, description)
values (144316561, 'boron', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (553226851, 'lithium', 'AMD XP 2100+ Box & Gigabyte GA-7DXE MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (770161804, 'nobelium', 'Fast Ethernet 10/100 8 port switching hub');
insert into POSITION (role_id, role_name, description)
values (694946314, 'ytterbium', 'KIT Keyboard Mouse and Speakers to match color case');
insert into POSITION (role_id, role_name, description)
values (998820027, 'beryllium', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)');
insert into POSITION (role_id, role_name, description)
values (382013541, 'potassium', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into POSITION (role_id, role_name, description)
values (769802617, 'yttrium', 'Intel Celeron 1.7Ghz 478 pin Box cpu + fan');
insert into POSITION (role_id, role_name, description)
values (166727584, 'beryllium', 'Keyboard Converter from (old) standard form to (new) PS/2.');
insert into POSITION (role_id, role_name, description)
values (958097571, 'lead', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001');
insert into POSITION (role_id, role_name, description)
values (326564708, 'samarium', 'Intel Pentium4 3.0ghz & Asus P4C800 MB w/ Antec Performance Plus II 1040B Case.');
insert into POSITION (role_id, role_name, description)
values (635918197, 'bromine', 'Mitsumi 52x 40 x 48 CD-RW');
insert into POSITION (role_id, role_name, description)
values (876320005, 'antimony', 'Intel Celeron 1.8Ghz 478 pin Box cpu + fan');
insert into POSITION (role_id, role_name, description)
values (184740196, 'xenon', 'Combo Intel P4 1.6Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.');
insert into POSITION (role_id, role_name, description)
values (364735390, 'strontium', '6072-1 case with side window 400W Powersupply.');
insert into POSITION (role_id, role_name, description)
values (672824897, 'thallium', 'YS AMD XP 2000+ Performance System');
insert into POSITION (role_id, role_name, description)
values (342833229, 'magnesium', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan');
insert into POSITION (role_id, role_name, description)
values (338133417, 'hydrogen', '512Mb SDRam PC133 Kingston');
insert into POSITION (role_id, role_name, description)
values (679553736, 'nickel', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (263899818, 'sulfur', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.');
insert into POSITION (role_id, role_name, description)
values (720704442, 'uranium', 'AMD XP 1800+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (485400861, 'copper', '128Mb PC2100 266Mhz DDR Ram ( Micron )');
insert into POSITION (role_id, role_name, description)
values (995921447, 'antimony', 'Surge protector');
insert into POSITION (role_id, role_name, description)
values (852885734, 'technetium', 'Cyber Power 1000VA Back Up W/Automatic Voltage Regulator');
insert into POSITION (role_id, role_name, description)
values (481564812, 'iron', 'Intel P4 1;7Ghz Box CPU+fan (478 pin)');
insert into POSITION (role_id, role_name, description)
values (378461155, 'phosphorus', 'W.D 80.0Gb 7200rpm ATA100 (WD800BB)');
insert into POSITION (role_id, role_name, description)
values (881474368, 'praseodymium', 'YS Intel P4 2.0Ghz POWER SYSTEM');
insert into POSITION (role_id, role_name, description)
values (745215562, 'gadolinium', 'Gigabyte GA-7VKMLE');
insert into POSITION (role_id, role_name, description)
values (398547356, 'hydrogen', 'USB Cable 6ft. Long.');
insert into POSITION (role_id, role_name, description)
values (536260589, 'gadolinium', 'AMD XP 2500+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.');
insert into POSITION (role_id, role_name, description)
values (294415745, 'mendlevium', 'AMD XP 2500+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (980918851, 'rhodium', 'Gigabyte GA-7VKMLE');
insert into POSITION (role_id, role_name, description)
values (278348703, 'magnesium', '313B Black 400W P4/AMD Fan5');
insert into POSITION (role_id, role_name, description)
values (496244063, 'iridium', 'Combo AMD XP 2100+ (Box CPU); Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into POSITION (role_id, role_name, description)
values (786134627, 'fermium', 'CNet External 56k V.92 Fax modem (Serial).');
insert into POSITION (role_id, role_name, description)
values (355672810, 'erbium', 'Microsoft Office 2000 Small Biz edition');
insert into POSITION (role_id, role_name, description)
values (911357270, 'chromium', 'Combo Intel Celeron 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (424126819, 'americium', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (791421936, 'neodymium', 'AMD XP 2500+ Barton (OEM). (with 333Mhz Front Side Bus w/ 512k Cache).');
insert into POSITION (role_id, role_name, description)
values (191560363, 'cerium', 'Logitech Cordless Optical Mouse.');
insert into POSITION (role_id, role_name, description)
values (735160342, 'beryllium', 'Intel Pentium4 1.7ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (696029449, 'lithium', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.');
insert into POSITION (role_id, role_name, description)
values (264096684, 'protactinium', 'Intel Pentium4 1.8ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (984097740, 'gallium', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LD533 m/b + fan.');
insert into POSITION (role_id, role_name, description)
values (331742559, 'nobelium', 'Microsoft Wireless Optical Mouse Blue.');
insert into POSITION (role_id, role_name, description)
values (592038684, 'manganese', 'Mitsumi 48x 12 x 40 CD-RW');
insert into POSITION (role_id, role_name, description)
values (440854852, 'barium', 'ADS Technologies Firewire 1394 3 Port PCI');
insert into POSITION (role_id, role_name, description)
values (277094093, 'iron', 'CyberPower Surge Protector 850 with 8 Outlet.');
insert into POSITION (role_id, role_name, description)
values (203688305, 'magnesium', 'AMD XP 1900+ & Gigabyte GA-7VKMLS MB w/ 313M Color Case.');
insert into POSITION (role_id, role_name, description)
values (165256469, 'gold', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.');
insert into POSITION (role_id, role_name, description)
values (941153423, 'astatine', 'Intel P4 1;7Ghz Box CPU+fan (478 pin)');
insert into POSITION (role_id, role_name, description)
values (441905645, 'europium', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)');
insert into POSITION (role_id, role_name, description)
values (899700514, 'iron', 'Wireless Access Point Router with 4-Port Switch - Version 3.2 (BEFW11S4)');
insert into POSITION (role_id, role_name, description)
values (575399817, 'astatine', 'LABTEC Cordless Desktop Keyboard & Mouse (Spanish Edition).');
insert into POSITION (role_id, role_name, description)
values (235942071, 'arsenic', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into POSITION (role_id, role_name, description)
values (162646878, 'nitrogen', 'Combo Intel P4 1.8Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support SD.');
insert into POSITION (role_id, role_name, description)
values (384748366, 'barium', '14inch LCD MG-015A Xgen2 Monitor.');
insert into POSITION (role_id, role_name, description)
values (201013938, 'osmium', 'Biostar M6VLR skt 370 Motherboard');
insert into POSITION (role_id, role_name, description)
values (343055006, 'sodium', 'Mitsumi 48x 12 x 40 CD-RW');
insert into POSITION (role_id, role_name, description)
values (353921238, 'terbium', 'Removeable ATA100 hard drive tray');
insert into POSITION (role_id, role_name, description)
values (875156405, 'zirconium', 'AMD XP 1700+ & Biostar M7VKQ w/ 313N case . W/ Free AMR 56k & PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (269361165, 'lead', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.');
insert into POSITION (role_id, role_name, description)
values (632075477, 'krypton', 'Intel Pentium4 2.0ghz & Gigabyte 8IRX MB w/ 313N Case.');
insert into POSITION (role_id, role_name, description)
values (562633887, 'neptunium', 'Gigabyte GA-7DPXDW-P Dual AMD Server board w/RAID up to 4GB of Registered DDR memory');
insert into POSITION (role_id, role_name, description)
values (683947556, 'barium', 'Maxtor 40Gb ATA100 5400rpm H/D');
insert into POSITION (role_id, role_name, description)
values (668048140, 'californium', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)');
insert into POSITION (role_id, role_name, description)
values (946485430, 'tin', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .');
insert into POSITION (role_id, role_name, description)
values (830448971, 'germanium', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.');
insert into POSITION (role_id, role_name, description)
values (846752544, 'cerium', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (127453802, 'rubidium', 'YS AMD XP 2000+ Performance System');
insert into POSITION (role_id, role_name, description)
values (275912823, 'chlorine', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan');
insert into POSITION (role_id, role_name, description)
values (818453932, 'iodine', 'AMDXP1800/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (723598231, 'manganese', 'Intel Pentium4 1.9ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (788020642, 'protactinium', 'Mitsumi 52x 40 x 48 CD-RW');
insert into POSITION (role_id, role_name, description)
values (836289094, 'americium', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into POSITION (role_id, role_name, description)
values (820593343, 'californium', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.');
insert into POSITION (role_id, role_name, description)
values (196887346, 'phosphorus', 'M7SXF P4 478pin Motherboard (Suppout DDR Max 3GB)(30 day D.O.A Warranty)');
insert into POSITION (role_id, role_name, description)
values (291471743, 'osmium', 'ATI RADEON 9200™ SE 128M DDR DVI+TV-Out 8X AGP (R92LE-C3S).');
insert into POSITION (role_id, role_name, description)
values (640729293, 'bismuth', '10/100 16 Port Switch');
insert into POSITION (role_id, role_name, description)
values (517434779, 'gold', 'Combo AMD XP 2100+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into POSITION (role_id, role_name, description)
values (210882131, 'gold', 'Intel P4 3.06 HT CPU & Intel D845PEBT2 M/B onboard Raid and S-ATA');
insert into POSITION (role_id, role_name, description)
values (660016107, 'antimony', 'ATI Radeon 9800 Pro 128MB Gold Edition.');
insert into POSITION (role_id, role_name, description)
values (168947359, 'hydrogen', 'Combo AMD XP 1700+ Gigabyte GA-7VKML M/B + Fan');
insert into POSITION (role_id, role_name, description)
values (546829216, 'selenium', 'ATI Radion 7000 64Mb SD CRT+TV-Out');
insert into POSITION (role_id, role_name, description)
values (823004390, 'nitrogen', 'Biostar M7SXD P4 M/B Socket 478 Support SD/DDR (30 day D.O.A Warranty)');
insert into POSITION (role_id, role_name, description)
values (452604754, 'neon', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (368019066, 'erbium', 'AMD XP 1800+ & Biostar M7VIG-Pro MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (493028462, 'holmium', 'Mitsumi DW-7801TE DVD Duplicator/Burner.');
insert into POSITION (role_id, role_name, description)
values (662264442, 'einsteinium', 'AMD XP 1800+ & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (812300108, 'ruthenium', '512MB DDR400 PC3200 Kingston(KVR400X64C3/512 )');
insert into POSITION (role_id, role_name, description)
values (942305112, 'lutetium', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.');
insert into POSITION (role_id, role_name, description)
values (620822124, 'phosphorus', 'Antec PFII Series 1040BII 400W PSU.');
insert into POSITION (role_id, role_name, description)
values (115131486, 'samarium', 'Combo AMD XP 1700+ Gigabyte GA-7VKML M/B + Fan');
insert into POSITION (role_id, role_name, description)
values (443821165, 'cadmium', 'Combo AMD XP 2700+ CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into POSITION (role_id, role_name, description)
values (915346877, 'lead', 'Maxtor 40Gb ATA100 5400rpm H/D');
insert into POSITION (role_id, role_name, description)
values (506256596, 'gadolinium', 'Logitech Smart Click 310 Camera');
insert into POSITION (role_id, role_name, description)
values (884157863, 'hydrogen', 'AMD XP 2000+ Box/with AMD Fan');
insert into POSITION (role_id, role_name, description)
values (685326937, 'plutonium', 'ADS External USB 2.0 Drive Kit');
insert into POSITION (role_id, role_name, description)
values (971547327, 'potassium', 'Gigabyte GA-8IE800 Intel®845E Chipset.');
insert into POSITION (role_id, role_name, description)
values (540498589, 'radium', 'ATA 100 Controller Card PCI');
insert into POSITION (role_id, role_name, description)
values (189669734, 'samarium', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (663500683, 'lanthanum', '6072-1 case with side window 400W Powersupply.');
insert into POSITION (role_id, role_name, description)
values (110449582, 'helium', 'Combo Intel P4 1.8Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan');
insert into POSITION (role_id, role_name, description)
values (808405686, 'neodymium', 'AMD XP 2500+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.');
insert into POSITION (role_id, role_name, description)
values (609836661, 'nitrogen', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (545997419, 'lanthanum', 'AMD XP 2000+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (971425631, 'lead', 'Intel P4 1;8Ghz (478)pin 512K 3 Year MFG warr.');
insert into POSITION (role_id, role_name, description)
values (168366431, 'tellurium', 'Intel Pentium4 1.6ghz & Gigabyte 8ID533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (979432588, 'nitrogen', 'Combo Intel P4 1.9Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.');
insert into POSITION (role_id, role_name, description)
values (530317206, 'hafnium', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.');
insert into POSITION (role_id, role_name, description)
values (611587715, 'nitrogen', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.');
insert into POSITION (role_id, role_name, description)
values (384972445, 'cesium', 'Intel Celeron 1.8Ghz/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (592600740, 'titanium', 'W.D 80.0Gb 7200rpm ATA100 (WD800BB)');
insert into POSITION (role_id, role_name, description)
values (533166725, 'lawrencium', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.');
insert into POSITION (role_id, role_name, description)
values (444734859, 'praseodymium', 'Gigabyte GA-8IPE1000 Pro (intel 865PE Chipset) Pentium 4 ;DDR400 and FSB 800.');
insert into POSITION (role_id, role_name, description)
values (591085081, 'oxygen', 'Combo Intel P4 1.8ghz Gigabyte GA-8LS533 m/b + fan.');
insert into POSITION (role_id, role_name, description)
values (579934918, 'neptunium', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (369371631, 'cadmium', 'Cooler Master ATA133 Rounded IDE Cable . PTC-A18');
insert into POSITION (role_id, role_name, description)
values (874147059, 'krypton', 'ADS Technologies Firewire 1394 3 Port PCI');
insert into POSITION (role_id, role_name, description)
values (880859102, 'zinc', 'Combo Intel Celeron 1.7Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .');
insert into POSITION (role_id, role_name, description)
values (955189703, 'nitrogen', 'AMD XP 2800+ Retail box.');
insert into POSITION (role_id, role_name, description)
values (434402185, 'hafnium', '512Mb SDRam PC133');
insert into POSITION (role_id, role_name, description)
values (377039627, 'manganese', 'Intel D845WN 478Pin SDRAM retail Box');
insert into POSITION (role_id, role_name, description)
values (760285895, 'gold', 'Combo Intel P4 1.7ghz CPU + Fan(Box);Biostar M7SXF P4 478pin M/B Support DDR DIMM');
insert into POSITION (role_id, role_name, description)
values (151932071, 'oxygen', 'PS2 2 Button Mouse');
insert into POSITION (role_id, role_name, description)
values (429574672, 'xenon', 'AMD 1.1Ghz BareBone System W/Free M');
insert into POSITION (role_id, role_name, description)
values (123490198, 'molybdenum', 'ADS USB 4 Port Hub');
insert into POSITION (role_id, role_name, description)
values (906818716, 'polonium', 'Mitsumi 1.44 Floppy Drive');
insert into POSITION (role_id, role_name, description)
values (495446909, 'terbium', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LS533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (193991099, 'aluminum', 'ATI Radion 7000; 64Mb DDR AGP +CRT+DVI+TV');
insert into POSITION (role_id, role_name, description)
values (137650885, 'bismuth', 'Pentiume 4 1.8Ghz/128M/30G Black Complete System.');
insert into POSITION (role_id, role_name, description)
values (714642464, 'helium', 'Combo Intel Celeron 1.7Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .');
insert into POSITION (role_id, role_name, description)
values (780208937, 'tantalum', 'YS AMD T-Bird 1.2 Ghz Performance Series');
insert into POSITION (role_id, role_name, description)
values (632279670, 'lead', 'Desk Top Microphone');
insert into POSITION (role_id, role_name, description)
values (234058091, 'gadolinium', 'Combo AMD XP 1900+ cpu Gigabyte GA-7ZXE Motherboard + Fan');
insert into POSITION (role_id, role_name, description)
values (527150490, 'rubidium', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (548233541, 'sodium', 'AMD XP 1800+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (252198550, 'indium', 'Assembly CPU/Fan; Motherboard; Case; and Other Products.');
insert into POSITION (role_id, role_name, description)
values (286852485, 'lawrencium', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LD533 m/b + fan.');
insert into POSITION (role_id, role_name, description)
values (583190929, 'curium', 'Logitech Cordless Optical Mouse.');
insert into POSITION (role_id, role_name, description)
values (388619009, 'holmium', 'Combo Intel P4 1.6Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (151165403, 'krypton', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.');
insert into POSITION (role_id, role_name, description)
values (914721624, 'curium', 'Intel D845WN 478Pin SDRAM retail Box');
insert into POSITION (role_id, role_name, description)
values (628645079, 'copper', '313B Black 300W P4/AMD Fan5 .');
insert into POSITION (role_id, role_name, description)
values (803592669, 'tantalum', 'Microsoft Wireless Optical Mouse Blue.');
insert into POSITION (role_id, role_name, description)
values (815775217, 'iodine', 'Surge protector');
insert into POSITION (role_id, role_name, description)
values (489377741, 'magnesium', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)');
insert into POSITION (role_id, role_name, description)
values (769900292, 'titanium', '2 Year Warranty On Combo''s.');
insert into POSITION (role_id, role_name, description)
values (611373445, 'iridium', 'ATA 100 RAID controller card');
insert into POSITION (role_id, role_name, description)
values (423368904, 'neptunium', 'Combo AMD XP 2500+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2');
insert into POSITION (role_id, role_name, description)
values (800383179, 'tantalum', 'Gigabyte GA-8ID533 Socket 478 Intel®');
insert into POSITION (role_id, role_name, description)
values (770779910, 'manganese', 'Intel P4 2.4 Ghz CPU BOX (533Mhz)');
insert into POSITION (role_id, role_name, description)
values (581163307, 'thallium', 'Matrox Dual Head G550 With 32 MB of Double Data Rate (DDR) memory; a 360. MHz primary RAMDAC.OEM package');
insert into POSITION (role_id, role_name, description)
values (959715188, 'aluminum', 'AMD XP 2100+ Box w/Fan');
insert into POSITION (role_id, role_name, description)
values (634135993, 'molybdenum', 'Combo Intel P4 1.8Ghz 478pin(box)CPU + Gigabyte GA-8IRX (DDR up to 2GB/4 USB)M/B + Fan');
insert into POSITION (role_id, role_name, description)
values (619492727, 'fermium', 'AMD XP 2200+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (220580133, 'thallium', 'ATI Radion 7000 64Mb SD CRT+TV-Out');
insert into POSITION (role_id, role_name, description)
values (791868268, 'chromium', 'Intel Pentium4 1.8ghz & Intel D845PESV MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (849828195, 'promethium', '10/100 16 Port Switch');
insert into POSITION (role_id, role_name, description)
values (917164486, 'actinium', 'Microsoft Office 2000 Small Biz edition');
insert into POSITION (role_id, role_name, description)
values (160844479, 'samarium', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into POSITION (role_id, role_name, description)
values (260263770, 'gold', 'AMD XP 1800+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (660189169, 'chlorine', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (964513898, 'dysprosium', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (310032751, 'cobalt', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (279115469, 'francium', 'Maxtor 40G 7200RPM ATA133');
insert into POSITION (role_id, role_name, description)
values (149826730, 'thulium', 'AMD Duron 1.2Ghz OEM');
insert into POSITION (role_id, role_name, description)
values (748235705, 'lithium', 'ADS Technologies Firewire 1394 3 Port PCI');
insert into POSITION (role_id, role_name, description)
values (369709283, 'titanium', 'Gigabyte GA-8SMMLP SiS650GX Chipset.');
insert into POSITION (role_id, role_name, description)
values (259175304, 'platinum', 'AMD XP 1700+ & Gigabyte GA-7DXE MB w/ 313N Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (888978348, 'hafnium', 'Intel P4 2.4G BareBone System W/ Free Mouse.');
insert into POSITION (role_id, role_name, description)
values (653653264, 'neon', 'Boka 406 Sub Woofer 4 Channel Speaker system');
insert into POSITION (role_id, role_name, description)
values (535249830, 'gallium', 'Intel Pentium4 1.8ghz & Gigabyte GA-8IE800 MB w/ 313M Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (991919168, 'californium', 'ADS Technologies Firewire External Drive.');
insert into POSITION (role_id, role_name, description)
values (325485023, 'thorium', 'GA-7VT600-L VIA KT600 chipset.');
insert into POSITION (role_id, role_name, description)
values (155203169, 'neodymium', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.');
insert into POSITION (role_id, role_name, description)
values (425168952, 'iridium', 'Dynatron CPU Cooler DF1206BH AMD Athlon\Duron Fan. (AMD Recommend)');
insert into POSITION (role_id, role_name, description)
values (359220978, 'polonium', 'Combo AMD XP 2000 Biostar M7VIK Skt A MotherBoard; KT400.');
insert into POSITION (role_id, role_name, description)
values (162800319, 'platinum', 'Intel P4 1;6Ghz Bare Bone');
insert into POSITION (role_id, role_name, description)
values (561314398, 'ytterbium', 'Intel P4 2.4 Ghz CPU BOX (533Mhz)');
insert into POSITION (role_id, role_name, description)
values (809763819, 'cerium', 'AMD XP 2000+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (557577530, 'niobium', 'Biostar M6VLR skt 370 Motherboard');
insert into POSITION (role_id, role_name, description)
values (556847056, 'lead', 'AOC 19" Monitor .26 9GLR');
insert into POSITION (role_id, role_name, description)
values (915244499, 'cesium', 'Combo AMD XP 2400+ cpu Gigabyte GA-7DXE Motherboard + Fan.');
insert into POSITION (role_id, role_name, description)
values (334386914, 'cobalt', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.');
insert into POSITION (role_id, role_name, description)
values (750946636, 'silver', '312B ATX Case with 250W P4/P3/AMD PS.');
insert into POSITION (role_id, role_name, description)
values (789534151, 'argon', 'CoolerMaster Thermal Compound Premium PTK-001.');
insert into POSITION (role_id, role_name, description)
values (678435296, 'dysprosium', 'Gigabyte GA-8IE800 Intel®845E Chipset.');
insert into POSITION (role_id, role_name, description)
values (357660144, 'lawrencium', 'YS Intel P4 2.0Ghz POWER SYSTEM');
insert into POSITION (role_id, role_name, description)
values (591261035, 'scandium', 'ADS Firewire Web Cam (20X faster than USB)');
insert into POSITION (role_id, role_name, description)
values (301746122, 'americium', 'Combo AMD XP 2200+( Box cpu) Gigabyte GA-7DXE.');
insert into POSITION (role_id, role_name, description)
values (547950643, 'nickel', 'LG 52x24x52x CD-RW (OEM).');
insert into POSITION (role_id, role_name, description)
values (649942859, 'vanadium', 'Sony Black 16X DVD .');
insert into POSITION (role_id, role_name, description)
values (670680594, 'neodymium', 'AMD XP 2500+ Barton Retail Box (with 333Mhz Front Side Bus w/ 512k Cache).');
insert into POSITION (role_id, role_name, description)
values (493617746, 'cesium', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard.');
insert into POSITION (role_id, role_name, description)
values (184558690, 'hafnium', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)');
insert into POSITION (role_id, role_name, description)
values (422366273, 'oxygen', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;');
insert into POSITION (role_id, role_name, description)
values (594645287, 'nitrogen', 'YS Intel P4 2.0Ghz Server Solution');
insert into POSITION (role_id, role_name, description)
values (724906377, 'oxygen', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.');
insert into POSITION (role_id, role_name, description)
values (853021196, 'helium', 'Seagate Baraccuda 40Gb 7200rpm');
insert into POSITION (role_id, role_name, description)
values (481746797, 'rutherfordium', 'Biostar M6VLR skt 370 Motherboard');
insert into POSITION (role_id, role_name, description)
values (989791451, 'plutonium', 'Sound Blaster PC128 Sound card');
insert into POSITION (role_id, role_name, description)
values (173274411, 'gadolinium', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.');
insert into POSITION (role_id, role_name, description)
values (501152361, 'nitrogen', 'Black RF Wireless Keyboard Track Ball (USB) w/ Antenna.');
insert into POSITION (role_id, role_name, description)
values (731690775, 'erbium', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.');
insert into POSITION (role_id, role_name, description)
values (685793832, 'neon', 'Desk Top Microphone');
insert into POSITION (role_id, role_name, description)
values (333294415, 'lead', 'Combo AMD XP 2000+ cpu Gigabyte GA-7VKMLS m/b fan.');
insert into POSITION (role_id, role_name, description)
values (529209704, 'thulium', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).');
insert into POSITION (role_id, role_name, description)
values (965203125, 'osmium', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)');
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
insert into SEAT (seat_number, row_number, room_number)
values (201, 201, 8);
commit;
prompt 400 records loaded
prompt Loading SHIFTS...
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (692292000, to_date('19-02-2023', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), 553177977);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (870662657, to_date('18-02-2023', 'dd-mm-yyyy'), to_date('10-10-2023', 'dd-mm-yyyy'), 133572987);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (178891307, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 995321596);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (994808420, to_date('17-04-2023', 'dd-mm-yyyy'), to_date('05-04-2023', 'dd-mm-yyyy'), 120358256);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (160003981, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 322303650);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (900165753, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('06-03-2023', 'dd-mm-yyyy'), 281916454);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (455845334, to_date('23-04-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), 505932891);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (857297905, to_date('31-05-2023', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'), 640556287);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (908607841, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 401469090);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (566701503, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'), 904262610);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (775667351, to_date('16-04-2023', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'), 399140995);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (440638109, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), 874925934);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (240362857, to_date('05-10-2023', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), 999279568);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (380096686, to_date('10-10-2023', 'dd-mm-yyyy'), to_date('21-12-2023', 'dd-mm-yyyy'), 573083436);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (818828802, to_date('04-08-2023', 'dd-mm-yyyy'), to_date('25-02-2023', 'dd-mm-yyyy'), 684340759);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (944262479, to_date('29-11-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'), 532384197);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (672315984, to_date('14-08-2023', 'dd-mm-yyyy'), to_date('05-02-2023', 'dd-mm-yyyy'), 150486491);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (279496699, to_date('27-11-2023', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'), 270636415);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (238050354, to_date('24-03-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 739366417);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (826491560, to_date('11-06-2023', 'dd-mm-yyyy'), to_date('01-05-2023', 'dd-mm-yyyy'), 883554799);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (549198574, to_date('28-04-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), 766896778);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (914206625, to_date('18-08-2023', 'dd-mm-yyyy'), to_date('02-07-2023', 'dd-mm-yyyy'), 466416494);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (757184949, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), 751246552);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (483665079, to_date('10-04-2023', 'dd-mm-yyyy'), to_date('26-02-2023', 'dd-mm-yyyy'), 462892532);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (178686396, to_date('26-11-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'), 841770665);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (319942448, to_date('05-05-2023', 'dd-mm-yyyy'), to_date('23-06-2023', 'dd-mm-yyyy'), 549057992);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (596370399, to_date('30-09-2023', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), 932130069);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (812965430, to_date('20-03-2023', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'), 924785672);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (328085419, to_date('14-07-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 982025418);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (573304935, to_date('21-08-2023', 'dd-mm-yyyy'), to_date('26-05-2023', 'dd-mm-yyyy'), 422155493);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (475014001, to_date('11-06-2023', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), 600746268);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (904245063, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('29-11-2023', 'dd-mm-yyyy'), 573928132);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (746505888, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('08-04-2023', 'dd-mm-yyyy'), 551868624);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (532288666, to_date('20-04-2023', 'dd-mm-yyyy'), to_date('29-01-2023', 'dd-mm-yyyy'), 736028738);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (169171685, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'), 229155781);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (331170291, to_date('23-12-2023', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'), 751246552);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (301587180, to_date('16-05-2023', 'dd-mm-yyyy'), to_date('19-05-2023', 'dd-mm-yyyy'), 810942013);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (495638725, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('18-02-2023', 'dd-mm-yyyy'), 123017180);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (824884203, to_date('06-04-2023', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 290932547);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (936993986, to_date('05-07-2023', 'dd-mm-yyyy'), to_date('19-08-2023', 'dd-mm-yyyy'), 178078486);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (544835932, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 150693205);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (738867544, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 221935402);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (554032833, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), 624938714);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (535269695, to_date('18-02-2023', 'dd-mm-yyyy'), to_date('15-02-2023', 'dd-mm-yyyy'), 609369225);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (344639962, to_date('31-05-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), 895591429);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (409744409, to_date('01-03-2023', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 936103842);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (764277130, to_date('27-05-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 797986115);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (870819660, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'), 830270538);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (951020467, to_date('20-09-2023', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), 575258987);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (791070113, to_date('27-09-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), 306191302);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (399637199, to_date('02-05-2023', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), 868403959);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (211269235, to_date('01-07-2023', 'dd-mm-yyyy'), to_date('01-07-2023', 'dd-mm-yyyy'), 442652819);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (581184996, to_date('04-12-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 693364662);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (963549273, to_date('25-09-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 475823720);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (493283001, to_date('12-09-2023', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'), 395536995);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (564460222, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 127010539);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (139943717, to_date('14-10-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 170208456);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (226572801, to_date('05-05-2023', 'dd-mm-yyyy'), to_date('19-01-2023', 'dd-mm-yyyy'), 550683516);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (259093190, to_date('09-01-2023', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), 270636415);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (342055605, to_date('25-08-2023', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 824057988);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (514051452, to_date('14-01-2023', 'dd-mm-yyyy'), to_date('27-04-2023', 'dd-mm-yyyy'), 559283037);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (259723031, to_date('29-03-2023', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), 736230883);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (373545987, to_date('10-09-2023', 'dd-mm-yyyy'), to_date('10-03-2023', 'dd-mm-yyyy'), 953988797);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (214648194, to_date('24-08-2023', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), 209728370);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (904538002, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'), 600746268);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (232814001, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), 592347002);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (524504573, to_date('25-05-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'), 432946267);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (628685669, to_date('11-08-2023', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'), 467653037);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (686089252, to_date('21-12-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'), 751246552);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (797279394, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('20-02-2023', 'dd-mm-yyyy'), 539736401);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (128459529, to_date('11-03-2023', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'), 582535671);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (280524543, to_date('15-06-2023', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 144020162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (307541551, to_date('08-10-2023', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), 764079527);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (716720632, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 172255483);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (542790790, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('13-07-2023', 'dd-mm-yyyy'), 753821866);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (567925516, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'), 980201317);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (572551882, to_date('30-04-2023', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'), 882903484);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (719427629, to_date('03-01-2023', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'), 233756485);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (124611647, to_date('23-05-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 247998477);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (564302748, to_date('29-12-2023', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), 361127872);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (764506310, to_date('30-04-2023', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), 639946543);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (580684699, to_date('29-11-2023', 'dd-mm-yyyy'), to_date('22-01-2023', 'dd-mm-yyyy'), 130418894);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (712757267, to_date('07-05-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), 177904578);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (586039528, to_date('23-06-2023', 'dd-mm-yyyy'), to_date('25-05-2023', 'dd-mm-yyyy'), 508977710);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (804729207, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 655061346);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (867674120, to_date('31-01-2023', 'dd-mm-yyyy'), to_date('09-01-2023', 'dd-mm-yyyy'), 467653037);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (234480254, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'), 609369225);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (248182859, to_date('21-01-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 796944275);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (258055763, to_date('29-05-2023', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'), 420409127);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (304789858, to_date('21-04-2023', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'), 919659941);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (363415732, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'), 669857753);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (528829440, to_date('25-01-2023', 'dd-mm-yyyy'), to_date('12-12-2023', 'dd-mm-yyyy'), 621786165);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (724830279, to_date('25-10-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), 893420511);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (642173937, to_date('03-12-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 144020162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (780378468, to_date('03-04-2023', 'dd-mm-yyyy'), to_date('13-03-2023', 'dd-mm-yyyy'), 852481514);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (687515561, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('26-02-2023', 'dd-mm-yyyy'), 276507256);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (383392737, to_date('02-06-2023', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), 534041390);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (535287979, to_date('27-02-2023', 'dd-mm-yyyy'), to_date('09-01-2023', 'dd-mm-yyyy'), 609369225);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (413554521, to_date('20-11-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 418297667);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (907923402, to_date('18-05-2023', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 220744448);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (272116154, to_date('21-07-2023', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'), 306191302);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (668332390, to_date('19-11-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), 936184899);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (159649925, to_date('08-03-2023', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'), 513491874);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (160216237, to_date('10-12-2023', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'), 321157167);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (725057217, to_date('30-11-2023', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'), 144020162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (279325707, to_date('17-08-2023', 'dd-mm-yyyy'), to_date('06-10-2023', 'dd-mm-yyyy'), 422155493);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (912558897, to_date('23-12-2023', 'dd-mm-yyyy'), to_date('28-04-2023', 'dd-mm-yyyy'), 624938714);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (603315045, to_date('04-09-2023', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), 117985529);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (800282700, to_date('11-12-2023', 'dd-mm-yyyy'), to_date('04-10-2023', 'dd-mm-yyyy'), 319839015);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (569656598, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'), 928204730);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (851114090, to_date('09-07-2023', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 398977486);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (372429028, to_date('02-03-2023', 'dd-mm-yyyy'), to_date('27-08-2023', 'dd-mm-yyyy'), 630914533);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (264934159, to_date('31-05-2023', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'), 980201317);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (105921023, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'), 640556287);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (662481358, to_date('14-07-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'), 284104059);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (922152538, to_date('14-04-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 292860183);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (326093414, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'), 103796669);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (846857047, to_date('13-07-2023', 'dd-mm-yyyy'), to_date('08-12-2023', 'dd-mm-yyyy'), 181008680);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (402761571, to_date('11-11-2023', 'dd-mm-yyyy'), to_date('04-08-2023', 'dd-mm-yyyy'), 999859046);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (420440900, to_date('24-04-2023', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), 936860626);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (421511304, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), 720971581);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (453189811, to_date('16-04-2023', 'dd-mm-yyyy'), to_date('14-03-2023', 'dd-mm-yyyy'), 697799922);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (721361950, to_date('24-04-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), 842874049);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (713777655, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), 869884759);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (309262232, to_date('19-05-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 735081362);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (763199157, to_date('27-12-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), 177904578);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (700699433, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 893420511);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (708845701, to_date('10-10-2023', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 941651867);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (720386986, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'), 952157670);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (441822416, to_date('06-09-2023', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), 124161802);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (987798580, to_date('09-06-2023', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'), 120720069);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (541014838, to_date('31-05-2023', 'dd-mm-yyyy'), to_date('24-03-2023', 'dd-mm-yyyy'), 747910964);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (563586342, to_date('06-08-2023', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), 238109118);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (336104842, to_date('05-06-2023', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'), 963478068);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (419346504, to_date('03-08-2023', 'dd-mm-yyyy'), to_date('23-06-2023', 'dd-mm-yyyy'), 144020162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (624958228, to_date('13-11-2023', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), 281916454);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (596027949, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 866217071);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (794810210, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), 718223920);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (666767332, to_date('29-12-2023', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'), 696972862);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (607710253, to_date('13-02-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'), 178283057);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (299328996, to_date('03-05-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), 322303650);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (135004070, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('29-06-2023', 'dd-mm-yyyy'), 306191302);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (352878698, to_date('09-07-2023', 'dd-mm-yyyy'), to_date('01-03-2023', 'dd-mm-yyyy'), 462892532);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (769478286, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 669524357);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (124777158, to_date('01-11-2023', 'dd-mm-yyyy'), to_date('01-07-2023', 'dd-mm-yyyy'), 149834226);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (963422152, to_date('13-04-2023', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'), 185381072);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (816692773, to_date('06-03-2023', 'dd-mm-yyyy'), to_date('20-06-2023', 'dd-mm-yyyy'), 952410652);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (542520861, to_date('16-10-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'), 301914323);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (796852324, to_date('14-01-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 123017180);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (685436431, to_date('03-07-2023', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), 226210025);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (927924317, to_date('13-05-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 180135686);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (743404755, to_date('27-05-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'), 532313056);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (589111609, to_date('19-04-2023', 'dd-mm-yyyy'), to_date('16-03-2023', 'dd-mm-yyyy'), 862072713);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (359431351, to_date('11-03-2023', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'), 177904578);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (877768269, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('09-04-2023', 'dd-mm-yyyy'), 630914533);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (138953475, to_date('23-02-2023', 'dd-mm-yyyy'), to_date('27-02-2023', 'dd-mm-yyyy'), 377238393);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (711500143, to_date('15-11-2023', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 157087096);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (579402696, to_date('28-10-2023', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'), 963478068);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (897509369, to_date('22-06-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), 828641516);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (591199648, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('13-01-2023', 'dd-mm-yyyy'), 226262298);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (373150145, to_date('17-01-2023', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'), 592347002);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (993591629, to_date('15-09-2023', 'dd-mm-yyyy'), to_date('20-03-2023', 'dd-mm-yyyy'), 783763822);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (881526301, to_date('03-08-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 814657903);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (151653824, to_date('24-10-2023', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 718599414);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (209730775, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 782195448);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (491966378, to_date('20-04-2023', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'), 241205406);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (816252881, to_date('10-01-2023', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'), 855309104);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (500202175, to_date('02-05-2023', 'dd-mm-yyyy'), to_date('03-09-2023', 'dd-mm-yyyy'), 882903484);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (589411268, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'), 952410652);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (720364084, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'), 280023446);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (341658769, to_date('24-12-2023', 'dd-mm-yyyy'), to_date('05-05-2023', 'dd-mm-yyyy'), 738509747);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (448945614, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('07-11-2023', 'dd-mm-yyyy'), 311806962);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (436499854, to_date('22-03-2023', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'), 833378932);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (504105300, to_date('29-10-2023', 'dd-mm-yyyy'), to_date('24-01-2023', 'dd-mm-yyyy'), 866217071);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (496812209, to_date('22-11-2023', 'dd-mm-yyyy'), to_date('26-01-2023', 'dd-mm-yyyy'), 299789591);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (556292807, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'), 626899383);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (636820951, to_date('07-05-2023', 'dd-mm-yyyy'), to_date('22-02-2023', 'dd-mm-yyyy'), 974144052);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (488893652, to_date('17-10-2023', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'), 550683516);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (126087312, to_date('26-07-2023', 'dd-mm-yyyy'), to_date('17-05-2023', 'dd-mm-yyyy'), 204402689);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (921619596, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('19-01-2023', 'dd-mm-yyyy'), 879336562);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (113893143, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), 513974082);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (631813152, to_date('03-01-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), 887134654);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (347578353, to_date('21-01-2023', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'), 696972862);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (555807335, to_date('14-04-2023', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), 149834226);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (789970447, to_date('30-09-2023', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 154264878);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (400235669, to_date('21-09-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), 432946267);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (110283617, to_date('13-01-2023', 'dd-mm-yyyy'), to_date('20-12-2023', 'dd-mm-yyyy'), 874925934);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (647972621, to_date('03-02-2023', 'dd-mm-yyyy'), to_date('03-04-2023', 'dd-mm-yyyy'), 882903484);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (971009344, to_date('01-02-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), 589774943);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (961451056, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 201342435);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (291621265, to_date('17-08-2023', 'dd-mm-yyyy'), to_date('06-08-2023', 'dd-mm-yyyy'), 170208456);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (773700938, to_date('23-02-2023', 'dd-mm-yyyy'), to_date('28-03-2023', 'dd-mm-yyyy'), 609369225);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (119624108, to_date('16-12-2023', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'), 864761121);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (770832433, to_date('19-12-2023', 'dd-mm-yyyy'), to_date('27-03-2023', 'dd-mm-yyyy'), 549985818);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (711839734, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'), 134982879);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (715096707, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('21-06-2023', 'dd-mm-yyyy'), 637136262);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (405092908, to_date('13-09-2023', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), 771518979);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (491349128, to_date('19-07-2023', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), 742524763);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (766885168, to_date('20-05-2023', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'), 540476869);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (987962240, to_date('22-08-2023', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'), 442322646);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (544477193, to_date('31-03-2023', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'), 476207224);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (102239770, to_date('14-08-2023', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), 202463670);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (206288384, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('08-06-2023', 'dd-mm-yyyy'), 690025000);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (796418101, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'), 893420511);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (173916856, to_date('18-12-2023', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'), 133572987);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (979658042, to_date('10-06-2023', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'), 311806962);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (407633863, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'), 183710376);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (460277375, to_date('09-06-2023', 'dd-mm-yyyy'), to_date('05-03-2023', 'dd-mm-yyyy'), 194815980);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (814163682, to_date('03-08-2023', 'dd-mm-yyyy'), to_date('27-05-2023', 'dd-mm-yyyy'), 177885927);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (757103590, to_date('15-04-2023', 'dd-mm-yyyy'), to_date('23-10-2023', 'dd-mm-yyyy'), 984196853);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (424173276, to_date('07-01-2023', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'), 321157167);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (285486340, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('13-04-2023', 'dd-mm-yyyy'), 115736975);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (519415580, to_date('20-01-2023', 'dd-mm-yyyy'), to_date('14-05-2023', 'dd-mm-yyyy'), 442652819);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (498450588, to_date('15-08-2023', 'dd-mm-yyyy'), to_date('28-01-2023', 'dd-mm-yyyy'), 887134654);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (307146043, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('03-01-2023', 'dd-mm-yyyy'), 952157670);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (672944050, to_date('10-02-2023', 'dd-mm-yyyy'), to_date('06-04-2023', 'dd-mm-yyyy'), 936184899);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (223514088, to_date('22-04-2023', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'), 130418894);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (741386457, to_date('06-06-2023', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'), 860961076);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (129369419, to_date('12-01-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), 865893397);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (386013316, to_date('01-08-2023', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'), 340278678);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (422567666, to_date('13-06-2023', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), 115736975);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (994073242, to_date('22-09-2023', 'dd-mm-yyyy'), to_date('21-03-2023', 'dd-mm-yyyy'), 751246552);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (461660610, to_date('29-01-2023', 'dd-mm-yyyy'), to_date('05-02-2023', 'dd-mm-yyyy'), 796944275);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (922035606, to_date('26-08-2023', 'dd-mm-yyyy'), to_date('25-01-2023', 'dd-mm-yyyy'), 808703582);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (358063269, to_date('03-10-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), 176172146);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (392844146, to_date('12-07-2023', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'), 584831315);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (378653430, to_date('30-11-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'), 718223920);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (858162336, to_date('25-10-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 292702201);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (389528700, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'), 218780512);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (153747721, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'), 597422886);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (995571978, to_date('20-10-2023', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'), 405145468);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (266815082, to_date('18-04-2023', 'dd-mm-yyyy'), to_date('31-01-2023', 'dd-mm-yyyy'), 738509747);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (370808243, to_date('04-02-2023', 'dd-mm-yyyy'), to_date('15-08-2023', 'dd-mm-yyyy'), 628951225);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (575752208, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 144020162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (262523853, to_date('09-11-2023', 'dd-mm-yyyy'), to_date('18-06-2023', 'dd-mm-yyyy'), 134982879);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (421087186, to_date('12-03-2023', 'dd-mm-yyyy'), to_date('20-08-2023', 'dd-mm-yyyy'), 401469090);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (569014082, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('12-11-2023', 'dd-mm-yyyy'), 418297667);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (878422548, to_date('15-11-2023', 'dd-mm-yyyy'), to_date('01-05-2023', 'dd-mm-yyyy'), 919698392);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (967875396, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('09-01-2023', 'dd-mm-yyyy'), 669524357);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (435399276, to_date('31-08-2023', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'), 774984509);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (190215997, to_date('04-02-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'), 661974959);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (481882532, to_date('28-03-2023', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'), 219490683);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (127271467, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'), 684340759);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (811721191, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('12-04-2023', 'dd-mm-yyyy'), 367974479);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (500931841, to_date('22-05-2023', 'dd-mm-yyyy'), to_date('16-08-2023', 'dd-mm-yyyy'), 816589551);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (561874619, to_date('06-07-2023', 'dd-mm-yyyy'), to_date('21-01-2023', 'dd-mm-yyyy'), 693364662);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (159862252, to_date('06-05-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'), 693364662);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (686672809, to_date('28-03-2023', 'dd-mm-yyyy'), to_date('27-10-2023', 'dd-mm-yyyy'), 883554799);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (859481302, to_date('16-01-2023', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), 295691441);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (437729907, to_date('09-09-2023', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'), 785395896);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (578299599, to_date('22-02-2023', 'dd-mm-yyyy'), to_date('19-03-2023', 'dd-mm-yyyy'), 553177977);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (999816284, to_date('23-05-2023', 'dd-mm-yyyy'), to_date('23-01-2023', 'dd-mm-yyyy'), 218780512);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (496265442, to_date('12-01-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 238109118);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (676060758, to_date('14-12-2023', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), 170767402);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (244065391, to_date('29-06-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'), 398977486);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (828452187, to_date('03-02-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), 822098469);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (207034524, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 360881982);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (717988584, to_date('15-10-2023', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 816589551);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (864694440, to_date('30-03-2023', 'dd-mm-yyyy'), to_date('21-07-2023', 'dd-mm-yyyy'), 336715636);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (459232059, to_date('14-05-2023', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), 736230883);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (148206606, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), 105394027);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (662719284, to_date('24-03-2023', 'dd-mm-yyyy'), to_date('22-03-2023', 'dd-mm-yyyy'), 573928132);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (834454425, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'), 855309104);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (691899861, to_date('02-01-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'), 747910964);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (948299438, to_date('05-03-2023', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'), 299789591);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (865278842, to_date('28-11-2023', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'), 420409127);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (245045352, to_date('15-07-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 794034863);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (695474841, to_date('15-06-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'), 359440647);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (274538116, to_date('25-08-2023', 'dd-mm-yyyy'), to_date('27-01-2023', 'dd-mm-yyyy'), 119813764);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (431221574, to_date('13-01-2023', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'), 890337452);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (317881047, to_date('02-09-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 501862641);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (562188295, to_date('31-10-2023', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 333722293);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (618701039, to_date('16-04-2023', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'), 852481514);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (416123545, to_date('15-06-2023', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'), 290502901);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (534515184, to_date('03-06-2023', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), 927381290);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (529486747, to_date('30-05-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'), 626375289);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (191266632, to_date('18-09-2023', 'dd-mm-yyyy'), to_date('08-11-2023', 'dd-mm-yyyy'), 239409163);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (662673623, to_date('31-05-2023', 'dd-mm-yyyy'), to_date('17-02-2023', 'dd-mm-yyyy'), 941651867);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (566774341, to_date('09-04-2023', 'dd-mm-yyyy'), to_date('02-05-2023', 'dd-mm-yyyy'), 738509747);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (765414024, to_date('24-03-2023', 'dd-mm-yyyy'), to_date('12-03-2023', 'dd-mm-yyyy'), 686407467);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (237923357, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('26-02-2023', 'dd-mm-yyyy'), 421314721);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (133174709, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('07-02-2023', 'dd-mm-yyyy'), 152485947);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (833160585, to_date('10-01-2023', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), 303288269);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (437684745, to_date('30-09-2023', 'dd-mm-yyyy'), to_date('10-01-2023', 'dd-mm-yyyy'), 571891498);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (217505505, to_date('17-07-2023', 'dd-mm-yyyy'), to_date('15-01-2023', 'dd-mm-yyyy'), 388667905);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (920267607, to_date('06-04-2023', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 747910964);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (233086097, to_date('18-04-2023', 'dd-mm-yyyy'), to_date('25-12-2023', 'dd-mm-yyyy'), 170208456);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (411761716, to_date('24-08-2023', 'dd-mm-yyyy'), to_date('09-01-2023', 'dd-mm-yyyy'), 322303650);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (205417266, to_date('26-10-2023', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'), 554917367);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (143690063, to_date('19-06-2023', 'dd-mm-yyyy'), to_date('04-05-2023', 'dd-mm-yyyy'), 927381290);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (635502315, to_date('25-06-2023', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'), 598851531);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (648249722, to_date('03-03-2023', 'dd-mm-yyyy'), to_date('01-01-2023', 'dd-mm-yyyy'), 513974082);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (411607585, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'), 869884759);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (965883448, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), 295108415);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (923486122, to_date('06-10-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'), 507134835);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (694918238, to_date('07-09-2023', 'dd-mm-yyyy'), to_date('30-05-2023', 'dd-mm-yyyy'), 284104059);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (527158297, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('16-04-2023', 'dd-mm-yyyy'), 220744448);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (384259611, to_date('22-07-2023', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), 735081362);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (521345556, to_date('04-10-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), 797368163);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (193665540, to_date('18-04-2023', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'), 718599414);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (938548040, to_date('07-07-2023', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), 475823720);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (782940373, to_date('27-11-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'), 239409163);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (155807555, to_date('19-10-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'), 794034863);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (147736718, to_date('17-09-2023', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'), 176172146);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (873654454, to_date('27-06-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'), 797986115);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (651782194, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'), 348879817);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (427850229, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('12-05-2023', 'dd-mm-yyyy'), 616864162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (519508105, to_date('16-09-2023', 'dd-mm-yyyy'), to_date('11-05-2023', 'dd-mm-yyyy'), 952157670);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (468557162, to_date('12-01-2023', 'dd-mm-yyyy'), to_date('14-09-2023', 'dd-mm-yyyy'), 418439061);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (205498479, to_date('24-08-2023', 'dd-mm-yyyy'), to_date('05-01-2023', 'dd-mm-yyyy'), 103261303);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (796742174, to_date('17-01-2023', 'dd-mm-yyyy'), to_date('24-02-2023', 'dd-mm-yyyy'), 694410389);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (754150603, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('29-04-2023', 'dd-mm-yyyy'), 220744448);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (469204025, to_date('09-04-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 219490683);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (260692055, to_date('02-07-2023', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'), 862072713);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (902851302, to_date('07-11-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'), 932130069);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (149484424, to_date('01-05-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), 345660840);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (707003185, to_date('03-05-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'), 242260899);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (853610294, to_date('07-06-2023', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'), 699762206);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (980785716, to_date('03-09-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'), 201342435);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (617337728, to_date('10-03-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'), 796944275);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (512403390, to_date('17-03-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), 150693205);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (906435399, to_date('12-08-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 540888184);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (139429105, to_date('28-03-2023', 'dd-mm-yyyy'), to_date('17-04-2023', 'dd-mm-yyyy'), 303319275);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (206721673, to_date('30-01-2023', 'dd-mm-yyyy'), to_date('29-05-2023', 'dd-mm-yyyy'), 640272796);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (855525093, to_date('12-03-2023', 'dd-mm-yyyy'), to_date('28-02-2023', 'dd-mm-yyyy'), 425239658);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (474922341, to_date('22-05-2023', 'dd-mm-yyyy'), to_date('24-09-2023', 'dd-mm-yyyy'), 276507256);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (510433183, to_date('06-12-2023', 'dd-mm-yyyy'), to_date('18-01-2023', 'dd-mm-yyyy'), 677534192);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (184134373, to_date('12-06-2023', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), 822098469);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (127904840, to_date('16-01-2023', 'dd-mm-yyyy'), to_date('20-05-2023', 'dd-mm-yyyy'), 217230965);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (135196957, to_date('10-03-2023', 'dd-mm-yyyy'), to_date('26-09-2023', 'dd-mm-yyyy'), 797986115);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (291729642, to_date('16-03-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'), 686407467);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (991306255, to_date('14-11-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 600746268);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (904415435, to_date('27-01-2023', 'dd-mm-yyyy'), to_date('06-02-2023', 'dd-mm-yyyy'), 867828763);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (392526699, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'), 810942013);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (337624157, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('15-03-2023', 'dd-mm-yyyy'), 276507256);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (425699329, to_date('13-10-2023', 'dd-mm-yyyy'), to_date('01-04-2023', 'dd-mm-yyyy'), 195263919);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (249424386, to_date('21-11-2023', 'dd-mm-yyyy'), to_date('13-02-2023', 'dd-mm-yyyy'), 176100852);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (619876547, to_date('23-07-2023', 'dd-mm-yyyy'), to_date('04-04-2023', 'dd-mm-yyyy'), 774984509);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (572034903, to_date('11-03-2023', 'dd-mm-yyyy'), to_date('30-04-2023', 'dd-mm-yyyy'), 639946543);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (414072862, to_date('25-11-2023', 'dd-mm-yyyy'), to_date('29-09-2023', 'dd-mm-yyyy'), 178078486);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (256253137, to_date('26-06-2023', 'dd-mm-yyyy'), to_date('09-07-2023', 'dd-mm-yyyy'), 508977710);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (859062567, to_date('08-02-2023', 'dd-mm-yyyy'), to_date('22-04-2023', 'dd-mm-yyyy'), 842874049);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (526438115, to_date('01-01-2023', 'dd-mm-yyyy'), to_date('25-08-2023', 'dd-mm-yyyy'), 172255483);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (174427958, to_date('19-01-2023', 'dd-mm-yyyy'), to_date('06-03-2023', 'dd-mm-yyyy'), 467653037);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (133999573, to_date('08-11-2023', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'), 807013482);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (142315637, to_date('10-12-2023', 'dd-mm-yyyy'), to_date('11-03-2023', 'dd-mm-yyyy'), 360881982);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (529083176, to_date('25-04-2023', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'), 337932609);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (586643543, to_date('09-04-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'), 295108415);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (680786315, to_date('26-05-2023', 'dd-mm-yyyy'), to_date('02-01-2023', 'dd-mm-yyyy'), 220744448);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (517067823, to_date('26-04-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'), 240115315);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (297039736, to_date('04-08-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'), 830270538);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (717116259, to_date('21-04-2023', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'), 178283057);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (907497290, to_date('28-09-2023', 'dd-mm-yyyy'), to_date('11-02-2023', 'dd-mm-yyyy'), 782195448);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (981773910, to_date('09-08-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'), 690025000);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (907639362, to_date('25-02-2023', 'dd-mm-yyyy'), to_date('25-05-2023', 'dd-mm-yyyy'), 299789591);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (967716761, to_date('27-11-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'), 865893397);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (101065086, to_date('26-09-2023', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'), 780264562);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (865580593, to_date('26-05-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), 506351401);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (150874220, to_date('01-06-2023', 'dd-mm-yyyy'), to_date('30-10-2023', 'dd-mm-yyyy'), 290932547);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (544374926, to_date('11-08-2023', 'dd-mm-yyyy'), to_date('14-03-2023', 'dd-mm-yyyy'), 690025000);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (841371586, to_date('23-10-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'), 174961000);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (909655822, to_date('30-10-2023', 'dd-mm-yyyy'), to_date('04-02-2023', 'dd-mm-yyyy'), 133572987);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (289315285, to_date('28-01-2023', 'dd-mm-yyyy'), to_date('09-03-2023', 'dd-mm-yyyy'), 573928132);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (565606458, to_date('16-10-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'), 767251347);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (610824383, to_date('23-11-2023', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'), 240115315);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (432990806, to_date('15-02-2023', 'dd-mm-yyyy'), to_date('16-08-2023', 'dd-mm-yyyy'), 720891949);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (677112593, to_date('27-02-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'), 727220792);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (956293413, to_date('24-03-2023', 'dd-mm-yyyy'), to_date('13-05-2023', 'dd-mm-yyyy'), 115736975);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (360671479, to_date('05-08-2023', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'), 408198599);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (890487169, to_date('14-09-2023', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'), 690025000);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (114640006, to_date('26-02-2023', 'dd-mm-yyyy'), to_date('04-07-2023', 'dd-mm-yyyy'), 233756485);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (197031117, to_date('09-07-2023', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 953988797);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (123116764, to_date('11-05-2023', 'dd-mm-yyyy'), to_date('07-05-2023', 'dd-mm-yyyy'), 727220792);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (256141764, to_date('07-04-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'), 295108415);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (740347026, to_date('23-09-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'), 184755344);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (924353999, to_date('09-01-2023', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'), 797986115);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (583298772, to_date('16-10-2023', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'), 420409127);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (689141646, to_date('17-09-2023', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'), 217521794);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (986380133, to_date('13-08-2023', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'), 532313056);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (302152825, to_date('27-02-2023', 'dd-mm-yyyy'), to_date('31-03-2023', 'dd-mm-yyyy'), 184895509);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (950195227, to_date('15-05-2023', 'dd-mm-yyyy'), to_date('07-11-2023', 'dd-mm-yyyy'), 820264412);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (865681697, to_date('04-11-2023', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'), 508914852);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (449536147, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'), 783763822);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (109595843, to_date('08-04-2023', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'), 677534192);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (790515862, to_date('17-03-2023', 'dd-mm-yyyy'), to_date('14-04-2023', 'dd-mm-yyyy'), 554917367);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (384317411, to_date('23-02-2023', 'dd-mm-yyyy'), to_date('23-02-2023', 'dd-mm-yyyy'), 150693205);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (154110136, to_date('12-11-2023', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'), 201342435);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (615866333, to_date('30-05-2023', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'), 639946543);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (214646023, to_date('23-08-2023', 'dd-mm-yyyy'), to_date('23-03-2023', 'dd-mm-yyyy'), 450555098);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (677665331, to_date('10-03-2023', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'), 877804100);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (808200346, to_date('11-09-2023', 'dd-mm-yyyy'), to_date('23-04-2023', 'dd-mm-yyyy'), 281637162);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (137029056, to_date('13-09-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'), 626899383);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (228703555, to_date('07-10-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'), 917154705);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (588263647, to_date('29-04-2023', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'), 686407467);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (980032661, to_date('31-01-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'), 832653813);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (795338123, to_date('13-02-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'), 873552785);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (791771467, to_date('05-03-2023', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'), 848103746);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (291405448, to_date('31-10-2023', 'dd-mm-yyyy'), to_date('20-03-2023', 'dd-mm-yyyy'), 121785655);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (945867100, to_date('02-05-2023', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'), 345246294);
insert into SHIFTS (shift_id, start_date_time, end_date_time, base_id)
values (526298756, to_date('05-12-2023', 'dd-mm-yyyy'), to_date('28-09-2023', 'dd-mm-yyyy'), 290932547);
commit;
prompt 400 records loaded
prompt Loading VOLUNTEERS...
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (820943069, to_date('24-12-2023', 'dd-mm-yyyy'), 'ValSlater', 620822124, 538878563, '532127075');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (728052444, to_date('23-11-2023', 'dd-mm-yyyy'), 'ConnieVan Der Beek', 496244063, 144790606, '539943439');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (548222318, to_date('09-02-2023', 'dd-mm-yyyy'), 'VivicaPaxton', 493617746, 866744809, '535740372');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (959604180, to_date('04-08-2023', 'dd-mm-yyyy'), 'TeenaRoot', 549120088, 631368862, '533391906');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (953264939, to_date('15-07-2023', 'dd-mm-yyyy'), 'PelvicGordon', 769802617, 299114757, '533330969');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (637721837, to_date('20-11-2023', 'dd-mm-yyyy'), 'LorraineUggams', 941153423, 216606274, '536210601');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (648262515, to_date('23-12-2023', 'dd-mm-yyyy'), 'ThomasMcDonnell', 177065433, 608192881, '539990765');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (846987742, to_date('06-04-2023', 'dd-mm-yyyy'), 'ScarlettSinise', 622739463, 275086623, '534830185');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (324514293, to_date('03-04-2023', 'dd-mm-yyyy'), 'KurtwoodBorden', 450034199, 857258048, '531694270');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (939275485, to_date('16-02-2023', 'dd-mm-yyyy'), 'SammyLoggins', 123711229, 924687916, '534350567');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (655356874, to_date('26-08-2023', 'dd-mm-yyyy'), 'OzzyDay-Lewis', 678435296, 505908538, '538263523');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (964804601, to_date('05-05-2023', 'dd-mm-yyyy'), 'OdedCraven', 165256469, 966872477, '536958498');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (705343901, to_date('29-01-2023', 'dd-mm-yyyy'), 'MacCheadle', 932418525, 639025517, '538419385');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (109445262, to_date('08-07-2023', 'dd-mm-yyyy'), 'DomCharles', 771822614, 964566404, '537553593');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (445675744, to_date('17-01-2023', 'dd-mm-yyyy'), 'AnnaBrothers', 489377741, 337706222, '531227462');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (138272958, to_date('01-03-2023', 'dd-mm-yyyy'), 'JonCarrey', 909202768, 895317919, '530422233');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (175879191, to_date('15-06-2023', 'dd-mm-yyyy'), 'NigelBurton', 731690775, 203130083, '534740622');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (345373195, to_date('14-08-2023', 'dd-mm-yyyy'), 'JackieStudi', 398547356, 881965141, '536020063');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (451737131, to_date('07-03-2023', 'dd-mm-yyyy'), 'WallaceYankovic', 897061527, 425206029, '539856383');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (209896170, to_date('26-10-2023', 'dd-mm-yyyy'), 'SonaAllison', 441905645, 457176379, '533405730');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (719468246, to_date('04-07-2023', 'dd-mm-yyyy'), 'AnitaNakai', 220580133, 789403034, '532145736');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (758361470, to_date('08-11-2023', 'dd-mm-yyyy'), 'DrewD''Onofrio', 123490198, 834870049, '532629409');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (256156696, to_date('04-05-2023', 'dd-mm-yyyy'), 'AliceMurphy', 789534151, 651382437, '536939397');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (133212750, to_date('10-05-2023', 'dd-mm-yyyy'), 'Johnnievon Sydow', 259175304, 995204286, '534859721');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (516431806, to_date('28-03-2023', 'dd-mm-yyyy'), 'CharltonCromwell', 836289094, 128231585, '539562266');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (467622428, to_date('09-09-2023', 'dd-mm-yyyy'), 'TalSupernaw', 373441515, 461940282, '538969555');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (785397757, to_date('12-04-2023', 'dd-mm-yyyy'), 'AlbertinaHerndon', 326564708, 253418130, '539898546');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (866546367, to_date('16-12-2023', 'dd-mm-yyyy'), 'JoannaKing', 557577530, 618803541, '534364153');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (637813267, to_date('16-09-2023', 'dd-mm-yyyy'), 'SophieReed', 512147344, 368516579, '537711932');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (794028566, to_date('27-10-2023', 'dd-mm-yyyy'), 'MauraCoolidge', 562633887, 594826988, '531478470');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (203521288, to_date('31-05-2023', 'dd-mm-yyyy'), 'AnnieAllan', 897061527, 941777746, '539554104');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (366755847, to_date('18-02-2023', 'dd-mm-yyyy'), 'MosFerry', 932418525, 550299971, '532836735');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (939128682, to_date('22-03-2023', 'dd-mm-yyyy'), 'FrancesHudson', 683947556, 962469929, '531851116');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (253862540, to_date('15-05-2023', 'dd-mm-yyyy'), 'RosieAzaria', 356303152, 834870049, '538124887');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (605935919, to_date('28-12-2023', 'dd-mm-yyyy'), 'JamieCoverdale', 333294415, 111848564, '535086098');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (282985172, to_date('26-11-2023', 'dd-mm-yyyy'), 'LauraTomei', 732378876, 453210957, '538889519');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (454116758, to_date('10-07-2023', 'dd-mm-yyyy'), 'NastassjaDerringer', 547950643, 399420166, '534415071');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (352567157, to_date('20-01-2023', 'dd-mm-yyyy'), 'TamalaKimball', 468168585, 873443277, '535613648');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (313147938, to_date('16-04-2023', 'dd-mm-yyyy'), 'LindseyHannah', 808405686, 966872477, '534740622');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (950413481, to_date('27-12-2023', 'dd-mm-yyyy'), 'VerticalFox', 404286043, 519789573, '538919287');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (488488861, to_date('21-12-2023', 'dd-mm-yyyy'), 'HexPreston', 353921238, 299347667, '530421723');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (578495386, to_date('24-05-2023', 'dd-mm-yyyy'), 'DermotHedaya', 377039627, 803826363, '534501042');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (564511286, to_date('22-10-2023', 'dd-mm-yyyy'), 'AmyHoliday', 417852195, 500871083, '531216529');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (884005066, to_date('31-12-2023', 'dd-mm-yyyy'), 'DrewPonce', 980918851, 968304655, '536359279');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (513679012, to_date('29-09-2023', 'dd-mm-yyyy'), 'RoddyPastore', 333920779, 709763067, '530502678');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (596660348, to_date('20-11-2023', 'dd-mm-yyyy'), 'CandiceDerringer', 342833229, 730857856, '531400407');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (511977564, to_date('09-06-2023', 'dd-mm-yyyy'), 'GailardDarren', 530317206, 227248220, '536525677');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (772259381, to_date('15-08-2023', 'dd-mm-yyyy'), 'ChrisCostello', 915346877, 417760874, '531427421');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (360593887, to_date('04-01-2023', 'dd-mm-yyyy'), 'GranShue', 385905786, 102529246, '536210601');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (642485323, to_date('14-03-2023', 'dd-mm-yyyy'), 'MosMueller-Stahl', 622739463, 500871083, '534600512');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (313846026, to_date('02-09-2023', 'dd-mm-yyyy'), 'TreyKimball', 996172820, 898487171, '531175714');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (270961030, to_date('19-10-2023', 'dd-mm-yyyy'), 'NicolasHagar', 986058697, 578292995, '530149999');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (613362820, to_date('13-02-2023', 'dd-mm-yyyy'), 'GordLavigne', 862985517, 316238082, '539341331');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (115553744, to_date('09-05-2023', 'dd-mm-yyyy'), 'SaffronChestnut', 428767209, 735272605, '538324324');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (628513584, to_date('11-10-2023', 'dd-mm-yyyy'), 'ElvisGarofalo', 980918851, 835934579, '532452791');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (196929778, to_date('06-12-2023', 'dd-mm-yyyy'), 'ChuckConnelly', 325485023, 288157516, '530970781');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (303087801, to_date('21-10-2023', 'dd-mm-yyyy'), 'WadeGarner', 487831062, 922852841, '530553860');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (673359205, to_date('02-12-2023', 'dd-mm-yyyy'), 'DenisWeaver', 265157884, 163498461, '532074392');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (308224807, to_date('26-12-2023', 'dd-mm-yyyy'), 'KylieBradford', 184558690, 803826363, '538919287');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (221770544, to_date('19-01-2023', 'dd-mm-yyyy'), 'AmyIngram', 880859102, 969138432, '530214472');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (901593477, to_date('08-05-2023', 'dd-mm-yyyy'), 'CourtneyVinton', 933998105, 737705982, '534925671');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (325055451, to_date('14-03-2023', 'dd-mm-yyyy'), 'ChaleeKristofferson', 632279670, 589274768, '534993864');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (392821917, to_date('06-09-2023', 'dd-mm-yyyy'), 'NedSpringfield', 671741204, 955928450, '536222102');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (165623403, to_date('08-01-2023', 'dd-mm-yyyy'), 'SonnyMyles', 384972445, 320060434, '533663234');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (415177149, to_date('15-10-2023', 'dd-mm-yyyy'), 'OwenMoore', 452604754, 482640628, '538626842');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (125206388, to_date('28-05-2023', 'dd-mm-yyyy'), 'JonathaColton', 529209704, 767869768, '530109419');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (903494796, to_date('06-08-2023', 'dd-mm-yyyy'), 'JeffreyFerry', 714642464, 395051296, '536946863');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (390913588, to_date('18-09-2023', 'dd-mm-yyyy'), 'HeathMadsen', 549556536, 856404171, '531315717');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (978358775, to_date('31-01-2023', 'dd-mm-yyyy'), 'ViggoBeals', 110449582, 355500888, '532575001');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (967536074, to_date('11-11-2023', 'dd-mm-yyyy'), 'Mary BethBraugher', 581163307, 500352861, '532863999');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (336530980, to_date('26-12-2023', 'dd-mm-yyyy'), 'BobbyDreyfuss', 421722923, 755124683, '535350436');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (396101487, to_date('14-03-2023', 'dd-mm-yyyy'), 'CrystalWood', 492871740, 151115197, '538851007');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (247630971, to_date('02-05-2023', 'dd-mm-yyyy'), 'SydneyVince', 193991099, 215377657, '530517617');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (378678727, to_date('12-03-2023', 'dd-mm-yyyy'), 'KathleenOsbourne', 221865701, 687295249, '536045030');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (557065662, to_date('25-10-2023', 'dd-mm-yyyy'), 'LeaKravitz', 741148104, 981038192, '537553593');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (109432643, to_date('11-12-2023', 'dd-mm-yyyy'), 'TildaHubbard', 496226319, 313295116, '530422233');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (795209007, to_date('06-12-2023', 'dd-mm-yyyy'), 'BenjaminRanger', 759864499, 725542736, '539486991');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (111928719, to_date('30-06-2023', 'dd-mm-yyyy'), 'HowardHanks', 115131486, 497295612, '537451318');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (892831691, to_date('19-12-2023', 'dd-mm-yyyy'), 'DianneFranklin', 263899818, 457176379, '534677629');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (282687759, to_date('23-12-2023', 'dd-mm-yyyy'), 'AnthonyRamis', 594645287, 388731624, '537885427');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (602780812, to_date('11-10-2023', 'dd-mm-yyyy'), 'KevnGates', 672824897, 505908538, '531764369');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (240990578, to_date('16-07-2023', 'dd-mm-yyyy'), 'TriniHeron', 620822124, 559225172, '531216529');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (327909572, to_date('26-05-2023', 'dd-mm-yyyy'), 'AniGough', 592600740, 319604370, '532306060');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (184932690, to_date('07-02-2023', 'dd-mm-yyyy'), 'SaulSpacek', 310720153, 750273676, '539994509');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (655256967, to_date('13-06-2023', 'dd-mm-yyyy'), 'NastassjaPride', 582912322, 457176379, '533612624');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (453728991, to_date('11-12-2023', 'dd-mm-yyyy'), 'BetteGleeson', 513149919, 737705982, '531910414');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (596477468, to_date('11-05-2023', 'dd-mm-yyyy'), 'DannyCobbs', 115131486, 215679774, '531330276');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (696268450, to_date('25-01-2023', 'dd-mm-yyyy'), 'HeathKatt', 324503961, 879127626, '531210525');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (834520713, to_date('27-05-2023', 'dd-mm-yyyy'), 'HookahPiven', 275912823, 500871083, '531694270');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (445918797, to_date('22-05-2023', 'dd-mm-yyyy'), 'TomTravers', 716780532, 675885992, '535676321');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (276561195, to_date('22-07-2023', 'dd-mm-yyyy'), 'GeraldWahlberg', 667230265, 655751347, '536909845');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (201581208, to_date('03-10-2023', 'dd-mm-yyyy'), 'GordiePhifer', 248269181, 895317919, '535009442');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (313177947, to_date('24-02-2023', 'dd-mm-yyyy'), 'PeaboMarie', 946485430, 217433112, '533488874');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (314994995, to_date('07-10-2023', 'dd-mm-yyyy'), 'RodMcCann', 253081212, 849809317, '530442051');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (583784229, to_date('08-05-2023', 'dd-mm-yyyy'), 'EwanDerringer', 649942859, 457666091, '535208744');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (384292290, to_date('20-05-2023', 'dd-mm-yyyy'), 'ChadShaye', 333920779, 550299971, '534083365');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (648307219, to_date('13-06-2023', 'dd-mm-yyyy'), 'BobbyRipley', 554174162, 102529246, '539764604');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (953802738, to_date('26-05-2023', 'dd-mm-yyyy'), 'BryanForster', 274554825, 458023431, '530442051');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (365117699, to_date('13-12-2023', 'dd-mm-yyyy'), 'CevinMcLean', 369371631, 232451416, '531910950');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (320108179, to_date('03-09-2023', 'dd-mm-yyyy'), 'MickeyTyler', 745215562, 721129191, '530502678');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (775209739, to_date('01-07-2023', 'dd-mm-yyyy'), 'TreyMyers', 874147059, 691415264, '536686821');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (844347337, to_date('19-03-2023', 'dd-mm-yyyy'), 'DonnaDeLuise', 771822614, 148004561, '535214211');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (992630392, to_date('02-08-2023', 'dd-mm-yyyy'), 'BobFolds', 752975163, 943148321, '534063736');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (470770511, to_date('18-01-2023', 'dd-mm-yyyy'), 'FredMarley', 160844479, 503402147, '532215442');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (101159372, to_date('09-02-2023', 'dd-mm-yyyy'), 'TraceBell', 776038542, 111827211, '537132620');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (951544258, to_date('05-12-2023', 'dd-mm-yyyy'), 'MelanieFiorentino', 165256469, 456007716, '537828436');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (457238751, to_date('14-09-2023', 'dd-mm-yyyy'), 'JackArthur', 769802617, 388731624, '538231723');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (377806082, to_date('27-10-2023', 'dd-mm-yyyy'), 'WadeLowe', 168947359, 425206029, '531427421');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (699152638, to_date('29-11-2023', 'dd-mm-yyyy'), 'PhilipChappelle', 858697568, 278803990, '530553860');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (616969123, to_date('31-03-2023', 'dd-mm-yyyy'), 'LionelBachman', 556910809, 618522898, '538109133');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (962456875, to_date('26-02-2023', 'dd-mm-yyyy'), 'JaredKutcher', 714846100, 915401751, '532145736');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (856276842, to_date('20-05-2023', 'dd-mm-yyyy'), 'SonaLandau', 917164486, 842869733, '531283878');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (501658715, to_date('11-07-2023', 'dd-mm-yyyy'), 'AnneWashington', 501152361, 941883227, '536210601');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (652607711, to_date('13-01-2023', 'dd-mm-yyyy'), 'DanniChilton', 183209683, 280751508, '539009310');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (318146519, to_date('20-05-2023', 'dd-mm-yyyy'), 'HeatherDef', 663500683, 725542736, '533161926');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (788529899, to_date('18-05-2023', 'dd-mm-yyyy'), 'LiamO''Donnell', 611587715, 431538042, '530414372');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (894369436, to_date('06-10-2023', 'dd-mm-yyyy'), 'IkeCarter', 421722923, 626156675, '535870790');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (134605958, to_date('11-07-2023', 'dd-mm-yyyy'), 'JohnField', 123711229, 551811823, '530214472');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (434267096, to_date('10-08-2023', 'dd-mm-yyyy'), 'JarvisCurtis-Hall', 620822124, 232451416, '535787086');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (217947514, to_date('29-11-2023', 'dd-mm-yyyy'), 'RuthLee', 971547327, 232451416, '539355730');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (809949292, to_date('19-10-2023', 'dd-mm-yyyy'), 'ElizaNorton', 876320005, 912712225, '533391906');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (397019954, to_date('27-06-2023', 'dd-mm-yyyy'), 'AdamPollack', 720704442, 319604370, '537344788');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (514625672, to_date('05-01-2023', 'dd-mm-yyyy'), 'LaraMakowicz', 884157863, 574992427, '534147067');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (742697109, to_date('20-09-2023', 'dd-mm-yyyy'), 'NanciKeitel', 191560363, 129115012, '537455459');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (721785427, to_date('18-05-2023', 'dd-mm-yyyy'), 'SuzyKattan', 858697568, 378855344, '536458121');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (925565947, to_date('03-06-2023', 'dd-mm-yyyy'), 'CarolTurturro', 425168952, 663599890, '538364304');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (150626973, to_date('10-12-2023', 'dd-mm-yyyy'), 'JoeyDe Almeida', 404286043, 153010076, '536105286');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (509481258, to_date('14-05-2023', 'dd-mm-yyyy'), 'DavisMcCann', 836289094, 665529249, '536587229');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (337737644, to_date('24-12-2023', 'dd-mm-yyyy'), 'DonalCox', 786134627, 419905261, '530553860');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (651370341, to_date('01-10-2023', 'dd-mm-yyyy'), 'PatHolden', 277094093, 700108211, '533199173');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (615023377, to_date('27-01-2023', 'dd-mm-yyyy'), 'MerrileePatton', 937169926, 981038192, '530445943');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (907287694, to_date('05-06-2023', 'dd-mm-yyyy'), 'MariaDavis', 310032751, 695501784, '539562266');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (793888402, to_date('12-01-2023', 'dd-mm-yyyy'), 'WilliamShaye', 308215380, 346952393, '530517617');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (144719696, to_date('31-12-2023', 'dd-mm-yyyy'), 'ElizaGrant', 210882131, 770154621, '536958498');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (755664923, to_date('13-08-2023', 'dd-mm-yyyy'), 'ClorisMoorer', 858697568, 673971429, '536958498');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (661139304, to_date('05-09-2023', 'dd-mm-yyyy'), 'AnthonyRicci', 872735168, 285929734, '536458121');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (548292815, to_date('27-01-2023', 'dd-mm-yyyy'), 'HarryHolliday', 917164486, 390816412, '536314927');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (208810729, to_date('28-12-2023', 'dd-mm-yyyy'), 'MelDuncan', 575399817, 362523636, '534284901');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (989249303, to_date('28-06-2023', 'dd-mm-yyyy'), 'PabloMilsap', 110449582, 138483323, '534900051');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (725844133, to_date('14-04-2023', 'dd-mm-yyyy'), 'MelbaDunaway', 634135993, 453984566, '532896127');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (274728655, to_date('15-12-2023', 'dd-mm-yyyy'), 'DavisRebhorn', 110449582, 874929669, '538895511');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (473500311, to_date('12-01-2023', 'dd-mm-yyyy'), 'ChantéOrlando', 852885734, 988158813, '530566278');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (995071866, to_date('13-07-2023', 'dd-mm-yyyy'), 'JudyShalhoub', 337759173, 216886967, '536939397');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (179745381, to_date('24-12-2023', 'dd-mm-yyyy'), 'HenryColton', 964513898, 152259740, '538627138');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (556446348, to_date('12-01-2023', 'dd-mm-yyyy'), 'RodArkenstone', 151932071, 351439044, '530421723');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (689055472, to_date('02-02-2023', 'dd-mm-yyyy'), 'JillSlater', 716780532, 618803541, '536909845');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (108775617, to_date('25-08-2023', 'dd-mm-yyyy'), 'BillyOverstreet', 672824897, 668336963, '533295403');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (218471407, to_date('11-04-2023', 'dd-mm-yyyy'), 'BeverleyAkins', 359220978, 783631977, '532355555');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (479918979, to_date('03-05-2023', 'dd-mm-yyyy'), 'SimonMarsden', 168947359, 440338782, '535916111');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (219903396, to_date('29-12-2023', 'dd-mm-yyyy'), 'JuliannaKeith', 732378876, 346813591, '531829061');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (416101218, to_date('18-01-2023', 'dd-mm-yyyy'), 'LeeMann', 995921447, 242882933, '533943518');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (948685722, to_date('13-08-2023', 'dd-mm-yyyy'), 'EricAtlas', 594645287, 609677936, '534925671');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (728592286, to_date('09-10-2023', 'dd-mm-yyyy'), 'JuddLemmon', 503257151, 167265890, '539488601');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (238381426, to_date('13-08-2023', 'dd-mm-yyyy'), 'JasonFranks', 914721624, 852927973, '531818898');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (846636987, to_date('21-05-2023', 'dd-mm-yyyy'), 'DrewLewin', 123711229, 253418130, '538419385');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (881836997, to_date('04-08-2023', 'dd-mm-yyyy'), 'DonaldWariner', 881474368, 687691141, '537015997');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (376634667, to_date('23-04-2023', 'dd-mm-yyyy'), 'AlecKershaw', 168947359, 767869768, '531124169');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (518487058, to_date('23-01-2023', 'dd-mm-yyyy'), 'LionelWen', 766570814, 170026490, '538109133');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (267568898, to_date('24-12-2023', 'dd-mm-yyyy'), 'RoryTrevino', 382013541, 968304655, '531818898');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (927909056, to_date('13-02-2023', 'dd-mm-yyyy'), 'SalmaMichaels', 422366273, 659887337, '533273414');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (882687172, to_date('26-02-2023', 'dd-mm-yyyy'), 'BlairDern', 745414744, 212906683, '535068939');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (729627947, to_date('08-11-2023', 'dd-mm-yyyy'), 'GinHyde', 149826730, 651382437, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (577430582, to_date('28-12-2023', 'dd-mm-yyyy'), 'BernardCattrall', 640729293, 629907579, '539898546');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (289170883, to_date('17-08-2023', 'dd-mm-yyyy'), 'JulioOrbit', 620822124, 589274768, '538428492');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (183613512, to_date('18-12-2023', 'dd-mm-yyyy'), 'JonathanKahn', 660189169, 111827211, '538419385');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (830371902, to_date('14-02-2023', 'dd-mm-yyyy'), 'ClintVaughan', 531324214, 981038192, '536176634');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (799853324, to_date('06-08-2023', 'dd-mm-yyyy'), 'WinonaEpps', 594645287, 212265538, '530898984');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (453926614, to_date('29-03-2023', 'dd-mm-yyyy'), 'CharlieEngland', 234058091, 324683402, '539088616');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (288250049, to_date('31-12-2023', 'dd-mm-yyyy'), 'BernardGore', 149826730, 399420166, '535870790');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (562196889, to_date('14-10-2023', 'dd-mm-yyyy'), 'JuliannaLaws', 260263770, 732071927, '538744918');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (177316069, to_date('15-03-2023', 'dd-mm-yyyy'), 'MarySlater', 961508320, 391681634, '533792097');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (190265545, to_date('23-12-2023', 'dd-mm-yyyy'), 'ChuckSchiff', 259175304, 966872477, '536042736');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (471155806, to_date('05-05-2023', 'dd-mm-yyyy'), 'RupertGuinness', 635918197, 305845154, '536210601');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (743241033, to_date('03-10-2023', 'dd-mm-yyyy'), 'MacRanger', 342833229, 964566404, '534063736');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (364895414, to_date('12-08-2023', 'dd-mm-yyyy'), 'AnjelicaHawthorne', 815775217, 614011429, '539562266');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (439812126, to_date('04-12-2023', 'dd-mm-yyyy'), 'FredaKleinenberg', 545341989, 711017879, '539486991');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (366362460, to_date('26-01-2023', 'dd-mm-yyyy'), 'MorganStowe', 991919168, 217433112, '537762116');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (962052610, to_date('05-02-2023', 'dd-mm-yyyy'), 'MiraHutton', 267272813, 483546182, '530433422');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (424015616, to_date('22-03-2023', 'dd-mm-yyyy'), 'EddieEllis', 591085081, 755124683, '535009932');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (211475964, to_date('10-06-2023', 'dd-mm-yyyy'), 'MenaBroza', 215041012, 849809317, '537576336');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (361124344, to_date('11-06-2023', 'dd-mm-yyyy'), 'JodyStallone', 582912322, 915027557, '530988023');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (871340056, to_date('31-03-2023', 'dd-mm-yyyy'), 'MerylForrest', 353921238, 673971429, '534943196');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (816198585, to_date('15-03-2023', 'dd-mm-yyyy'), 'DanField', 817610947, 736002250, '539994509');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (575201823, to_date('28-04-2023', 'dd-mm-yyyy'), 'JonathanPurefoy', 611373445, 216606274, '531883110');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (189668448, to_date('04-02-2023', 'dd-mm-yyyy'), 'SteveMirren', 512986462, 574992427, '534703725');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (581721963, to_date('06-03-2023', 'dd-mm-yyyy'), 'DanielPenders', 546829216, 289027790, '539759533');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (196813891, to_date('11-09-2023', 'dd-mm-yyyy'), 'MaeHingle', 611587715, 171670200, '534736079');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (555719621, to_date('07-01-2023', 'dd-mm-yyyy'), 'FionnulaGreen', 434402185, 324683402, '531330276');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (226944417, to_date('20-03-2023', 'dd-mm-yyyy'), 'JonathaHopper', 499261206, 850857605, '535969551');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (155477078, to_date('04-08-2023', 'dd-mm-yyyy'), 'MiguelCondition', 591085081, 663406175, '539138001');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (308828756, to_date('28-12-2023', 'dd-mm-yyyy'), 'WarrenHauser', 584159569, 346813591, '538627138');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (226294435, to_date('16-10-2023', 'dd-mm-yyyy'), 'RachidMoraz', 660016107, 300844103, '539088616');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (982374555, to_date('30-09-2023', 'dd-mm-yyyy'), 'JoanDench', 428767209, 760426989, '534600512');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (900294305, to_date('11-02-2023', 'dd-mm-yyyy'), 'TildaGatlin', 862985517, 530942780, '535009442');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (976558062, to_date('21-09-2023', 'dd-mm-yyyy'), 'LanceLunch', 373441515, 176786250, '534588262');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (202476496, to_date('02-12-2023', 'dd-mm-yyyy'), 'LaurenceKeitel', 964513898, 500871083, '531554530');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (793603819, to_date('25-07-2023', 'dd-mm-yyyy'), 'PierceHackman', 915244499, 668336963, '538895511');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (363022703, to_date('25-06-2023', 'dd-mm-yyyy'), 'JohnHoliday', 425168952, 144790606, '535456368');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (499414345, to_date('20-01-2023', 'dd-mm-yyyy'), 'CeiliHagerty', 377039627, 453210957, '537374741');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (235851193, to_date('19-11-2023', 'dd-mm-yyyy'), 'GlenSizemore', 294415745, 298564543, '536314927');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (720249825, to_date('29-08-2023', 'dd-mm-yyyy'), 'TamalaCurry', 769802617, 411498575, '532829331');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (823421490, to_date('17-09-2023', 'dd-mm-yyyy'), 'ConnieZellweger', 660016107, 311019840, '536133507');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (545657798, to_date('11-11-2023', 'dd-mm-yyyy'), 'DarylFender', 909202768, 453984566, '536953321');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (507789069, to_date('20-07-2023', 'dd-mm-yyyy'), 'RitaHaslam', 591085081, 261762953, '531320992');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (437652843, to_date('05-05-2023', 'dd-mm-yyyy'), 'VingSpector', 373556476, 808111489, '533761432');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (687910038, to_date('24-04-2023', 'dd-mm-yyyy'), 'Jean-ClaudePiven', 949465249, 762708704, '536594956');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (246146269, to_date('05-12-2023', 'dd-mm-yyyy'), 'NikkaFavreau', 740002560, 379089095, '535870790');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (223195826, to_date('12-05-2023', 'dd-mm-yyyy'), 'IsabellaCarr', 632279670, 246819691, '532149124');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (430625801, to_date('30-05-2023', 'dd-mm-yyyy'), 'KevnSpacek', 220580133, 629907579, '537082440');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (283317875, to_date('17-06-2023', 'dd-mm-yyyy'), 'ShannonSwinton', 633923938, 956458859, '537287970');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (188085265, to_date('14-02-2023', 'dd-mm-yyyy'), 'AniMorrison', 352546269, 784672748, '530433422');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (704262321, to_date('10-07-2023', 'dd-mm-yyyy'), 'JulietClinton', 441905645, 109110931, '535555392');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (587204282, to_date('10-05-2023', 'dd-mm-yyyy'), 'KurtSolido', 925374231, 849809317, '531693540');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (450634687, to_date('09-03-2023', 'dd-mm-yyyy'), 'Jean-LucFerrer', 791868268, 324683402, '531554530');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (108777947, to_date('05-08-2023', 'dd-mm-yyyy'), 'YaphetLerner', 938124815, 144790606, '538969555');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (384214567, to_date('10-03-2023', 'dd-mm-yyyy'), 'Carrie-AnneGaines', 492871740, 968304655, '530574898');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (592396525, to_date('16-07-2023', 'dd-mm-yyyy'), 'GoranFinn', 547950643, 709763067, '537828436');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (238760315, to_date('25-07-2023', 'dd-mm-yyyy'), 'GarlandSalonga', 244866060, 966872477, '532583764');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (189375133, to_date('17-12-2023', 'dd-mm-yyyy'), 'NicoleSevenfold', 750946636, 709763067, '531281568');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (601063733, to_date('26-08-2023', 'dd-mm-yyyy'), 'BernieTorino', 447680874, 491161262, '535613648');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (321933428, to_date('17-05-2023', 'dd-mm-yyyy'), 'MattChilton', 187659795, 681700409, '535787086');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (898254756, to_date('26-11-2023', 'dd-mm-yyyy'), 'ShannonAnderson', 422366273, 320060434, '534284901');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (548625297, to_date('29-06-2023', 'dd-mm-yyyy'), 'LesleyRamirez', 996172820, 221002926, '532102815');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (591356144, to_date('12-07-2023', 'dd-mm-yyyy'), 'OdedGates', 776038542, 154279368, '538231723');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (236018541, to_date('13-07-2023', 'dd-mm-yyyy'), 'DeniseLindo', 553226851, 227248220, '535086098');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (875088165, to_date('05-12-2023', 'dd-mm-yyyy'), 'Jonny LeeBoothe', 998820027, 568160739, '538804908');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (736624569, to_date('19-04-2023', 'dd-mm-yyyy'), 'ChetKnight', 496244063, 144027567, '531693540');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (583923284, to_date('14-12-2023', 'dd-mm-yyyy'), 'AlanaSilverman', 368019066, 607752739, '535998802');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (873078075, to_date('09-02-2023', 'dd-mm-yyyy'), 'DarrenHeatherly', 187659795, 119611867, '539601284');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (704390851, to_date('21-12-2023', 'dd-mm-yyyy'), 'MarleyDuschel', 421722923, 486898882, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (128566735, to_date('06-07-2023', 'dd-mm-yyyy'), 'DennyWinwood', 961508320, 962469929, '537455459');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (393631789, to_date('03-10-2023', 'dd-mm-yyyy'), 'HumbertoCheadle', 325485023, 227248220, '539379627');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (543510892, to_date('30-10-2023', 'dd-mm-yyyy'), 'OssieFonda', 995921447, 148004561, '531502627');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (704203281, to_date('28-02-2023', 'dd-mm-yyyy'), 'OssiePerlman', 308215380, 670415411, '532693445');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (118493240, to_date('30-06-2023', 'dd-mm-yyyy'), 'MadelineMahood', 288205055, 388731624, '536870854');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (715133455, to_date('26-08-2023', 'dd-mm-yyyy'), 'RedCurtis', 662264442, 764463597, '532006348');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (223438515, to_date('24-03-2023', 'dd-mm-yyyy'), 'WinonaBall', 990963882, 491220901, '539379627');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (469226077, to_date('08-08-2023', 'dd-mm-yyyy'), 'CaseyBacharach', 422366273, 822221093, '536982267');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (913043182, to_date('31-12-2023', 'dd-mm-yyyy'), 'BruceMerchant', 548233541, 418470967, '532575001');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (816615232, to_date('09-06-2023', 'dd-mm-yyyy'), 'IvanShepherd', 581163307, 432331083, '533199173');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (348455121, to_date('30-10-2023', 'dd-mm-yyyy'), 'CubaFarina', 145684861, 965570106, '533199173');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (164570018, to_date('28-07-2023', 'dd-mm-yyyy'), 'AlbertClose', 817610947, 440376493, '532896127');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (125203316, to_date('17-05-2023', 'dd-mm-yyyy'), 'KrisFlanery', 961508320, 655751347, '535394978');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (733549227, to_date('03-03-2023', 'dd-mm-yyyy'), 'SonnyHawke', 183209683, 458023431, '534215157');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (307377542, to_date('08-05-2023', 'dd-mm-yyyy'), 'JodieGuzman', 632075477, 261762953, '530612508');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (919506039, to_date('15-09-2023', 'dd-mm-yyyy'), 'GeoffStuermer', 780208937, 924687916, '534147067');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (368058054, to_date('30-09-2023', 'dd-mm-yyyy'), 'LaurenceFariq', 325485023, 305845154, '532448737');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (762442704, to_date('09-05-2023', 'dd-mm-yyyy'), 'AidanLinney', 958097571, 735972745, '536525677');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (635995270, to_date('17-11-2023', 'dd-mm-yyyy'), 'PhoebeTippe', 874147059, 769427375, '538195033');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (721215232, to_date('06-03-2023', 'dd-mm-yyyy'), 'RaymondMcCabe', 874147059, 515954602, '530517617');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (648539463, to_date('19-03-2023', 'dd-mm-yyyy'), 'MiriamGarcia', 495446909, 586703006, '532844612');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (954588081, to_date('18-02-2023', 'dd-mm-yyyy'), 'RonSchreiber', 399040823, 111848564, '534227964');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (710820449, to_date('20-01-2023', 'dd-mm-yyyy'), 'SeanLarter', 881474368, 154279368, '537742413');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (208538843, to_date('24-11-2023', 'dd-mm-yyyy'), 'MorrisWaits', 468168585, 895317919, '531345003');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (361177269, to_date('05-01-2023', 'dd-mm-yyyy'), 'CliveBalin', 611373445, 806813527, '534216956');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (609812934, to_date('25-06-2023', 'dd-mm-yyyy'), 'JoanJohansson', 846752544, 533969445, '534001996');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (942837882, to_date('11-04-2023', 'dd-mm-yyyy'), 'ElvisIngram', 632075477, 725383778, '534795101');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (365728278, to_date('10-09-2023', 'dd-mm-yyyy'), 'WangMortensen', 391226859, 165466073, '531491418');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (581848851, to_date('25-09-2023', 'dd-mm-yyyy'), 'AnnetteMacht', 881474368, 489998132, '533161926');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (470229996, to_date('18-05-2023', 'dd-mm-yyyy'), 'CaroleWine', 909202768, 346952393, '531478470');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (471255028, to_date('13-11-2023', 'dd-mm-yyyy'), 'CyndiHagerty', 853021196, 801243102, '536939397');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (216195095, to_date('30-06-2023', 'dd-mm-yyyy'), 'CeliaWalken', 499261206, 534888327, '534001996');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (861529245, to_date('29-06-2023', 'dd-mm-yyyy'), 'SuzyCrimson', 937169926, 554808700, '533403509');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (413987154, to_date('01-01-2023', 'dd-mm-yyyy'), 'AniTucci', 369709283, 221442985, '537132620');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (257252001, to_date('13-04-2023', 'dd-mm-yyyy'), 'JakeAbraham', 415587027, 289027790, '537037527');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (816261011, to_date('15-07-2023', 'dd-mm-yyyy'), 'BreckinMargulies', 548259826, 992154421, '535163131');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (520041146, to_date('13-02-2023', 'dd-mm-yyyy'), 'TiaDalton', 771822614, 434281923, '531556679');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (749017453, to_date('06-12-2023', 'dd-mm-yyyy'), 'GinKretschmann', 529209704, 923629366, '535613648');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (777731572, to_date('09-04-2023', 'dd-mm-yyyy'), 'EileenRichards', 723598231, 941777746, '535050497');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (248907899, to_date('11-07-2023', 'dd-mm-yyyy'), 'CornellConway', 640729293, 430619276, '537287970');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (839804901, to_date('07-05-2023', 'dd-mm-yyyy'), 'SaulHopper', 369371631, 639653214, '532796638');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (806789094, to_date('21-04-2023', 'dd-mm-yyyy'), 'AzucarFehr', 369738131, 631368862, '536314927');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (619069169, to_date('05-02-2023', 'dd-mm-yyyy'), 'LoisLi', 769802617, 784672748, '539411393');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (317527788, to_date('02-11-2023', 'dd-mm-yyyy'), 'CarlDavison', 747287649, 217433112, '531959351');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (959588517, to_date('01-01-2023', 'dd-mm-yyyy'), 'SandraTippe', 369371631, 224541148, '530878034');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (236055433, to_date('12-01-2023', 'dd-mm-yyyy'), 'AndrewAdkins', 156499563, 246819691, '538364304');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (470862876, to_date('12-09-2023', 'dd-mm-yyyy'), 'MaeDukakis', 151165403, 381327425, '530109419');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (639672862, to_date('15-09-2023', 'dd-mm-yyyy'), 'SalmaLindley', 770161804, 711017879, '536042736');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (968257655, to_date('09-03-2023', 'dd-mm-yyyy'), 'JoshPlummer', 368019066, 608192881, '536359279');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (296604984, to_date('21-12-2023', 'dd-mm-yyyy'), 'SalmaBale', 890030689, 345969896, '531062013');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (819683430, to_date('19-11-2023', 'dd-mm-yyyy'), 'TziRickman', 357660144, 681700409, '532149124');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (840805463, to_date('01-06-2023', 'dd-mm-yyyy'), 'LennyApple', 561176400, 607752739, '536020063');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (498525632, to_date('20-06-2023', 'dd-mm-yyyy'), 'MaryLofgren', 870028514, 417760874, '538428492');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (653011416, to_date('13-02-2023', 'dd-mm-yyyy'), 'RalphEaston', 385905786, 841549911, '535540140');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (542824230, to_date('14-07-2023', 'dd-mm-yyyy'), 'KimField', 424126819, 559225172, '533926002');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (948048089, to_date('22-06-2023', 'dd-mm-yyyy'), 'MaeHoskins', 881474368, 861195123, '530421723');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (920703423, to_date('26-01-2023', 'dd-mm-yyyy'), 'JoannaHatchet', 576724083, 938873687, '532149124');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (668383554, to_date('18-10-2023', 'dd-mm-yyyy'), 'NikPayton', 937169926, 479306098, '534415071');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (902051327, to_date('05-10-2023', 'dd-mm-yyyy'), 'JohnetteFranks', 513149919, 379089095, '532392489');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (883933393, to_date('21-10-2023', 'dd-mm-yyyy'), 'Jean-LucViterelli', 373556476, 948199480, '533199173');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (336449659, to_date('22-01-2023', 'dd-mm-yyyy'), 'GaryGalecki', 575399817, 381327425, '534740622');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (698115382, to_date('03-11-2023', 'dd-mm-yyyy'), 'CatherineBusey', 183209683, 962469929, '537314547');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (537353429, to_date('13-02-2023', 'dd-mm-yyyy'), 'BreckinCash', 356303152, 176786250, '536870854');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (860154185, to_date('13-12-2023', 'dd-mm-yyyy'), 'KeithTucci', 735160342, 668336963, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (272520625, to_date('09-07-2023', 'dd-mm-yyyy'), 'PeaboBrooke', 941153423, 770154621, '536726717');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (683636037, to_date('11-10-2023', 'dd-mm-yyyy'), 'AlanSpector', 812300108, 305845154, '539764604');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (360691901, to_date('15-10-2023', 'dd-mm-yyyy'), 'RuthMichaels', 149826730, 516287580, '531556679');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (871313432, to_date('28-03-2023', 'dd-mm-yyyy'), 'EmmylouMandrell', 532611238, 861195123, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (674520265, to_date('06-10-2023', 'dd-mm-yyyy'), 'ErnieSpader', 194871002, 285929734, '538389533');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (546159813, to_date('13-01-2023', 'dd-mm-yyyy'), 'PattyHuston', 145684861, 108670789, '538181763');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (349750765, to_date('01-10-2023', 'dd-mm-yyyy'), 'ChristineSolido', 481746797, 345969896, '539337395');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (188674256, to_date('23-12-2023', 'dd-mm-yyyy'), 'BrothersMeyer', 949465249, 215735625, '532215442');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (300650178, to_date('01-07-2023', 'dd-mm-yyyy'), 'LeslieShandling', 421722923, 650186931, '534284901');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (580436161, to_date('09-02-2023', 'dd-mm-yyyy'), 'BruceDel Toro', 235942071, 197676122, '533283024');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (841686697, to_date('27-12-2023', 'dd-mm-yyyy'), 'LaraSupernaw', 915244499, 822221093, '535245994');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (453909936, to_date('25-08-2023', 'dd-mm-yyyy'), 'ChuckAssante', 663500683, 318631392, '534442449');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (715459619, to_date('11-01-2023', 'dd-mm-yyyy'), 'CampbellAlbright', 130326060, 991047259, '535214211');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (948499687, to_date('03-10-2023', 'dd-mm-yyyy'), 'DannyCurry', 117554332, 111827211, '538215644');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (226879032, to_date('02-09-2023', 'dd-mm-yyyy'), 'GiancarloGoodall', 917067047, 927532008, '538969555');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (672853907, to_date('02-02-2023', 'dd-mm-yyyy'), 'JoanPaul', 235942071, 138483323, '536860466');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (383595500, to_date('07-06-2023', 'dd-mm-yyyy'), 'HughSteiger', 310720153, 857258048, '531851116');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (273420157, to_date('10-03-2023', 'dd-mm-yyyy'), 'HectorMcCann', 660189169, 530942780, '531714622');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (742679758, to_date('03-05-2023', 'dd-mm-yyyy'), 'RoddyCurtis', 384972445, 631368862, '533347394');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (309249760, to_date('04-09-2023', 'dd-mm-yyyy'), 'MickyBergen', 554174162, 988358139, '537015997');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (463552389, to_date('03-10-2023', 'dd-mm-yyyy'), 'MorrisAkins', 291471743, 691415264, '534501042');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (533052487, to_date('03-04-2023', 'dd-mm-yyyy'), 'ChubbyLaSalle', 836289094, 895317919, '533506677');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (767163521, to_date('30-01-2023', 'dd-mm-yyyy'), 'WinonaHatchet', 594645287, 841549911, '534001996');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (578501243, to_date('11-07-2023', 'dd-mm-yyyy'), 'CaryTsettos', 423368904, 965570106, '538830110');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (701422510, to_date('13-03-2023', 'dd-mm-yyyy'), 'AdrienStarr', 529209704, 995371193, '539906432');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (253786755, to_date('17-08-2023', 'dd-mm-yyyy'), 'DelroyReynolds', 906818716, 453257261, '535144823');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (612877625, to_date('03-10-2023', 'dd-mm-yyyy'), 'MikiLangella', 770161804, 709763067, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (341422260, to_date('31-08-2023', 'dd-mm-yyyy'), 'RowanWills', 969189003, 545616519, '537075192');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (724645743, to_date('17-04-2023', 'dd-mm-yyyy'), 'BurtHeche', 334728919, 212906683, '533451053');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (304298193, to_date('27-12-2023', 'dd-mm-yyyy'), 'EmersonJackson', 259603153, 700108211, '539601284');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (220592028, to_date('18-02-2023', 'dd-mm-yyyy'), 'EdLewin', 858697568, 324683402, '537742413');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (997986871, to_date('27-03-2023', 'dd-mm-yyyy'), 'DennisNeeson', 815331207, 346952393, '539906432');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (435759624, to_date('12-02-2023', 'dd-mm-yyyy'), 'HookahRooker', 759864499, 885245205, '539990765');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (689297187, to_date('24-03-2023', 'dd-mm-yyyy'), 'ArmandPalmieri', 450034199, 663599890, '534468917');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (453049343, to_date('15-02-2023', 'dd-mm-yyyy'), 'ScottKirkwood', 531324214, 716329537, '530288264');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (581079292, to_date('29-08-2023', 'dd-mm-yyyy'), 'EttaNicholas', 998820027, 734848963, '536310044');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (406149348, to_date('13-06-2023', 'dd-mm-yyyy'), 'RodneyBenoit', 199271455, 650186931, '530878034');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (943279284, to_date('12-08-2023', 'dd-mm-yyyy'), 'DarDoucette', 766570814, 614011429, '532203518');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (788714843, to_date('08-12-2023', 'dd-mm-yyyy'), 'AntonioChanning', 468168585, 168218099, '530922703');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (450243896, to_date('09-11-2023', 'dd-mm-yyyy'), 'GuyRossellini', 959715188, 411498575, '531829061');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (469797762, to_date('23-12-2023', 'dd-mm-yyyy'), 'SaulTennison', 487831062, 682222925, '534210530');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (524275183, to_date('30-12-2023', 'dd-mm-yyyy'), 'EmmaGoldwyn', 317390763, 417760874, '533637886');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (615526454, to_date('12-04-2023', 'dd-mm-yyyy'), 'ToriPlimpton', 632075477, 607752739, '536939397');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (285435211, to_date('29-05-2023', 'dd-mm-yyyy'), 'ChloeLoring', 234058091, 657517965, '536864889');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (117035372, to_date('24-06-2023', 'dd-mm-yyyy'), 'JillCrosby', 550013332, 500352861, '536783116');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (107600742, to_date('28-12-2023', 'dd-mm-yyyy'), 'MaxineDavies', 875156405, 253418130, '530988023');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (524644760, to_date('18-07-2023', 'dd-mm-yyyy'), 'AndieKramer', 443821165, 840178757, '535889865');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (280767922, to_date('30-09-2023', 'dd-mm-yyyy'), 'MikaShorter', 184740196, 811845920, '532796638');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (688290341, to_date('04-01-2023', 'dd-mm-yyyy'), 'TobeySisto', 530317206, 453210957, '539856383');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (179606973, to_date('26-02-2023', 'dd-mm-yyyy'), 'GuyStallone', 162646878, 378855344, '536587229');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (904203001, to_date('01-01-2023', 'dd-mm-yyyy'), 'DanielMcConaughey', 324503961, 288157516, '536492762');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (638266872, to_date('12-05-2023', 'dd-mm-yyyy'), 'BarbaraParish', 274554825, 843598204, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (367838485, to_date('04-02-2023', 'dd-mm-yyyy'), 'ValGetty', 144316561, 498184934, '537532068');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (531430046, to_date('10-03-2023', 'dd-mm-yyyy'), 'EddiePonce', 529209704, 242882933, '532083490');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (533057073, to_date('22-12-2023', 'dd-mm-yyyy'), 'MaxMcIntyre', 959715188, 670415411, '534543703');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (161617057, to_date('16-12-2023', 'dd-mm-yyyy'), 'PercyStudi', 124089897, 995204286, '536519815');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (877553278, to_date('27-11-2023', 'dd-mm-yyyy'), 'JenniferMaguire', 241411480, 609677936, '536726717');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (652741287, to_date('11-02-2023', 'dd-mm-yyyy'), 'PeterGreen', 333294415, 859280680, '533021183');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (574535528, to_date('12-01-2023', 'dd-mm-yyyy'), 'OssieFoley', 124089897, 425206029, '532448737');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (249913631, to_date('03-09-2023', 'dd-mm-yyyy'), 'ChloePfeiffer', 830448971, 456007716, '533506677');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (670655852, to_date('18-06-2023', 'dd-mm-yyyy'), 'KieferGoodall', 253081212, 440591474, '539355730');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (125497178, to_date('21-06-2023', 'dd-mm-yyyy'), 'RobbieCotton', 421722923, 732071927, '532203518');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (470189574, to_date('09-03-2023', 'dd-mm-yyyy'), 'BarbaraGray', 545997419, 119611867, '539494561');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (791411904, to_date('30-03-2023', 'dd-mm-yyyy'), 'RichMattea', 780207682, 956458859, '534588262');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (725464993, to_date('21-10-2023', 'dd-mm-yyyy'), 'JoelyFrakes', 870028514, 102529246, '533692843');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (817689356, to_date('30-06-2023', 'dd-mm-yyyy'), 'TeaBrickell', 388619009, 968304655, '531910414');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (133543076, to_date('24-01-2023', 'dd-mm-yyyy'), 'GiancarloViterelli', 155203169, 270722605, '531556679');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (557277343, to_date('15-03-2023', 'dd-mm-yyyy'), 'BrittanyRuiz', 830448971, 915027557, '536939397');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (439147144, to_date('14-03-2023', 'dd-mm-yyyy'), 'MarieHopper', 441905645, 500153117, '536825728');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (977094617, to_date('24-04-2023', 'dd-mm-yyyy'), 'WilliamCobbs', 234058091, 388731624, '533347394');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (343842556, to_date('07-02-2023', 'dd-mm-yyyy'), 'EthanKleinenberg', 326564708, 313295116, '539337395');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (295335570, to_date('24-01-2023', 'dd-mm-yyyy'), 'JoelyChesnutt', 716701135, 707362980, '539341331');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (721466403, to_date('21-04-2023', 'dd-mm-yyyy'), 'GilbertPryce', 628645079, 170026490, '534677629');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (125024911, to_date('14-02-2023', 'dd-mm-yyyy'), 'GeraldGuinness', 453287420, 696682926, '536939397');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (439807190, to_date('27-09-2023', 'dd-mm-yyyy'), 'MelbaGetty', 628645079, 941883227, '531883110');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (423822363, to_date('06-07-2023', 'dd-mm-yyyy'), 'BettyPolito', 168947359, 866744809, '538922386');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (788534526, to_date('16-05-2023', 'dd-mm-yyyy'), 'ViennaBergen', 123711229, 981038192, '534624249');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (350077345, to_date('21-05-2023', 'dd-mm-yyyy'), 'LievDillon', 716701135, 730857856, '532715079');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (513378812, to_date('05-08-2023', 'dd-mm-yyyy'), 'AnitaLandau', 561314398, 886616517, '533943518');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (525133659, to_date('01-08-2023', 'dd-mm-yyyy'), 'TriniHopper', 175031975, 516287580, '538851007');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (356560926, to_date('11-06-2023', 'dd-mm-yyyy'), 'NataschaPopper', 252198550, 453210957, '538428492');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (401884182, to_date('07-01-2023', 'dd-mm-yyyy'), 'KyleMcDonald', 301746122, 246819691, '532215442');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (903471912, to_date('28-08-2023', 'dd-mm-yyyy'), 'YolandaDaniels', 937169926, 362523636, '533506677');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (639575548, to_date('11-11-2023', 'dd-mm-yyyy'), 'RedSherman', 136283222, 320060434, '537451318');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (935602668, to_date('06-07-2023', 'dd-mm-yyyy'), 'LeslieCantrell', 549556536, 575113736, '539871135');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (584862841, to_date('26-07-2023', 'dd-mm-yyyy'), 'EwanCampbell', 685793832, 440338782, '535009932');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (789723635, to_date('25-06-2023', 'dd-mm-yyyy'), 'RolandoRobbins', 496226319, 108670789, '536210601');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (759114278, to_date('31-08-2023', 'dd-mm-yyyy'), 'TyRooker', 557577530, 533969445, '537159592');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (823314479, to_date('23-09-2023', 'dd-mm-yyyy'), 'HerbieMacDowell', 168366431, 320060434, '531502627');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (451965899, to_date('31-05-2023', 'dd-mm-yyyy'), 'AlfieDarren', 973308178, 358219149, '539486991');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (386243784, to_date('15-05-2023', 'dd-mm-yyyy'), 'KyraBriscoe', 200297628, 543404897, '539341331');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (321126253, to_date('23-03-2023', 'dd-mm-yyyy'), 'JaimeBirch', 123490198, 111848564, '539355730');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (898698738, to_date('03-08-2023', 'dd-mm-yyyy'), 'MinnieRooker', 453287420, 285929734, '539337395');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (998431087, to_date('09-12-2023', 'dd-mm-yyyy'), 'TziMacNeil', 550013332, 721129191, '531556679');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (435364818, to_date('20-07-2023', 'dd-mm-yyyy'), 'SonaLandau', 812300108, 500871083, '532635955');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (402148032, to_date('17-11-2023', 'dd-mm-yyyy'), 'MykeltiCooper', 468168585, 453257261, '536592127');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (515855482, to_date('10-02-2023', 'dd-mm-yyyy'), 'LiliSaxon', 308903216, 988358139, '535578896');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (555531293, to_date('27-09-2023', 'dd-mm-yyyy'), 'GatesSchreiber', 932418525, 882293772, '532006348');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (801391851, to_date('19-05-2023', 'dd-mm-yyyy'), 'ChiGarfunkel', 545341989, 737705982, '530970781');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (511626333, to_date('07-04-2023', 'dd-mm-yyyy'), 'NoahVince', 310720153, 822221093, '535164136');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (597732403, to_date('14-01-2023', 'dd-mm-yyyy'), 'RodLillard', 714846100, 764463597, '535297001');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (584324562, to_date('13-10-2023', 'dd-mm-yyyy'), 'GavinGyllenhaal', 530317206, 422639247, '536680280');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (864352654, to_date('10-07-2023', 'dd-mm-yyyy'), 'DorryPepper', 388619009, 659537321, '534600512');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (785668027, to_date('01-07-2023', 'dd-mm-yyyy'), 'StevieCotton', 156499563, 618803541, '533943518');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (429874851, to_date('01-01-2023', 'dd-mm-yyyy'), 'MerleHeron', 888978348, 388731624, '535870790');
insert into VOLUNTEERS (volunteer_id, join_date, name, role_id, gear_id, phone_number)
values (669404095, to_date('18-08-2023', 'dd-mm-yyyy'), 'AlanYorn', 153407366, 379833230, '536176634');
commit;
prompt 400 records loaded
prompt Loading SIGNED_UP...
insert into SIGNED_UP (volunteer_id, shift_id)
values (451965899, 383392737);
insert into SIGNED_UP (volunteer_id, shift_id)
values (450634687, 127271467);
insert into SIGNED_UP (volunteer_id, shift_id)
values (360691901, 770832433);
insert into SIGNED_UP (volunteer_id, shift_id)
values (453049343, 566701503);
insert into SIGNED_UP (volunteer_id, shift_id)
values (164570018, 184134373);
insert into SIGNED_UP (volunteer_id, shift_id)
values (325055451, 628685669);
insert into SIGNED_UP (volunteer_id, shift_id)
values (285435211, 662481358);
insert into SIGNED_UP (volunteer_id, shift_id)
values (578501243, 524504573);
insert into SIGNED_UP (volunteer_id, shift_id)
values (578495386, 405092908);
insert into SIGNED_UP (volunteer_id, shift_id)
values (942837882, 474922341);
insert into SIGNED_UP (volunteer_id, shift_id)
values (729627947, 124777158);
insert into SIGNED_UP (volunteer_id, shift_id)
values (669404095, 425699329);
insert into SIGNED_UP (volunteer_id, shift_id)
values (434267096, 790515862);
insert into SIGNED_UP (volunteer_id, shift_id)
values (533057073, 184134373);
insert into SIGNED_UP (volunteer_id, shift_id)
values (208538843, 383392737);
insert into SIGNED_UP (volunteer_id, shift_id)
values (190265545, 124611647);
insert into SIGNED_UP (volunteer_id, shift_id)
values (378678727, 150874220);
insert into SIGNED_UP (volunteer_id, shift_id)
values (368058054, 319942448);
insert into SIGNED_UP (volunteer_id, shift_id)
values (581848851, 824884203);
insert into SIGNED_UP (volunteer_id, shift_id)
values (161617057, 782940373);
insert into SIGNED_UP (volunteer_id, shift_id)
values (637721837, 234480254);
insert into SIGNED_UP (volunteer_id, shift_id)
values (177316069, 672944050);
insert into SIGNED_UP (volunteer_id, shift_id)
values (453909936, 234480254);
insert into SIGNED_UP (volunteer_id, shift_id)
values (577430582, 826491560);
insert into SIGNED_UP (volunteer_id, shift_id)
values (968257655, 694918238);
insert into SIGNED_UP (volunteer_id, shift_id)
values (903494796, 453189811);
insert into SIGNED_UP (volunteer_id, shift_id)
values (363022703, 411607585);
insert into SIGNED_UP (volunteer_id, shift_id)
values (871313432, 392526699);
insert into SIGNED_UP (volunteer_id, shift_id)
values (653011416, 754150603);
insert into SIGNED_UP (volunteer_id, shift_id)
values (548222318, 526298756);
insert into SIGNED_UP (volunteer_id, shift_id)
values (274728655, 424173276);
insert into SIGNED_UP (volunteer_id, shift_id)
values (704390851, 561874619);
insert into SIGNED_UP (volunteer_id, shift_id)
values (742697109, 386013316);
insert into SIGNED_UP (volunteer_id, shift_id)
values (349750765, 109595843);
insert into SIGNED_UP (volunteer_id, shift_id)
values (901593477, 920267607);
insert into SIGNED_UP (volunteer_id, shift_id)
values (537353429, 980785716);
insert into SIGNED_UP (volunteer_id, shift_id)
values (196813891, 927924317);
insert into SIGNED_UP (volunteer_id, shift_id)
values (613362820, 569014082);
insert into SIGNED_UP (volunteer_id, shift_id)
values (616969123, 877768269);
insert into SIGNED_UP (volunteer_id, shift_id)
values (406149348, 635502315);
insert into SIGNED_UP (volunteer_id, shift_id)
values (670655852, 248182859);
insert into SIGNED_UP (volunteer_id, shift_id)
values (962456875, 372429028);
insert into SIGNED_UP (volunteer_id, shift_id)
values (809949292, 541014838);
insert into SIGNED_UP (volunteer_id, shift_id)
values (514625672, 586039528);
insert into SIGNED_UP (volunteer_id, shift_id)
values (704203281, 579402696);
insert into SIGNED_UP (volunteer_id, shift_id)
values (423822363, 908607841);
insert into SIGNED_UP (volunteer_id, shift_id)
values (674520265, 468557162);
insert into SIGNED_UP (volunteer_id, shift_id)
values (953802738, 147736718);
insert into SIGNED_UP (volunteer_id, shift_id)
values (125206388, 923486122);
insert into SIGNED_UP (volunteer_id, shift_id)
values (683636037, 178686396);
insert into SIGNED_UP (volunteer_id, shift_id)
values (488488861, 258055763);
insert into SIGNED_UP (volunteer_id, shift_id)
values (435759624, 133174709);
insert into SIGNED_UP (volunteer_id, shift_id)
values (587204282, 841371586);
insert into SIGNED_UP (volunteer_id, shift_id)
values (511977564, 326093414);
insert into SIGNED_UP (volunteer_id, shift_id)
values (543510892, 137029056);
insert into SIGNED_UP (volunteer_id, shift_id)
values (179606973, 459232059);
insert into SIGNED_UP (volunteer_id, shift_id)
values (368058054, 496812209);
insert into SIGNED_UP (volunteer_id, shift_id)
values (954588081, 317881047);
insert into SIGNED_UP (volunteer_id, shift_id)
values (274728655, 128459529);
insert into SIGNED_UP (volunteer_id, shift_id)
values (788714843, 580684699);
insert into SIGNED_UP (volunteer_id, shift_id)
values (775209739, 124611647);
insert into SIGNED_UP (volunteer_id, shift_id)
values (384292290, 420440900);
insert into SIGNED_UP (volunteer_id, shift_id)
values (248907899, 149484424);
insert into SIGNED_UP (volunteer_id, shift_id)
values (469226077, 352878698);
insert into SIGNED_UP (volunteer_id, shift_id)
values (638266872, 519508105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (445918797, 411607585);
insert into SIGNED_UP (volunteer_id, shift_id)
values (962456875, 178891307);
insert into SIGNED_UP (volunteer_id, shift_id)
values (516431806, 302152825);
insert into SIGNED_UP (volunteer_id, shift_id)
values (927909056, 858162336);
insert into SIGNED_UP (volunteer_id, shift_id)
values (531430046, 127271467);
insert into SIGNED_UP (volunteer_id, shift_id)
values (962052610, 711839734);
insert into SIGNED_UP (volunteer_id, shift_id)
values (839804901, 961451056);
insert into SIGNED_UP (volunteer_id, shift_id)
values (348455121, 448945614);
insert into SIGNED_UP (volunteer_id, shift_id)
values (524275183, 851114090);
insert into SIGNED_UP (volunteer_id, shift_id)
values (435759624, 859062567);
insert into SIGNED_UP (volunteer_id, shift_id)
values (655356874, 902851302);
insert into SIGNED_UP (volunteer_id, shift_id)
values (285435211, 796742174);
insert into SIGNED_UP (volunteer_id, shift_id)
values (274728655, 133999573);
insert into SIGNED_UP (volunteer_id, shift_id)
values (524644760, 400235669);
insert into SIGNED_UP (volunteer_id, shift_id)
values (935602668, 272116154);
insert into SIGNED_UP (volunteer_id, shift_id)
values (584324562, 999816284);
insert into SIGNED_UP (volunteer_id, shift_id)
values (471255028, 432990806);
insert into SIGNED_UP (volunteer_id, shift_id)
values (515855482, 677665331);
insert into SIGNED_UP (volunteer_id, shift_id)
values (321126253, 155807555);
insert into SIGNED_UP (volunteer_id, shift_id)
values (698115382, 578299599);
insert into SIGNED_UP (volunteer_id, shift_id)
values (699152638, 846857047);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236055433, 237923357);
insert into SIGNED_UP (volunteer_id, shift_id)
values (881836997, 291729642);
insert into SIGNED_UP (volunteer_id, shift_id)
values (846987742, 169171685);
insert into SIGNED_UP (volunteer_id, shift_id)
values (919506039, 110283617);
insert into SIGNED_UP (volunteer_id, shift_id)
values (450634687, 207034524);
insert into SIGNED_UP (volunteer_id, shift_id)
values (437652843, 994808420);
insert into SIGNED_UP (volunteer_id, shift_id)
values (584862841, 455845334);
insert into SIGNED_UP (volunteer_id, shift_id)
values (841686697, 378653430);
insert into SIGNED_UP (volunteer_id, shift_id)
values (406149348, 980032661);
insert into SIGNED_UP (volunteer_id, shift_id)
values (542824230, 556292807);
insert into SIGNED_UP (volunteer_id, shift_id)
values (543510892, 865681697);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236018541, 680786315);
insert into SIGNED_UP (volunteer_id, shift_id)
values (637721837, 589111609);
insert into SIGNED_UP (volunteer_id, shift_id)
values (453909936, 526438115);
insert into SIGNED_UP (volunteer_id, shift_id)
values (189668448, 133174709);
insert into SIGNED_UP (volunteer_id, shift_id)
values (615526454, 797279394);
insert into SIGNED_UP (volunteer_id, shift_id)
values (349750765, 264934159);
insert into SIGNED_UP (volunteer_id, shift_id)
values (725844133, 331170291);
insert into SIGNED_UP (volunteer_id, shift_id)
values (705343901, 498450588);
insert into SIGNED_UP (volunteer_id, shift_id)
values (246146269, 147736718);
insert into SIGNED_UP (volunteer_id, shift_id)
values (295335570, 407633863);
insert into SIGNED_UP (volunteer_id, shift_id)
values (720249825, 796742174);
insert into SIGNED_UP (volunteer_id, shift_id)
values (840805463, 291621265);
insert into SIGNED_UP (volunteer_id, shift_id)
values (628513584, 500931841);
insert into SIGNED_UP (volunteer_id, shift_id)
values (742679758, 668332390);
insert into SIGNED_UP (volunteer_id, shift_id)
values (283317875, 384317411);
insert into SIGNED_UP (volunteer_id, shift_id)
values (605935919, 700699433);
insert into SIGNED_UP (volunteer_id, shift_id)
values (246146269, 907923402);
insert into SIGNED_UP (volunteer_id, shift_id)
values (728052444, 724830279);
insert into SIGNED_UP (volunteer_id, shift_id)
values (115553744, 994073242);
insert into SIGNED_UP (volunteer_id, shift_id)
values (875088165, 169171685);
insert into SIGNED_UP (volunteer_id, shift_id)
values (525133659, 249424386);
insert into SIGNED_UP (volunteer_id, shift_id)
values (900294305, 725057217);
insert into SIGNED_UP (volunteer_id, shift_id)
values (321126253, 405092908);
insert into SIGNED_UP (volunteer_id, shift_id)
values (977094617, 764506310);
insert into SIGNED_UP (volunteer_id, shift_id)
values (736624569, 148206606);
insert into SIGNED_UP (volunteer_id, shift_id)
values (424015616, 904245063);
insert into SIGNED_UP (volunteer_id, shift_id)
values (118493240, 619876547);
insert into SIGNED_UP (volunteer_id, shift_id)
values (839804901, 617337728);
insert into SIGNED_UP (volunteer_id, shift_id)
values (498525632, 127904840);
insert into SIGNED_UP (volunteer_id, shift_id)
values (454116758, 689141646);
insert into SIGNED_UP (volunteer_id, shift_id)
values (133543076, 561874619);
insert into SIGNED_UP (volunteer_id, shift_id)
values (196929778, 498450588);
insert into SIGNED_UP (volunteer_id, shift_id)
values (903494796, 647972621);
insert into SIGNED_UP (volunteer_id, shift_id)
values (133212750, 127904840);
insert into SIGNED_UP (volunteer_id, shift_id)
values (356560926, 169171685);
insert into SIGNED_UP (volunteer_id, shift_id)
values (948048089, 908607841);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236018541, 816252881);
insert into SIGNED_UP (volunteer_id, shift_id)
values (920703423, 780378468);
insert into SIGNED_UP (volunteer_id, shift_id)
values (511626333, 950195227);
insert into SIGNED_UP (volunteer_id, shift_id)
values (125203316, 686672809);
insert into SIGNED_UP (volunteer_id, shift_id)
values (240990578, 980785716);
insert into SIGNED_UP (volunteer_id, shift_id)
values (350077345, 542790790);
insert into SIGNED_UP (volunteer_id, shift_id)
values (108775617, 575752208);
insert into SIGNED_UP (volunteer_id, shift_id)
values (376634667, 615866333);
insert into SIGNED_UP (volunteer_id, shift_id)
values (108777947, 920267607);
insert into SIGNED_UP (volunteer_id, shift_id)
values (406149348, 924353999);
insert into SIGNED_UP (volunteer_id, shift_id)
values (208810729, 109595843);
insert into SIGNED_UP (volunteer_id, shift_id)
values (295335570, 441822416);
insert into SIGNED_UP (volunteer_id, shift_id)
values (295335570, 436499854);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236018541, 624958228);
insert into SIGNED_UP (volunteer_id, shift_id)
values (967536074, 264934159);
insert into SIGNED_UP (volunteer_id, shift_id)
values (789723635, 517067823);
insert into SIGNED_UP (volunteer_id, shift_id)
values (548222318, 495638725);
insert into SIGNED_UP (volunteer_id, shift_id)
values (321126253, 160216237);
insert into SIGNED_UP (volunteer_id, shift_id)
values (203521288, 383392737);
insert into SIGNED_UP (volunteer_id, shift_id)
values (435364818, 923486122);
insert into SIGNED_UP (volunteer_id, shift_id)
values (942837882, 986380133);
insert into SIGNED_UP (volunteer_id, shift_id)
values (939128682, 647972621);
insert into SIGNED_UP (volunteer_id, shift_id)
values (109432643, 636820951);
insert into SIGNED_UP (volunteer_id, shift_id)
values (133212750, 717988584);
insert into SIGNED_UP (volunteer_id, shift_id)
values (545657798, 139429105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (809949292, 256141764);
insert into SIGNED_UP (volunteer_id, shift_id)
values (223438515, 139943717);
insert into SIGNED_UP (volunteer_id, shift_id)
values (953802738, 217505505);
insert into SIGNED_UP (volunteer_id, shift_id)
values (363022703, 808200346);
insert into SIGNED_UP (volunteer_id, shift_id)
values (939275485, 818828802);
insert into SIGNED_UP (volunteer_id, shift_id)
values (318146519, 233086097);
insert into SIGNED_UP (volunteer_id, shift_id)
values (469797762, 724830279);
insert into SIGNED_UP (volunteer_id, shift_id)
values (415177149, 529083176);
insert into SIGNED_UP (volunteer_id, shift_id)
values (823314479, 936993986);
insert into SIGNED_UP (volunteer_id, shift_id)
values (256156696, 206721673);
insert into SIGNED_UP (volunteer_id, shift_id)
values (860154185, 153747721);
insert into SIGNED_UP (volunteer_id, shift_id)
values (498525632, 532288666);
insert into SIGNED_UP (volunteer_id, shift_id)
values (282687759, 828452187);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313147938, 981773910);
insert into SIGNED_UP (volunteer_id, shift_id)
values (577430582, 496812209);
insert into SIGNED_UP (volunteer_id, shift_id)
values (513679012, 409744409);
insert into SIGNED_UP (volunteer_id, shift_id)
values (285435211, 126087312);
insert into SIGNED_UP (volunteer_id, shift_id)
values (363022703, 149484424);
insert into SIGNED_UP (volunteer_id, shift_id)
values (992630392, 178891307);
insert into SIGNED_UP (volunteer_id, shift_id)
values (954588081, 137029056);
insert into SIGNED_UP (volunteer_id, shift_id)
values (939128682, 481882532);
insert into SIGNED_UP (volunteer_id, shift_id)
values (725844133, 139429105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (507789069, 142315637);
insert into SIGNED_UP (volunteer_id, shift_id)
values (453909936, 542790790);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313177947, 119624108);
insert into SIGNED_UP (volunteer_id, shift_id)
values (161617057, 449536147);
insert into SIGNED_UP (volunteer_id, shift_id)
values (954588081, 205498479);
insert into SIGNED_UP (volunteer_id, shift_id)
values (788529899, 319942448);
insert into SIGNED_UP (volunteer_id, shift_id)
values (515855482, 740347026);
insert into SIGNED_UP (volunteer_id, shift_id)
values (670655852, 331170291);
insert into SIGNED_UP (volunteer_id, shift_id)
values (125206388, 437729907);
insert into SIGNED_UP (volunteer_id, shift_id)
values (900294305, 796852324);
insert into SIGNED_UP (volunteer_id, shift_id)
values (672853907, 342055605);
insert into SIGNED_UP (volunteer_id, shift_id)
values (642485323, 725057217);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236055433, 228703555);
insert into SIGNED_UP (volunteer_id, shift_id)
values (221770544, 816692773);
insert into SIGNED_UP (volunteer_id, shift_id)
values (386243784, 386013316);
insert into SIGNED_UP (volunteer_id, shift_id)
values (967536074, 994808420);
insert into SIGNED_UP (volunteer_id, shift_id)
values (637813267, 359431351);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313846026, 963422152);
insert into SIGNED_UP (volunteer_id, shift_id)
values (816261011, 248182859);
insert into SIGNED_UP (volunteer_id, shift_id)
values (596660348, 811721191);
insert into SIGNED_UP (volunteer_id, shift_id)
values (128566735, 302152825);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236018541, 124777158);
insert into SIGNED_UP (volunteer_id, shift_id)
values (511977564, 529083176);
insert into SIGNED_UP (volunteer_id, shift_id)
values (788529899, 496812209);
insert into SIGNED_UP (volunteer_id, shift_id)
values (580436161, 686672809);
insert into SIGNED_UP (volunteer_id, shift_id)
values (283317875, 890487169);
insert into SIGNED_UP (volunteer_id, shift_id)
values (520041146, 304789858);
insert into SIGNED_UP (volunteer_id, shift_id)
values (133212750, 980032661);
insert into SIGNED_UP (volunteer_id, shift_id)
values (907287694, 169171685);
insert into SIGNED_UP (volunteer_id, shift_id)
values (555719621, 717988584);
insert into SIGNED_UP (volunteer_id, shift_id)
values (273420157, 763199157);
insert into SIGNED_UP (volunteer_id, shift_id)
values (616969123, 904538002);
insert into SIGNED_UP (volunteer_id, shift_id)
values (948685722, 319942448);
insert into SIGNED_UP (volunteer_id, shift_id)
values (861529245, 680786315);
insert into SIGNED_UP (volunteer_id, shift_id)
values (513378812, 994073242);
insert into SIGNED_UP (volunteer_id, shift_id)
values (602780812, 289315285);
insert into SIGNED_UP (volunteer_id, shift_id)
values (696268450, 139943717);
insert into SIGNED_UP (volunteer_id, shift_id)
values (189668448, 680786315);
insert into SIGNED_UP (volunteer_id, shift_id)
values (948685722, 724830279);
insert into SIGNED_UP (volunteer_id, shift_id)
values (578501243, 344639962);
insert into SIGNED_UP (volunteer_id, shift_id)
values (469226077, 764506310);
insert into SIGNED_UP (volunteer_id, shift_id)
values (799853324, 481882532);
insert into SIGNED_UP (volunteer_id, shift_id)
values (318146519, 491966378);
insert into SIGNED_UP (volunteer_id, shift_id)
values (390913588, 214648194);
insert into SIGNED_UP (volunteer_id, shift_id)
values (704390851, 460277375);
insert into SIGNED_UP (volunteer_id, shift_id)
values (377806082, 770832433);
insert into SIGNED_UP (volunteer_id, shift_id)
values (728052444, 190215997);
insert into SIGNED_UP (volunteer_id, shift_id)
values (350077345, 936993986);
insert into SIGNED_UP (volunteer_id, shift_id)
values (256156696, 770832433);
insert into SIGNED_UP (volunteer_id, shift_id)
values (840805463, 151653824);
insert into SIGNED_UP (volunteer_id, shift_id)
values (413987154, 897509369);
insert into SIGNED_UP (volunteer_id, shift_id)
values (450634687, 938548040);
insert into SIGNED_UP (volunteer_id, shift_id)
values (898254756, 921619596);
insert into SIGNED_UP (volunteer_id, shift_id)
values (451965899, 259723031);
insert into SIGNED_UP (volunteer_id, shift_id)
values (733549227, 967716761);
insert into SIGNED_UP (volunteer_id, shift_id)
values (861529245, 923486122);
insert into SIGNED_UP (volunteer_id, shift_id)
values (687910038, 581184996);
insert into SIGNED_UP (volunteer_id, shift_id)
values (390913588, 907923402);
insert into SIGNED_UP (volunteer_id, shift_id)
values (257252001, 826491560);
insert into SIGNED_UP (volunteer_id, shift_id)
values (479918979, 528829440);
insert into SIGNED_UP (volunteer_id, shift_id)
values (898698738, 459232059);
insert into SIGNED_UP (volunteer_id, shift_id)
values (948685722, 483665079);
insert into SIGNED_UP (volunteer_id, shift_id)
values (581721963, 238050354);
insert into SIGNED_UP (volunteer_id, shift_id)
values (513679012, 712757267);
insert into SIGNED_UP (volunteer_id, shift_id)
values (939275485, 205417266);
insert into SIGNED_UP (volunteer_id, shift_id)
values (196929778, 692292000);
insert into SIGNED_UP (volunteer_id, shift_id)
values (601063733, 816692773);
insert into SIGNED_UP (volunteer_id, shift_id)
values (939275485, 113893143);
insert into SIGNED_UP (volunteer_id, shift_id)
values (699152638, 950195227);
insert into SIGNED_UP (volunteer_id, shift_id)
values (211475964, 154110136);
insert into SIGNED_UP (volunteer_id, shift_id)
values (613362820, 924353999);
insert into SIGNED_UP (volunteer_id, shift_id)
values (189375133, 738867544);
insert into SIGNED_UP (volunteer_id, shift_id)
values (348455121, 233086097);
insert into SIGNED_UP (volunteer_id, shift_id)
values (295335570, 796742174);
insert into SIGNED_UP (volunteer_id, shift_id)
values (415177149, 567925516);
insert into SIGNED_UP (volunteer_id, shift_id)
values (767163521, 373545987);
insert into SIGNED_UP (volunteer_id, shift_id)
values (451965899, 694918238);
insert into SIGNED_UP (volunteer_id, shift_id)
values (816261011, 828452187);
insert into SIGNED_UP (volunteer_id, shift_id)
values (841686697, 139429105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (653011416, 944262479);
insert into SIGNED_UP (volunteer_id, shift_id)
values (668383554, 232814001);
insert into SIGNED_UP (volunteer_id, shift_id)
values (881836997, 519508105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (514625672, 481882532);
insert into SIGNED_UP (volunteer_id, shift_id)
values (902051327, 297039736);
insert into SIGNED_UP (volunteer_id, shift_id)
values (819683430, 857297905);
insert into SIGNED_UP (volunteer_id, shift_id)
values (775209739, 139429105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (642485323, 413554521);
insert into SIGNED_UP (volunteer_id, shift_id)
values (639672862, 686672809);
insert into SIGNED_UP (volunteer_id, shift_id)
values (451737131, 249424386);
insert into SIGNED_UP (volunteer_id, shift_id)
values (253786755, 686089252);
insert into SIGNED_UP (volunteer_id, shift_id)
values (520041146, 743404755);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313177947, 336104842);
insert into SIGNED_UP (volunteer_id, shift_id)
values (557065662, 743404755);
insert into SIGNED_UP (volunteer_id, shift_id)
values (951544258, 542520861);
insert into SIGNED_UP (volunteer_id, shift_id)
values (184932690, 437729907);
insert into SIGNED_UP (volunteer_id, shift_id)
values (834520713, 468557162);
insert into SIGNED_UP (volunteer_id, shift_id)
values (648262515, 266815082);
insert into SIGNED_UP (volunteer_id, shift_id)
values (705343901, 999816284);
insert into SIGNED_UP (volunteer_id, shift_id)
values (327909572, 440638109);
insert into SIGNED_UP (volunteer_id, shift_id)
values (345373195, 711500143);
insert into SIGNED_UP (volunteer_id, shift_id)
values (578495386, 256141764);
insert into SIGNED_UP (volunteer_id, shift_id)
values (238381426, 260692055);
insert into SIGNED_UP (volunteer_id, shift_id)
values (397019954, 586039528);
insert into SIGNED_UP (volunteer_id, shift_id)
values (518487058, 841371586);
insert into SIGNED_UP (volunteer_id, shift_id)
values (272520625, 400235669);
insert into SIGNED_UP (volunteer_id, shift_id)
values (307377542, 500931841);
insert into SIGNED_UP (volunteer_id, shift_id)
values (368058054, 105921023);
insert into SIGNED_UP (volunteer_id, shift_id)
values (520041146, 151653824);
insert into SIGNED_UP (volunteer_id, shift_id)
values (109445262, 493283001);
insert into SIGNED_UP (volunteer_id, shift_id)
values (728052444, 865681697);
insert into SIGNED_UP (volunteer_id, shift_id)
values (336449659, 859481302);
insert into SIGNED_UP (volunteer_id, shift_id)
values (439812126, 206288384);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313177947, 421511304);
insert into SIGNED_UP (volunteer_id, shift_id)
values (715459619, 770832433);
insert into SIGNED_UP (volunteer_id, shift_id)
values (383595500, 105921023);
insert into SIGNED_UP (volunteer_id, shift_id)
values (165623403, 337624157);
insert into SIGNED_UP (volunteer_id, shift_id)
values (817689356, 496812209);
insert into SIGNED_UP (volunteer_id, shift_id)
values (513679012, 691899861);
insert into SIGNED_UP (volunteer_id, shift_id)
values (397019954, 907923402);
insert into SIGNED_UP (volunteer_id, shift_id)
values (728052444, 685436431);
insert into SIGNED_UP (volunteer_id, shift_id)
values (689055472, 987962240);
insert into SIGNED_UP (volunteer_id, shift_id)
values (613362820, 828452187);
insert into SIGNED_UP (volunteer_id, shift_id)
values (247630971, 262523853);
insert into SIGNED_UP (volunteer_id, shift_id)
values (698115382, 554032833);
insert into SIGNED_UP (volunteer_id, shift_id)
values (964804601, 535287979);
insert into SIGNED_UP (volunteer_id, shift_id)
values (296604984, 677112593);
insert into SIGNED_UP (volunteer_id, shift_id)
values (670655852, 498450588);
insert into SIGNED_UP (volunteer_id, shift_id)
values (324514293, 948299438);
insert into SIGNED_UP (volunteer_id, shift_id)
values (226879032, 302152825);
insert into SIGNED_UP (volunteer_id, shift_id)
values (793603819, 569656598);
insert into SIGNED_UP (volunteer_id, shift_id)
values (217947514, 708845701);
insert into SIGNED_UP (volunteer_id, shift_id)
values (467622428, 841371586);
insert into SIGNED_UP (volunteer_id, shift_id)
values (226879032, 205498479);
insert into SIGNED_UP (volunteer_id, shift_id)
values (356560926, 258055763);
insert into SIGNED_UP (volunteer_id, shift_id)
values (327909572, 469204025);
insert into SIGNED_UP (volunteer_id, shift_id)
values (904203001, 427850229);
insert into SIGNED_UP (volunteer_id, shift_id)
values (788534526, 769478286);
insert into SIGNED_UP (volunteer_id, shift_id)
values (995071866, 922035606);
insert into SIGNED_UP (volunteer_id, shift_id)
values (488488861, 610824383);
insert into SIGNED_UP (volunteer_id, shift_id)
values (203521288, 455845334);
insert into SIGNED_UP (volunteer_id, shift_id)
values (605935919, 800282700);
insert into SIGNED_UP (volunteer_id, shift_id)
values (767163521, 945867100);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313147938, 610824383);
insert into SIGNED_UP (volunteer_id, shift_id)
values (548222318, 127904840);
insert into SIGNED_UP (volunteer_id, shift_id)
values (950413481, 738867544);
insert into SIGNED_UP (volunteer_id, shift_id)
values (499414345, 720364084);
insert into SIGNED_UP (volunteer_id, shift_id)
values (533052487, 897509369);
insert into SIGNED_UP (volunteer_id, shift_id)
values (743241033, 223514088);
insert into SIGNED_UP (volunteer_id, shift_id)
values (548222318, 902851302);
insert into SIGNED_UP (volunteer_id, shift_id)
values (308828756, 572034903);
insert into SIGNED_UP (volunteer_id, shift_id)
values (360691901, 927924317);
insert into SIGNED_UP (volunteer_id, shift_id)
values (903494796, 586643543);
insert into SIGNED_UP (volunteer_id, shift_id)
values (190265545, 102239770);
insert into SIGNED_UP (volunteer_id, shift_id)
values (317527788, 529486747);
insert into SIGNED_UP (volunteer_id, shift_id)
values (557065662, 496265442);
insert into SIGNED_UP (volunteer_id, shift_id)
values (450243896, 119624108);
insert into SIGNED_UP (volunteer_id, shift_id)
values (451965899, 717988584);
insert into SIGNED_UP (volunteer_id, shift_id)
values (396101487, 565606458);
insert into SIGNED_UP (volunteer_id, shift_id)
values (742679758, 770832433);
insert into SIGNED_UP (volunteer_id, shift_id)
values (638266872, 285486340);
insert into SIGNED_UP (volunteer_id, shift_id)
values (463552389, 424173276);
insert into SIGNED_UP (volunteer_id, shift_id)
values (499414345, 128459529);
insert into SIGNED_UP (volunteer_id, shift_id)
values (724645743, 556292807);
insert into SIGNED_UP (volunteer_id, shift_id)
values (823421490, 824884203);
insert into SIGNED_UP (volunteer_id, shift_id)
values (799853324, 549198574);
insert into SIGNED_UP (volunteer_id, shift_id)
values (881836997, 358063269);
insert into SIGNED_UP (volunteer_id, shift_id)
values (964804601, 301587180);
insert into SIGNED_UP (volunteer_id, shift_id)
values (300650178, 307541551);
insert into SIGNED_UP (volunteer_id, shift_id)
values (575201823, 906435399);
insert into SIGNED_UP (volunteer_id, shift_id)
values (155477078, 431221574);
insert into SIGNED_UP (volunteer_id, shift_id)
values (846636987, 790515862);
insert into SIGNED_UP (volunteer_id, shift_id)
values (948499687, 279496699);
insert into SIGNED_UP (volunteer_id, shift_id)
values (720249825, 119624108);
insert into SIGNED_UP (volunteer_id, shift_id)
values (601063733, 226572801);
insert into SIGNED_UP (volunteer_id, shift_id)
values (280767922, 769478286);
insert into SIGNED_UP (volunteer_id, shift_id)
values (785397757, 824884203);
insert into SIGNED_UP (volunteer_id, shift_id)
values (670655852, 588263647);
insert into SIGNED_UP (volunteer_id, shift_id)
values (226944417, 906435399);
insert into SIGNED_UP (volunteer_id, shift_id)
values (699152638, 331170291);
insert into SIGNED_UP (volunteer_id, shift_id)
values (514625672, 380096686);
insert into SIGNED_UP (volunteer_id, shift_id)
values (820943069, 407633863);
insert into SIGNED_UP (volunteer_id, shift_id)
values (920703423, 944262479);
insert into SIGNED_UP (volunteer_id, shift_id)
values (125203316, 965883448);
insert into SIGNED_UP (volunteer_id, shift_id)
values (742679758, 721361950);
insert into SIGNED_UP (volunteer_id, shift_id)
values (939275485, 341658769);
insert into SIGNED_UP (volunteer_id, shift_id)
values (150626973, 900165753);
insert into SIGNED_UP (volunteer_id, shift_id)
values (721466403, 603315045);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313147938, 519508105);
insert into SIGNED_UP (volunteer_id, shift_id)
values (376634667, 853610294);
insert into SIGNED_UP (volunteer_id, shift_id)
values (236018541, 159649925);
insert into SIGNED_UP (volunteer_id, shift_id)
values (507789069, 407633863);
insert into SIGNED_UP (volunteer_id, shift_id)
values (314994995, 260692055);
insert into SIGNED_UP (volunteer_id, shift_id)
values (189375133, 556292807);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313177947, 425699329);
insert into SIGNED_UP (volunteer_id, shift_id)
values (133212750, 527158297);
insert into SIGNED_UP (volunteer_id, shift_id)
values (962456875, 859062567);
insert into SIGNED_UP (volunteer_id, shift_id)
values (296604984, 583298772);
insert into SIGNED_UP (volunteer_id, shift_id)
values (367838485, 790515862);
insert into SIGNED_UP (volunteer_id, shift_id)
values (109445262, 583298772);
insert into SIGNED_UP (volunteer_id, shift_id)
values (651370341, 498450588);
insert into SIGNED_UP (volunteer_id, shift_id)
values (188674256, 741386457);
insert into SIGNED_UP (volunteer_id, shift_id)
values (253786755, 207034524);
insert into SIGNED_UP (volunteer_id, shift_id)
values (343842556, 214648194);
insert into SIGNED_UP (volunteer_id, shift_id)
values (948499687, 459232059);
insert into SIGNED_UP (volunteer_id, shift_id)
values (655356874, 826491560);
insert into SIGNED_UP (volunteer_id, shift_id)
values (806789094, 331170291);
insert into SIGNED_UP (volunteer_id, shift_id)
values (715459619, 572551882);
insert into SIGNED_UP (volunteer_id, shift_id)
values (762442704, 142315637);
insert into SIGNED_UP (volunteer_id, shift_id)
values (223195826, 205498479);
insert into SIGNED_UP (volunteer_id, shift_id)
values (313147938, 105921023);
insert into SIGNED_UP (volunteer_id, shift_id)
values (580436161, 936993986);
insert into SIGNED_UP (volunteer_id, shift_id)
values (101159372, 725057217);
insert into SIGNED_UP (volunteer_id, shift_id)
values (901593477, 565606458);
insert into SIGNED_UP (volunteer_id, shift_id)
values (913043182, 291405448);
insert into SIGNED_UP (volunteer_id, shift_id)
values (639575548, 421087186);
insert into SIGNED_UP (volunteer_id, shift_id)
values (108777947, 414072862);
insert into SIGNED_UP (volunteer_id, shift_id)
values (635995270, 556292807);
insert into SIGNED_UP (volunteer_id, shift_id)
values (360593887, 124611647);
insert into SIGNED_UP (volunteer_id, shift_id)
values (562196889, 689141646);
insert into SIGNED_UP (volunteer_id, shift_id)
values (376634667, 757103590);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for CINEMA_ROOM...
alter table CINEMA_ROOM enable constraint FK_BASE_ID;
prompt Enabling foreign key constraints for MOVIE...
alter table MOVIE enable constraint SYS_C009281;
alter table MOVIE enable constraint SYS_C009282;
prompt Enabling foreign key constraints for TICKET...
alter table TICKET enable constraint SYS_C009290;
prompt Enabling foreign key constraints for FOOD...
alter table FOOD enable constraint SYS_C009296;
prompt Enabling foreign key constraints for SEAT...
alter table SEAT enable constraint SYS_C009302;
prompt Enabling foreign key constraints for SHIFTS...
alter table SHIFTS enable constraint SYS_C009373;
prompt Enabling foreign key constraints for VOLUNTEERS...
alter table VOLUNTEERS enable constraint SYS_C009365;
alter table VOLUNTEERS enable constraint SYS_C009367;
prompt Enabling foreign key constraints for SIGNED_UP...
alter table SIGNED_UP enable constraint SYS_C009377;
alter table SIGNED_UP enable constraint SYS_C009378;
prompt Enabling triggers for BASE...
alter table BASE enable all triggers;
prompt Enabling triggers for CINEMA_ROOM...
alter table CINEMA_ROOM enable all triggers;
prompt Enabling triggers for PROJECTOR_EMPLOYEE...
alter table PROJECTOR_EMPLOYEE enable all triggers;
prompt Enabling triggers for MOVIE...
alter table MOVIE enable all triggers;
prompt Enabling triggers for TICKET...
alter table TICKET enable all triggers;
prompt Enabling triggers for FOOD...
alter table FOOD enable all triggers;
prompt Enabling triggers for GEAR...
alter table GEAR enable all triggers;
prompt Enabling triggers for PERSONAL_INFO...
alter table PERSONAL_INFO enable all triggers;
prompt Enabling triggers for POSITION...
alter table POSITION enable all triggers;
prompt Enabling triggers for SEAT...
alter table SEAT enable all triggers;
prompt Enabling triggers for SHIFTS...
alter table SHIFTS enable all triggers;
prompt Enabling triggers for VOLUNTEERS...
alter table VOLUNTEERS enable all triggers;
prompt Enabling triggers for SIGNED_UP...
alter table SIGNED_UP enable all triggers;

set feedback on
set define on
prompt Done
