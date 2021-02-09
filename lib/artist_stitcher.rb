class ArtistStitcher
  require 'spotify_api_helper'
  require 'json'

  attr_reader :artist

  def initialize(artist)
    @artist = artist
    stitch_artist(artist)
  end

  def stitch_artist(artist)
    spotify_object = SpotifyApiHelper.new.get_artist_object(artist.spotify_id)
    if spotify_object
      @artist.name = spotify_object["name"]
      @artist.followers = spotify_object["followers"]["total"]
      @artist.genres = spotify_object["genres"]
      @artist.popularity = spotify_object["popularity"]
      @artist.images = spotify_object["images"].map{|image| image["url"]}
      @artist = @artist.to_json
    else
      puts "inalid spotify id"
      false
    end
  end

end
