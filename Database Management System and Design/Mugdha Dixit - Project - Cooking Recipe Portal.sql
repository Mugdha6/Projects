-- Project name - Online recipe Portal
-- Mugdha Dixit


-- create user table
create table users(
user_id int primary key,
user_name varchar(50) not null,
email varchar(100) unique not null,
password varchar(50) not null);  



-- create Recipes_Category table
create table recipe_category(
recipe_id int primary key,
cattegory_name varchar(100) not null);



-- create table vegetarian
create table vegetarian(
v_id int primary key,
user_id int,
title varchar(100) not null,
steps varchar(500) not null,
description varchar(500),
cooking_time int,
servings int,
constraint fk_users foreign key (user_id) references users(user_id));



-- create table Non-vegetarian
create table nonvegetarian(
nv_id int primary key,
user_id int,
title varchar(100) not null,
steps varchar(500) not null,
description varchar(500),
cooking_time int,
servings int,
constraint fk_nvusers foreign key (user_id) references users(user_id));


-- create table vegan
create table vegan(
vn_id int primary key,
user_id int,
title varchar(100) not null,
steps varchar(500) not null,
description varchar(500),
cooking_time int,
servings int,
constraint fk_vnusers foreign key (user_id) references users(user_id));


-- create table desserts
create table Desserts(
d_id int primary key,
user_id int,
title varchar(100) not null,
steps varchar(500) not null,
description varchar(500),
cooking_time int,
servings int,
constraint fk_dusers foreign key (user_id) references users(user_id));



-- create table Ratings
create table ratings (
rating_id int primary key,
recipe_id int,
user_id int,
rating_value int,
constraint fk_recipe foreign key (recipe_id) references recipe_category(recipe_id),
constraint fk_user foreign key (user_id) references users(user_id));


-- create table recipe_of_the_month
CREATE TABLE recipe_of_the_month (
rm_id INT PRIMARY KEY,
month_name VARCHAR(50),
rating_id int,
CONSTRAINT fk_rm_rating FOREIGN KEY (rating_id) REFERENCES ratings(rating_id));




-- inserting mock data into users table
insert into users (user_id, user_name, email, password) values (1, 'Rori Androsik', 'randrosik0@furl.net', '~0/>f');
insert into users (user_id, user_name, email, password) values (2, 'Dacie Cogdell', 'dcogdell1@is.gd', '$}UPSK~XN');
insert into users (user_id, user_name, email, password) values (3, 'Georgina McNirlan', 'gmcnirlan2@sciencedirect.com', '(9JKAx');
insert into users (user_id, user_name, email, password) values (4, 'Winne Spoors', 'wspoors3@devhub.com', '.`$k3>');
insert into users (user_id, user_name, email, password) values (5, 'Berte Tuma', 'btuma4@home.pl', '~qK|~=');
insert into users (user_id, user_name, email, password) values (6, 'Cyb Lucey', 'clucey5@vinaora.com', '~1EW%3>ct');
insert into users (user_id, user_name, email, password) values (7, 'Erda Jewar', 'ejewar6@netvibes.com', ',d6o)');
insert into users (user_id, user_name, email, password) values (8, 'Venita Erskin', 'verskin7@cargocollective.com', '"RMq&YU3');
insert into users (user_id, user_name, email, password) values (9, 'Emma Boyack', 'eboyack8@ucsd.edu', '@zm)mEz(');
insert into users (user_id, user_name, email, password) values (10, 'Ginny Giraudeau', 'ggiraudeau9@technorati.com', '+v&443');
insert into users (user_id, user_name, email, password) values (11, 'Augustus Frankcombe', 'afrankcombea@un.org', '_%w2p');
insert into users (user_id, user_name, email, password) values (12, 'Patric Oldroyd', 'poldroydb@moonfruit.com', '~qhFaxj3(3');
insert into users (user_id, user_name, email, password) values (13, 'Alexandrina Vodden', 'avoddenc@reuters.com', ')D/,QvU60v');
insert into users (user_id, user_name, email, password) values (14, 'Jelene Cannicott', 'jcannicottd@nbcnews.com', '%Yl=ne`*ur');
insert into users (user_id, user_name, email, password) values (15, 'Yvonne Scruton', 'yscrutone@sun.com', '<<ZS7"`"Qf');
insert into users (user_id, user_name, email, password) values (16, 'Charo Ratledge', 'cratledgef@globo.com', '$h1XxF%');
insert into users (user_id, user_name, email, password) values (17, 'Carissa Faughnan', 'cfaughnang@unblog.fr', ',ywa*q$pp');
insert into users (user_id, user_name, email, password) values (18, 'Sonny Bramont', 'sbramonth@census.gov', '$Cb\NI\n9b');
insert into users (user_id, user_name, email, password) values (19, 'Falkner Kincey', 'fkinceyi@wsj.com', ')QF}K)l0om');
insert into users (user_id, user_name, email, password) values (20, 'Faulkner Casserley', 'fcasserleyj@home.pl', '\rsy>LC');
insert into users (user_id, user_name, email, password) values (21, 'Kendrick Hubane', 'khubanek@unblog.fr', '>pMgllv');
insert into users (user_id, user_name, email, password) values (22, 'Neilla Pickerill', 'npickerilll@shutterfly.com', '>u~i5mhCuv');
insert into users (user_id, user_name, email, password) values (23, 'Cristine Lathom', 'clathomm@facebook.com', '"|@|4A4m');
insert into users (user_id, user_name, email, password) values (24, 'Brewster Goldsack', 'bgoldsackn@behance.net', '!k(YCWtKK&');
insert into users (user_id, user_name, email, password) values (25, 'Hermione Bruyett', 'hbruyetto@topsy.com', '{Wj##vv');
insert into users (user_id, user_name, email, password) values (26, 'Marice Gabler', 'mgablerp@addtoany.com', ',0#%_rk');
insert into users (user_id, user_name, email, password) values (27, 'Brade Keighly', 'bkeighlyq@sphinn.com', '%z3+cS.#B');
insert into users (user_id, user_name, email, password) values (28, 'Vasilis McCumskay', 'vmccumskayr@who.int', '_FvT8wm4');
insert into users (user_id, user_name, email, password) values (29, 'Hurlee McEnhill', 'hmcenhills@psu.edu', '==Hy?v');
insert into users (user_id, user_name, email, password) values (30, 'Rollin Turner', 'rturnert@vimeo.com', '&ng<`&');
insert into users (user_id, user_name, email, password) values (31, 'Daphna Malec', 'dmalecu@businesswire.com', '=1k1ul>sm');
insert into users (user_id, user_name, email, password) values (32, 'Iolande Saberton', 'isabertonv@dion.ne.jp', '}X!G@P*(U!');
insert into users (user_id, user_name, email, password) values (33, 'Cchaddie Langhor', 'clanghorw@free.fr', '{{H78');
insert into users (user_id, user_name, email, password) values (34, 'Sigrid Vouls', 'svoulsx@ucoz.ru', '>Hc6avC');
insert into users (user_id, user_name, email, password) values (35, 'Annabelle Munnis', 'amunnisy@paginegialle.it', '?TMm`epT');
insert into users (user_id, user_name, email, password) values (36, 'Kevyn Onthank', 'konthankz@goo.ne.jp', ')x~!wb"');
insert into users (user_id, user_name, email, password) values (37, 'Chryste Copson', 'ccopson10@ucla.edu', '<HP4B');
insert into users (user_id, user_name, email, password) values (38, 'Gilbertina Hirtz', 'ghirtz11@discuz.net', '''sG%I!7a6j');
insert into users (user_id, user_name, email, password) values (39, 'Debby Flieger', 'dflieger12@google.ca', '=N#<$v+A''+');
insert into users (user_id, user_name, email, password) values (40, 'Des Del Monte', 'ddel13@constantcontact.com', ').(|6Ya)f');
insert into users (user_id, user_name, email, password) values (41, 'Gertrudis Codner', 'gcodner14@tripod.com', '!9H~wR');
insert into users (user_id, user_name, email, password) values (42, 'Neille Gillatt', 'ngillatt15@irs.gov', ',n_V,1\0DL');
insert into users (user_id, user_name, email, password) values (43, 'Brenna Jenno', 'bjenno16@nps.gov', ',QZ<4');
insert into users (user_id, user_name, email, password) values (44, 'Annecorinne Ivanovic', 'aivanovic17@networkadvertising.org', '#E"ZQ');
insert into users (user_id, user_name, email, password) values (45, 'Killy Ramble', 'kramble18@wufoo.com', ')F(j,U');
insert into users (user_id, user_name, email, password) values (46, 'Charlene Haysey', 'chaysey19@twitpic.com', '>Ce3ZlX');
insert into users (user_id, user_name, email, password) values (47, 'Danya Osbidston', 'dosbidston1a@biglobe.ne.jp', '@uF>~a');
insert into users (user_id, user_name, email, password) values (48, 'Jacquetta Piggens', 'jpiggens1b@princeton.edu', '`jENnwh7r"');
insert into users (user_id, user_name, email, password) values (49, 'Raven Ollive', 'rollive1c@tiny.cc', '_VgFkkr');
insert into users (user_id, user_name, email, password) values (50, 'Richmond Lillee', 'rlillee1d@cbc.ca', '+ik''QX');
insert into users (user_id, user_name, email, password) values (51, 'Joela Bodicum', 'jbodicum1e@dot.gov', '>bGV@*+c');
insert into users (user_id, user_name, email, password) values (52, 'Euphemia Daniello', 'edaniello1f@geocities.jp', '&@<~8gO''');
insert into users (user_id, user_name, email, password) values (53, 'Cassy Billes', 'cbilles1g@cnn.com', '%tq/=V+cSg');
insert into users (user_id, user_name, email, password) values (54, 'Aime Bolderson', 'abolderson1h@netvibes.com', '~)<~O9z,');
insert into users (user_id, user_name, email, password) values (55, 'Genny Sunock', 'gsunock1i@nps.gov', '(8u>B7$.');
insert into users (user_id, user_name, email, password) values (56, 'Justinian Cresswell', 'jcresswell1j@photobucket.com', '{yrE}nt|`');
insert into users (user_id, user_name, email, password) values (57, 'Bernadette Niesegen', 'bniesegen1k@telegraph.co.uk', '/79BTd');
insert into users (user_id, user_name, email, password) values (58, 'Con Epilet', 'cepilet1l@jugem.jp', '<ja7=UZFW');
insert into users (user_id, user_name, email, password) values (59, 'Sashenka McIlmurray', 'smcilmurray1m@stanford.edu', '#W\l_@`');
insert into users (user_id, user_name, email, password) values (60, 'Marcellina Sprigin', 'msprigin1n@g.co', '=YbAQg6');
insert into users (user_id, user_name, email, password) values (61, 'Wayne Vallis', 'wvallis1o@hud.gov', '*UHm/($4}');
insert into users (user_id, user_name, email, password) values (62, 'Jaclin Dwyr', 'jdwyr1p@google.co.jp', '%atXwS6rCL');
insert into users (user_id, user_name, email, password) values (63, 'Moll McClaren', 'mmcclaren1q@xinhuanet.com', '/''~1iEL');
insert into users (user_id, user_name, email, password) values (64, 'Velma Leivesley', 'vleivesley1r@biglobe.ne.jp', '\,2r0H_nd');
insert into users (user_id, user_name, email, password) values (65, 'Corny Worlock', 'cworlock1s@sohu.com', '`@|7Cxyu');
insert into users (user_id, user_name, email, password) values (66, 'Farleigh Brabender', 'fbrabender1t@utexas.edu', '+\tj+');
insert into users (user_id, user_name, email, password) values (67, 'Rustin Chedgey', 'rchedgey1u@imdb.com', '{=9XU');
insert into users (user_id, user_name, email, password) values (68, 'Anna Whiteland', 'awhiteland1v@angelfire.com', ',ZcTWo$JB');
insert into users (user_id, user_name, email, password) values (69, 'Linnie Cottel', 'lcottel1w@google.com.br', '=!''NBc');
insert into users (user_id, user_name, email, password) values (70, 'Burnaby Zeplin', 'bzeplin1x@printfriendly.com', '<hPo5');
insert into users (user_id, user_name, email, password) values (71, 'Britteny Spiteri', 'bspiteri1y@zdnet.com', '|6Gq/XC"C');
insert into users (user_id, user_name, email, password) values (72, 'Jervis Normanton', 'jnormanton1z@statcounter.com', '>Z!fqc+');
insert into users (user_id, user_name, email, password) values (73, 'Tabbi Banister', 'tbanister20@example.com', '}\&YQwG+4G');
insert into users (user_id, user_name, email, password) values (74, 'Quillan Bennington', 'qbennington21@ameblo.jp', '>r3k*');
insert into users (user_id, user_name, email, password) values (75, 'Costanza Hissie', 'chissie22@cocolog-nifty.com', '*%v2s>');
insert into users (user_id, user_name, email, password) values (76, 'Roma Barnwell', 'rbarnwell23@unc.edu', '\npb5');
insert into users (user_id, user_name, email, password) values (77, 'Upton Bosche', 'ubosche24@t-online.de', '"iaa8%"!0');
insert into users (user_id, user_name, email, password) values (78, 'Marie-ann Lafay', 'mlafay25@usda.gov', '.XAD\');
insert into users (user_id, user_name, email, password) values (79, 'Merell Mabbutt', 'mmabbutt26@photobucket.com', '$&~@}lFvZ4');
insert into users (user_id, user_name, email, password) values (80, 'Nickolas Dolbey', 'ndolbey27@1688.com', '(tJ\He');
insert into users (user_id, user_name, email, password) values (81, 'Derrik Rosenstein', 'drosenstein28@princeton.edu', '\sT+u*P');
insert into users (user_id, user_name, email, password) values (82, 'Loleta Januszewski', 'ljanuszewski29@bizjournals.com', '=m8+wV&');
insert into users (user_id, user_name, email, password) values (83, 'Fred Babon', 'fbabon2a@mashable.com', '!A+sF4C\N~');
insert into users (user_id, user_name, email, password) values (84, 'Ethyl Paul', 'epaul2b@bbc.co.uk', '.i(oFsTA7x');
insert into users (user_id, user_name, email, password) values (85, 'Mela Hucklesby', 'mhucklesby2c@com.com', '(_R(P>3`$,');
insert into users (user_id, user_name, email, password) values (86, 'Peadar Plumtree', 'pplumtree2d@washington.edu', '@//%yukBB');
insert into users (user_id, user_name, email, password) values (87, 'Stephie Miroy', 'smiroy2e@fc2.com', '*Mnqh_L,');
insert into users (user_id, user_name, email, password) values (88, 'Blithe Gratland', 'bgratland2f@hexun.com', '!Ie$*''Ybs');
insert into users (user_id, user_name, email, password) values (89, 'Ambur Lummus', 'alummus2g@google.pl', '?.461){~"?');
insert into users (user_id, user_name, email, password) values (90, 'Dilly Yurivtsev', 'dyurivtsev2h@chron.com', '.i*8,X');
insert into users (user_id, user_name, email, password) values (91, 'Amber Pidgeley', 'apidgeley2i@usa.gov', '~r?Vs,q{f');
insert into users (user_id, user_name, email, password) values (92, 'Tani Jovasevic', 'tjovasevic2j@blogger.com', ',WqqL8F\');
insert into users (user_id, user_name, email, password) values (93, 'Cheri Bescoby', 'cbescoby2k@desdev.cn', '~w2OP4');
insert into users (user_id, user_name, email, password) values (94, 'Will Howbrook', 'whowbrook2l@techcrunch.com', '|$sVVorbw~');
insert into users (user_id, user_name, email, password) values (95, 'Beatriz Rubberts', 'brubberts2m@wordpress.com', '=<9!<jYzS/');
insert into users (user_id, user_name, email, password) values (96, 'Zelma Brauns', 'zbrauns2n@fotki.com', '.L1$5#Cxm(');
insert into users (user_id, user_name, email, password) values (97, 'Lauralee Magwood', 'lmagwood2o@ifeng.com', '?nRzf?');
insert into users (user_id, user_name, email, password) values (98, 'Kelsi Stoffersen', 'kstoffersen2p@businesswire.com', '.5e?FwRF_');
insert into users (user_id, user_name, email, password) values (99, 'Judas De Lasci', 'jde2q@lulu.com', '(N)4N<vP"');
insert into users (user_id, user_name, email, password) values (100, 'Sander Pinney', 'spinney2r@wordpress.com', '$jU_Ub1''');



-- Inserting data into the vegetarian table
INSERT INTO vegetarian (v_id, title, steps, description, cooking_time, servings)
VALUES (5, 'Vegetable Stir-Fry', '1. Heat oil in a wok or skillet. 2. Add sliced vegetables (e.g., bell peppers, carrots, broccoli) and stir-fry for a few minutes. 3. In a small bowl, whisk together soy sauce, ginger, and garlic. 4. Pour the sauce over the vegetables and stir-fry until crisp-tender. 5. Serve hot over steamed rice.', 'A healthy and colorful vegetable stir-fry.', 10, 2);

INSERT INTO vegetarian (v_id,user_id, title, steps, description, cooking_time, servings)
VALUES (6, 12, 'Quinoa Salad', '1. Cook quinoa according to package instructions. 2. In a large bowl, combine cooked quinoa, chopped vegetables (e.g., cucumber, cherry tomatoes, red onion), and fresh herbs (e.g., parsley, mint). 3. In a small bowl, whisk together olive oil, lemon juice, salt, and pepper to make the dressing. 4. Pour the dressing over the quinoa mixture and toss to combine. 5. Serve chilled.', 'A refreshing and nutritious salad made with quinoa and fresh vegetables.', 20, 4);

INSERT INTO vegetarian (v_id, user_id, title, steps, description, cooking_time, servings)
VALUES (7,52, 'Vegetable Curry', '1. Heat oil in a large pot over medium heat. 2. Add diced onion, minced garlic, and grated ginger. Cook until fragrant. 3. Add chopped vegetables (e.g., potatoes, carrots, peas) and cook for a few minutes. 4. Stir in curry powder, turmeric, cumin, and chili powder. 5. Pour in coconut milk and vegetable broth. Simmer until the vegetables are tender. 6. Serve hot with rice or naan bread.', 'A flavorful and hearty vegetable curry with a creamy coconut milk base.', 30, 6);

INSERT INTO vegetarian (v_id,user_id, title, steps, description, cooking_time, servings)
VALUES (8, 24, 'Caprese Salad', '1. Slice fresh tomatoes and mozzarella cheese. 2. Arrange the tomato and mozzarella slices on a plate. 3. Add fresh basil leaves on top. 4. Drizzle with olive oil and balsamic glaze. 5. Sprinkle with salt and pepper. 6. Serve as a light and refreshing salad.', 'A classic Italian salad made with tomatoes, mozzarella cheese, and fresh basil.', 10, 2);

INSERT INTO vegetarian (v_id, user_id, title, steps, description, cooking_time, servings)
VALUES (1, 3, 'Caprese Salad', '1. Slice fresh tomatoes and fresh mozzarella cheese. 2. Arrange the tomato and mozzarella slices on a serving plate. 3. Drizzle with extra virgin olive oil and balsamic glaze. 4. Sprinkle with fresh basil leaves and season with salt and pepper. 5. Serve as a refreshing and light salad.', 'A classic Italian salad with ripe tomatoes, creamy mozzarella, and fragrant basil.', 10, 2);

INSERT INTO vegetarian (v_id, user_id, title, steps, description, cooking_time, servings)
VALUES (2, 15, 'Vegetable Curry', '1. Heat oil in a pot or pan. 2. Add diced onions and minced garlic, and sauté until fragrant. 3. Add your choice of vegetables (e.g., carrots, potatoes, bell peppers) and cook until slightly tender. 4. Mix in curry powder, turmeric, cumin, and other desired spices. 5. Pour in coconut milk and simmer until the vegetables are cooked through. 6. Serve the vegetable curry over steamed rice or with naan bread.', 'A flavorful and aromatic curry made with a variety of vegetables and creamy coconut milk.', 30, 4);

INSERT INTO vegetarian (v_id, user_id, title, steps, description, cooking_time, servings)
VALUES (3, 2, 'Quinoa Salad', '1. Cook quinoa according to package instructions and let it cool. 2. In a large bowl, combine cooked quinoa, diced cucumbers, cherry tomatoes, chopped fresh herbs (e.g., parsley, mint), and crumbled feta cheese. 3. Drizzle with lemon juice and olive oil. 4. Season with salt and pepper to taste. 5. Toss all the ingredients together until well combined. 6. Serve chilled as a nutritious and protein-packed salad.', 'A light and refreshing salad made with quinoa, fresh vegetables, and tangy feta cheese.', 20, 3);

INSERT INTO vegetarian (v_id, user_id, title, steps, description, cooking_time, servings)
VALUES (4, 87, 'Mushroom Risotto', '1. In a large pan, melt butter and sauté chopped onions until translucent. 2. Add sliced mushrooms and cook until they release their moisture and turn golden brown. 3. Stir in Arborio rice and coat it with the butter and mushroom mixture. 4. Gradually add vegetable broth, stirring constantly, until the rice is cooked and creamy. 5. Season with salt, pepper, and grated Parmesan cheese. 6. Serve the mushroom risotto hot with a sprinkle of fresh parsley on top.', 'A rich and creamy Italian rice dish flavored with savory mushrooms.', 40, 4);


-- inserting data into table nonvegetarian
INSERT INTO nonvegetarian (nv_id, user_id, title, steps, description, cooking_time, servings)
VALUES (1, 52, 'Chicken Parmesan', '1. Preheat the oven to 375°F (190°C). 2. Dip chicken breasts in beaten eggs, then coat with breadcrumbs mixed with grated Parmesan cheese. 3. Heat oil in a skillet and cook the chicken breasts until golden brown on both sides. 4. Place the cooked chicken in a baking dish and top with marinara sauce and shredded mozzarella cheese. 5. Bake in the preheated oven for 20-25 minutes until the cheese is melted and bubbly. 6. Serve the chicken Parmesan with pasta or a side salad.', 'A classic Italian dish featuring breaded chicken topped with marinara sauce and melted cheese.', 45, 4);

INSERT INTO nonvegetarian (nv_id, user_id, title, steps, description, cooking_time, servings)
VALUES (2, 5, 'Beef Tacos', '1. Heat oil in a skillet and cook ground beef until browned. 2. Add taco seasoning and water, simmer until the beef is fully cooked and the liquid is reduced. 3. Warm up corn tortillas in a separate pan or in the oven. 4. Fill each tortilla with the cooked beef, and top with your favorite taco toppings like shredded lettuce, diced tomatoes, cheese, and salsa. 5. Serve the beef tacos hot with a squeeze of lime.', 'Delicious and savory tacos filled with seasoned ground beef.', 30, 3);

INSERT INTO nonvegetarian (nv_id, user_id, title, steps, description, cooking_time, servings)
VALUES (3, 13, 'Baked Salmon with Lemon and Dill', '1. Preheat the oven to 400°F (200°C) and line a baking sheet with foil. 2. Place salmon fillets on the prepared baking sheet. 3. Drizzle with olive oil, sprinkle with salt, pepper, and fresh dill. 4. Squeeze fresh lemon juice over the salmon. 5. Bake in the preheated oven for 12-15 minutes until the salmon is cooked through and flakes easily with a fork. 6. Serve the baked salmon with steamed vegetables or a side of rice.', 'Tender and flavorful salmon baked to perfection with citrusy flavors of lemon and dill.', 15, 2);

INSERT INTO nonvegetarian (nv_id, user_id, title, steps, description, cooking_time, servings)
VALUES (4, 11, 'Spaghetti Bolognese', '1. Cook spaghetti according to package instructions. 2. In a separate pan, sauté minced garlic and diced onions until fragrant. 3. Add ground beef and cook until browned. 4. Stir in tomato sauce, diced tomatoes, and Italian herbs. Simmer for 15-20 minutes. 5. Serve the spaghetti with the meat sauce and garnish with grated Parmesan cheese.', 'A classic Italian pasta dish with a flavorful meat sauce.', 40, 4);

INSERT INTO nonvegetarian (nv_id, user_id, title, steps, description, cooking_time, servings)
VALUES (5, 15, 'Honey Mustard Glazed Salmon', '1. Preheat the oven to 400°F (200°C) and line a baking sheet with foil. 2. In a small bowl, whisk together honey, Dijon mustard, minced garlic, and lemon juice. 3. Place salmon fillets on the prepared baking sheet and brush the honey mustard glaze over the top. 4. Bake in the preheated oven for 12-15 minutes until the salmon is cooked through. 5. Serve the glazed salmon with a side of roasted vegetables or a salad.', 'Flaky salmon fillets with a sweet and tangy honey mustard glaze.', 15, 2);

INSERT INTO nonvegetarian (nv_id, user_id, title, steps, description, cooking_time, servings)
VALUES (6, 15, 'Shrimp Scampi', '1. Cook pasta according to package instructions. 2. In a large skillet, melt butter and olive oil over medium heat. 3. Add minced garlic and sauté until fragrant. 4. Add shrimp and cook until they turn pink. 5. Stir in white wine, lemon juice, and red pepper flakes. 6. Toss the cooked pasta with the shrimp mixture. 7. Serve the shrimp scampi with a sprinkle of fresh parsley on top.', 'Tender shrimp cooked in a flavorful garlic and butter sauce.', 20, 3);





-- inserting data into vegan table
INSERT INTO vegan (vn_id, user_id, title, steps, description, cooking_time, servings)
VALUES (1, 2, 'Vegan Lentil Soup', '1. In a large pot, heat olive oil over medium heat. 2. Add diced onions, minced garlic, and chopped carrots. Sauté until vegetables are tender. 3. Rinse and drain lentils, then add them to the pot. 4. Pour in vegetable broth and bring to a boil. 5. Reduce heat and simmer for about 30 minutes or until lentils are cooked through. 6. Season with salt, pepper, and dried herbs (e.g., thyme, oregano). 7. Serve the vegan lentil soup hot with a sprinkle of fresh parsley on top.', 'A hearty and nutritious soup made with lentils and flavorful vegetables.', 45, 6);

INSERT INTO vegan (vn_id, user_id, title, steps, description, cooking_time, servings)
VALUES (2, 13, 'Vegan Chickpea Curry', '1. Heat oil in a pan and sauté diced onions until golden. 2. Add minced garlic, grated ginger, and curry powder. Cook for a minute until fragrant. 3. Add canned chickpeas, diced tomatoes, and coconut milk. Simmer for about 15 minutes. 4. Stir in chopped spinach and cook until wilted. 5. Season with salt, pepper, and a squeeze of fresh lime juice. 6. Serve the vegan chickpea curry over cooked rice or with naan bread.', 'A flavorful and protein-rich curry made with chickpeas and aromatic spices.', 30, 4);

INSERT INTO vegan (vn_id, user_id, title, steps, description, cooking_time, servings)
VALUES (3, 65, 'Vegan Buddha Bowl', '1. Cook quinoa according to package instructions. 2. In a large bowl, assemble a variety of colorful vegetables like roasted sweet potatoes, steamed broccoli, sliced avocado, and cherry tomatoes. 3. Add a handful of leafy greens, such as spinach or kale. 4. Drizzle with your choice of dressing or sauce, like tahini or a citrus vinaigrette. 5. Sprinkle with toasted nuts or seeds for added crunch. 6. Serve the vegan Buddha bowl as a healthy and balanced meal.', 'A nourishing and visually appealing bowl filled with a mix of grains, vegetables, and dressing.', 25, 2);

INSERT INTO vegan (vn_id, user_id, title, steps, description, cooking_time, servings)
VALUES (5, 6, 'Vegan Chickpea Salad', '1. In a large bowl, combine cooked and cooled chickpeas, diced cucumbers, cherry tomatoes, and chopped red onions. 2. Add chopped fresh herbs like parsley and cilantro. 3. Drizzle with a dressing made with olive oil, lemon juice, and Dijon mustard. 4. Season with salt, pepper, and a pinch of cumin. 5. Toss everything together until well combined. 6. Serve the vegan chickpea salad chilled as a refreshing and protein-packed side dish or light meal.', 'A healthy and flavorful salad featuring protein-rich chickpeas and fresh vegetables.', 15, 4);




--inserting data into desserts table

INSERT INTO Desserts (d_id, user_id, title, steps, description, cooking_time, servings)
VALUES (2, 3, 'Blueberry Muffins', '1. Preheat the oven. 2. Mix dry ingredients. 3. Combine wet ingredients. 4. Mix wet and dry ingredients. 5. Fold in blueberries. 6. Bake and cool.', 'Delicious blueberry muffins for breakfast or a sweet treat.', 30, 12);

INSERT INTO Desserts (d_id, user_id, title, steps, description, cooking_time, servings)
VALUES (3, 5, 'Banana Bread', '1. Preheat the oven. 2. Cream butter and sugar. 3. Add bananas, eggs, and vanilla. 4. Mix in dry ingredients. 5. Fold in nuts or chocolate chips. 6. Bake and cool.', 'Classic moist banana bread using ripe bananas.', 60, 8);

INSERT INTO Desserts (d_id, user_id, title, steps, description, cooking_time, servings)
VALUES (5, 10, 'Chocolate Chip Cookies', '1. Preheat oven. 2. Cream butter and sugars. 3. Beat in eggs and vanilla. 4. Combine dry ingredients. 5. Fold in chocolate chips. 6. Drop dough onto baking sheets. 7. Bake and cool.', 'Classic chocolate chip cookies for a sweet treat.', 20, 24);

INSERT INTO Desserts (d_id, user_id, title, steps, description, cooking_time, servings)
VALUES (6, 12, 'Raspberry Cheesecake', '1. Preheat oven. 2. Mix graham cracker crumbs and butter. 3. Press mixture into a pan. 4. Beat cream cheese, sugar, and vanilla. 5. Add eggs one at a time. 6. Pour over crust and swirl in raspberry sauce. 7. Bake and refrigerate.', 'Creamy cheesecake with a tangy raspberry swirl.', 60, 10);





-- inserting data into recipe_category table
insert into recipe_category  (recipe_id, cattegory_name) values (101, 'Vegetarian');
insert into recipe_category  (recipe_id, cattegory_name) values (102, 'Non-Vegetarian');
insert into recipe_category  (recipe_id, cattegory_name) values (103, 'Vegan');
insert into recipe_category  (recipe_id, cattegory_name) values (104, 'Desserts');




-- inserting data into ratings table

insert into ratings (rating_id, recipe_id, user_id, rating_value) values (1, 104, 24, 2);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (2, 102, 9, 4);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (3, 103, 25, 3);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (4, 101, 39, 1);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (5, 102, 55, 2);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (6, 104, 36, 3);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (7, 103, 44, 4);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (8, 101, 32, 5);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (9, 101, 15, 1);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (10, 101, 1, 2);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (11, 103, 57, 3);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (12, 104, 74, 4);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (13, 102, 36, 5);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (14, 102, 25, 4);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (15, 104, 35, 3);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (16, 103, 2, 2);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (17, 103, 14,3);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (18, 102, 47, 4);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (19, 103, 58, 5);
insert into ratings (rating_id, recipe_id, user_id, rating_value) values (20, 101, 70, 5);



-- Inserting data into recipe_of_the_month

insert into recipe_of_the_month (rm_id, month_name, rating_id) values (1, 'January', 15);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (2, 'July', 5);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (3, 'December', 19);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (4, 'January', 12);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (5, 'September', 16);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (6, 'September', 16);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (7, 'December', 18);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (8, 'July', 9);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (9, 'November', 12);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (10, 'October', 3);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (11, 'October', 14);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (12, 'July', 16);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (13, 'September', 16);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (14, 'March', 1);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (15, 'February', 12);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (16, 'February', 13);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (17, 'August', 8);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (18, 'November', 12);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (19, 'December', 3);
insert into recipe_of_the_month (rm_id, month_name, rating_id) values (20, 'July', 20);











