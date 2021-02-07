require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "validations" do
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
  end
  describe "relationships" do
    it {should have_many :users}
  end
end
