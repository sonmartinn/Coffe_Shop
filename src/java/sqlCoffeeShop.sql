create database dbCoffeeShop
go
use dbCoffeeShop
Go
create table tbLoaiCoffee
(
	maLoai int primary key,
	tenLoai nvarchar(100),
)
Go
create table tbMenu
(
	maSP int identity(1,1) primary key,
	tenSP nvarchar(100),
	donGia int,
	hinhAnh nvarchar(50),
	moTa nvarchar(max),
	maLoai int foreign key references tbLoaiCoffee(maLoai)
		on update cascade
		on delete cascade
)

go

CREATE TABLE comments (
  comment_id INT PRIMARY KEY identity(1,1),
  user_name NVARCHAR(255),
  comment_text NVARCHAR(1000),
  star_rating int,
 )
 go
 CREATE TABLE customer (
   id INT PRIMARY KEY IDENTITY(1,1),
   name NVARCHAR(50) NOT NULL,
   email NVARCHAR(50) NOT NULL ,
   phone NVARCHAR(20) NOT NULL,
	date DATE NOT NULL,
   time TIME NOT NULL,
   guests INT NOT NULL
)
Go
insert into tbLoaiCoffee(maLoai, tenLoai)
VALUES(1,'Hot'),
		(2,'Cold'),
		(3,'Hot & Cold')
go
insert into tbMenu(tenSP, donGia, hinhAnh, moTa, maloai)
VALUES('Black Coffee',5,'menu-1.jpg','Sit lorem ipsum et diam elitr est dolor sed duo guberg sea et et lorem dolor',3),
		('Chocolete Coffee',7,'menu-2.jpg','Sit lorem ipsum et diam elitr est dolor sed duo guberg sea et et lorem dolor',3),
		('Coffee With Milk',9,'menu-3.jpg','Sit lorem ipsum et diam elitr est dolor sed duo guberg sea et et lorem dolor',3);
go
INSERT INTO customer (name, email, phone, date, time, guests)
VALUES (N'Văn Phú Mạnh', 'manh@gmail.com', '123456789', '2023-05-06', '14:30:00', 4);
go
INSERT INTO customer (name, email, phone, date, time, guests)
VALUES (N'Trươnng Công Tuấn Kiệt', 'kiet@gmail.com', '987654321', '2023-05-08', '18:00:00', 2);

go
INSERT INTO comments (user_name, comment_text, star_rating) 
VALUES 
  (N'Huy Ngô', N'Cf ngon tuyệt vời', 5),
  (N'Phú Mạnh', N'Trang đặt bàn vippro',5),
  (N'Tuấn Kiệt', N'Chào mừng đến với trang web của chúng tôi!',5);