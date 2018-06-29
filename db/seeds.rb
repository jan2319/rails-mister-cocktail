# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'


puts 'Cleaning database...'
Ingredient.destroy_all
Cocktail.destroy_all

puts 'Creating ingredients...'

ing_list = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)

ing_list["drinks"].each do |ing|
  ing_name = ing["strIngredient1"]
  Ingredient.create(name: ing_name)
end

puts 'Creating cocktails...'

new_cocktails = ["Munich Mule", "Gin Fizz", "Cuba Libre", "Harvey Wallbanger", "Vodka Orange", "Flying Hirsch"]

Cocktail.create(name: new_cocktails[0])
Cocktail.create(name: new_cocktails[1])
Cocktail.create(name: new_cocktails[2])
Cocktail.create(name: new_cocktails[3])
Cocktail.create(name: new_cocktails[4])
Cocktail.create(name: new_cocktails[5])


puts 'Finished!'

