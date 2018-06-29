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

puts 'Creating ingredients...'

ing_list = JSON.parse(open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)

ing_list["drinks"].each do |ing|
  ing_name = ing["strIngredient1"]
  Ingredient.create(name: ing_name)
end

puts 'Creating cocktails...'

new_cocktails = %w(Munich Mule, Gin Fizz, Cuba Libre, Harvey Wallbanger, Vodka Orange, Flying Hirsch)

new_cocktails.each_with_index do |cocktail, index|
  Cocktail.create(name: cocktail[index])
end

puts 'Finished!'

