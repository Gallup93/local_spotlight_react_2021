# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |i|
    User.create(username: "TestUser1", email: "user-#{i+1}@example.com", password: "password", password_confirmation: "password")
end

spotify_ids = ["1ZOtGD23o1UK8XQDA9D2cc", "5PxhTwi9zUw26P4UUBuRs6", "2vnB6tuQMaQpORiRdvXF9H", "1SoBNpuC0N4nvaQFENS0qf", "5F24VT2NBrbVTIAOmzWBux"]


Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[0]}")
Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[1]}")
Artist.create(city: "Chicago", state: "IL", spotify_id: "#{spotify_ids[2]}")
Artist.create(city: "Chicago", state: "IL", spotify_id: "#{spotify_ids[3]}")
Artist.create(city: "Denver", state: "IL", spotify_id: "#{spotify_ids[4]}")
