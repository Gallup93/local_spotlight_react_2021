require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
  end
  describe "relationships" do
    it {should belong_to :location}
  end
end
