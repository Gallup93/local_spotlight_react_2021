require 'rails_helper'
require './lib/artist_commander'

RSpec.describe "Artist Commander" do
  before(:each) do
    @base_artist = Artist.new(city: "Seattle", state: "WA", spotify_id: "6olE6TJLqED3rqDCT0FyPh")
    @base_invalid_city = Artist.new(city: "SEA-HAWKS", state: "WA", spotify_id: "6olE6TJLqED3rqDCT0FyPh")
    @base_invalid_state = Artist.new(city: "Seattle", state: "WAHWAH", spotify_id: "6olE6TJLqED3rqDCT0FyPh")
    @base_invalid_spot_id = Artist.new(city: "Seattle", state: "WA", spotify_id: "Hehehehehe")
    @base_existing_spot_id = Artist.new(city: "Seattle", state: "WA", spotify_id: "77WeI8znTJNL9VgXxJVfOO")
  end

  describe "process_new_artist()" do
    it "returns 'success' type and <artist object> if valid" do
      result = ArtistCommander.process_new_artist(@base_artist)
      expect(result[:type]).to eq("success")
      expect(@base_artist.name).to eq("Nirvana")
    end

    it "returns 'error' type with relevant note if invalid" do
      result = ArtistCommander.process_new_artist(@base_invalid_city)
      expect(result[:type]).to eq("error")
      expect(result[:value]).to eq("Invalid City/State")
      expect(@base_artist.name).to eq(nil)
    end
  end
end
