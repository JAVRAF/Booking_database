CREATE DATABASE booking;
CREATE TABLE booking.User (
    id varchar(36) PRIMARY KEY NOT NULL,
    name varchar(50) NOT NULL,
    login varchar(50) NOT NULL,
    password varchar(60) NOT NULL,
    email varchar(250) NOT NULL,
    birthDate date NOT NULL,
    isStudent boolean NOT NULL,
    isAdmin boolean NOT NULL,
    canAddScreening boolean NOT NULL
)ENGINE=INNODB;
CREATE TABLE booking.Theater (
    id varchar(36) PRIMARY KEY NOT NULL,
    name varchar(50) NOT NULL,
    address varchar(50) NOT NULL,
    nbRooms integer NOT NULL
)ENGINE=INNODB;
CREATE TABLE booking.Room (
    id varchar(36) PRIMARY KEY NOT NULL,
    roomNumber integer NOT NULL,
    nbSeats integer NOT NULL,
    theaterID varchar(36),
    FOREIGN KEY (theaterID) REFERENCES theater(id)
)ENGINE=INNODB;
CREATE TABLE booking.Movie (
    id varchar(36) PRIMARY KEY NOT NULL,
    name varchar(50) NOT NULL,
    runtime integer NOT NULL
)ENGINE=INNODB;
CREATE TABLE booking.Screening (
    id varchar(36) PRIMARY KEY NOT NULL,
    Time Datetime NOT NULL,
    roomID varchar(36) NOT NULL,
    movieID varchar(36) NOT NULL,
    isFull boolean NOT NULL,
    FOREIGN KEY (roomID) REFERENCES Room(id),
    FOREIGN KEY (movieID) REFERENCES Movie(id)
)ENGINE=INNODB;
CREATE TABLE booking.TicketPrice (
    id varchar(36) PRIMARY KEY NOT NULL,
    name varchar(50) NOT NULL,
    price decimal(2,1) NOT NULL
)ENGINE=INNODB;
CREATE TABLE booking.Booking (
    id varchar(36) PRIMARY KEY NOT NULL,
    seat varchar(3) NOT NULL,
    isPaidOnline boolean NOT NULL,
    userID varchar(36) NOT NULL,
    screeningID varchar(36) NOT NULL,
    ticketPriceID varchar(36) NOT NULL,
    FOREIGN KEY (userID) REFERENCES user(id),
    FOREIGN KEY (screeningID) REFERENCES screening(id),
    FOREIGN KEY (ticketPriceID) REFERENCES ticketPrice(id)
)ENGINE=INNODB;
INSERT INTO User (id, name, login, password, email, birthDate, isStudent, isAdmin, canAddScreening)
VALUES
(UUID(), 'Jean Bon', 'JBON','$2y$10$8ANe6JBxgl77L6TM1T5.JeX9hvZ30u6ytaWU3v5REKTFzcD8Ecl/i','j.bon@coldmail.fr','1985-07-19',0,1,0),
(UUID(), 'Marie Rihaz', 'MRihaz','$2y$10$VEIlRc.G9x3JWTOUhDkPP.8eJy87ZBsnb5h3FwDkHFYjf88pAxvy6','m.rihaz@cesthoo.com','1989-02-23',0,0,0),
(UUID(), 'Liz Ourde', 'l.Ourde','$2y$10$4XTCmxPP6olWYV3jg86UweDh5SG.6zlVTZWGp8YcDZjSo374HEN2a','lourde@nsm.com','1992-10-30',0,0,1);
INSERT INTO Theater (id, name, address, nbRooms)
VALUES
(UUID(),'Cinémario','15 rue des tuyaux 15489 CHAMPVILLE',2),
(UUID(),'Aussinéma','5 chemin des gens 25665 VILLEMONDE',1),
(UUID(),'Cinérgie max','154 avenue des pas perdus 99012 PARAPRIS',3);
INSERT INTO Room (id, roomNumber, nbSeats, theaterID)
VALUES
(UUID(),1,40,'ea4df4c8-af5b-11eb-9077-d43d7e550068'),
(UUID(),21,20,'ea4df775-af5b-11eb-9077-d43d7e550068'),
(UUID(),31,100,'ea4df830-af5b-11eb-9077-d43d7e550068'),
(UUID(),32,100,'ea4df830-af5b-11eb-9077-d43d7e550068');
INSERT INTO Movie (id, name, runtime)
VALUES 
(UUID(), 'les étoiles du seigneur', 140),
(UUID(), 'les anneaux de la guerre', 201);
INSERT INTO Screening (id, Time, roomID, movieID, isFull)
VALUES 
(UUID(),'2021-05-08 15:00:00', '4e2d04da-af5c-11eb-9077-d43d7e550068','a3d86e14-af5c-11eb-9077-d43d7e550068',1),
(UUID(),'2021-05-08 15:00:00', '4e2d0877-af5c-11eb-9077-d43d7e550068','a3d86e14-af5c-11eb-9077-d43d7e550068',0),
(UUID(),'2021-05-08 19:00:00', '4e2d0877-af5c-11eb-9077-d43d7e550068','a3dae2ee-af5c-11eb-9077-d43d7e550068',0),
(UUID(),'2021-05-08 21:00:00', '4e2d08ce-af5c-11eb-9077-d43d7e550068','a3dae2ee-af5c-11eb-9077-d43d7e550068',1);
INSERT INTO ticketPrice (id, name, price)
VALUES
(UUID(),'full',9.2),
(UUID(),'student',7.6),
(UUID(),'-14',5.9);
INSERT INTO Booking (id, seat, isPaidOnline, userID, screeningID, ticketPriceID)
VALUES
(UUID(),'A12',1,'ea449aca-af5b-11eb-9077-d43d7e550068','c2f29a49-af5c-11eb-9077-d43d7e550068','c9a5723e-af5c-11eb-9077-d43d7e550068'),
(UUID(),'C55',0,'ea449aca-af5b-11eb-9077-d43d7e550068','c2f29bf7-af5c-11eb-9077-d43d7e550068','c9a5723e-af5c-11eb-9077-d43d7e550068');