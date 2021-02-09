require 'rails_helper'
require './lib/artist_stitcher'

RSpec.describe "ArtistStitcher helper class" do
  before(:all) do
    @artist = Artist.new(city: "Rockford", state: "IL", spotify_id: "1LB8qB5BPb3MHQrfkvifXU")
  end
  
  it "successfully returns json artist object" do
    artist_json = ArtistStitcher.new(@artist)
    new_artist = JSON.parse(artist_json.artist)
    expect(new_artist["name"]).to eq("Cheap Trick")
  end
end
