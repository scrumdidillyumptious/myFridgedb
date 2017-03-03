 --dummy users

use myFridgeDB;
insert into users(userid,username, password)
value(0001,'Ben' , 'password');
insert into users(userid,username, password)
value(0002,'Sam' , 'password');

insert into users(userid,username, password)
value(0003,'John' , 'password');
insert into users(userid,username, password)
value(0004,'testUserName' , 'password');

--Dummy ingredients

insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0001,'Pear',30817, 4, 31217);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0002,'Apple',30817, 4, 31517);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0003,'Peach',30817, 4, 31417);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0004,'Pie Crust',30817, 2, 32017);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0005,'Gallon of Milk',30817, 1, 31817);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0006,'Cup of Flour',30817, 3, 32717);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0007,'Cup of Sugar',30817, 2, 31917);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0008,'Stick of Butter',30817, 2, 31317);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0009,'Pint of Cream',30817, 1, 31817);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0005,'Box of Cereal',30817, 1, 32217);
insert into ingredients(ingID,iname, dateLogged, quantity, expDate)
value(0005,'Dash of Meme',30817, 3, 42099);
select * from ingredients;

--Dummy recipie

use myFridgeDB;
insert into recipie
values('Apple pie', 4, 'easy as pie!', 0001,'Baked Goods', (select userid from users where username='testUserName'));
insert into recipie
values('Peach pie', 4, 'easy as pie!', 0002,'Baked Goods', (select userid from users where username='testUserName'));
insert into recipie
values('Pear pie', 4, 'easy as pie!', 0003, 'Baked Goods',(select userid from users where username='testUserName'));
insert into recipie
values('Apple slices', 1, 'cut up some apples ya dummy', 0004, 'Fruit',(select userid from users where username='testUserName'));
insert into recipie
values('Cereal with milk', 1, 'add cereal and milk', 0005, 'Breakfast',(select userid from users where username='testUserName'));

select * from recipie;

--dummyLinkers


insert into recipie_has_ingredients
values(0002,0003);
insert into recipie_has_ingredients
values(0002,0001);
insert into recipie_has_ingredients
values(0002,0004);
insert into recipie_has_ingredients
values(0005,0005);
select * from recipie_has_ingredients;
