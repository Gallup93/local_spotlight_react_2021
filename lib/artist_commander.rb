require 'location_helper'
require 'spotify_api_helper'

class ArtistCommander

  # validates given base_artist. returns hash with a :type code and :value
  # :type => ("error" or "success"), :value => ("<error message>" or <artist object>)
  def self.process_new_artist(base_artist)
    @artist = base_artist
    @result = { type: nil, value: nil }
    @city_state = { city: base_artist.city, state: base_artist.state }
    validate_artist
    @result
  end

  # validates submitted :city, :state, :spotify_id. handles errors.
  def self.validate_artist
    if handle_artist_location
      if artist_already_exists?(@artist.spotify_id)
        @result[:type] = "error"
        @result[:value] = "Artist already exists"
      else
        spotify_object = get_spotify_artist_object(@artist.spotify_id)
        if spotify_object["name"]
          stitch(spotify_object)
          @result[:type] = "success"
          @result[:value] = @artist.to_json
        else
          @result[:type] = "error"
          @result[:value] = "Invalid Spotify ID"
        end
      end
    else
      @result[:type] = "error"
      @result[:value] = "Invalid City/State"
    end
  end

  # checks for existing location in db
  # if no matches, it checks if city/state are valid
  # if valid, it creates new location and returns true (else false)
  def self.handle_artist_location
    city_state = { city: @artist.city, state: @artist.state }
    exists = LocationHelper.get_existing(city_state)
    if exists
      @artist.location_id = exists.id
    else
      if LocationHelper.verify_state(city_state[:state].to_sym) && LocationHelper.verify_city(city_state)
        location_id = LocationHelper.create_location(city_state)
        @artist.location_id = location_id
        true
      else
        false
      end
    end
  end

  # returns first item in array of artists that match given spotify_id
  def self.get_artist_by_spotify_id(spotify_id)
    Artist.all.select{|artist| artist.spotify_id == spotify_id}[0]
  end

  # returns true false if artist with matching spotify_id exists in db
  def self.artist_already_exists?(spotify_id)
    get_artist_by_spotify_id(spotify_id) ? true : false
  end

  # hits Spotify API and returns an aritst object
  def self.get_spotify_artist_object(spotify_id)
    SpotifyApiHelper.new.get_artist_object(spotify_id)
  end

  # maps relevant spotify_object attributes to Artist object
  def self.stitch(spotify_object)
    @artist.name = spotify_object["name"]
    @artist.followers = spotify_object["followers"]["total"]
    @artist.genres = spotify_object["genres"]
    @artist.popularity = spotify_object["popularity"]
    @artist.images = spotify_object["images"].map{|image| image["url"]}
  end

  def self.set_selected_artist(artists, params = nil)
    if params
      Artist.find(params)
    else
      if !artists.empty?
        artists.first
      else
        "no artists"
      end
    end
  end

  def self.sort_artists(artists, key = nil)
    case key
    when "alpha"
      artists.order('LOWER(name)')
    when "followers"
      artists.order(followers: :desc)
    when "date-added"
      artists.order(created_at: :desc)
    else
      artists.order(created_at: :desc)
    end
  end
end
