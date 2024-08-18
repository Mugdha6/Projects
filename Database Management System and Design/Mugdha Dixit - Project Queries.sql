-- Queries on project - Online recipe Portal
-- Mugdha Dixit

-- shows alll the recipe category with highest rating value
select recipe_id, rating_value from ratings where rating_value = 5;


-- Alter Table
alter table users add salary decimal(10, 2);

-- select query
select * from desserts;

-- insert query.

insert into recipe_of_the_month (rm_id, month_name, rating_id) values (21, 'August', 6);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (22, 'November', 12);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (23, 'December', 3);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (24, 'July', 20);


-- Update query.
update ratings set rating_value = 5 where user_id = 31;
update ratings set rating_value = 4 where user_id = 32;
update ratings set rating_value = 1 where user_id = 33;
update ratings set rating_value = 5 where user_id = 34;

-- Delete Query.
delete from users where user_id = 32;
delete from users where user_id = 14;
delete from users where user_id = 31;
delete from users where user_id = 94;



-- query using left join
select ratings.rating_id, ratings.recipe_id, recipe_category.recipe_id
from ratings
left join recipe_category on ratings.recipe_id = recipe_category.recipe_id;



-- Right Join
SELECT ratings.rating_id, ratings.recipe_id, recipe_category.recipe_id
FROM ratings
RIGHT JOIN recipe_category ON ratings.recipe_id = recipe_category.recipe_id;


-- How many categories do we have 
SELECT * from recipe_category;

-- Recipes with highest ratings
select recipe_id, rating_value from ratings where rating_value = 5;

-- Users who have added recipes in category veg as well as desserts.
select v.v_id, v.title as vegetarian_title, d.d_id, d.title as dessert_title
from vegetarian v
inner join desserts d on v.v_id = d.d_id;

-- shows all the recipes from table non-vegetarian and desserts which has cooking time less than 60 min
select title, cooking_time from nonvegetarian where cooking_time < 60
union
select title, cooking_time from desserts where cooking_time < 60;


-- shows all the recipes from all four categories which has cheese in its description.
select title, description
from vegetarian
where description like '%cheese%'
union
select title, description
from nonvegetarian
where description like '%cheese%'
union
select title, description
from vegan
where description like '%cheese%'
union
select title, description
from desserts
where description like '%cheese%';


 


