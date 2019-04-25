SET NAMES UTF8;
DROP DATABASE IF EXISTS d_easybuy;
CREATE DATABASE d_easybuy CHARSET=UTF8;
USE d_easybuy;

CREATE TABLE  t_khb(
	uid INT PRIMARY KEY AUTO_INCREMENT,  
	username VARCHAR(32),    				
	tel      VARCHAR(11),                 
	password VARCHAR(64),                  
	passwordAgain varchar(16)                 
);

INSERT INTO t_khb VALUES(1,'Feild','18186228854','123456','123456');
INSERT INTO t_khb VALUES(2,'Tom','18186228854','123456','123456'  );


CREATE TABLE t_fruit(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(16),
	fprice DECIMAL(4,2) 	
);

INSERT INTO t_fruit VALUES('1','apple','12.00');
INSERT INTO t_fruit VALUES('2','lizi','8.00' );
INSERT INTO t_fruit VALUES('3','xiangjiao','6.00' );
INSERT INTO t_fruit VALUES('4','xigua','10.00');

CREATE TABLE t_drink(
	did INT PRIMARY KEY AUTO_INCREMENT,
	dname VARCHAR(16),
	dprice DECIMAL(4,2) 	
);

INSERT INTO t_drink VALUES('1','kele','4.00' );
INSERT INTO t_drink VALUES('2','xuebi','3.00' );
INSERT INTO t_drink VALUES('3','qishui','5.00' );
INSERT INTO t_drink VALUES('4','qixi','2.00' );

CREATE TABLE t_life(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	lname VARCHAR(16),
	lprice DECIMAL(4,2) 	
);

INSERT INTO t_life VALUES('1','yagao','4.00' );
INSERT INTO t_life VALUES('2','yashua','3.00' );
INSERT INTO t_life VALUES('3','maojin','5.00' );
INSERT INTO t_life VALUES('4','xiezi','2.00' );

/**商品表的创建(该表包含所有的商品)**/
/**
	设置三个外键：
		外键1：fid
		外键2：did
		外键3：lid
**/
CREATE TABLE t_spb(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(16),
	sprice DECIMAL(4,2),
	fid INT,
	did INT,
	lid INT,	
	FOREIGN KEY(fid) REFERENCES t_fruit(fid), 
	FOREIGN KEY(did) REFERENCES t_drink(did),
	FOREIGN KEY(lid) REFERENCES t_life(lid)	
);  

#向商品表中插入信息
/**
	怎样以外键为条件查找商品信息
**/
INSERT INTO t_spb VALUES(1,'apple','12.00','1',null,null);
INSERT INTO t_spb VALUES(2,'lizi','8.00','2',null,null);
INSERT INTO t_spb VALUES(3,'xiangjiao','6.00','3',null,null);
INSERT INTO t_spb VALUES(4,'xigua','10.00','4',null,null);
INSERT INTO t_spb VALUES(5,'kele','4.00',null,'1',null);
INSERT INTO t_spb VALUES(6,'xuebi','3.00',null,'2',null);

/**
	设计客户订购表：
	用来保存客户的购买相关信息
**/
CREATE TABLE t_khdgb(
	kid INT  PRIMARY KEY AUTO_INCREMENT,
	sid INT,
	tel      VARCHAR(11),
	goodname VARCHAR(32),
	number   VARCHAR(32),
	price    DECIMAL(6,2),
	sum      DECIMAL(6,2)	
);