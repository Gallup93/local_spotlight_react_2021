require 'artist_stitcher'

class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]

  # GET /artists or /artists.json
  def index
    @location = set_location
    @new_location = Location.new
    @artists = compile_artists(@location)
    @selected_artist = select_artist(@artists)
  end

  # GET /artists/1 or /artists/1.json
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists or /artists.json
  def create
    base_artist = Artist.new(artist_params)
    stitched_json = ArtistStitcher.new(base_artist)
    parsed_json = JSON.parse(stitched_json.artist)
    @artist = Artist.new(parsed_json)

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: "Artist was successfully created." }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1 or /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: "Artist was successfully updated." }
        format.json { render :show, status: :ok, location: @artist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1 or /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url, notice: "Artist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_params
      params.permit(:city, :state, :spotify_id, :name, :followers, :popularity, :genres, :images)
    end

    def set_location
      if !params['select_location']
        if current_user
          Location.find(current_user.location_id)
        else
          Location.all.sample
        end
      else
        Location.find(params['select_location'])
      end
    end

    def compile_artists(location)
      Artist.where("state = ? and city = ?", "#{location.state}", "#{location.city}" )
    end

    def select_artist(artists)
      if params["selected_id"]
        Artist.find(params["selected_id"]).spotify_id
      else
        if !artists.empty?
          artists.sample.spotify_id
        else
          "no artists"
        end
      end
    end
end
