SET NAMES UTF8;
DROP DATABASE IF EXISTS d_easybuy;
CREATE DATABASE d_easybuy CHARSET=UTF8;
USE d_easybuy;

#客户表
CREATE TABLE  t_khb(
	uid INT PRIMARY KEY AUTO_INCREMENT,  
	username VARCHAR(32),    				
	tel      VARCHAR(11),                 
	password VARCHAR(64),                  
	passwordAgain varchar(16),
	sex INT,
	registerTime DATETIME,
	avatar VARCHAR(256)
);

INSERT INTO t_khb VALUES(null,'Feild','15118099616','123456','123456',null,null,null);
INSERT INTO t_khb VALUES(null,'Tom','18186228854','123456','123456',null,null,null);

#商品表
CREATE TABLE t_spb(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(128),
	snum VARCHAR(8),#商品库存
	sprice DECIMAL(6,2),#商品价格
	old_price DECIMAL(6,2),
	sdesc VARCHAR(128),
	simage VARCHAR(32),
	type INT
);

#SKU
CREATE TABLE t_sku(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	#sname VARCHAR(128),
	size VARCHAR(32),
	color VARCHAR(16),
	spb_id int
);


#向商品表中插入信息

INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'【i.t潮牌】Rocket x lunch 春季女士风衣','1000','180.00',"190.00",'春季新品女士风衣',"/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'宽松落肩胸口侧边字母印染连帽卫衣男女同款','2000','190.00',"300.00",'优质面料，简约设计',"/storage/goods/03.png",2);
INSERT INTO t_spb VALUES(NULL,'【刘亚仁宋仲基同款】Studio Concrete韩国进口数字心情中性款情侣卫衣男女同款1/LOW黑色','800','300.00','400.00','时尚潮流，基础简约',"/storage/goods/04.png",2);
INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'冷淡风赫本小黑裙女2019春装新款韩版宽松显瘦抽绳系带灯笼袖波点连衣裙女长裙子潮','100','50.50',"55.50",'简约时尚，美式格调',"/storage/goods/01.png",1);
INSERT INTO t_spb VALUES(NULL,'【i.t潮牌】Rocket x lunch 春季女士风衣','1000','180.00',"190.00",'春季新品女士风衣',"/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'【i.t潮牌】Rocket x lunch 春季女士风衣','1000','180.00',"190.00",'春季新品女士风衣',"/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'【i.t潮牌】Rocket x lunch 春季女士风衣','1000','180.00',"190.00",'春季新品女士风衣',"/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'【i.t潮牌】Rocket x lunch 春季女士风衣','1000','180.00',"190.00",'春季新品女士风衣',"/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'【i.t潮牌】Rocket x lunch 春季女士风衣','1000','180.00',"190.00",'春季新品女士风衣',"/storage/goods/02.png",1);
INSERT INTO t_spb VALUES(NULL,'宽松落肩胸口侧边字母印染连帽卫衣男女同款','2000','190.00',"300.00",'优质面料，简约设计',"/storage/goods/03.png",2);
INSERT INTO t_spb VALUES(NULL,'宽松落肩胸口侧边字母印染连帽卫衣男女同款','2000','190.00',"300.00",'优质面料，简约设计',"/storage/goods/03.png",2);
INSERT INTO t_spb VALUES(NULL,'宽松落肩胸口侧边字母印染连帽卫衣男女同款','2000','190.00',"300.00",'优质面料，简约设计',"/storage/goods/03.png",2);
INSERT INTO t_spb VALUES(NULL,'宽松落肩胸口侧边字母印染连帽卫衣男女同款','2000','190.00',"300.00",'优质面料，简约设计',"/storage/goods/03.png",2);
INSERT INTO t_spb VALUES(NULL,'宽松落肩胸口侧边字母印染连帽卫衣男女同款','2000','190.00',"300.00",'优质面料，简约设计',"/storage/goods/03.png",2);

#向sku表插入数据
INSERT INTO t_sku VALUES(NULL,'L X M S','1 2 3 4',1);
INSERT INTO t_sku VALUES(NULL,'L X S','1 2 3 4',2);
INSERT INTO t_sku VALUES(NULL,'L M S','1 2 4',3);
INSERT INTO t_sku VALUES(NULL,'L X M S','1 2 3 4',4);

#购物车表
CREATE TABLE t_khdgb(
	kid INT  PRIMARY KEY AUTO_INCREMENT,
	sid INT,
	tel      VARCHAR(11),
	goodname VARCHAR(256),
	number   VARCHAR(32),
	price    DECIMAL(6,2),
	sum      DECIMAL(6,2),
	status int,
	color VARCHAR(32),
	size VARCHAR(32)	
);



#打卡表
CREATE TABLE t_docard(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	num int,
	time DATETIME,
	tel      VARCHAR(11)
);

#图片表
CREATE TABLE t_img(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	path VARCHAR(128),
	num int,
	size  VARCHAR(16),
	pid INT
);

#订单表
CREATE TABLE t_order(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	phone VARCHAR(11),
	time DATETIME,
	money DECIMAL(6,2),
	sort VARCHAR(128)
);

#优惠券表
CREATE TABLE t_discount(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(32),
	num int,
	tel      VARCHAR(11)
);

#店铺表
CREATE TABLE t_shop(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	s_name varchar(32),
	s_address varchar(32),
	type VARCHAR(11)
);

#用户关注店铺表
CREATE TABLE t_user_shop(
	id INT  PRIMARY KEY AUTO_INCREMENT,
	tel      VARCHAR(11),
	type VARCHAR(32),
	num int,
	discount_id int
);


