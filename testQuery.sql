use myfridgedb;
select iname, expDate, rdesc, instructions
from ingredients_has_recipie as a, ingredients as b, recipie as c
where b.ingID=a.ingredients_ingID and c.recipieID=a.recipie_recipieID;
