class SpotifyApiHelper
  attr_reader :req_token
  def initialize
    @req_token = request_auth_token
  end
  def request_auth_token
    credentials = ENV['SPOTIFY_CLIENT_ID'] + ':' + ENV['SPOTIFY_CLIENT_SECRET']
    encoded_credentials = Base64.encode64(credentials).gsub("\n","")

    url = URI("https://accounts.spotify.com/api/token")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Basic #{encoded_credentials}"
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request.body = "grant_type=client_credentials"

    response = https.request(request)

    JSON.parse(response.read_body)["access_token"]
  end

  def get_artist_object(id)
    url = URI("https://api.spotify.com/v1/artists/#{id}")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{@req_token}"

    response = https.request(request)

    JSON.parse(response.read_body)
  end

  def get_artist_albums(spotify_id)
    url = URI("https://api.spotify.com/v1/artists/#{spotify_id}/albums?limit=50&include_groups=album,single,compilation&market=US")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{@req_token}"

    response = https.request(request)

    JSON.parse(response.read_body)
  end
end
