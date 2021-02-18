require 'artist_commander'
require 'location_helper'
require 'json'

class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[ show edit update destroy ]

  # GET /artists or /artists.json
  def index
    @location = set_location
    @new_location = Location.new
    @artists = compile_artists(@location)
    @selected_artist = Artist.all.sample
    @selected_spotify_id = select_artist(@artists, params['select_artist'])
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
    @params = format_params(artist_params)
    @artist = Artist.new(@params)
    @result = ArtistCommander.process_new_artist(@artist)
    if @result[:type] == "error"
      flash[:error] = @result[:value]
      redirect_to '/artists/new'
    else
      @artist.save
      respond_to do |format|
        @artist.save
        format.html { redirect_to @artist, notice: "Artist was successfully created." }
        format.json { render :show, status: :created, location: @artist }
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
  # use artist_params to pre-format base_artist's city/state
  def format_params(artist_params)
    formatted_city = artist_params[:city].downcase
    formatted_state = artist_params[:state].upcase
    spotify_id = artist_params[:spotify_id]
    { city: formatted_city, state: formatted_state, spotify_id: spotify_id }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_artist
    @artist = Artist.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def artist_params
    params.permit(:city, :state, :spotify_id, :name, :followers, :popularity, :genres, :images)
  end

  # temporary method to set artists#index browse location
  def set_location
    LocationHelper.browse_location(params['select_location'], current_user)
  end

  # temporary method to compile artists from given location for artists#index
  def compile_artists(location)
    Artist.where("state = ? and city = ?", "#{location.state}", "#{location.city}" )
  end

  # temporary method for selecting current artist highlighted in artists#index
  def select_artist(artists, params = nil)
    params ? ArtistCommander.select_spotify_id(artists, params) : ArtistCommander.select_spotify_id(artists)
  end
end
