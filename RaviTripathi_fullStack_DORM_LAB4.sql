CREATE DATABASE ecommerce;

USE ECOMMERCE;
CREATE TABLE SUPPLIER 
(
	supp_id INT PRIMARY KEY AUTO_INCREMENT, 
	supp_name VARCHAR(50) NOT NULL,
	supp_city VARCHAR(50) NOT NULL,
	supp_phone VARCHAR(50) NOT NULL
);
CREATE TABLE CUSTOMER 
(
	cus_id INT PRIMARY KEY AUTO_INCREMENT, 
	cus_name VARCHAR(20) NOT NULL,
	cus_city VARCHAR(30) NOT NULL,
	cus_phone VARCHAR(10) NOT NULL, 
    cus_gender CHAR
);

CREATE TABLE CATEGORY 
(
	cat_id INT PRIMARY KEY AUTO_INCREMENT,
	cat_name VARCHAR(20) NOT NULL
);

CREATE TABLE PRODUCT 
(
	pro_id INT PRIMARY KEY AUTO_INCREMENT, 
	pro_name VARCHAR(20) NOT NULL DEFAULT "DUMMY", 
	pro_desc VARCHAR(60),
	cat_id INT,
	FOREIGN KEY (cat_id) REFERENCES category(cat_id)
 );

CREATE TABLE SUPPLIER_PRICING 
(
	pricing_id INT PRIMARY KEY AUTO_INCREMENT,
	pro_id INT, 
	supp_id INT,
	supp_price INT DEFAULT 0,
	FOREIGN KEY (pro_id) REFERENCES product(pro_id),
	FOREIGN KEY (supp_id) REFERENCES supplier(supp_id)
);

CREATE TABLE `ORDER`
(
	ord_id INT PRIMARY KEY AUTO_INCREMENT,
	ord_amount INT NOT NULL,
	ord_date DATE NOT NULL,
	cus_id INT,
    pricing_id INT,
	FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
	FOREIGN KEY (pricing_id) REFERENCES supplier_pricing(pricing_id)
);

CREATE TABLE RATING
(
	rat_id INT PRIMARY KEY AUTO_INCREMENT,
	ord_id INT, 
    rat_ratstars INT NOT NULL,
	FOREIGN KEY(ord_id) REFERENCES order_detail(ord_id)
 );

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi","1234567890");
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai","2589631470");
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore","9785462315");
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi","8975463285");
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow","7898456532");

INSERT INTO CUSTOMER VALUES(1,"AAKASH","Delhi","9999999999",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN","Noida","9785463215",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA","Mumbai","9999999999",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA","Kolkata","9994562399",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT","Lucknow","7895999999",'M');

INSERT INTO CATEGORY VALUEs(1,"Books");
INSERT INTO CATEGORY VALUES(2,"Games");
INSERT INTO CATEGORY VALUES(3,"Groceries");
INSERT INTO CATEGORY VALUES(4,"Electornics");
INSERT INTO CATEGORY VALUES(5,"Clothes");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat Earphones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,3100);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);


INSERT INTO `ORDER` VALUES(101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-00-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);


INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

##3)----3)Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

select cus_gender,count(*) tot_customers from customer a inner join (select cus_id,sum(ord_amount) from `order`
group by cus_id
having sum(ord_amount)>=3000) b
on a.cus_id=b.cus_id
group by cus_gender;

## 4)Display all the orders along with product name ordered by a customer having Customer_Id=2

select a.ord_id,a.ord_amount,a.ord_date,cus_name,pro_name,pro_desc from `order` a inner join supplier_pricing b
on a.pricing_id=b.pricing_id
inner join product c on b.pro_id=c.pro_id
inner join customer d
on a.cus_id=d.cus_id
where a.cus_id=2;

##5)Display the Supplier details who can supply more than one product.
select a.supp_id,supp_name,supp_city,supp_phone from supplier a 
inner join (select supp_id, count(distinct pro_id) 
from supplier_pricing group by supp_id 
having count(distinct pro_id)>1) b on a.supp_id=b.supp_id ;

## 6)Find the least expensive product from each category and print the table with category id, name, product name and price of the product
select cat_id,cat_name,pro_name,price as min_price from 
( select a.cat_id,a.cat_name,pro_name,price, rank() over 
(partition by a.cat_id order by a.cat_id,price) as Rnk 
from category a inner join (select a.cat_id, a.pro_name,a.pro_desc, price from product a 
inner join( select b.pro_id, min(supp_price) as price from supplier_pricing a 
inner join product b on a.pro_id=b.pro_id group by b.pro_id) b 
on a.pro_id=b.pro_id) b 
on a.cat_id=b.cat_id group by a.cat_id,a.cat_name,pro_name,price) a where rnk=1;

##7)Display the Id and Name of the Product ordered after “2021-10-05”.

select a.pro_id,pro_name from product a inner join 
( select a.pricing_id,a.ord_id,a.cus_id,b.pro_id from `order` a 
 inner join supplier_pricing b on a.pricing_id=b.pricing_id where ord_date >"2021-10-05") b 
 on a.pro_id=b.pro_id ;


##8) 8)Display customer name and gender whose names start or end with character 'A'.
select cus_name,cus_gender from customer where cus_name like 'A%' or cus_name like  '%A';

##9--9)Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”.
DELIMITER //
create PROCEDURE Supplier_Rating()
BEGIN
		select supp_id,supp_name,case 
		when avg(rat_ratstars)=5 then "Excellent Service"
		when avg(rat_ratstars)>4 then "Good Service"
		when avg(rat_ratstars)>2 then "Average Service"
		ELSE   "Poor Service"  end as Type_of_Service from (
		select a.ord_id,rat_ratstars,a.pricing_id,d.supp_id,supp_name from `order` a
		inner join rating b
		on a.ord_id=b.ord_id
		inner join supplier_pricing c
		on a.pricing_id=c.pricing_id
		inner join supplier d
		on c.supp_id=d.supp_id) as a
		group by supp_id,supp_name;
	END;

call Supplier_Rating();

