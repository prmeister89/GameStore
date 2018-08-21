require 'rest-client'
require 'json'
require 'nokogiri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
UserGame.destroy_all
Game.destroy_all
#User
User.create(name: "Jimmy Figgs", balance: 500.00)
User.create(name: "Carol Clines", balance: 1000.00)
User.create(name: "Amy Applebeans", balance: 800.00)
User.create(name: "Sally Codswhollop", balance: 100.00)
User.create(name: "Johnny Jellybeans", balance: 300.00)

#Game
# Game.create(name: "The Legend of Zelda",
#             description: "Save the princess, save Hyrule.",
#             original_release_date: "01-04-1973",
#             original_game_rating: 7, platforms: ["NES", "Wii", "Switch"],
#             price: 29.99)
# Game.create(name: "The Witcher 3: Wild Hunt",
#             description: "Monster Slaying, apathy, and one special unicorn.",
#             original_release_date: "05-19-2015",
#             original_game_rating: 10,
#             platforms: ["Xbox 360", "Xbox One", "Playstaion 4"],
#             price: 39.99)
# Game.create(name: "The Last of Us",
#             description: "Zombies, Ellen Page(look-a-like), and an angry Mid-Western Logan.",
#             original_release_date: "06-14-2013",
#             original_game_rating: 10,
#             platforms: ["Xbox 360", "Xbox One", "Playstaion 4"],
#             price: 19.99)
# Game.create(name: "Quantam Gum Drops",
#             description: "Fun with Science and Candy (candy not included.)",
#             original_release_date: "08-29-2003",
#             original_game_rating: 4,
#             platforms: ["Wii", "Switch","Xbox 360", "Xbox One", "Playstaion 4"],
#             price: 5.99)
# Game.create(name: "Heavy Boots",
#             description: "Walk around with heavy boots. You'll get there, eventually.",
#             original_release_date: "02-12-1999",
#             original_game_rating: 2,
#             platforms: ["NES", "Sega Genesis", "Xbox 360"],
#             price: 1.99)
# Game.create(name: "Butterfly Massacre",
#             description: "A safe place for your psychotic child to kill swarms of innocent butterflies.",
#             original_release_date: "12-25-1984",
#             original_game_rating: 3,
#             platforms: ["NES", "Sega Genesis"],
#             price: 7.99)

#Games created from XML
doc = Nokogiri::XML(File.open("games.xml"))
z = Nokogiri::XML(File.open("games.xml")).at_xpath("response/results").children
games = z.map do |parce|
  rand_price = rand(0...25.01).round(2)
  #game name
  name = parce.children.to_a[14].text
  #game description
  if Nokogiri::HTML(parce.children.to_a[5].text).css('p').count == 0
    description = "Sorry, no description is available."
  else
    description = Nokogiri::HTML(parce.children.to_a[5].text).css('p')[0].text
  end
  #game original_release_date
  release_date = parce.children.to_a[17].text[0..9]
  #game original_game_rating
  game_rating = parce.children.to_a[16].text.split.last
  #array of game platforms
  platforms = parce.children.to_a[18].children.children.children.select do |x|
    x.text.length>3 && !(x.text.start_with?("http"))
    end.map do |y|
      y.text
    end

  Game.create(name: "#{name}", description: "#{description}", original_release_date: "#{release_date}", original_game_rating: "#{game_rating}",platforms: platforms, price: rand_price)
end

#UserGame -- condition options: Poor, Fair, Good, Very Good, Perfect
UserGame.create(user_id: 1, game_id: 1, condition: "Good", list_price: 34.99)
UserGame.create(user_id: 1, game_id: 2, condition: "Very Good", list_price: 49.99)
UserGame.create(user_id: 2, game_id: 2, condition: "Good", list_price: 39.99)
UserGame.create(user_id: 2, game_id: 3, condition: "Fair", list_price: 19.99)
UserGame.create(user_id: 3, game_id: 3, condition: "Good", list_price: 24.99)
UserGame.create(user_id: 3, game_id: 4, condition: "Poor", list_price: 4.99)
UserGame.create(user_id: 4, game_id: 4, condition: "Fair", list_price: 9.99)
UserGame.create(user_id: 4, game_id: 5, condition: "Perfect", list_price: 59.99)
UserGame.create(user_id: 6, game_id: 6, condition: "Poor", list_price: 8.99)
UserGame.create(user_id: 6, game_id: 1, condition: "Fair", list_price: 24.99)
