CREATE TABLE judgeproduct(
	p_id VARCHAR(10) NOT NULL,
	p_userid VARCHAR(10),
	p_name VARCHAR(20),
	p_unitPrice  NUMBER(7),
	p_description CLOB,
   	p_category VARCHAR(20),
	p_unitsInStock NUMBER(5),
	p_fileName  VARCHAR(20),
	p_accept NUMBER(1) default 0 , -- 0: 심사중, 1: 거절, 2: accept
	p_rejectreason VARCHAR(100) default 'NONE' ,
	PRIMARY KEY (p_id)
);
