require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "validations" do
    it {should validate_presence_of :num_tracks}
    it {should validate_presence_of :spotify_id}
    it {should validate_presence_of :name}
    it {should validate_presence_of :artist_id}
    it {should validate_presence_of :release_date}
  end
end
