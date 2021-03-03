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

  describe "Processing artist submissions" do
    it "returns 'success' type and <artist object> if valid" do
      result = ArtistCommander.process_new_artist(@base_artist)
      expect(result[:type]).to eq("success")
      expect(@base_artist.name).to eq("Nirvana")
    end

    it "returns 'error' type with relevant note if invalid city/state" do
      result = ArtistCommander.process_new_artist(@base_invalid_city)
      expect(result[:value]).to eq("Invalid City/State")
      expect(@base_artist.name).to eq(nil)
    end

    it "returns 'error' type with relevant note if invalid spotify id" do
      result = ArtistCommander.process_new_artist(@base_invalid_spot_id)
      expect(result[:value]).to eq("Invalid Spotify ID")
      expect(@base_artist.name).to eq(nil)
    end

    it "returns 'error' type with relevant note if existing spotify id" do
      result = ArtistCommander.process_new_artist(@base_existing_spot_id)
      expect(result[:value]).to eq("Artist already exists")
      expect(@base_artist.name).to eq(nil)
    end
  end

  describe "setting a selected_artist" do
    it "sets artist when params (artist_id) provided" do
      artists = Artist.where('city = ?', 'chicago')
      result = ArtistCommander.set_selected_artist(artists, 8)
      expect(result.name).to eq("Ratboys")
    end

    it "returns error note when no artists and no params" do
      result = ArtistCommander.set_selected_artist(artists = [], params = nil)
      expect(result).to eq("no artists")
    end

    it "defaults to first artist in array when no params given" do
      artists = Artist.where('city = ?', 'chicago')
      result = ArtistCommander.set_selected_artist(artists, params = nil)
      expect(result.name).to eq("Beach Bunny")
    end
  end
end
