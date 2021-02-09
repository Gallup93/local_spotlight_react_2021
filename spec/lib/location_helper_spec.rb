require 'rails_helper'
require './lib/location_helper'

RSpec.describe "Location Helper" do

  it "finds existing location in DB by city/state" do
    location = { city: "Denver", state: "CO"}

    found_location = LocationHelper.find_by_city_state(location)

    expect(found_location[0].city).to eq("Denver")
  end

  it "verifies valid location by city/state" do
    location = { city: "Rockford", state: "IL"}

    result = LocationHelper.validate_city_state(location)

    expect(result).to eq(true)
  end
end
