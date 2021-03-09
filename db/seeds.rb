# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'spotify_api_helper'

rockford = Location.create(city: "rockford",state: "IL")
boston = Location.create(city: "boston",state: "MA")
chicago = Location.create(city: "chicago",state: "IL")
denver = Location.create(city: "denver",state: "CO")
milwaukee = Location.create(city: "milwaukee",state: "WI")
locations = [rockford, chicago, denver, milwaukee]

User.create(email: "DaBears85@example.com", password: "password", password_confirmation: "password", city: "chicago", state: "IL", location_id: chicago.id)

4.times do |i|
    User.create(email: "user-#{i}@example.com", password: "password", password_confirmation: "password", city: "#{locations[i].city}", state: "#{locations[i].state}", location_id: locations[i].id)
end

spotify_ids = ["1jAlXWRhCvBrpnX8avLVRP", "5PxhTwi9zUw26P4UUBuRs6", "3EusnQEaJ7atdju9f3QoB0", "1ZOtGD23o1UK8XQDA9D2cc", "77WeI8znTJNL9VgXxJVfOO", "2oWWnEqDToq3n0Hv1zPZQJ", "2vnB6tuQMaQpORiRdvXF9H", "1SoBNpuC0N4nvaQFENS0qf","40Yq4vzPs9VNUrIBG5Jr2i", "5F24VT2NBrbVTIAOmzWBux", "0fcwfASKlWfHUqoeLZBgG3"]

genres = ["pop", "pop-punk", "rap", "rock" "punk",
    "emo", "psychedelic", "soul", "R&B", "country"]

images = ["https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b",
    "https://i.scdn.co/image/a4e10b79a642e9891383448cbf37d7266a6883d6",
    "https://i.scdn.co/image/42ae0f180f16e2f21c1f2212717fc436f5b95451",
    "https://i.scdn.co/image/e797ad36d56c3fc8fa06c6fe91263a15bf8391b8"]

Artist.create(city: "rockford", state: "IL", spotify_id: "#{spotify_ids[0]}", name: "Pink Beam", followers: 111, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: rockford.id)
Artist.create(city: "rockford", state: "IL", spotify_id: "#{spotify_ids[1]}", name: "Quilt Club", followers: 2000, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: rockford.id)
Artist.create(city: "rockford", state: "IL", spotify_id: "#{spotify_ids[2]}", name: "Purple Hell", followers: 30400, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: rockford.id)
Artist.create(city: "rockford", state: "IL", spotify_id: "#{spotify_ids[3]}", name: "The Moon Men", followers: 100300, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: rockford.id)
Artist.create(city: "rockford", state: "IL", spotify_id: "#{spotify_ids[4]}", name: "Taboo Blah Blah", followers: 690500, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: rockford.id)
Artist.create(city: "rockford", state: "IL", spotify_id: "#{spotify_ids[5]}", name: "Name The Moon", followers: 1300500, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: rockford.id)

Artist.create(city: "chicago", state: "IL", spotify_id: "#{spotify_ids[6]}", name: "Beach Bunny", followers: 350000, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: chicago.id)
Artist.create(city: "chicago", state: "IL", spotify_id: "#{spotify_ids[7]}", name: "Ratboys", followers: 23000, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: chicago.id)
Artist.create(city: "chicago", state: "IL", spotify_id: "#{spotify_ids[8]}", name: "The Smashing Pumpkins", followers: 3150600, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: chicago.id)

Artist.create(city: "denver", state: "CO", spotify_id: "#{spotify_ids[9]}", name: "Eldren", followers: 5000, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: denver.id)
Artist.create(city: "denver", state: "CO", spotify_id: "#{spotify_ids[10]}", name: "Decollage", followers: 50, popularity: rand(1..100), genres: genres.sample(3), images: images, location_id: denver.id)


def associate_artist_albums(artist)
  albums = SpotifyApiHelper.new.get_artist_albums(artist.spotify_id)
  albums["items"].each do |album|
    Album.create(
      name: album["name"], release_date: album["release_date"], num_tracks: album["total_tracks"],
      images: album["images"], spotify_id: album["id"], artist_id: artist.id
    )
  end
end

Artist.all.each do |artist|
  associate_artist_albums(artist)
end
