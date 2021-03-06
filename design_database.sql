drop database if exists quanlikhunghiduong;

create database resort_management;

use resort_management;

create table vi_tri (
	id_vitri int primary key,
    `name` varchar(50)
);


create table trinh_do (
	id_trinhdo int primary key,
    `trinhdo` varchar(30)
);

create table bo_phan (
	id_bophan int primary key,
    `tenbophan` varchar(30)
);

create table nhan_vien (
	id_nhanvien int primary key,
    `hoten` varchar(30),
    id_vitri int,
    id_trinhdo int,
    id_bophan int,
    ngay_sinh date,
    `so_cmnd` varchar(30),
    `luong` varchar(30),
    `SDT` varchar(30),
    `Email` varchar(30),
    `Dia_chi` varchar(30),
    
    foreign key (id_vitri) references vi_tri (id_vitri),
	foreign key (id_trinhdo) references trinh_do (id_trinhdo),
	foreign key (id_bophan) references bo_phan (id_bophan)
);


create table loai_khach (
	id_loaikhach int primary key,
    `tenloaikhach` varchar(50)
);

create table khach_hang (
	id_khachhang int primary key,
    id_loaikhach int,
    `hoten` varchar(50),
	ngaysinh date,
    `so_cmnd` varchar(30),
    `SDT` varchar(30),
    `Email` varchar(30),
    `Dia_chi` varchar(30),
    
    foreign key (id_loaikhach) references loai_khach (id_loaikhach)
);


create table kieu_thue (
	id_kieuthue int primary key,
    `tenkieuthue` varchar(50),
	gia int
);

create table loai_dich_vu (
	id_loaidichvu int primary key,
    `tenloaidichvu` varchar(50)
);

create table dich_vu (
	id_dichvu int primary key,
    `tendichvu` varchar(50),
    dientich int,
    sotang int,
	`songuoitoita` varchar(50),
    `chiphithue` varchar(50),
    id_kieuthue int,
    id_loaidichvu int,
    `trangthai` varchar(45),
    
    foreign key (id_kieuthue) references kieu_thue (id_kieuthue),
    foreign key (id_loaidichvu) references loai_dich_vu (id_loaidichvu)
);

create table hop_dong (
	id_hopdong int primary key,
    id_nhanvien int,
    id_khachhang int,
    id_dichvu int,
    ngaylamhopdong date,
    ngayketthuc date,
    tiendatcoc int,
    tongtien int,
    
    foreign key (id_nhanvien) references nhan_vien (id_nhanvien),
	foreign key (id_khachhang) references khach_hang (id_khachhang),
	foreign key (id_dichvu) references dich_vu (id_dichvu)
);

create table hop_dong_chi_tiet (
	id_hopdongchitiet int primary key,
    id_hopdong int,
    id_dichvudikem int,
    soluong int,
    
    foreign key (id_hopdong) references hop_dong (id_hopdong),
    foreign key (id_dichvudikem) references dich_vu_di_kem (id_dichvudikem)
);

create table dich_vu_di_kem (
	id_dichvudikem int primary key,
    `tendichvudikem` varchar(50),
    gia int,
    donvi int,
    `trangthai` varchar(45)
);

insert into vi_tri
values 
(1,'L??? t??n'),
(2,'Ph???c v???'),
(3,'Chuy??n vi??n'),
(4,'Gi??m s??t'),
(5,'Qu???n l??'),
(6,'Gi??m ?????c');
select *from vi_tri;

insert into trinh_do 
values
(1,'Trung c???p'),
(2,'Cao ?????ng'),
(3,'?????i h???c'),
(4,'Sau ?????i h???c');

insert into bo_phan 
values
(1,'sale-marketing'),
(2,'h??nh ch??nh'),
(3,'Ph???c v???'),
(4,'Qu???n l??');

insert into nhan_vien 
values
(1,'Tr???n Quang Th??i',1,2,2,'1948-02-03','201814459','2000','0779441949','thailyon33@gmail.com','???? N???ng'),
(2,'Hoa Quang Th??i',2,1,2,'2000-02-04','201814459','223000','8979441949','hoathai@gmail.com','Qu???ng Tr???'),
(3,'Hoa Nguy??n Th??i',1,2,3,'1999-02-03','201814459','223000','8979441949','hoathai@gmail.com','Tam k??');

insert into khach_hang
values
(1,2,'Tr???n Quang Th??i','1948-02-03','201814459','0779441949','thailyon33@gmail.com','???? N???ng'),
(2,4,'Hoa Quang Th??i','2000-02-04','201814459','8979441949','hoathai@gmail.com','Qu???ng Tr???'),
(3,3,'Hoa Nguy??n Th??i','1999-02-03','201814459','8979441949','hoathai@gmail.com','Tam k??');

insert into loai_khach
values
(1,'Diamond'),
(2,'Platium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');

insert into kieu_thue
values
(1,'N??m',50000),
(2,'Th??ng',5000),
(3,'Ng??y',500),
(4,'Gi???',50);

insert into loai_dich_vu
values
(1,'Villa'),
(2,'House'),
(3,'Room');

insert into dich_vu
values
(1,'villa',100,2,10,50000,1,1,'C??n'),
(2,'House',100,2,10,5000,1,1,'h???t'),
(3,'Room',100,2,10,500,1,1,'C??n');


insert into hop_dong
values
(1,1,1,1,'2021-03-02','2021-03-10',10000,20000),
(2,2,2,2,'2021-03-02','2021-03-10',10000,20000);


insert into hop_dong_chi_tiet
values
(1,1,1,2),
(2,2,2,3);


insert into dich_vu_di_kem
values
(1,'Massage',2000,2,'C??n'),
(2,'Karaoke',3000,3,'h???t');



















