CREATE TABLE cinema_room
(
  room_number INT NOT NULL,
  name VARCHAR(20) NOT NULL,
  PRIMARY KEY (room_number)
);

CREATE TABLE projector_employee
(
  projector_code INT NOT NULL,
  date DATE NOT NULL,
  time DATE NOT NULL,
  PRIMARY KEY (projector_code)
);

CREATE TABLE seat
(
  seat_number INT NOT NULL,
  row_number INT NOT NULL,
  room_number INT NOT NULL,
  PRIMARY KEY (seat_number),
  FOREIGN KEY (room_number) REFERENCES cinema_room(room_number),
  UNIQUE (row_number)
);

CREATE TABLE movie
(
  film_code INT NOT NULL,
  name VARCHAR(20) NOT NULL,
  duration INT NOT NULL,
  category VARCHAR(20) NOT NULL,
  room_number INT NOT NULL,
  projector_code INT NOT NULL,
  PRIMARY KEY (film_code),
  FOREIGN KEY (room_number) REFERENCES cinema_room(room_number),
  FOREIGN KEY (projector_code) REFERENCES projector_employee(projector_code)
);

CREATE TABLE ticket
(
  identifying_number INT NOT NULL,
  hour INT NOT NULL,
  seat INT NOT NULL,
  price INT NOT NULL,
  film_code INT NOT NULL,
  PRIMARY KEY (identifying_number),
  FOREIGN KEY (film_code) REFERENCES movie(film_code)
);

CREATE TABLE food
(
  food VARCHAR(20) NOT NULL,
  drinks VARCHAR(20) NOT NULL,
  receipt INT NOT NULL,
  identifying_number INT NOT NULL,
  PRIMARY KEY (receipt),
  FOREIGN KEY (identifying_number) REFERENCES ticket(identifying_number)
);