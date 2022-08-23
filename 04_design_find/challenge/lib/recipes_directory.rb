require_relative "./recipe.rb"


class RecipesDirectory

 def all
   sql = 'SELECT name, cooking_time, rating FROM recipes;'
   set = DatabaseConnection.exec_params(sql, [])

   all_recipes = []

   set.each do |record|
   recipe = Recipe.new
   recipe.name = record["name"]
   recipe.cooking_time = record["cooking_time"]
   recipe.rating = record["rating"]

   all_recipes << recipe
   end
    return all_recipes
  end


  def find(id)
   sql = 'SELECT name, cooking_time, rating FROM recipes WHERE id = $1;'
   set = DatabaseConnection.exec_params(sql, [id])

   record = set[0]

   recipe = Recipe.new
   recipe.name = record["name"]
   recipe.cooking_time = record["cooking_time"]
   recipe.rating = record["rating"]

   return recipe
  end

end