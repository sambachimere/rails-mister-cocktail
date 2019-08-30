# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

# desroy first: Class with references:
Cocktail.destroy_all
Ingredient.destroy_all
# create cocktail data array

cocktails = [
  ['Mojito', 'https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'],
  ['Samba Colada', 'https://images.unsplash.com/photo-1527761939622-9119094630cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'],
  ['Wagon Cocktail', 'https://images.unsplash.com/photo-1550426735-c33c7ce414ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'],
  ['Benoit Colada', 'https://images.unsplash.com/photo-1553451133-8083c47243d6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60'],
  ['Samba Special', 'https://images.unsplash.com/photo-1514361892635-6b07e31e75f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60']
]

# create new cocktails from array

cocktails.each do |name, photo|
  cocktail = Cocktail.create!(name: name)
  cocktail.remote_photo_url = photo
  cocktail.save
end

puts 'cocktails have been created'

# create new ingredient from json file

result = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
ingredients = result['drinks']

ingredients.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts 'ingredients have been created'
