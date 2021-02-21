require 'rails_helper'

RSpec.describe "Favorties", type: :request do
  it "creates a new favorite" do
    user = User.first
    artist = Artist.first
    favorite = Favorite.create(user_id: user.id, artist_id: artist.id)
    expect(favorite.user_id).to eq(user.id)
    expect(favorite.artist_id).to eq(artist.id)
    expect(user.favorites.count).to eq(1)
  end
end
