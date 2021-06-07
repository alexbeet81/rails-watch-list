# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

# require 'json'
# require 'open-uri'

puts "Deleting database"
Movie.destroy_all
puts "Done"

url = 'http://tmdb.lewagon.com/movie/top_rated'

user_serialized = URI.open(url).read
movies = JSON.parse(user_serialized)

movies["results"].sample(100).each do |movie|
  new_movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
    )

  puts "created entry for #{new_movie.title} with ID: #{new_movie.id}"
end

puts "created #{Movie.count} new movies"


puts "destroying lists"
List.destroy_all
puts "done"
# puts "creating new lists"

# list_1 = List.create!(
#   name: "Alex's Awesome list"
#   )
# list_2 = List.create!(
#   name: "Action Movies"
#   )
# list_3 = List.create!(
#   name: "My favourite movies"
#   )

# puts "done making lists"
