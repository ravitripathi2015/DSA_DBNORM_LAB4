create database ecommerce;

use ecommerce;
create table supplier (supp_id int primary key, supp_name varchar(50) not null, supp_city varchar(50) not null,supp_phone varchar(50) not null);
create table customer (cus_id int primary key, cus_name varchar(20) not null, cus_city varchar(30) not null,cus_phone varchar(10) not null, cus_gender char);

create table category (cat_id int primary key, cat_name varchar(20) not null);

create table product (pro_id int primary key, pro_name varchar(20) not null default "Dummy", pro_desc varchar(60), cat_id int, foreign key (cat_id) references category(cat_id));

create table supplier_pricing (pricing_id int primary key,pro_id int, supp_id int,supp_price int default 0, foreign key (pro_id) references product(pro_id), foreign key (supp_id) references supplier(supp_id));

create table `order`(ord_id int primary key, ord_amount int not null, ord_date date not null,cus_id int, pricing_id int, foreign key (cus_id) references customer(cus_id), foreign key (pricing_id) references supplier_pricing(pricing_id));

create table rating(rat_id int primary key,ord_id int, rat_ratstars int not null, foreign key(ord_id) references order_detail(ord_id));

insert into supplier values(1,"Rajesh Retails","Delhi","1234567890");
insert into supplier values(2,"Appario Ltd.","Mumbai","2589631470");
insert into supplier values(3,"Knome products","Banglore","9785462315");
insert into supplier values(4,"Bansal Retails","Kochi","8975463285");
insert into supplier values(5,"Mittal Ltd.","Lucknow","7898456532");

insert into customer values(1,"AAKASH","Delhi","9999999999",'M');
insert into customer values(2,"AMAN","Noida","9785463215",'M');
insert into customer values(3,"NEHA","Mumbai","9999999999",'F');
insert into customer values(4,"MEGHA","Kolkata","9994562399",'F');
insert into customer values(5,"PULKIT","Lucknow","7895999999",'M');

insert into category values(1,"Books");
insert into category values(2,"Games");
insert into category values(3,"Groceries");
insert into category values(4,"Electornics");
insert into category values(5,"Clothes");

insert into product values(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
insert into product values(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
insert into product values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into product values(4,"OATS","Highly Nutritious from Nestle",3);
insert into product values(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
insert into product values(6,"MILK","1L Toned MIlk",3);
insert into product values(7,"Boat Earphones","1.5Meter long Dolby Atmos",4);
insert into product values(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
insert into product values(9,"Project IGI","compatible with windows 7 and above",2);
insert into product values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product values(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
insert into product values(12,"Train Your Brain","By Shireen Stephen",1);

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
insert into supplier_pricing values(6,12,2,780);
insert into supplier_pricing values(7,12,4,789);
insert into supplier_pricing values(8,3,1,3100);
insert into supplier_pricing values(9,1,5,1450);
insert into supplier_pricing values(10,4,2,999);
insert into supplier_pricing values(11,7,3,549);
insert into supplier_pricing values(12,7,4,529);
insert into supplier_pricing values(13,6,2,105);
insert into supplier_pricing values(14,6,1,99);
insert into supplier_pricing values(15,2,5,2999);
insert into supplier_pricing values(16,5,2,2999);



select * from supplier_pricing;




insert into `order` values(101,1500,"2021-10-06",2,1);
insert into `order` values(102,1000,"2021-10-12",3,5);
insert into `order` values(103,30000,"2021-09-16",5,2);
insert into `order` values(104,1500,"2021-10-05",1,1);
insert into `order` values(105,3000,"2021-08-16",4,3);
insert into `order` values(106,1450,"2021-08-18",1,9);
insert into `order` values(107,789,"2021-09-01",3,7);
insert into `order` values(108,780,"2021-09-07",5,6);
insert into `order` values(109,3000,"2021-00-10",5,3);
insert into `order` values(110,2500,"2021-09-10",2,4);
insert into `order` values(111,1000,"2021-09-15",4,5);
insert into `order` values(112,789,"2021-09-16",4,7);
insert into `order` values(113,31000,"2021-09-16",1,8);
insert into `order` values(114,1000,"2021-09-16",3,5);
insert into `order` values(115,3000,"2021-09-16",5,3);
insert into `order` values(116,99,"2021-09-17",2,14);


insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);


select cus_gender,count(*) tot_customer from customer a inner join (select cus_id,sum(ord_amount) from order_detail
group by cus_id
having sum(ord_amount)>=3000) b
on a.cus_id=b.cus_id
group by cus_gender;

select ord_id,pro_desc from order_detail a inner join supplier_pricing b
on a.pricing_id=b.pricing_id
inner join product c on b.pro_id=c.pro_id
where a.cus_id=2;

select * from supplier limit 2;
select * from supplier_pricing limit 2;

select supp_name from supplier a inner join (select supp_id, count(distinct pro_id) from supplier_pricing group by supp_id having count(distinct pro_id)>1) b
on a.supp_id=b.supp_id;

use ecommerce;
select * from order_detail;

select * from `order`;
