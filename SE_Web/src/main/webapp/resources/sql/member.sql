CREATE TABLE member( 
    id varchar(10) NOT NULL,
    password varchar(10) NOT NULL,
    name varchar(10) not null,
    gender varchar(4),
    birth  varchar(10),
    mail  varchar(30),
    phone varchar(20),
    address varchar(90),
    regist_day varchar(50),    
    usertype varchar(1),
    primary key(id) 
);

select * from member;
