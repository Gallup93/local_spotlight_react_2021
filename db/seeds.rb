# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rockford = Location.create(city: "Rockford",state: "IL")
chicago = Location.create(city: "Chicago",state: "IL")
chicago = Location.create(city: "Denver",state: "CO")
locations = [rockford, chicago]

2.times do |i|
    User.create(username: "TestUser1", email: "user-#{i+1}@example.com", password: "password", password_confirmation: "password", location_id: locations[i].id)
end

spotify_ids = ["1jAlXWRhCvBrpnX8avLVRP", "5PxhTwi9zUw26P4UUBuRs6", "3EusnQEaJ7atdju9f3QoB0", "2oWWnEqDToq3n0Hv1zPZQJ", "77WeI8znTJNL9VgXxJVfOO", "2vnB6tuQMaQpORiRdvXF9H", "1SoBNpuC0N4nvaQFENS0qf", "5F24VT2NBrbVTIAOmzWBux", "0fcwfASKlWfHUqoeLZBgG3"]

genres = ["pop", "pop-punk", "rap", "rock" "punk",
    "emo", "psychedelic", "soul", "R&B", "country"]

images = ["https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b",
    "https://i.scdn.co/image/a4e10b79a642e9891383448cbf37d7266a6883d6",
    "https://i.scdn.co/image/42ae0f180f16e2f21c1f2212717fc436f5b95451",
    "https://i.scdn.co/image/e797ad36d56c3fc8fa06c6fe91263a15bf8391b8"]

Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[0]}", name: "Pink Beam", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[1]}", name: "Quilt Club", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[2]}", name: "Purple Hell", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[3]}", name: "Name The Moon", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Rockford", state: "IL", spotify_id: "#{spotify_ids[4]}", name: "Taboo Blah Blah", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Chicago", state: "IL", spotify_id: "#{spotify_ids[5]}", name: "Beach Bunny", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Chicago", state: "IL", spotify_id: "#{spotify_ids[6]}", name: "Ratboys", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Denver", state: "CO", spotify_id: "#{spotify_ids[7]}", name: "Eldren", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
Artist.create(city: "Denver", state: "CO", spotify_id: "#{spotify_ids[8]}", name: "Decollage", followers: rand(1..100000), popularity: rand(1..100), genres: genres.sample(3), images: images)
