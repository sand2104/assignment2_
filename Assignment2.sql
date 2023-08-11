CREATE DATABASE ExerciseDB
USE ExerciseDB;


CREATE TABLE Publisher
(
    PID INT PRIMARY KEY,
    PublisherName NVARCHAR(50) UNIQUE NOT NULL
);


INSERT INTO Publisher VALUES (1, 'Duff & Dutt');
INSERT INTO Publisher VALUES (2, 'Ray & martin');
INSERT INTO Publisher VALUES (3, 'Tiwari&Co');


CREATE TABLE Category
(
    CID INT PRIMARY KEY,
    CategoryName NVARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Category VALUES (1, 'Horror');
INSERT INTO Category VALUES (2, 'Comedy');
INSERT INTO Category VALUES (3, 'Biopic');


CREATE TABLE Author
(
    AID INT PRIMARY KEY,
    AuthorName NVARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO Author VALUES (1, 'Charles');
INSERT INTO Author VALUES (2, 'Rohit Shetty');
INSERT INTO Author VALUES (3, 'Nadiwala Roy');


CREATE TABLE Book (
    BID INT PRIMARY KEY,
    BName NVARCHAR(50) NOT NULL,
    BPrice DECIMAL(10, 2) NOT NULL,
    Author INT,    FOREIGN KEY (Author) REFERENCES Author(AID),
    Publisher INT,    FOREIGN KEY (Publisher) REFERENCES Publisher(PID),
    Category INT,    FOREIGN KEY (Category) REFERENCES Category(CID)
);


INSERT INTO Book VALUES (1, 'Anabelle2', 16.99, 1, 1, 1);
INSERT INTO Book VALUES (2, 'Sorry to No Sorry', 21.99, 2, 2, 2);
INSERT INTO Book VALUES (3, 'MS Dhoni', 18.99, 3, 3, 3);
INSERT INTO Book VALUES (4, 'Anabelle Returns', 16.99, 1, 1, 2);
INSERT INTO Book VALUES (5, 'Hurray!', 21.99, 2, 2, 3);
INSERT INTO Book VALUES (6, 'Neerja', 18.99, 3, 3, 1);



SELECT B.BID, B.BName, B.BPrice, A.AuthorName, P.PublisherName, C.CategoryName
FROM Book AS B
JOIN Author AS A ON B.Author = A.AID
JOIN Publisher AS P ON B.Publisher = P.PID
JOIN Category AS C ON B.Category = C.CID;
drop table book

