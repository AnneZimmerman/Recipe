use HeartyHearthDB
go

drop table if exists CookbookRecipe
drop table if exists Cookbook
drop table if exists MealCourseRecipe
drop table if exists Course
drop table if exists Meal
drop table if exists RecipeIngredient
drop table if exists Instruction
drop table if exists Ingredient
drop table if exists Measurement
drop table if exists Recipe
drop table if exists Cuisine
drop table if exists Users
go 

create table dbo.Users(
    UserId int not null identity primary key,
    FirstName varchar(20) not null 
        constraint c_Users_firstname_cannot_be_blank check(FirstName <> ''),
    LastName varchar(20) not null 
        constraint c_Users_lastname_cannot_be_blank check(LastName <> ''),
    UserName varchar(30) not null 
        constraint c_Users_username_cannot_be_blank check(UserName <> '')
        constraint u_Users_username unique
)
go

create table dbo.Cuisine(
    CuisineId int not null identity primary key,
    CuisineType varchar(20) not null 
        constraint c_Cuisine_type_cannot_be_blank check(CuisineType <> '')
        constraint u_Cuisine_type_unique unique
)
go

create table dbo.Recipe(
    RecipeId int not null identity primary key,
    UserId int not null constraint f_User_recipe foreign key references Users(UserId),
    CuisineId int not null constraint f_Cuisine_recipe foreign key references Cuisine(CuisineId),
    RecipeName varchar(30) not null 
        constraint c_Recipe_name_cannot_be_blank check(RecipeName <> '')
        constraint u_Recipe_name unique,
    DraftDate date not null default getdate()
        constraint c_Recipe_draftdate_must_be_after_January_1_2017_and_not_in_future check(DraftDate between '01-01-2017' and getdate()),
    PublishedDate date null
        constraint c_Recipe_publisheddate_cannot_be_in_future check(PublishedDate <= getdate()),
    ArchivedDate date null
        constraint c_Recipe_archiveddate_cannot_be_in_future check(ArchivedDate <= getdate()),
    Calories int not null
        constraint c_Recipe_calories_must_be_greater_than_zero check(Calories > 0) ,
    constraint u_RecipeId_and_UserId_and_CuizineId unique(RecipeId, UserId, CuisineId),
    RecipeStatus as case 
        when PublishedDate is null and ArchivedDate is null then 'Draft'
        when PublishedDate is not null and ArchivedDate is null then 'Published'
        else 'Archived'
        end,
    RecipePicture as concat('Recipe - ', RecipeName, '.jpg') persisted 
        constraint u_Recipe_RecipePicture_unique unique,
    constraint c_Recipe_publisheddate_must_be_after_draftdate check(DraftDate <= PublishedDate),
    constraint c_Recipe_archiveddate_must_be_after_publisheddate check(PublishedDate <= ArchivedDate)
)
go

create table dbo.Measurement(
    MeasurementId int not null identity primary key,
    MeasurementType varchar(20) not null 
        constraint c_Measurement_type_cannot_be_blank check(MeasurementType <> '')
        constraint u_Measurement_type_unique unique
)
go 


create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    Ingredient varchar(50) not null 
        constraint c_Ingredient_cannot_be_blank check(Ingredient <> '')
        constraint u_Ingredient_unique unique,
    IngredientPicture as concat('Ingredient - ', Ingredient, '.jpg') persisted
        constraint u_Ingredient_IngredientPicture_is_unique unique
)
go

create table dbo.Instruction(
    InstructionId int not null identity primary key,
    RecipeId int not null constraint f_Recipe_instruction foreign key references Recipe(RecipeId),
    Instruction varchar(100) not null 
        constraint c_Instructions_cannot_be_blank check(Instruction <> ''),
    InstructionSequence int not null
        constraint c_Instruction_sequence_must_be_greater_than_zero check(InstructionSequence > 0),
    constraint u_Instruction_InstructionId_and_RecipeId_and_InstructionSequence_must_be_unique unique(RecipeId, Instruction, InstructionSequence)
)
go 

create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    RecipeId int not null constraint f_Recipe_recipeingredient foreign key references Recipe(RecipeId),
    IngredientId int not null constraint f_Ingredient_recipeingredient foreign key references Ingredient(IngredientId),
    MeasurementId int not null constraint f_Measurement_recipeingredient foreign key references Measurement(MeasurementId),
    Quantity decimal(5,2) not null
        constraint c_Quantity_recipeingredient_must_be_greater_than_zero check(Quantity > 0),
    IngredientSequence int not null 
        constraint c_RecipeIngredient_ingredientsequence_must_be_greater_than_zero check(IngredientSequence > 0)
)
go 
 

create table dbo.Meal(
    MealId int not null identity primary key,
    UserId int not null constraint f_User_meal foreign key references Users(UserId),
    MealName varchar(50) not null 
        constraint c_Meal_name_cannot_be_blank check(MealName <> '')
        constraint u_Meal_name unique,
    MealStatus bit not null,
    DateCreated date not null default getdate()
        constraint c_Meal_datecreated_must_be_after_January_01_2017 check(DateCreated between '01-01-2017' and getdate()),
    MealPicture as concat('Meal - ', MealName, '.jpg') persisted  
)
go 

create table dbo.Course(
    CourseId int not null identity primary key,
    CourseName varchar(20) not null 
        constraint c_Course_cannot_be_blank check(CourseName <> '')
        constraint u_Course_name_unique unique,
    CourseSequence int not null
        constraint c_Course_sequence_must_be_greater_than_zero check(CourseSequence > 0)
)
go

create table dbo.MealCourseRecipe(
    MealCourseRecipeId int not null identity primary key,
    MealId int not null constraint f_Meal_mealcourserecipe foreign key references Meal(MealId),
    CourseId int not null constraint f_Course_mealcourserecipe foreign key references Course(CourseId),
    RecipeId int not null constraint f_Recipe_mealcourserecipe foreign key references Recipe(RecipeId),
    MainCourse bit not null,
    constraint c_MealId_and_CourseId_and_RecipeId_must_be_unique unique(MealId, CourseId, RecipeId)
)
go

create table dbo.Cookbook(
    CookbookId int not null identity primary key,
    UserId int not null constraint f_User_cookbook foreign key references Users(UserId),
    CookbookName varchar(50) not null 
        constraint c_Cookbook_name_cannot_be_blank check(CookbookName <> ''),
    Price decimal(4,2) not null 
        constraint c_Cookbook_price_must_be_between_0_and_40 check(Price between 0 and 40.00),
    CookbookStatus bit not null,
        --AF YOu can combine the constraint at the bottom of the table with this one, same idea as what I said above
    DateCreated date not null 
        constraint c_Cookbook_datecreated_must_be_after_January_1_2017 check(DateCreated >= '01-01-2017'),
    CookbookPicture as concat('Cookbook - ', CookbookName, '.jpg') 
        constraint u_Cookbook_CookbookPicture_unique unique,
    constraint c_Cookbook_datecreated_cannot_be_in_future check(DateCreated <= getdate()) 
)
go 

create table dbo.CookbookRecipe(
    CookbookRecipeId int not null identity primary key,
    CookbookId int not null constraint f_Cookbook_cookbookrecipe foreign key references Cookbook(CookbookId),
    RecipeId int not null constraint f_Recipe_cookbookrecipe foreign key references Recipe(RecipeId),
    RecipeSequence int not null 
        constraint c_CookbookRecipe_recipesequence_cannot_be_blank check(RecipeSequence <> ''),
    constraint u_CookbookRecipe_cookbookid_and_recipeid unique(CookbookId, RecipeId)
)
go 

