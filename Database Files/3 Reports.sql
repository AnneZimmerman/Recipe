use HeartyHearthDB
go
/*
1 Recipe list page:
    List of all Recipes that are either published or archived, published recipes should appear at the top. 
	Archived recipes should appear gray. Surround the archived recipe with <span style="color:gray">recipe name</span>
    In the resultset show the Recipe with its status, dates it was published and archived (blank if not archived),
     user, number of calories and number of ingredients.
*/

select r.RecipeStatus, PublishedDate = isnull(convert(varchar, r.PublishedDate, 120), ''),
    ArchivedDate = isnull(convert(varchar, r.ArchivedDate, 120), ''), r.Calories, Users = concat(u.FirstName, ' ', u.LastName),
    Ingredients = max(ri.IngredientSequence),
    RecipeName = 
        case 
          when r.RecipeStatus = 'Archived' then concat('<span style="color:gray">', r.RecipeName, '</span>')
          else r.RecipeName
          end 
from Recipe r 
join Users u 
on r.UserId = u.UserId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
where r.RecipeStatus in ('Published', 'Archived')
group by r.RecipeStatus, r.Calories, r.PublishedDate, r.ArchivedDate, u.LastName, u.FirstName, r.RecipeName
order by r.RecipeStatus desc

/*
2 Recipe details page:
    Show for a specific recipe (three result sets):
        a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
        b) List of ingredients: show the measurement type and ingredient in one column, sorted by sequence. Ex. 1 Teaspoon Salt  
        c) List of prep steps sorted by sequence.
*/

--a
select r.RecipeName, r.Calories, NumInstructions = count(distinct(i.InstructionId)), NumIngredients = count(distinct(ri.RecipeIngredientId)) 
from Recipe r
join Instruction i 
on r.RecipeId = i.RecipeId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
where r.RecipeName = 'Macaroni and Cheese'
group by r.RecipeName, r.Calories


--b
select Ingredients = concat(ri.Quantity, ' ', m.MeasurementType, ' ', i.Ingredient )
from Ingredient i 
join RecipeIngredient ri 
on i.IngredientId = ri.IngredientId 
join Measurement m 
on m.MeasurementId = ri.MeasurementId
join Recipe  r 
on r.RecipeId = ri.RecipeId
where r.RecipeName = 'Macaroni and Cheese' 
order by ri.IngredientSequence

--c 
select i.Instruction, i.InstructionSequence
from Instruction i 
join Recipe r 
on r.RecipeId = i.RecipeId
where r.RecipeName = 'Macaroni and Cheese'
order by i.InstructionSequence

/*
3 Meal list page:
    All active meals, meal name, user that created meal, number of calories for the meal, number of courses, 
    and number of recipes per each meal, sorted by name of meal
*/
select m.MealName, u.FirstName, u.LastName, NumCourses = count(distinct(c.CourseId)), NumRecipes = count(distinct(r.RecipeId)) , NumCalories = sum( r.Calories)  
from Meal m 
join Users u 
on u.UserId = m.UserId
join MealCourseRecipe mcr
on mcr.MealId = m.MealId
join Recipe r 
on r.RecipeId = mcr.RecipeId
join Course c 
on c.CourseId = mcr.CourseId
where m.MealStatus = 1
group by m.MealName, u.FirstName, u.LastName
order by m.MealName

/*
4 Meal details page:
    Show for a specific meal:
        a) Meal header: meal name, user, date created.
        b) List of all recipes. 
            Display in one column the course type, recipe, and for the main course show which dish is the main and which are side. 
			In this format "Course Type: Main\Side dish - Recipe Name. Then main dishes should be bold, using the bold tags as shown below
                ex: 
                    Appetizer: Mixed Greens
                    <b>Main: Main dish - Onion Pastrami Chicken</b>
					Main: Side dish - Roasted cucumbers with mustard
*/

--a
select m.MealName, u.FirstName, u.LastName, m.DateCreated 
from Meal m 
join Users u 
on u.UserId = m.UserId
where m.MealName = 'Breakfast Bash'

--b 
select CourseDesc =
    case 
       when c.CourseName = 'Appetizer' then concat(c.CourseName, ' - ', r.RecipeName)
       when c.CourseName = 'Side' then concat('Main: ', c.CourseName, ' - ', r.RecipeName) 
       when c.CourseName = 'Main' then concat('<b>Main: ', c.CourseName, ' - ', r.RecipeName, '</b>')
       else concat (c.CourseName, ' - ', r.RecipeName)
       end
from Meal m 
join MealCourseRecipe mcr
on m.MealId = mcr.MealId
join Course c 
on c.CourseId = mcr.CourseId
join Recipe r 
on r.RecipeId = mcr.RecipeId
where m.MealName = 'Breakfast Bash'

--5 Cookbook list page:
    --Show all active cookbooks with author and number of recipes per book. Sorted by book name
select c.CookbookName, u.FirstName, u.LastName, RecipeNum = count(r.RecipeId) 
from Cookbook c 
join Users u 
on u.UserId = c.UserId
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join Recipe r 
on r.RecipeId = cr.RecipeId
where c.CookbookStatus = 1
group by c.CookbookName, u.FirstName, u.LastName
order by c.CookbookName

--6 Cookbook details page:
    --Show for specific cookbook:
    --a) Cookbook header: cookbook name, user, date created, price, number of recipes.
    --b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  
    --Note: User will click on recipe to see all ingredients and steps.

--a
select c.CookbookName, u.FirstName, u.LastName, c.DateCreated, c.Price, NumRecipes = count(r.RecipeId) 
from Cookbook c 
join Users u 
on u.UserId = c.UserId
join CookbookRecipe cr 
on c.CookbookId = cr.CookbookId
join Recipe r 
on r.RecipeId = cr.RecipeId
where c.CookbookName = 'Treats for Two'
group by c.CookbookName, u.FirstName, u.LastName, c.DateCreated, c.Price


--b
select r.RecipeName, z.CuisineType, Instructions = count(distinct(s.InstructionId)), Ingredients = count(distinct(i.Ingredient)) 
from Recipe r  
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join Users u 
on u.UserId = r.UserId 
join Ingredient i 
on i.IngredientId = ri.IngredientId
join Instruction s 
on s.RecipeId = r.RecipeId
join Cuisine z
on z.CuisineId = r.CuisineId
join CookbookRecipe cr 
on cr.RecipeId = r.RecipeId 
join Cookbook c 
on c.CookbookId = cr.CookbookId
where c.CookbookName = 'Treats for Two'
group by r.RecipeName, z.CuisineType
order by r.RecipeName

--7 April Fools Page:
   --On April 1st we have a page with a joke cookbook. For that page provide the following.
   --a) A list of all the recipes that are in all cookbooks. The recipe name should be the reverse of the real name proper cased. 
   --There are matching pictures for those names, include the reversed picture names so that we can show the joke pictures.
    --b) When the user clicks on a specific recipe they should see a list of the first ingredient of each recipe in the
    -- system, and a list of the last step in each recipe in the system
 --a
select RecipeName = concat(upper(substring(reverse(r.RecipeName), 1, 1)), substring(lower(reverse(r.RecipeName)), 2, 30)), PictureName = concat(upper(substring(reverse(r.RecipePicture), 1, 1)), substring(lower(reverse(r.RecipePicture)), 2, 40))
from Recipe r 
join CookbookRecipe cr 
on r.RecipeId = cr.RecipeId
join Cookbook c 
on c.CookbookId = cr.CookbookId
 
--b

;
with x as(
    select Instructions = max( s.Instruction), r.RecipeId
    from Instruction s 
    join Recipe r 
    on r.RecipeId = s.RecipeId
    group by r.RecipeId
)

select distinct i.Ingredient, x.Instructions
from x 
join Recipe r 
on r.RecipeId = x.RecipeId
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join Ingredient i 
on i.IngredientId = ri.IngredientId
join Instruction s 
on r.RecipeId = s.RecipeId
where ri.IngredientSequence = 1
order by x.Instructions desc 

--For site administration page:
--8 seperate reports
    --a) List of how many recipes each user created per status. Show 0 if none
	--b) List of how many recipes each user created and average amount of days that it took for the user's recipes to be published.
    --c) List of how many meals each user created and whether they're active or inactive. Show 0 if none
    --d) List of how many cookbooks each user created and whether they're active or inactive. Show 0 if none
   --e) List of archived recipes that were never published, and how long it took for them to be archived.

--a
select u.FirstName, u.LastName, r.RecipeStatus, Recipes = isnull(count(r.RecipeId), 0), r.RecipeName
from Users u
left join Recipe r 
on u.UserId = r.UserId
group by r.RecipeStatus, u.FirstName, u.LastName, r.RecipeName 
order by u.FirstName

--b
select Recipes = count(*), AvgDays = isnull(avg(datediff(day, r.DraftDate, isnull(r.PublishedDate, null))), 0), u.FirstName, u.LastName
from Recipe r 
join Users u 
on u.UserId = r.UserId
group by u.FirstName, u.LastName
order by u.LastName

--c
select Meals = isnull(count(m.MealId), 0), u.FirstName, u.LastName, MealStatus = isnull(m.MealStatus, 0)
from Users u 
left join Meal m
on u.UserId = m.UserId
group by u.FirstName, u.LastName, m.MealStatus

--d
select Cookbooks = isnull(count(c.CookbookId), 0), u.FirstName, u.LastName, CookbookStatus = isnull(c.CookbookStatus, 0)
from Users u 
left join Cookbook c 
on u.UserId = c.UserId
group by u.FirstName, u.LastName, c.CookbookStatus

--e
select r.RecipeName, DaysToArchive = datediff(day, r.DraftDate, r.ArchivedDate) 
from Recipe r 
where r.PublishedDate is null and r.ArchivedDate is not null

--9 For user dashboard page:
   --a) Show number of the user's recipes, meals and cookbooks. 
    --b) List of their recipes, display the status and the number of hours between the status it's in and the one before that. Show null if recipe has the status drafted.
    --c) Count of their recipes per cuisine. Show 0 for none.

--a
;
with x as(
    select Recipes = count(r.RecipeId), u.UserId 
    from Recipe r  
    join Users u 
    on u.UserId = r.UserId
    group by u.UserId
)
select x.Recipes, Meals = count(distinct mcr.MealId), Cookbooks = count(distinct cr.CookbookId), u.FirstName, u.LastName
from x
join Recipe r 
on x.UserId = r.UserId
join MealCourseRecipe mcr
on r.RecipeId = mcr.RecipeId 
join Meal m 
on m.MealId = mcr.MealId
join CookbookRecipe cr 
on r.RecipeId = cr.RecipeId
join Cookbook c 
on c.CookbookId = cr.CookbookId
join Users u 
on u.UserId = r.UserId
where u.UserName = 'johnnypaul' 
group by x.UserId, x.Recipes , u.FirstName, u.LastName

--b
select r.RecipeName, r.RecipeStatus, u.FirstName, u.LastName, HourCount = 
    case 
      when r.RecipeStatus = 'Published' then datediff(hour, r.DraftDate, r.PublishedDate)
      when r.RecipeStatus = 'Archived' and r.PublishedDate is null then datediff(hour, r.DraftDate, r.ArchivedDate)
      when r.RecipeStatus = 'Archived' then datediff(hour, r.PublishedDate, r.ArchivedDate)
      when r.RecipeStatus = 'Draft' then null
      else 0 
      end
from Recipe r 
join Users u 
on u.UserId = r.UserId
where u.UserName = 'johnnypaul'

;
with x as (
    select r.RecipeId, c.CuisineId 
    from Recipe r 
    join Users u 
    on u.UserId = r.UserId
    join Cuisine c 
    on c.CuisineId = r.CuisineId
    where u.UserName = 'johnnypaul'
)

select RecipesPerCuisine = count(x.RecipeId), c.CuisineId
    from Cuisine c 
    left join x
    on x.CuisineId = c.CuisineId
    group by c.CuisineId 


