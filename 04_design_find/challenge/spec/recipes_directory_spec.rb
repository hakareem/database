require "recipes_directory"

RSpec.describe RecipesDirectory do

def reset_table
seed_sql = File.read('spec/seeds.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
connection.exec(seed_sql)
end

before(:each) do
reset_table
end

 it "returns list of recipes" do
  repo = RecipesDirectory.new
  recipes = repo.all
  expect(recipes.length).to eq 2 
  expect(recipes.first.name).to eq "Chicken"
  expect(recipes.first.cooking_time).to eq "5" 
  expect(recipes.first.rating).to eq "1" 
 end

 it "returns a single artist" do
  repo = RecipesDirectory.new
  recipe = repo.find(1)
  expect(recipe.name).to eq "Chicken"
  expect(recipe.cooking_time).to eq "5"
  expect(recipe.rating).to eq "1" 
 end
end