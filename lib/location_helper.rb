class LocationHelper
  # returns first item in array of locations that match given :city and :state
  def self.get_existing(city_state)
    Location.where("city = ? AND state = ?", city_state[:city], city_state[:state])[0]
  end

  # returns true if Location exists in db with same :city and :state
  def self.check_if_exists(city_state)
    get_existing(city_state) ? true : false
  end

  # utilizes CityState gem to validate (bool) given state abbreviation
  # (state abbreviation must be uppercased and symolbized)
  def self.verify_state(state)
    all_states = CS.get(:us)
    all_states[state] ? true : false
  end

  # utilized CityState gem to validate (bool) a given :city in a :state
  def self.verify_city(city_state)
    state_abrv = city_state[:state]
    city_full = city_state[:city]
    cities = CS.get(:us, state_abrv)

    cities.one? { |city| city.downcase == city_full.downcase }
  end

  # saves given city_state as new Location. returns location_id or error note
  def self.create_location(city_state)
    location = Location.new(city: city_state[:city], state: city_state[:state])
    location.save ? location.id : nil
  end
end
