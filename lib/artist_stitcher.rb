class ArtistStitcher
  require 'spotify_api_helper'

  def initialize(artist)
    return stitch_artist(artist)
  end

  def stitch_artist(artist)
    spotify_object = SpotifyApiHelper.new.get_artist_object(artist.spotify_id)
    if spotify_object
      artist.name = spotify_object["name"]
      artist.followers = spotify_object["followers"]["total"]
      artist.genres = spotify_object["genres"]
      artist.popularity = spotify_object["popularity"]
      artist.images = spotify_object["images"].map{|image| image["url"]}

      artist.save
    else
      puts "inalid spotify id"
      false
    end
  end

end
