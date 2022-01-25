-- Lab 2
-- hreese
-- Jan 25, 2022

USE `hreese`;
-- AIRLINES
-- Create and populate relational tables corresponding to the AIRLINES dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS airports;

CREATE TABLE airlines (
    Id           INTEGER,
    Airline      VARCHAR(25),
    Abbreviation VARCHAR(15),
    Country      CHAR(3),
    
    PRIMARY KEY (Id),
    UNIQUE(Abbreviation)
);

CREATE TABLE airports (
    City          VARCHAR(20),
    AirportCode   CHAR(3),
    AirportName   VARCHAR(35),
    Country       VARCHAR(15),
    CountryAbbrev CHAR(3),
    
    PRIMARY KEY (AirportCode)
);

CREATE TABLE flights (
    Airline       INTEGER,
    FlightNo      INTEGER,
    SourceAirport CHAR(3) NOT NULL,
    DestAirport   CHAR(3) NOT NULL,
    
    PRIMARY KEY (FlightNo, SourceAirport, DestAirport),
    
    FOREIGN KEY (SourceAirport)
      REFERENCES airports(AirportCode),
    FOREIGN KEY (DestAirport)
      REFERENCES airports(AirportCode),    
    FOREIGN KEY (Airline)
      REFERENCES airlines (Id),
      
    UNIQUE(Airline, FlightNo)
);

INSERT INTO airlines (Id, Airline, Abbreviation, Country)
VALUES  (1, 'United Airlines', 'UAL', 'USA'),
        (2, 'US Airways', 'USAir', 'USA'),
        (3, 'Delta Airlines', 'Delta', 'USA'),
        (4, 'Southwest Airlines', 'Southwest', 'USA'),
        (5, 'American Airlines', 'American', 'USA'),
        (6, 'Northwest Airlines', 'Northwest', 'USA'),
        (7, 'Continental Airlines', 'Continental', 'USA'),
        (8, 'JetBlue Airways', 'JetBlue', 'USA'),
        (9, 'Frontier Airlines', 'Frontier', 'USA'),
        (10, 'AirTran Airways', 'AirTran', 'USA'),
        (11, 'Allegiant Air', 'Allegiant', 'USA'),
        (12, 'Virgin America', 'Virgin', 'USA');

INSERT INTO airports (City, AirportCode, AirportName, Country, CountryAbbrev)
VALUES  ('Aberdeen', 'APG', 'Phillips AAF', 'United States', 'US'),
        ('Aberdeen', 'ABR', 'Municipal', 'United States', 'US'),
        ('Abilene', 'DYS', 'Dyess AFB', 'United States', 'US'),
        ('Abilene', 'ABI', 'Municipal', 'United States', 'US'),
        ('Abingdon', 'VJI', 'Virginia Highlands', 'United States', 'US'),
        ('Ada', 'ADT', 'Ada', 'United States', 'US'),
        ('Adak Island', 'ADK', 'Adak Island Ns', 'United States', 'US'),
        ('Adrian', 'ADG', 'Lenawee County', 'United States', 'US'),
        ('Afton', 'AFO', 'Municipal', 'United States', 'US'),
        ('Aiken', 'AIK', 'Municipal', 'United States', 'US'),
        ('Ainsworth', 'ANW', 'Ainsworth', 'United States', 'US'),
        ('Akhiok', 'AKK', 'Akhiok SPB', 'United States', 'US'),
        ('Akiachak', 'KKI', 'Spb', 'United States', 'US'),
        ('Akiak', 'AKI', 'Akiak', 'United States', 'US'),
        ('Akron CO', 'AKO', 'Colorado Plains Regional Airport', 'United States', 'US'),
        ('Akron/Canton OH', 'CAK', 'Akron/canton Regional', 'United States', 'US'),
        ('Akron/Canton', 'AKC', 'Fulton International', 'United States', 'US');
        
INSERT INTO flights (Airline,  FlightNo, SourceAirport, DestAirport)
VALUES  (1,  28, 'APG', 'ABR'),
        (1,  29, 'AIK', 'ADT'),
        (1,  44, 'AKO', 'AKI'),
        (1,  45, 'CAK', 'APG'),
        (1,  54, 'AFO', 'AKO'),
        (3,  2, 'AIK', 'ADT'),
        (3,  3, 'DYS', 'ABI'),
        (3,  26, 'AKK', 'VJI'),
        (9,  1260, 'AKO', 'AKC'),
        (9,  1261, 'APG', 'ABR'),
        (9,  1286, 'ABR', 'APG'),
        (9,  1287, 'DYS', 'ANW'),
        (10,  6, 'KKI', 'AKC'),
        (10,  7, 'VJI', 'APG'),
        (10,  54, 'ADT', 'APG'),
        (6,  4, 'AIK', 'AKO'),
        (6,  5, 'CAK', 'APG'),
        (6,  28, 'AKO', 'ABI'),
        (6,  29, 'ABR', 'ABI');

        
USE `hreese`;
-- KATZENJAMMER
-- Create and populate the KATZENJAMMER database
DROP TABLE IF EXISTS Vocals;
DROP TABLE IF EXISTS Tracklists;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Instruments;
DROP TABLE IF EXISTS Albums;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Band;

CREATE TABLE Albums (
    AId     INTEGER,
    Title   VARCHAR(37),
    Year    INTEGER,
    Label   VARCHAR(21),
    `Type`  VARCHAR(6),
    
    PRIMARY KEY (AId)
);

CREATE TABLE Songs (
    SongId  INTEGER,
    Title   VARCHAR(31),
    
    PRIMARY KEY (SongId)
);

CREATE TABLE Band (
    Id        INTEGER,
    Firstname VARCHAR(10),
    Lastname  VARCHAR(9),
    
    PRIMARY KEY (Id)
);

CREATE TABLE Vocals (
    SongId   INTEGER,
    Bandmate INTEGER,
    `Type`   VARCHAR(6),
    
    PRIMARY KEY (SongId, Bandmate),
    FOREIGN KEY (SongId)
      REFERENCES Songs (SongId),
    FOREIGN KEY (Bandmate)
      REFERENCES Band (Id)
);

CREATE TABLE Tracklists (
    AlbumId  INTEGER,
    Position INTEGER,
    SongId   INTEGER,
    
    PRIMARY KEY (AlbumId, SongId),
    FOREIGN KEY (SongId)
      REFERENCES Songs (SongId),
    FOREIGN KEY (AlbumId)
      REFERENCES Albums (AId)
);

CREATE TABLE Performance (
    SongId        INTEGER,
    Bandmate      INTEGER,
    StagePosition VARCHAR(6),
    
    PRIMARY KEY (SongId, Bandmate),
    FOREIGN KEY (SongId)
      REFERENCES Songs (SongId),
    FOREIGN KEY (Bandmate)
      REFERENCES Band (Id)
);

CREATE TABLE Instruments (
    SongId      INTEGER,
    BandmateId  INTEGER,
    Instrument  VARCHAR(15),
    
    PRIMARY KEY (SongId, Instrument),
    FOREIGN KEY (SongId)
      REFERENCES Songs (SongId),
    FOREIGN KEY (BandmateId)
      REFERENCES Band (Id)
);

INSERT INTO Albums (AId, Title, Year, Label, Type)
VALUES  (1, 'Le Pop', 2008, 'Propeller Recordings', 'Studio'),
        (2, 'A Kiss Before You Go', 2011, 'Propeller Recordings', 'Studio'),
        (3, 'A Kiss Before You Go: Live in Hamburg', 2012, 'Universal Music Group', 'Live'),
        (4, 'Rockland', 2015, 'Propeller Recordings', 'Studio');

INSERT INTO Songs (SongId, Title)
VALUES  (1, 'Overture'),
        (2, 'A Bar In Amsterdam'),
        (3, 'Demon Kitty Rag'),
        (4, 'Tea With Cinnamon'),
        (5, 'Hey Ho on the Devil''s Back'),
        (6, 'Wading in Deeper'),
        (7, 'Le Pop'),
        (8, 'Der Kapitan'),
        (9, 'Virginia Clemm'),
        (10, 'Play My Darling'),
        (11, 'To the Sea'),
        (12, 'Mother Superior'),
        (13, 'Aint no Thang'),
        (14, 'A Kiss Before You Go'),
        (15, 'I Will Dance (When I Walk Away)'),
        (16, 'Cherry Pie'),
        (17, 'Land of Confusion'),
        (18, 'Lady Marlene'),
        (19, 'Rock-Paper-Scissors'),
        (20, 'Cocktails and Ruby Slippers'),
        (21, 'Soviet Trumpeter'),
        (22, 'Loathsome M'),
        (23, 'Shepherds Song'),
        (24, 'Gypsy Flee'),
        (25, 'Gods Great Dust Storm'),
        (26, 'Ouch'),
        (27, 'Listening to the World'),
        (28, 'Johnny Blowtorch'),
        (29, 'Flash'),
        (30, 'Driving After You'),
        (31, 'My Own Tune'),
        (32, 'Badlands'),
        (33, 'Old De Spain'),
        (34, 'Oh My God'),
        (35, 'Lady Gray'),
        (36, 'Shine Like Neon Rays'),
        (37, 'Flash in the Dark'),
        (38, 'My Dear'),
        (39, 'Bad Girl'),
        (40, 'Rockland'),
        (41, 'Curvaceous Needs'),
        (42, 'Borka'),
        (43, 'Let it Snow');

INSERT INTO Band (Id, Firstname, Lastname)
VALUES  (1, 'Solveig', 'Heilo'),
        (2, 'Marianne', 'Sveen'),
        (3, 'Anne-Marit', 'Bergheim'),
        (4, 'Turid', 'Jorgensen');

INSERT INTO Vocals (SongId, Bandmate, `Type`)
VALUES  (2, 1, 'lead'),
        (2, 3, 'chorus'),
        (2, 4, 'chorus'),
        (3, 2, 'lead'),
        (4, 1, 'chorus'),
        (4, 2, 'lead'),
        (4, 3, 'chorus'),
        (4, 4, 'chorus');

INSERT INTO Tracklists (AlbumId, Position, SongId)
VALUES  (1, 1, '1'),
        (1, 2, '2'),
        (1, 3, '3'),
        (1, 4, '4'),
        (1, 5, '5'),
        (1, 6, '6'),
        (1, 7, '7'),
        (1, 8, '8'),
        (1, 9, '9'),
        (1, 10, '10'),
        (1, 11, '11'),
        (1, 12, '12'),
        (1, 13, '13'),
        (2, 1, '14'),
        (2, 2, '15'),
        (2, 3, '16'),
        (2, 4, '17'),
        (2, 5, '18'),
        (2, 6, '19'),
        (2, 7, '20'),
        (2, 8, '21'),
        (2, 9, '22'),
        (2, 10, '23'),
        (2, 11, '24'),
        (2, 12, '25'),
        (3, 1, '14'),
        (3, 2, '26'),
        (3, 3, '3'),
        (3, 4, '15'),
        (3, 5, '11'),
        (3, 6, '19'),
        (3, 7, '18'),
        (3, 8, '16'),
        (3, 9, '12'),
        (3, 10, '17'),
        (3, 11, '22'),
        (3, 12, '20'),
        (3, 13, '2'),
        (3, 14, '5'),
        (3, 15, '8'),
        (3, 16, '7'),
        (3, 17, '25'),
        (3, 18, '13'),
        (3, 19, '24'),
        (4, 1, '33'),
        (4, 2, '41'),
        (4, 3, '34'),
        (4, 4, '35'),
        (4, 5, '31'),
        (4, 6, '36'),
        (4, 7, '30'),
        (4, 8, '37'),
        (4, 9, '38'),
        (4, 10, '39'),
        (4, 11, '40');

INSERT INTO Performance (SongId, Bandmate, StagePosition)
VALUES  (1, 1, 'back'),
        (1, 2, 'left'),
        (1, 3, 'center'),
        (1, 4, 'right'),
        (2, 1, 'center'),
        (2, 2, 'back'),
        (2, 3, 'left'),
        (2, 4, 'right'),
        (3, 1, 'back'),
        (3, 2, 'right'),
        (3, 3, 'center'),
        (3, 4, 'left'),
        (4, 1, 'back'),
        (4, 2, 'center'),
        (4, 3, 'left'),
        (4, 4, 'right');

INSERT INTO Instruments (SongId, BandmateId, Instrument)
VALUES  (1, 1, 'trumpet'),
        (1, 2, 'keyboard'),
        (1, 3, 'accordion'),
        (1, 4, 'bass balalaika'),
        (2, 1, 'trumpet'),
        (2, 2, 'drums'),
        (2, 3, 'guitar'),
        (2, 4, 'bass balalaika'),
        (3, 1, 'drums'),
        (3, 1, 'ukalele'),
        (3, 2, 'banjo'),
        (3, 3, 'bass balalaika'),
        (3, 4, 'keyboards'),
        (4, 1, 'drums'),
        (4, 2, 'ukalele'),
        (4, 3, 'accordion'),
        (4, 4, 'bass balalaika');


USE `hreese`;
-- BAKERY
-- Create and populate the BAKERY database
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS receipts;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS goods;

CREATE TABLE customers (
    CId        INTEGER,
    LastName  VARCHAR(12),
    FirstName VARCHAR(8),
    
    PRIMARY KEY (CId),
    UNIQUE(LastName, FirstName)
);

CREATE TABLE receipts (
    RNumber    INTEGER,
    SaleDate   DATE,
    Customer   INTEGER,
    
    PRIMARY KEY (RNumber),
    FOREIGN KEY (Customer)
      REFERENCES customers (CId)
);

CREATE TABLE goods (
    GId    VARCHAR(13),
    Flavor VARCHAR(10),
    Food   VARCHAR(9),
    Price  FLOAT(2),
    
    PRIMARY KEY (GId),
    UNIQUE(Flavor, Food)
);

CREATE TABLE items (
    Receipt INTEGER,
    Ordinal INTEGER,
    Item    VARCHAR(13) NOT NULL,
    
    PRIMARY KEY (Receipt, Ordinal),
    FOREIGN KEY (Item)
      REFERENCES goods(GId),
    FOREIGN KEY (Receipt)
      REFERENCES receipts(RNumber)
);

INSERT INTO customers(CId, LastName, FirstName)
VALUES  (1, 'LOGAN', 'JULIET'),
        (2, 'ARZT', 'TERRELL'),
        (3, 'ESPOSITA', 'TRAVIS'),
        (4, 'ENGLEY', 'SIXTA'),
        (5, 'DUNLOW', 'OSVALDO'),
        (6, 'SLINGLAND', 'JOSETTE'),
        (7, 'TOUSSAND', 'SHARRON'),
        (8, 'HELING', 'RUPERT'),
        (9, 'HAFFERKAMP', 'CUC'),
        (10, 'DUKELOW', 'CORETTA'),
        (11, 'STADICK', 'MIGDALIA'),
        (12, 'MCMAHAN', 'MELLIE'),
        (13, 'ARNN', 'KIP'),
        (14, 'S''OPKO', 'RAYFORD'),
        (15, 'CALLENDAR', 'DAVID'),
        (16, 'CRUZEN', 'ARIANE'),
        (17, 'MESDAQ', 'CHARLENE'),
        (18, 'DOMKOWSKI', 'ALMETA'),
        (19, 'STENZ', 'NATACHA'),
        (20, 'ZEME', 'STEPHEN');
        
INSERT INTO receipts (RNumber, SaleDate, Customer)
VALUES  (18129, STR_TO_DATE('28-Oct-2007', '%d-%b-%Y'), 15),
        (51991, STR_TO_DATE('17-Oct-2007', '%d-%b-%Y'), 14),
        (83085, STR_TO_DATE('12-Oct-2007', '%d-%b-%Y'), 7),
        (70723, STR_TO_DATE('28-Oct-2007', '%d-%b-%Y'), 20),
        (13355, STR_TO_DATE('12-Oct-2007', '%d-%b-%Y'), 7),
        (52761, STR_TO_DATE('27-Oct-2007', '%d-%b-%Y'), 8),
        (99002, STR_TO_DATE('13-Oct-2007', '%d-%b-%Y'), 20),
        (58770, STR_TO_DATE('22-Oct-2007', '%d-%b-%Y'), 18),
        (84665, STR_TO_DATE('10-Oct-2007', '%d-%b-%Y'), 6);

INSERT INTO goods (GId, Flavor, Food, Price)
VALUES  ('20-BC-C-10', 'Chocolate', 'Cake', 8.95),
        ('20-BC-L-10', 'Lemon', 'Cake', 8.95),
        ('20-CA-7.5', 'Casino', 'Cake', 15.95),
        ('24-8x10', 'Opera', 'Cake', 15.95),
        ('25-STR-9', 'Strawberry', 'Cake', 11.95),
        ('26-8x10', 'Truffle', 'Cake', 15.95),
        ('45-CH', 'Chocolate', 'Eclair', 3.25),
        ('45-CO', 'Coffee', 'Eclair', 3.5),
        ('45-VA', 'Vanilla', 'Eclair', 3.25),
        ('46-11', 'Napoleon', 'Cake', 13.49),
        ('90-ALM-I', 'Almond', 'Tart', 3.75),
        ('90-APIE-10', 'Apple', 'Pie', 5.25),
        ('90-APP-11', 'Apple', 'Tart', 3.25),
        ('90-APR-PF', 'Apricot', 'Tart', 3.25),
        ('90-BER-11', 'Berry', 'Tart', 3.25),
        ('90-BLK-PF', 'Blackberry', 'Tart', 3.25),
        ('90-BLU-11', 'Blueberry', 'Tart', 3.25),
        ('90-CH-PF', 'Chocolate', 'Tart', 3.75),
        ('90-CHR-11', 'Cherry', 'Tart', 3.25),
        ('90-LEM-11', 'Lemon', 'Tart', 3.25),
        ('90-PEC-11', 'Pecan', 'Tart', 3.75),
        ('70-GA', 'Ganache', 'Cookie', 1.15),
        ('70-GON', 'Gongolais', 'Cookie', 1.15),
        ('70-R', 'Raspberry', 'Cookie', 1.09),
        ('70-LEM', 'Lemon', 'Cookie', 0.79),
        ('70-M-CH-DZ', 'Chocolate', 'Meringue', 1.25),
        ('70-M-VA-SM-DZ', 'Vanilla', 'Meringue', 1.15),
        ('70-MAR', 'Marzipan', 'Cookie', 1.25),
        ('70-TU', 'Tuile', 'Cookie', 1.25),
        ('70-W', 'Walnut', 'Cookie', 0.79),
        ('50-ALM', 'Almond', 'Croissant', 1.45),
        ('50-APP', 'Apple', 'Croissant', 1.45),
        ('50-APR', 'Apricot', 'Croissant', 1.45),
        ('50-CHS', 'Cheese', 'Croissant', 1.75),
        ('50-CH', 'Chocolate', 'Croissant', 1.75),
        ('51-APR', 'Apricot', 'Danish', 1.15),
        ('51-APP', 'Apple', 'Danish', 1.15),
        ('51-ATW', 'Almond', 'Twist', 1.15),
        ('51-BC', 'Almond', 'BearClaw', 1.95),
        ('51-BLU', 'Blueberry', 'Danish', 1.15);
        
INSERT INTO items (Receipt, Ordinal, Item)
VALUES  (18129, 1, '70-TU'),
        (51991, 1, '90-APIE-10'),
        (51991, 2, '90-CH-PF'),
        (51991, 3, '90-APP-11'),
        (51991, 4, '26-8x10'),
        (83085, 1, '25-STR-9'),
        (83085, 2, '24-8x10'),
        (83085, 3, '90-APR-PF'),
        (83085, 4, '51-ATW'),
        (83085, 5, '26-8x10'),
        (70723, 1, '45-CO'),
        (13355, 1, '24-8x10'),
        (13355, 2, '70-LEM'),
        (13355, 3, '46-11'),
        (52761, 1, '90-ALM-I'),
        (52761, 2, '26-8x10'),
        (52761, 3, '50-CHS'),
        (52761, 4, '90-BLK-PF'),
        (52761, 5, '90-ALM-I'),
        (99002, 1, '50-CHS'),
        (99002, 2, '45-VA'),
        (58770, 1, '50-CHS'),
        (58770, 2, '46-11'),
        (58770, 3, '45-CH'),
        (58770, 4, '20-CA-7.5'),
        (84665, 1, '90-BER-11');


USE `hreese`;
-- CUSTOM
-- Create and populate your custom database
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Colors;
DROP TABLE IF EXISTS Parts;
DROP TABLE IF EXISTS Categories;


CREATE TABLE Categories (
    Id   INTEGER,
    Name VARCHAR(45),
    
    PRIMARY KEY (Id)
);

CREATE TABLE Parts (
    PartNum  VARCHAR(10),
    Name     VARCHAR(85),
    Category INTEGER,
    
    PRIMARY KEY (PartNum),
    FOREIGN KEY (Category)
      REFERENCES Categories (Id)
);

CREATE TABLE Colors (
    Id     INTEGER,
    Name   VARCHAR(25),
    Rgb    VARCHAR(6),
    Opaque CHAR(1),
    
    PRIMARY KEY (Id)
);

CREATE TABLE Inventory (
    Id       INTEGER,
    PartNum  VARCHAR(10),
    ColorId  INTEGER,
    Quantity INTEGER,
    
    PRIMARY KEY(Id, PartNum),
    FOREIGN KEY (PartNum)
      REFERENCES Parts (PartNum),
    FOREIGN KEY (ColorId)
      REFERENCES Colors (Id)
);

INSERT INTO Categories (Id, Name)
VALUES  (2, 'Bricks Printed'),
        (3, 'Bricks Sloped'),
        (4, 'Duplo, Quatro, and Primo'),
        (5, 'Bricks Special'),
        (6, 'Bricks Wedged'),
        (7, 'Containers'),
        (8, 'Technic Bricks'),
        (9, 'Plates Special'),
        (10, 'Tiles Printed'),
        (11, 'Bricks'),
        (12, 'Technic Connectors'),
        (13, 'Minifigs'),
        (14, 'Plates'),
        (15, 'Tiles Special'),
        (16, 'Windows and Doors'),
        (17, 'Non-LEGO'),
        (18, 'Hinges, Arms, and, Turntables'),
        (19, 'Tiles'),
        (20, 'Bricks Round and Cones'),
        (21, 'Plates Round and Dishes'),
        (22, 'Pneumatics'),
        (23, 'Panels'),
        (24, 'Other');

INSERT INTO Parts (PartNum, Name, Category)
VALUES  ('3020', 'Plate 2 x 4', 14),
        ('2460', 'Tile Special 2 x 2 with Pin', 15),
        ('49668', 'Plate Special 1 x 1 with Tooth', 9),
        ('54805', 'DUPLO CONE 2X2X2 DEC', 24),
        ('970c00', 'Legs and Hips [Complete Assembly]', 13),
        ('mcsport6','Sports Promo Figure Head Torso Assembly McDonald''s Set 6 (7922)', 13);

INSERT INTO Colors (Id, Name, Rgb, Opaque)
VALUES  (0, 'Black', '05131D', 'f'),
        (1, 'Blue', '0055BF', 'f'),
        (2, 'Green', '237841', 'f'),
        (3, 'Dark Turquoise', '008F9B', 'f'),
        (4, 'Red', 'C91A09', 'f'),
        (5, 'Dark Pink', 'C870A0', 'f'),
        (6, 'Brown', '583927', 'f'),
        (7, 'Light Gray', '9BA19D', 'f'),
        (8, 'Dark Gray', '6D6E5C', 'f'),
        (9, 'Light Blue', 'B4D2E3', 'f'),
        (10, 'Bright Green', '4B9F4A', 'f'),
        (11, 'Light Turquoise', '55A5AF', 'f'),
        (12, 'Salmon', 'F2705E', 'f'),
        (13, 'Pink', 'FC97AC', 'f'),
        (14, 'Yellow', 'F2CD37', 'f'),
        (15, 'White', 'FFFFFF', 'f'),
        (17, 'Light Green', 'C2DAB8', 'f'),
        (18, 'Light Yellow', 'FBE696', 'f'),
        (19, 'Tan', 'E4CD9E', 'f'),
        (20, 'Light Violet', 'C9CAE2', 'f'),
        (21, 'Glow In Dark Opaque', 'D4D5C9', 'f'),
        (22, 'Purple', '81007B', 'f'),
        (23, 'Dark Blue-Violet', '2032B0', 'f'),
        (25, 'Orange', 'FE8A18', 'f');
        
INSERT INTO Inventory (Id, PartNum, ColorId, Quantity)        
VALUES  (1, 'mcsport6', 25, 1),
        (3, '3020', 15, 1),
        (26, '2460', 7, 1),
        (55, '970c00', 14, 1),
        (1117, '49668', 19, 2),
        (15003, '54805', 25, 1);
