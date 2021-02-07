require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe "validations" do  
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :spotify_id}
    it {should validate_presence_of :name}
    it {should validate_presence_of :followers}
    it {should validate_presence_of :popularity}
  end
end
