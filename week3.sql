
show databases;
create database week3;
show databases;
create table Supplier(sid int,sname varchar(20),city varchar(20),PRIMARY KEY(sid));
create table Parts(pid int,pname varchar(20),color varchar(20),PRIMARY KEY(pid));
create table Catalog(sid int,pid int,cost double,PRIMARY KEY(sid,pid),foreign key(sid) references Supplier(sid),foreign key(pid) references Parts(pid));
insert into Supplier
Values (10001,'Acme Widget','Bangalore'),
(10002,'Johns','Kolkata'),
(10003,'Vimal','Mumbai'),
(10004,'Reliance','Delhi');
insert into Parts
Values (20001,'Book','Red'),
(20002,'Pen','Red'),
(20003,'Pencil','Green'),
(20004,'Mobile','Green'),
(20005,'Charger','Black');
insert into Catalog
Values (10001,20001,10),
(10001,20002,10),
(10001,20003,10),
(10001,20004,30),
(10001,20005,10),
(10002,20001,10),
(10002,20002,10),
(10003,20003,20),
(10004,20003,40);

select * from Supplier; 
select * from Parts; 
select * from Catalog; 

select distinct(sid) SID from Catalog,Parts where Catalog.pid=Parts.pid and Parts.color='Red' or Parts.color='Green';
select distinct(Catalog.sid) SID from Catalog,Parts,Supplier where Catalog.pid=Parts.pid and Catalog.sid=Supplier.sid and (Parts.color='Red' or Supplier.city='Bangalore');
select  distinct c1.sid,c2.sid from Catalog c1,Catalog c2 where c1.sid!=c2.sid and (c1.pid=c2.pid and c1.cost>c2.cost);
select distinct(sid) SID from Catalog,Parts where Catalog.pid=Parts.pid and Parts.color='Red';