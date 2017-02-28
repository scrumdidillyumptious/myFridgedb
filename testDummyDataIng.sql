
insert into ingredients(ingID,iname, dateLogged, quantity, expDate,users_userid) 
value(0001,'Pear',020817, 4, 021217, (select userid from users where username='testUserName'));
insert into ingredients(ingID,iname, dateLogged, quantity, expDate,users_userid) 
value(0002,'Apple',020817, 4, 021517, (select userid from users where username='testUserName'));
insert into ingredients(ingID,iname, dateLogged, quantity, expDate, users_userid) 
value(0003,'Peach',020817, 4, 021417, (select userid from users where username='testUserName'));
insert into ingredients(ingID,iname, dateLogged, quantity, expDate, users_userid) 
value(0004,'Pie Crust',020817, 4, 022017, (select userid from users where username='testUserName'));
insert into ingredients(ingID,iname, dateLogged, quantity, expDate, users_userid) 
value(0005,'Gallon of Milk',020817, 1, 021817, (select userid from users where username='testUserName'));
select * from ingredients;