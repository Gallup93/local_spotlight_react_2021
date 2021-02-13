require 'rails_helper'
require './lib/location_helper'

RSpec.describe "Location Helper" do

  describe "get_existing()" do
    it "gets existing location from db" do
      city_state = { city: "rockford", state: "IL"}
      existing = LocationHelper.get_existing(city_state)
      expect(existing.city).to eq("rockford")
    end

    it "returns nil for non existing location" do
      city_state = { city: "reno", state: "NV"}
      existing = LocationHelper.get_existing(city_state)
      expect(existing).to eq(nil)
    end
  end

  describe "check_if_exists()" do
    it "returns true if existing" do
      city_state = { city: "rockford", state: "IL"}
      result = LocationHelper.check_if_exists(city_state)
      expect(result).to eq(true)
    end

    it "returns false if non-existing" do
      city_state = { city: "reno", state: "NV"}
      result = LocationHelper.check_if_exists(city_state)
      expect(result).to eq(false)
    end
  end

  describe "verify_state()" do
    it "returns true if valid" do
      state = :MA
      result = LocationHelper.verify_state(state)
      expect(result).to eq(true)
    end

    it "returns false if invalid" do
      state = :MG
      result = LocationHelper.verify_state(state)
      expect(result).to eq(false)
    end
  end

  describe "verify_city()" do
    it "returns true if valid" do
      city_state = { city: "framingham", state: "MA" }
      result = LocationHelper.verify_city(city_state)
      expect(result).to eq(true)
    end

    it "returns false if invalid" do
      city_state = { city: "framingFord", state: "MA" }
      result = LocationHelper.verify_city(city_state)
      expect(result).to eq(false)
    end
  end

  describe "create_location()" do
    it "returns new lcoation_id if valid" do
      city_state = {city: "Beloit", state: "WI"}
      result = LocationHelper.create_location(city_state)
      expect(result).to eq(Location.last.id)
    end

    it "returns error message if invalid" do
      city_state = {city: "", state: "WI"}
      result = LocationHelper.create_location(city_state)
      expect(result).to eq(nil)
    end
  end

  describe "process_city_state()" do
    it "if valid will return type: 'success', value: <Location object>" do
      city_state = { city: "Rockford", state: "IL" }
      result = LocationHelper.process_city_state(city_state)
      expect(result[:type]).to eq("success")
      expect(result[:value][:id]).to_not eq(nil)
    end

    it "invalid city returns => { type: 'error', value: 'city invalid' }" do
      city_state = { city: "Screw City", state: "IL" }
      result = LocationHelper.process_city_state(city_state)
      expect(result[:type]).to eq("error")
      expect(result[:value]).to eq("Invalid City")
    end

    it "invalid state returns => { type: 'error', value: 'state invalid' }" do
      city_state = { city: "Rockford", state: "Illinois" }
      result = LocationHelper.process_city_state(city_state)
      expect(result[:type]).to eq("error")
      expect(result[:value]).to eq("Invalid State")
    end
  end
end
