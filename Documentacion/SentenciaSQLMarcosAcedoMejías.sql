Create user 'agexbo'@'localhost' identified by '1234';

Create database agexbo;

grant ALL privileges on agexbo.* to 'agexbo'@'localhost';

use agexbo;

create table usuarios (
	usuario varchar(20) primary key not null,
    passwd varchar(200) not null,
    nombre varchar(50),
	dni varchar(9),
	email varchar(50),
	tlfno varchar(12),
    rol varchar(10) not null,
    validado varchar(2) not null,
    datos varchar(2)
);

create table explotacion (
	REGA varchar(14) primary key not null,
    nombre varchar(50) not null,
    provincia varchar(20) not null,
    municipio varchar(20) not null,
	usuario varchar(9) not null,
    FOREIGN KEY (usuario) REFERENCES usuarios(usuario)
);

create table bovino (
	DIB varchar(14) primary key not null,
	REGA varchar(14) not null,
    nacimiento varchar(10) not null,
    paisOrigen varchar(20) not null default "España",
    raza varchar(50) not null,
	sexo varchar(6) not null,
	DIBMadre varchar(14) not null,
    fechaAlta varchar(10) not null,
	ternero varchar(2) not null default "No",
	exploNaci varchar(14) not null,
    FOREIGN KEY (REGA) REFERENCES explotacion(REGA)
);

create table destinoExplotacion (
	DIB varchar(14) primary key not null,
    destinoExplo varchar(20) not null,
    FOREIGN KEY (DIB) REFERENCES bovino(DIB)
);

create table baja (
	DIB varchar(14) primary key not null,
    fechaBaja varchar(10) not null,
    causa varchar(50) not null,
    destino varchar(50),
    FOREIGN KEY (DIB) REFERENCES bovino(DIB)
);

INSERT INTO usuarios (usuario, passwd, dni, nombre, email, tlfno, rol, validado, datos) VALUES ('macedom', MD5('1234'), '09211723Q', 'Marcos Acedo Mejías', 'marcosxacedo@gmail.com', '680801655', 'Cliente', 'si', 'Si');
INSERT INTO usuarios (usuario, passwd, dni, nombre, email, tlfno, rol, validado, datos) VALUES ('macedomc', MD5('1234'), '09211723Q', 'Marcos Acedo Mejías', 'marcosxacedo@gmail.com', '680801655', 'Cliente', 'si', 'No');
INSERT INTO usuarios (usuario, passwd, dni, nombre, email, tlfno, rol, validado, datos) VALUES ('macedomv', MD5('1234'), '09211723Q', 'Marcos Acedo Mejías', 'marcosxacedo@gmail.com', '680801655', 'Visitante', 'si', 'Si');

INSERT INTO explotacion (REGA, nombre, provincia, municipio, usuario) VALUES ('ES060690000534', 'Ejemplo2', 'Badajoz', 'Badajoz', 'macedomc');

INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678910", "ES060690000534", "2020-07-07", "España", "Cruzada", "M", "ES109876543210", "2020-11-14", "No", "ES060690000534");
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678911", "ES060690000534", "2020-11-09", "España", "Cruzada", "H", "ES109876543210", "2020-11-14", "No", "ES060690000534");
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678912", "ES060690000534", "2020-11-08", "España", "Cruzada", "H", "ES109876543210", "2020-11-14", "Si", "ES060690000534");
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678913", "ES060690000534", "2020-11-07", "España", "Cruzada", "H", "ES109876543210", "2020-11-14", "No", "ES060690000534");
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678914", "ES060690000534", "2020-11-12", "España", "Cruzada", "H", "ES109876543210", "2020-11-14", "No", "ES060690000534");
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678915", "ES060690000534", "2020-11-01", "España", "Cruzada", "M", "ES109876543210", "2020-11-14", "No", "ES060690000534");
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ("ES012345678916", "ES060690000534", "2020-11-01", "España", "Cruzada", "M", "ES109876543210", "2020-11-14", "No", "ES060690000534");

INSERT INTO baja (DIB, fechaBaja, causa, destino) VALUES ("ES012345678913", "2020-11-22", "Venta", "Empresa H");
INSERT INTO baja (DIB, fechaBaja, causa, destino) VALUES ("ES012345678916", "2020-11-22", "Muerte", "");

INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ("ES012345678910", "Cebadero");
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ("ES012345678911", "Reposicion");
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ("ES012345678916", "Reposicion");

INSERT INTO explotacion (REGA, nombre, provincia, municipio, usuario) VALUES ('ES060380000001', 'COMERCIAL AGROPECUARIA EXTREMEÑA SA.', 'Badajoz ', 'Cordobilla de Lácara', 'macedom');

INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001003573247', 'ES060380000001', '2007-02-09', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001003573203', 'ES060380000001', '2006-03-23', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001004635453', 'ES060380000001', '2005-11-02', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051004635470', 'ES060380000001', '2006-01-06', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071004635449', 'ES060380000001', '2005-09-10', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081004635462', 'ES060380000001', '2005-11-26', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011003573248', 'ES060380000001', '2007-02-09', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081005676207', 'ES060380000001', '2008-03-01', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061005676216', 'ES060380000001', '2008-03-20', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011005430193', 'ES060380000001', '2009-12-03', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021005430194', 'ES060380000001', '2009-12-04', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061005532520', 'ES060380000001', '2010-01-29', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031005532527', 'ES060380000001', '2010-02-07', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081005532522', 'ES060380000001', '2010-02-14', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081005069611', 'ES060380000001', '2010-04-05', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031005069616', 'ES060380000001', '2010-04-24', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061005535518', 'ES060380000001', '2012-02-26', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051005536929', 'ES060380000001', '2012-05-11', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001005536946', 'ES060380000001', '2012-10-18', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021005536948', 'ES060380000001', '2012-10-19', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007099601', 'ES060380000001', '2013-04-28', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081007099579', 'ES060380000001', '2013-06-28', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007099576', 'ES060380000001', '2013-06-13', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007099587', 'ES060380000001', '2013-06-06', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007099569', 'ES060380000001', '2013-08-24', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021007099584', 'ES060380000001', '2013-06-05', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031007099585', 'ES060380000001', '2013-06-05', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007099570', 'ES060380000001', '2013-07-06', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081007099568', 'ES060380000001', '2013-08-02', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061007557070', 'ES060380000001', '2014-05-13', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061007557092', 'ES060380000001', '2014-10-09', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007557095', 'ES060380000001', '2014-10-20', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007553004', 'ES060380000001', '2014-11-29', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001007557085', 'ES060380000001', '2014-09-30', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021007557087', 'ES060380000001', '2014-10-01', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071007557093', 'ES060380000001', '2014-10-10', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007193722', 'ES060380000001', '2015-01-11', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031007553019', 'ES060380000001', '2015-02-11', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031007553008', 'ES060380000001', '2015-01-11', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071007193815', 'ES060380000001', '2015-04-04', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021008102157', 'ES060380000001', '2015-07-12', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061007553012', 'ES060380000001', '2015-01-28', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011007801856', 'ES060380000001', '2015-04-25', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081007193816', 'ES060380000001', '2015-04-05', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011007193819', 'ES060380000001', '2015-04-08', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001007553016', 'ES060380000001', '2015-02-04', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021007553018', 'ES060380000001', '2015-02-06', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091008102154', 'ES060380000001', '2015-06-13', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007553026', 'ES060380000001', '2015-02-25', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071007801863', 'ES060380000001', '2015-05-23', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061008102162', 'ES060380000001', '2015-09-25', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031007801870', 'ES060380000001', '2015-10-10', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071007801885', 'ES060380000001', '2015-11-09', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007801887', 'ES060380000001', '2015-12-10', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007553048', 'ES060380000001', '2015-04-25', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041007801859', 'ES060380000001', '2015-05-01', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081007801864', 'ES060380000001', '2015-06-05', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007801865', 'ES060380000001', '2015-06-12', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031007193811', 'ES060380000001', '2015-03-28', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007801883', 'ES060380000001', '2015-11-27', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007801894', 'ES060380000001', '2016-01-30', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001007801899', 'ES060380000001', '2016-02-13', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081007801900', 'ES060380000001', '2016-02-13', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091007050135', 'ES060380000001', '2016-04-29', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007806060', 'ES060380000001', '2016-09-16', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071007806062', 'ES060380000001', '2016-10-06', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071006777186', 'ES060380000001', '2011-05-15', 'España', 'LIMOUSINE', 'M', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011007553028', 'ES060380000001', '2015-02-16', 'España', 'CRUZADA', 'M', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051007860500', 'ES060380000001', '2015-05-16', 'España', 'LIMOUSINE', 'M', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041007806069', 'ES060380000001', '2016-12-29', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021007806078', 'ES060380000001', '2017-02-08', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031007806080', 'ES060380000001', '2017-02-10', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031008772521', 'ES060380000001', '2017-09-29', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021008772553', 'ES060380000001', '2017-12-29', 'España', 'CRUZADA', 'H', 'ES051007801894', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061008972422', 'ES060380000001', '2018-02-01', 'España', 'CRUZADA', 'H', 'ES081007801886', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081008972424', 'ES060380000001', '2018-02-15', 'España', 'CRUZADA', 'H', 'ES001005435368', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091008972425', 'ES060380000001', '2018-02-15', 'España', 'CRUZADA', 'H', 'ES081007801864', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031008972430', 'ES060380000001', '2018-03-15', 'España', 'CRUZADA', 'H', 'ES021005430194', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041008972431', 'ES060380000001', '2018-03-15', 'España', 'CRUZADA', 'H', 'ES051003231165', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051008972432', 'ES060380000001', '2018-03-23', 'España', 'CRUZADA', 'H', 'ES061005676216', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061008972433', 'ES060380000001', '2018-03-23', 'España', 'CRUZADA', 'H', 'ES071007099567', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081008972435', 'ES060380000001', '2018-04-06', 'España', 'CRUZADA', 'H', 'ES031007193811', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091008972436', 'ES060380000001', '2018-04-14', 'España', 'CRUZADA', 'H', 'ES011002969031', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011008972438', 'ES060380000001', '2018-04-14', 'España', 'CRUZADA', 'H', 'ES091007099569', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051008972443', 'ES060380000001', '2018-04-27', 'España', 'CRUZADA', 'H', 'ES091007557095', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081008972446', 'ES060380000001', '2018-09-15', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011008972450', 'ES060380000001', '2018-09-28', 'España', 'CRUZADA', 'H', 'ES031007553019', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011008972461', 'ES060380000001', '2018-10-30', 'España', 'CRUZADA', 'H', 'ES041005430210', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081008972480', 'ES060380000001', '2018-12-22', 'España', 'CRUZADA', 'H', 'ES011005430193', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES050008972465', 'ES060380000001', '2018-11-10', 'España', 'CRUZADA', 'H', 'ES021007557087', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009396382', 'ES060380000001', '2019-02-05', 'España', 'CRUZADA', 'H', 'ES071007801885', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009396387', 'ES060380000001', '2019-03-06', 'España', 'CRUZADA', 'H', 'ES031007193811', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009396390', 'ES060380000001', '2019-03-08', 'España', 'CRUZADA', 'H', 'ES031008102170', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009396394', 'ES060380000001', '2019-04-10', 'España', 'CRUZADA', 'H', 'ES081007099568', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009396386', 'ES060380000001', '2019-02-16', 'España', 'CRUZADA', 'H', 'ES041007801859', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009396391', 'ES060380000001', '2019-03-20', 'España', 'CRUZADA', 'H', 'ES001003573247', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009396395', 'ES060380000001', '2019-04-17', 'España', 'CRUZADA', 'H', 'ES051007801894', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009396396', 'ES060380000001', '2019-04-17', 'España', 'CRUZADA', 'H', 'ES061007557092', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009396399', 'ES060380000001', '2019-05-18', 'España', 'CRUZADA', 'H', 'ES091007553004', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009396400', 'ES060380000001', '2019-05-18', 'España', 'CRUZADA', 'H', 'ES081007801864', '2019-03-06', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009396402', 'ES060380000001', '2019-06-01', 'España', 'CRUZADA', 'H', 'ES001007557085', '2019-06-12', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009396403', 'ES060380000001', '2019-09-20', 'España', 'CRUZADA', 'M', 'ES001004635453', '2019-09-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009396405', 'ES060380000001', '2019-09-20', 'España', 'CRUZADA', 'H', 'ES091008102154', '2019-09-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009396407', 'ES060380000001', '2019-09-23', 'España', 'CRUZADA', 'H', 'ES031007099585', '2019-09-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009396408', 'ES060380000001', '2019-10-01', 'España', 'CRUZADA', 'H', 'ES051007801883', '2019-10-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009396409', 'ES060380000001', '2019-10-01', 'España', 'CRUZADA', 'M', 'ES081004635462', '2019-10-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009396410', 'ES060380000001', '2019-10-01', 'España', 'CRUZADA', 'M', 'ES081007193816', '2019-10-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009396411', 'ES060380000001', '2019-10-08', 'España', 'CRUZADA', 'H', 'ES091007557095', '2019-10-13', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009396412', 'ES060380000001', '2019-10-08', 'España', 'CRUZADA', 'H', 'ES091007557095', '2019-10-13', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009396413', 'ES060380000001', '2019-10-08', 'España', 'CRUZADA', 'M', 'ES011007801856', '2019-10-13', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009396414', 'ES060380000001', '2019-10-08', 'España', 'CRUZADA', 'H', 'ES071007193815', '2019-10-13', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009396416', 'ES060380000001', '2019-10-08', 'España', 'CRUZADA', 'M', 'ES081005069611', '2019-10-13', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009396417', 'ES060380000001', '2019-10-13', 'España', 'CRUZADA', 'H', 'ES001007801899', '2019-10-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009396418', 'ES060380000001', '2019-10-13', 'España', 'CRUZADA', 'M', 'ES031007553019', '2019-10-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009396419', 'ES060380000001', '2019-10-13', 'España', 'CRUZADA', 'H', 'ES021007099584', '2019-10-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009396420', 'ES060380000001', '2019-10-13', 'España', 'CRUZADA', 'M', 'ES071007557093', '2019-10-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009396421', 'ES060380000001', '2019-10-13', 'España', 'CRUZADA', 'M', 'ES081007099579', '2019-10-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009396422', 'ES060380000001', '2019-11-07', 'España', 'CRUZADA', 'H', 'ES031007806080', '2019-11-15', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009896423', 'ES060380000001', '2019-11-07', 'España', 'CRUZADA', 'H', 'ES021007553018', '2019-11-15', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009396424', 'ES060380000001', '2019-11-07', 'España', 'CRUZADA', 'H', 'ES021008102157', '2019-11-15', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009396425', 'ES060380000001', '2019-11-07', 'España', 'CRUZADA', 'H', 'ES011003573248', '2019-11-15', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009396426', 'ES060380000001', '2019-11-18', 'España', 'CRUZADA', 'M', 'ES051007099601', '2019-11-26', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009396427', 'ES060380000001', '2019-12-03', 'España', 'CRUZADA', 'H', 'ES061007553012', '2019-12-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009396428', 'ES060380000001', '2019-12-03', 'España', 'CRUZADA', 'M', 'ES001007553016', '2019-12-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009396429', 'ES060380000001', '2019-12-04', 'España', 'CRUZADA', 'M', 'ES061005535518', '2019-12-12', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009396430', 'ES060380000001', '2019-12-04', 'España', 'CRUZADA', 'H', 'ES051007099587', '2019-12-12', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009396431', 'ES060380000001', '2019-12-10', 'España', 'CRUZADA', 'M', 'ES021005430194', '2019-12-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009396432', 'ES060380000001', '2019-12-10', 'España', 'CRUZADA', 'M', 'ES031005532527', '2019-12-18', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009396433', 'ES060380000001', '2019-12-22', 'España', 'CRUZADA', 'M', 'ES001005536946', '2019-12-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009396434', 'ES060380000001', '2020-01-06', 'España', 'CRUZADA', 'M', 'ES011005430193', '2020-01-14', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009396435', 'ES060380000001', '2020-01-06', 'España', 'CRUZADA', 'H', 'ES001003573203', '2020-01-14', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009396436', 'ES060380000001', '2020-01-07', 'España', 'CRUZADA', 'H', 'ES081007801900', '2020-01-14', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009396437', 'ES060380000001', '2020-01-07', 'España', 'CRUZADA', 'H', 'ES071004635449', '2020-01-14', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009396438', 'ES060380000001', '2020-01-07', 'España', 'CRUZADA', 'M', 'ES091007553026', '2020-01-14', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009396439', 'ES060380000001', '2020-01-18', 'España', 'CRUZADA', 'H', 'ES061007557070', '2020-01-20', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009396440', 'ES060380000001', '2020-01-18', 'España', 'CRUZADA', 'M', 'ES051007099576', '2020-01-21', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009396441', 'ES060380000001', '2020-01-18', 'España', 'CRUZADA', 'H', 'ES041003573207', '2020-01-21', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009396442', 'ES060380000001', '2020-01-18', 'España', 'CRUZADA', 'H', 'ES031007553008', '2020-01-21', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009396443', 'ES060380000001', '2020-01-18', 'España', 'CRUZADA', 'M', 'ES081005676207', '2020-01-21', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009396444', 'ES060380000001', '2020-01-22', 'España', 'CRUZADA', 'H', 'ES071007801885', '2020-01-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009649768', 'ES060380000001', '2020-01-22', 'España', 'CRUZADA', 'H', 'ES041007801859', '2020-01-21', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009649769', 'ES060380000001', '2020-01-22', 'España', 'CRUZADA', 'H', 'ES021005536948', '2020-01-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009649770', 'ES060380000001', '2020-01-22', 'España', 'CRUZADA', 'M', 'ES031007193811', '2020-01-30', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009649771', 'ES060380000001', '2020-01-28', 'España', 'CRUZADA', 'H', 'ES091007099570', '2020-02-05', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009649773', 'ES060380000001', '2020-02-16', 'España', 'CRUZADA', 'H', 'ES011007193819', '2020-02-24', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009649774', 'ES060380000001', '2020-02-24', 'España', 'CRUZADA', 'H', 'ES091007553048', '2020-03-03', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009649775', 'ES060380000001', '2020-03-19', 'España', 'CRUZADA', 'H', 'ES041007806069', '2020-03-27', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009649776', 'ES060380000001', '2020-03-19', 'España', 'CRUZADA', 'M', 'ES051007193722', '2020-03-27', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009649777', 'ES060380000001', '2020-04-03', 'España', 'CRUZADA', 'M', 'ES001003573247', '2020-04-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009649778', 'ES060380000001', '2020-04-03', 'España', 'CRUZADA', 'M', 'ES071007801863', '2020-04-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009649779', 'ES060380000001', '2020-04-03', 'España', 'CRUZADA', 'M', 'ES091007801865', '2020-04-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009649780', 'ES060380000001', '2020-04-03', 'España', 'CRUZADA', 'H', 'ES081007099568', '2020-04-11', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009649782', 'ES060380000001', '2020-04-13', 'España', 'CRUZADA', 'M', 'ES021007806078', '2020-04-21', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009649783', 'ES060380000001', '2020-04-19', 'España', 'CRUZADA', 'H', 'ES011007557092', '2020-04-27', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009649784', 'ES060380000001', '2020-04-27', 'España', 'CRUZADA', 'H', 'ES091007099569', '2020-05-04', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009649785', 'ES060380000001', '2020-04-27', 'España', 'CRUZADA', 'H', 'ES091007553004', '2020-05-04', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009649797', 'ES060380000001', '2020-10-03', 'España', 'CRUZADA', 'H', 'ES021007557087', '2020-10-08', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009649801', 'ES060380000001', '2020-10-10', 'España', 'CRUZADA', 'M', 'ES071007193815', '2020-10-14', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009649787', 'ES060380000001', '2020-09-27', 'España', 'CRUZADA', 'M', 'ES091008972436', '2020-09-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009649788', 'ES060380000001', '2020-09-27', 'España', 'CRUZADA', 'H', 'ES031008772521', '2020-09-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009649789', 'ES060380000001', '2020-09-27', 'España', 'CRUZADA', 'M', 'ES001007557085', '2020-09-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009649790', 'ES060380000001', '2020-09-28', 'España', 'CRUZADA', 'M', 'ES081007099579', '2020-09-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009649791', 'ES060380000001', '2020-09-28', 'España', 'CRUZADA', 'H', 'ES051005536929', '2020-09-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009649793', 'ES060380000001', '2020-10-01', 'España', 'CRUZADA', 'M', 'ES021008102157', '2020-10-05', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009649794', 'ES060380000001', '2020-10-01', 'España', 'CRUZADA', 'H', 'ES061005676216', '2020-10-05', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009649795', 'ES060380000001', '2020-10-01', 'España', 'CRUZADA', 'M', 'ES081005069611', '2020-10-05', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009649796', 'ES060380000001', '2020-10-01', 'España', 'CRUZADA', 'M', 'ES081008972435', '2020-10-05', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009649799', 'ES060380000001', '2020-10-10', 'España', 'CRUZADA', 'M', 'ES091008102154', '2020-10-14', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081009649800', 'ES060380000001', '2020-10-10', 'España', 'CRUZADA', 'H', 'ES081007193816', '2020-10-14', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009649802', 'ES060380000001', '2020-10-12', 'España', 'CRUZADA', 'M', 'ES071007806062', '2020-10-16', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009649803', 'ES060380000001', '2020-10-12', 'España', 'CRUZADA', 'H', 'ES031007099585', '2020-10-16', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009649804', 'ES060380000001', '2020-10-14', 'España', 'CRUZADA', 'H', 'ES011007801856', '2020-10-20', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009649805', 'ES060380000001', '2020-10-14', 'España', 'CRUZADA', 'H', 'ES041008972431', '2020-10-20', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009649806', 'ES060380000001', '2020-10-14', 'España', 'CRUZADA', 'H', 'ES021007099584', '2020-10-20', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009649807', 'ES060380000001', '2020-10-19', 'España', 'CRUZADA', 'H', 'ES051007099601', '2020-10-28', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009649808', 'ES060380000001', '2020-10-20', 'España', 'CRUZADA', 'M', 'ES061008972433', '2020-10-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009649809', 'ES060380000001', '2020-10-20', 'España', 'CRUZADA', 'M', 'ES031007553019', '2020-10-29', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES091009649812', 'ES060380000001', '2020-10-20', 'España', 'CRUZADA', 'H', 'ES051007099587', '2020-11-03', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES001009649813', 'ES060380000001', '2020-10-30', 'España', 'CRUZADA', 'H', 'ES051004635470', '2020-11-03', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES011009649814', 'ES060380000001', '2020-10-30', 'España', 'CRUZADA', 'M', 'ES001007801899', '2020-11-03', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES021009649815', 'ES060380000001', '2020-10-30', 'España', 'CRUZADA', 'M', 'ES051008972432', '2020-11-03', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009649816', 'ES060380000001', '2020-10-30', 'España', 'CRUZADA', 'H', 'ES061007553012', '2020-11-03', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES041009649817', 'ES060380000001', '2020-10-30', 'España', 'CRUZADA', 'H', 'ES091007557095', '2020-11-03', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009649819', 'ES060380000001', '2020-11-05', 'España', 'CRUZADA', 'M', 'ES071007557093', '2020-11-11', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES061009649820', 'ES060380000001', '2020-11-11', 'España', 'CRUZADA', 'H', 'ES061005535518', '2020-11-16', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES071009649821', 'ES060380000001', '2020-11-13', 'España', 'CRUZADA', 'M', 'ES021005430194', '2020-11-19', 'Si', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES051009649818', 'ES060380000001', '2020-10-30', 'España', 'CRUZADA', 'H', 'ES081008972424', '2020-11-03', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES031009649792', 'ES060380000001', '2020-11-01', 'España', 'CRUZADA', 'H', 'ES081007801864', '2020-10-05', 'No', 'ES060380000001');
INSERT INTO bovino (DIB, REGA, nacimiento, paisOrigen, raza, sexo, DIBMadre, fechaAlta, ternero, exploNaci) VALUES ('ES081007801886', 'ES060380000001', '2020-12-01', 'España', 'CRUZADA', 'H', 'DESCONOCIDO', '2019-03-06', 'No', 'ES060380000001');

INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061007557070', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061007557092', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007557095', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007553004', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001007557085',' Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021007557087', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071007557093', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031007553019', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031007553008', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061007553012', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011007801856', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001007553016', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021007553018', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007553026', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071007801863', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031007801870', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071007801885', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007801887', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007553048', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041007801859', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081007801864', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007801865', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051007801883', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081007801886', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051007801894', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001007801899', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081007801900', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091007050135', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051007806060', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071007806062', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041007806069', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021007806078', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031007806080', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031008772521', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021008772553', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061008972422', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081008972424', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091008972425', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031008972430', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041008972431', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051008972432', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061008972433', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081008972435', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091008972436', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011008972438', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051008972443', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081008972446', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011008972450', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011008972461', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081008972480', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES050008972465', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061009396382', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011009396387', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009396390', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009396394', 'Reposicion');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009396386', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041009396391', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009396395', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009396396', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009396399', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009396400', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009396402', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009396403', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051009396405', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009396407', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009396408', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009396409', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009396410', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009396411', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011009396412', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009396413', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009396414', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051009396416', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041009396417', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009396418', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009396419', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009396420', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009396421', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009396422', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011009896423', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009396424', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009396425', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041009396426', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009396427', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061009396428', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009396429', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009396430', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009396431', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009396432', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009396433', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011009396434', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009396435', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009396436', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041009396437', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051009396438', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061009396439', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061009396440', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009396441', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009396442', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009396443', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009396444', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009649768', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009649769', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES031009649770', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041009649771', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061009649773', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009649774', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES081009649775', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES091009649776', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES001009649777', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES011009649778', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009649779', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES021009649780', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES041009649782', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES051009649783', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES061009649784', 'Cebadero');
INSERT INTO destinoExplotacion (DIB, destinoExplo) VALUES ('ES071009649785', 'Cebadero');

INSERT INTO baja (DIB, fechaBaja, causa, destino) VALUES ('ES051009649818', '2020-11-03', 'MUERTE EXPLOTACION', 'AR20-0139664');
INSERT INTO baja (DIB, fechaBaja, causa, destino) VALUES ('ES031009649792', '2020-10-13', 'MUERTE EXPLOTACION', 'AR20-0128900');
