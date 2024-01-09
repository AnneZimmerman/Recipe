--Af Looks great!  One comment below to fix, and then please adjust your tables file according to the changes you have made and submit
/*
AZ Questions:
1)Is there a start date that should limit the date columns?
--AF Good question, that would be a good idea, you can pick a date that you think makes sense and just use that
2)Is there a max price on the cookbooks?
--AF That's also a good question for the client, also here pick an accurate max price and use it
3)Are the 3 cuizine types given in the sample data the only ones?
--AF As said in the video, they are the only sample ones but users can add more once approved

AZ ok, thanks.

Users:
UserId int not null identity primary key
FirstName varchar(20) not null not blank
LastName varchar(20) not null not blank
UserName varchar(30) not null not blank unique
First and Last name unique

Measurement:
MeasurementId int not null identity primary key
MeasurementType varchar(20) not null not blank 

Recipes
RecipeId int not null identity primary key
UserId (fk User)
CuizineId (fk Cuizine)
Status varchar(10) must be 'draft', 'published', 'archived'
StatusDate datetime2 null
Name varchar(30)not null/blank unique
Calories int not null
Picture computed

--AF You have measurement id in this table, no need for it as you already will have a measurementid in recipeingredient
Ingredient:
IngrientId int not null identity primary key,
Ingredients varchar(50) not null/blank
Picture computed


Instructions:
InstructionId int not null identity primary key,
RecipeId (fk Recipe)
Instructions varchar(100)not null/blank
InstuctionSequence int not null

RecipeIngredient:
RecipeIngredientId int not null identity primary key,
RecipeId (fk Recipe)
IngredientID(fk Ingredient)
MeasurementId (fk Measurement)
Quantity int not null
IngredientSequence int not null

Cuizine
CuizineId int not null identity primary key
CuizineType varchar(20) 

Meal
MealId int not null identity primary key
UserId (fk User)
Name varchar(50)not null/blank unique
MealStatus bit 'active', 'inactive'
DateCreated date
Picture computed

Course
CourseId int not null identity primary key
Course varchar(20) must be 'appetizer', 'side', 'main', 'dessert'
CourseSequence int not null

MealCourseRecipe 
MealCourseRecipeID int not null identity primary key
MealID (fk Meal)
CourseId (fk Course)
RecipeId (fk Recipe)
MealID and CourseId and RecipeId must be unique

Cookbook
CookbookId int not null identity primary key
UserId (fk User)
Name varchar(50) not null/blank unique
Price decimal(5,2)not null
Status varchar(10) 'active', 'inactive'
DateCreated date
Picture computed

CookbookRecipe 
CookbookRecipeId int not null identity primary key
CookbookId (fk Cookbook)
RecipeId (fk Recipe)
RecipeSequence int not null
CookbookId and RecipeId must be unique


*/