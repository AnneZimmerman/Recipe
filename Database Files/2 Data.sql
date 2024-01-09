use HeartyHearthDB 
go 

delete CookbookRecipe
delete Cookbook 
delete MealCourseRecipe 
delete Course 
delete Meal 
delete RecipeIngredient 
delete Instruction 
delete Measurement
delete Ingredient 
delete Recipe 
delete Cuisine 
delete Users 
go 

insert Users(FirstName, LastName, UserName)
select FirstName = 'Susie', LastName = 'Lucia', UserName = 'susielucia'
union select 'Johnny', 'Paul', 'johnnypaul'
union select 'Francis', 'Journey', 'francisj'
union select 'Clarice', 'Horman', 'claricehorman'
union select 'MaryBeth', 'Withers', 'maywith'
union select 'Pete', 'Olivarus', 'peteo'
go 

insert Cuisine(CuisineType)
select CuisineType = 'American'
union select 'French'
union select 'English'
go 

insert Recipe(UserId, CuisineId, RecipeName, DraftDate, PublishedDate, ArchivedDate, Calories)
select UserId = (select u.UserId from Users u where u.UserName = 'peteo'),
       CuisineID = (select c.CuisineId from Cuisine c where c.CuisineType = 'American'),
       RecipeName = 'Chocolate Chip Cookies', DraftDate = '06-14-2017', PublishedDate = '07-01-2017', ArchivedDate = null, Calories = 80
union select (select u.UserId from Users u where u.UserName = 'francisj'),
        (select c.CuisineId from Cuisine c where c.CuisineType = 'French'), 
        'Apple Yogurt Smoothie', '04-23-2022', null, null, 170
union select (select u.UserId from Users u where u.UserName = 'maywith'),
        (select c.CuisineId from Cuisine c where c.CuisineType = 'English'),
        'Cheese Bread', '02-12-2018', null, '11-11-2021', 115
union select (select u.UserId from Users u where u.UserName = 'claricehorman'),
        (select c.CuisineId from Cuisine c where c.CuisineType = 'American'),  
        'Butter Muffins', '05-11-2020', '07-30-2020', null, 430
union select (select u.UserId from Users u where u.UserName = 'johnnypaul'),
        (select c.CuisineId from Cuisine c where c.CuisineType = 'American'),
        'Macaroni and Cheese', '12-13-2018', null, null, 80
union select (select u.UserId from Users u where u.UserName = 'johnnypaul'),
        (select c.CuisineId from Cuisine c where c.CuisineType = 'English'),
        'Shepherd''s pie', '11-21-2017', '01-12-2018', '11-28-2020', 600
union select (select u.UserId from Users u where u.UserName = 'susielucia'),
        (select c.CuisineId from Cuisine c where c.CuisineType = 'French'),
        'Creme Brulee', '03-09-2017', '04-06-2017', null, 400

insert Ingredient(Ingredient)
select Ingredients = 'sugar'
union select 'oil'
union select 'flour'
union select 'vanilla sugar'
union select 'baking powder'
union select 'baking soda'
union select 'chocolate chips'
union select 'granny smith apples'
union select 'vanilla yogurt'
union select 'orange juice'
union select 'honey'
union select 'ice cubes'
union select 'club bread'
union select 'butter'
union select 'shredded cheese'
union select 'garlic cloves(crushed)'
union select 'black pepper'
union select 'salt'
union select 'vanilla pudding'
union select 'eggs'
union select 'whipped cream cheese'
union select 'stick butter'
union select 'sour cream cheese'
union select 'heavy cream'
union select 'egg yolks'
union select 'potatoes'
union select 'onion'
union select 'mixed veg'
union select 'ground round beef'
union select 'beef broth'
union select 'worcestershire sauce'
union select 'vanilla'
union select 'elbow macaroni'
union select 'cheddar cheese'
union select 'milk'
go 

insert Measurement(MeasurementType)
select MeasurmentType = 'ounce'
union select 'teaspoon'
union select 'clove'
union select 'pinch'
union select 'cup'
union select 'tablespoon'
union select 'unit'
union select 'lbs'


insert Instruction(RecipeId, Instruction, InstructionSequence)
select RecipeId = (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       Instructions = 'First combine sugar, oil and eggs in a bowl', InstuctionSequence = 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'mix well', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'add flour, vanilla sugar, baking powder and baking soda', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'beat for 5 minutes', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'add chocolate chips', 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'freeze for 1-2 hours', 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'roll into balls and place spread out on a cookie sheet', 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       'bake on 350 for 10 min.', 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       'Peel the apples and dice', 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       'Combine all ingredients in bowl except for apples and ice cubes', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       'mix until smooth', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       'add apples and ice cubes', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       'pour into glasses', 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       'Slit bread every 3/4 inches', 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       'Combine all ingredients in bowl', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       'fill slits with chees mixture', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       'wrap bread into a foil and bake for 30 minutes', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       'Cream butter with sugars', 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       'Add eggs and mix well', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       'Slowly add rest of ingredients and mix well', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       'fill muffin pans 3/4 full and bake for 30 minutes', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       'heat and mix sugar and cream', 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       'add egg yolks and vanilla', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       'pour int rameskin in hot water', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       'bake at 350 for 50 minutes, chill atleast 2 hours', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       'sprinke with sugar', 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s pie'),
       'chop all, boil potatoes and saute vegetables', 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s pie'),
       'add beef and worcestershire sauce to vegetables and cook', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s pie'),
       'mash potatoes-layer in casserole between vegetables/beef', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s pie'),
       'bake at 400 for 30 minutes', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'),
        'boil macaroni and drain', 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'),
        'make a roux with flour and butter', 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'),
        'add salt, pepper, and milk to roux and cook for 5 minutes', 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'),
        'add cheddar cheese and stir until melted', 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'),
        'fold macaroni into cheese sauce', 5

insert RecipeIngredient(RecipeId, IngredientId, MeasurementId, Quantity, IngredientSequence)
select RecipeId = (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       IngredientId = (select i.IngredientId from Ingredient i where i.Ingredient = 'sugar'),
       MeasurementId = (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       Quantity = 1, IngredientSequence = 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'oil'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       0.5, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'eggs'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       3, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'flour'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       2, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'vanilla sugar'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       1, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'baking powder'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       2, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'baking soda'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       0.5, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'chocolate chips'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       1, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'granny smith apples'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       2, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'vanilla yogurt'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       2, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'sugar'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'orange juice'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       0.5, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'honey'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'tablespoon'),
       2, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'ice cubes'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       5, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'club bread'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'butter'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'ounce'),
       4, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'shredded cheese'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'ounce'),
       8, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'garlic cloves(crushed)'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'clove'),
       2, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'black pepper'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       0.25, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'salt'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'pinch'),
       1, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'stick butter'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'sugar'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       3, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'vanilla pudding'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'tablespoon'),
       2, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'eggs'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       4, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'whipped cream cheese'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'ounce'),
       8, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'sour cream cheese'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'ounce'),
       8, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'flour'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       1, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'baking powder'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       2, 8
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'sugar'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'tablespoon'),
       3, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'heavy cream'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       1, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'egg yolks'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       3, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'vanilla'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       0.25, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'salt'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       1, 1
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'potatoes'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       3, 2
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'stick butter'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       1, 3
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'onion'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'unit'),
       1, 4
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'mixed veg'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       1.5, 5
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'ground round beef'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'lbs'),
       1.5, 6
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'beef broth'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       0.5, 7
union select (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'worcestershire sauce'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       1, 8
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'elbow macaroni'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'ounce'),
       8, 1
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'butter'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       0.25, 2
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'flour'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       0.25, 3
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'salt'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'teaspoon'),
       0.5, 4
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'black pepper'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'pinch'),
       1, 5
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'milk'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       2, 6
union select (select r.RecipeId from Recipe r where R.RecipeName = 'Macaroni and Cheese'),
       (select i.IngredientId from Ingredient i where i.Ingredient = 'cheddar cheese'),
       (select m.MeasurementId from Measurement m where m.MeasurementType = 'cup'),
       2, 7

insert Meal(UserId, MealName, MealStatus, DateCreated)
select UserId = (select u.UserId from Users u where u.UserName = 'johnnypaul'),
       MealName = 'Breakfast Bash', MealStatus = 1, DateCreate = '02-19-2020'
union select (select u.UserId from Users u where u.UserName = 'susielucia'),
       'Around the World', 0, '12-04-2021'
union select (select u.UserId from Users u where u.UserName = 'francisj'),
       'French/American Blend', 1, '03-14-2017'
union select (select u.UserId from Users u where u.UserName = 'peteo'),
       'Simply Delicious', 1, '07-07-2022'

select * from Meal 

insert Course(CourseName, CourseSequence)
select CourseName = 'Appetizer', CourseSequence = 1
union select 'Main', 2 
union select 'Side', 3
union select 'Dessert', 4

insert MealCourseRecipe(MealId, CourseId, RecipeId, MainCourse)
select MealId = (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'),
       CourseId = (select c.CourseId from Course c where c.CourseName  = 'Appetizer'),
       RecipeId = (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'),
       MainCourse = 0
union select (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'),
             (select c.CourseId from Course c where c.CourseName = 'Main'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 1
union select (select m.MealId from Meal m where m.MealName = 'Breakfast Bash'),
             (select c.CourseId from Course c where c.CourseName = 'Side'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 0
union select (select m.MealId from Meal m where m.MealName = 'Around the World'),
             (select c.CourseId from Course c where c.CourseName = 'Appetizer'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'), 0
union select (select m.MealId from Meal m where m.MealName = 'Around the World'),
             (select c.CourseId from Course c where c.CourseName = 'Main'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'), 1
union select (select m.MealId from Meal m where m.MealName = 'Around the World'),
             (select c.CourseId from Course c where c.CourseName = 'Dessert'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 0             
union select (select m.MealId from Meal m where m.MealName = 'French/American Blend'),
             (select c.CourseId from Course c where c.CourseName = 'Appetizer'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 0
union select (select m.MealId from Meal m where m.MealName = 'French/American Blend'),
             (select c.CourseId from Course c where c.CourseName = 'Main'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'), 1
union select (select m.MealId from Meal m where m.MealName = 'French/American Blend'),
             (select c.CourseId from Course c where c.CourseName = 'Dessert'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'), 0
union select (select m.MealId from Meal m where m.MealName = 'Simply Delicious'),
             (select c.CourseId from Course c where c.CourseName = 'Appetizer'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 0
union select (select m.MealId from Meal m where m.MealName = 'Simply Delicious'),
             (select c.CourseId from Course c where c.CourseName = 'Main'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'), 1
union select (select m.MealId from Meal m where m.MealName = 'Simply Delicious'),
             (select c.CourseId from Course c where c.CourseName = 'Side'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'), 0
union select (select m.MealId from Meal m where m.MealName = 'Simply Delicious'),
             (select c.CourseId from Course c where c.CourseName = 'Dessert'),
             (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'), 0
             
select * from MealCourseRecipe


insert Cookbook(UserId, CookbookName, Price, CookbookStatus, DateCreated)
select UserId = (select UserId from Users u where u.UserName = 'maywith'),
       CookbookName = 'Treats for Two', Price = 30, CookbookStatus = 1, DateCreated = '07-24-2019'
union select (select UserId from Users u where u.UserName = 'francisj'),
       'Sweet Tooth', 35.55, 1, '12-10-2020'
union select (select UserId from Users u where u.UserName = 'peteo'),
       'Cozy Comfort', 30, 1, '09-08-2017'
union select (select UserId from Users u where u.UserName = 'susielucia'),
       'International Delights', 40, 2, '07-18-2020'

insert CookbookRecipe(CookbookId, RecipeId, RecipeSequence)
select CookbookId = (select c.CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'),
       RecipeId = (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 
       RecipeSequence = 1
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 2
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 3
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Treats for Two'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 4
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Sweet Tooth'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Chocolate Chip Cookies'), 1
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Sweet Tooth'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Butter Muffins'), 2
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Sweet Tooth'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'), 3
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Sweet Tooth'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Apple Yogurt Smoothie'), 4
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Cozy Comfort'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'), 1
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Cozy Comfort'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 2
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'Cozy Comfort'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'), 3
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'International Delights'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Shepherd''s Pie'), 1
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'International Delights'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Creme Brulee'), 2
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'International Delights'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Macaroni and Cheese'), 3
union select (select c.CookbookId from Cookbook c where c.CookbookName = 'International Delights'),
       (select r.RecipeId from Recipe r where r.RecipeName = 'Cheese Bread'), 4
       
