use myFridgeDB;
insert into recipie
values('Apple pie', 4, 'easy as pie!', 0001,'Baked Goods', (select userid from users where username='testUserName'));
insert into recipie
values('Peach pie', 4, 'easy as pie!', 0002,'Baked Goods', (select userid from users where username='testUserName'));
insert into recipie
values('Pear pie', 4, 'easy as pie!', 0003, 'Baked Goods',(select userid from users where username='testUserName'));
insert into recipie
values('Apple slices', 1, 'cut up some apples ya dummy', 0004, 'Baked Goods',(select userid from users where username='testUserName'));
insert into recipie
values('Cereal with milk', 1, 'add cereal and milk', 0005, 'Baked Goods',(select userid from users where username='testUserName'));
select * from recipie;
