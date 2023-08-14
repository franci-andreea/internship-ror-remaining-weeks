# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.destroy_all

pasta_al_dente = Product.create(
  name: 'Pasta Al Dente',
  description: "Experience the true essence of Italy with our Pasta Al Dente, a culinary marvel 
  that celebrates the art of perfectly cooked pasta. Mangia bene!",
  price: 22.00,
  vegetarian: false,
  category: 2
)
pasta_al_dente.image.attach(io: File.open(Rails.root.join('app/assets/images/pasta-al-dente.png')), filename: 'pasta-al-dente.png')

puts("PASTA AL DENTE CREATED AND SUCCESSFULLY ADDED TO THE DATABASE, YAY!")

pasta_with_feta = Product.create(
  name: 'Pasta With Feta',
  description: "Description for Pasta With Feta",
  price: 20.00,
  vegetarian: true,
  category: 2
)
pasta_with_feta.image.attach(io: File.open(Rails.root.join('app/assets/images/pasta-with-feta.png')), filename: 'pasta-with-feta.png')

puts("PASTA WITH FETA CREATED AND SUCCESSFULLY ADDED TO THE DATABASE, YAY!")

chicken_soup = Product.create(
  name: 'Chicken Soup',
  description: "Description for Chicken Soup",
  price: 14.50,
  vegetarian: false,
  category: 1
)
chicken_soup.image.attach(io: File.open(Rails.root.join('app/assets/images/chicken-soup.png')), filename: 'chicken-soup.png')

puts("CHICKEN SOUP CREATED AND SUCCESSFULLY ADDED TO THE DATABASE, YAY!")

crepes_with_nutella = Product.create(
  name: 'Crepes With Nutella',
  description: "Description for Crepes With Nutella",
  price: 16.70,
  vegetarian: true,
  category: 3
)
crepes_with_nutella.image.attach(io: File.open(Rails.root.join('app/assets/images/crepes-with-nutella.png')), filename: 'crepes-with-nutella.png')
puts("CREPES WITH NUTELLA CREATED AND SUCCESSFULLY ADDED TO THE DATABASE, YAY!")

pizza_california = Product.create(
  name: 'Pizza California',
  description: "Description for Pizza California",
  price: 12.70,
  vegetarian: false,
  category: 2
)
pizza_california.image.attach(io: File.open(Rails.root.join('app/assets/images/california-pizza.png')), filename: 'california-pizza.png')
puts("PIZZA CALIFORNIA CREATED AND SUCCESSFULLY ADDED TO THE DATABASE, YAY!")
