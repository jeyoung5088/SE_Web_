CREATE TABLE product(
	p_id VARCHAR(10) NOT NULL,
	p_userid VARCHAR(10),
	p_name VARCHAR(20),
	p_unitPrice  NUMBER(7),
	p_description CLOB,
   	p_category VARCHAR(20)
	p_unitsInStock NUMBER(5),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (p_id)
);
