CREATE DATABASE qlbansach;

USE qlbansach;

CREATE TABLE IF NOT EXISTS khachhang(
	makh varchar(20),
	taikhoan varchar(30),
	matkhau varchar(255),
	email varchar(50),
	diachi varchar(255),
	dienthoai varchar(20),
	gioitinh varchar(5),
	ngaysinh datetime,
	hoten varchar(50)
);

ALTER TABLE khachhang
ADD PRIMARY KEY khachhang(makh);

CREATE TABLE IF NOT EXISTS donhang(
	madonhang varchar(20),
	dathanhtoan boolean,
	ngaygiao datetime,
	ngaydat datetime,
	tinhtranggh varchar(20)
);

ALTER TABLE donhang
ADD PRIMARY KEY donhang(madonhang);

ALTER TABLE donhang 
ADD makh varchar(20),
ADD CONSTRAINT FK_makh_khachhang_donhang
FOREIGN KEY (makh) REFERENCES khachhang(makh);

CREATE TABLE IF NOT EXISTS sach(
	masach varchar(20),
	tensach varchar(100),
	soluongton int,
	ngaycapnhat datetime,
	anhbia varchar(255),
	mota varchar(255),
	giaban DECIMAL(19,2),
	PRIMARY KEY (masach)
);

CREATE TABLE IF NOT EXISTS donhang_sach(
	madonhang varchar(20),
	masach varchar(20),
	soluong int,
	dongia DECIMAL(19,2),
	PRIMARY KEY (madonhang, masach),
	CONSTRAINT FK_madonhang_donhang_donhang_sach
	FOREIGN KEY (madonhang) REFERENCES donhang(madonhang),
	CONSTRAINT FK_masach_sach_donhang_sach
	FOREIGN KEY (masach) REFERENCES sach(masach)
);


CREATE TABLE IF NOT EXISTS chude(
	machude varchar(20),
	tenchude varchar(100),
	PRIMARY KEY (machude)
);

ALTER TABLE sach 
ADD machude varchar(20),
ADD CONSTRAINT FK_machude_chude_sach
FOREIGN KEY (machude) REFERENCES chude(machude);


CREATE TABLE IF NOT EXISTS tacgia(
	matacgia varchar(20),
	tentacgia varchar(50),
	diachi varchar(255),
	tieusu text,
	dienthoai varchar(20),
	PRIMARY KEY (matacgia)
);

CREATE TABLE IF NOT EXISTS sach_tacgia(
	masach varchar(20),
	matacgia varchar(20),
	vaitro varchar(20),
	vitri varchar(20),
	PRIMARY KEY (masach, matacgia),
	CONSTRAINT FK_masach_sach_sach_tacgia
	FOREIGN KEY (masach) REFERENCES sach(masach),
	CONSTRAINT FK_matacgia_tacgia_sach_tacgia
	FOREIGN KEY (matacgia) REFERENCES tacgia(matacgia)
);

CREATE TABLE IF NOT EXISTS nhaxuatban(
	mansx varchar(20),
	tennsb varchar(100),
	dienthoai varchar(20),
	diachi varchar(255),
	PRIMARY KEY (mansx)
);

ALTER TABLE sach
ADD mansx varchar(20),
ADD CONSTRAINT FK_mansx_nhaxuatban_sach
FOREIGN KEY (mansx) REFERENCES nhaxuatban(mansx);



