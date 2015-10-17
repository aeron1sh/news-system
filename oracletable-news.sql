spool c:\DBCreateInfofornews.log;
-----news system
-----user table
drop table NEWS_USER;
create table NEWS_USER(
	id	              NUMBER(10, 0)  	PRIMARY KEY NOT NULL,
	username	        varchar2(20)   	NOT NULL,
	password          varchar2(20)    NOT NULL,
	email             varchar2(100)   NULL,
	usertype          number(5,0)     NOT NULL

INSERT INTO NEWS_USER VALUES(1,'admin','admin','admin@bdqn.cn',0);
INSERT INTO NEWS_USER VALUES(2,'user','user','user@bdqn.cn',1);
INSERT INTO NEWS_USER VALUES(3,'test','test','test@bdqn.cn',1);

-----news classfication table
drop table NEWS_COMMENT;
drop table NEWS_DETAIL;
drop table NEWS_CATEGORY;
create table NEWS_CATEGORY(
	id              NUMBER(10,0)     NOT NULL PRIMARY KEY,
	name            varchar2(50)     NOT NULL,
	createdate      Date             NOT NULL
);
INSERT INTO NEWS_CATEGORY(id,name,createdate) VALUES(1,'国内',sysdate);
INSERT INTO NEWS_CATEGORY(id,name,createdate) VALUES(2,'国际',sysdate);
INSERT INTO NEWS_CATEGORY(id,name,createdate) VALUES(3,'娱乐',sysdate);
INSERT INTO NEWS_CATEGORY(id,name,createdate) VALUES(4,'军事',sysdate);
INSERT INTO NEWS_CATEGORY(id,name,createdate) VALUES(5,'财经',sysdate);
INSERT INTO NEWS_CATEGORY(id,name,createdate) VALUES(6,'天气',sysdate);

-----news detail table
create table NEWS_DETAIL(
	id               number(10,0)    NOT NULL  PRIMARY KEY,
	categoryId       number(10,0)    NOT NULL,
	title   			   varchar2(100)   NOT NULL,
	summary          varchar2(255)   NULL,
	content          CLOB   NULL,
	picpath          varchar2(255)   NULL,
	author   			   varchar2(50)    NULL,
	createdate       date            NULL,
	modifydate       date            NULL,
	Foreign key(categoryId) references NEWS_CATEGORY(id)
);
INSERT INTO NEWS_DETAIL VALUES(
	1,1,'尼日利亚一架客机坠毁','尼日利亚一架客机坠毁，伤亡惨重','尼日利亚一架客机坠毁，伤亡惨重,10人重伤','','admin',sysdate,sysdate）；

-----news comment table
create table NEWS_COMMENT(
	id               number(10,0)    PRIMARY KEY,
	newsId           number(10,0)    NOT NULL,
	content          varchar2(2000),
	author           varchar2(50),
	ip               varchar2(15),
	createdate       date,                                
	Foreign key(newsId) references NEWS_DETAIL(id)
);
SELECT * FROM news_detail;
DELETE FROM news_detail WHERE ID=2