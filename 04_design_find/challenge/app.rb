require_relative 'lib/database_connection'
require_relative "lib/recipes_directory.rb"

DatabaseConnection.connect('recipes_directory')

recipes = RecipesDirectory.new

recipes.all.each do |recipe|
  p "Name: #{recipe.name} - Cook Time: #{recipe.cooking_time} - Rating: #{recipe.rating}"
end

first_recipe = recipes.find(1)
p first_recipe.name
p first_recipe.cooking_time
p first_recipe.rating


