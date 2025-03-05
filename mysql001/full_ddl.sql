CREATE DATABASE IF NOT EXISTS cybersoft_shop;

USE cybersoft_shop;

CREATE TABLE IF NOT EXISTS loaisanpham (
	maloaisp varchar(20),
	tenloaisp varchar(100),
	PRIMARY KEY (maloaisp)
);


CREATE TABLE IF NOT EXISTS sanpham (
	masp varchar(20),
	tensp varchar(100),
	gia DECIMAL(19,2),
	mota varchar(255),
	PRIMARY KEY (masp)
);

ALTER TABLE sanpham
ADD maloaisp varchar(20),
ADD CONSTRAINT FK_maloaisp_loaisanpham_sanpham
FOREIGN KEY (maloaisp) REFERENCES loaisanpham(maloaisp);

CREATE TABLE IF NOT EXISTS hoadon_sanpham(
	mahoadon varchar(20),
	masp varchar(20),
	giaban DECIMAL(19,2),
	soluong int,
	PRIMARY KEY (mahoadon, masp)
);


CREATE TABLE IF NOT EXISTS hoadon (
	mahoadon varchar(20),
	ngaymua datetime,
	PRIMARY KEY (mahoadon)
);

ALTER TABLE hoadon_sanpham
ADD CONSTRAINT FK_mahoadon_hoadon_hoadon_sanpham
FOREIGN KEY (mahoadon) REFERENCES hoadon(mahoadon);

ALTER TABLE hoadon_sanpham
ADD CONSTRAINT FK_masp_sanpham_hoadon_sanpham
FOREIGN KEY (masp) REFERENCES sanpham(masp);

CREATE TABLE IF NOT EXISTS khachhang (
	makh varchar(20),
	ho varchar(20),
	ten varchar(20),
	sodt varchar(20),
	email varchar(50),
	diachi varchar(255),
	PRIMARY KEY (makh)
);


ALTER TABLE hoadon
ADD makh varchar(20),
ADD CONSTRAINT FK_makh_khachhang_hoadon
FOREIGN KEY (makh) REFERENCES khachhang(makh);
