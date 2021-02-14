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
    all_states[state.to_sym] ? true : false
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

  # location is either in params, associated with current_user, or random.
  def self.browse_location(params, cur_user)
    if params
      Location.find(params)
    else
      if cur_user
        Location.find(cur_user.location_id)
      else
        Location.find(Artist.all.sample.location_id)
      end
    end
  end

  # process city/state given from artists index browser
  # returns a location or an error massage
  def self.process_city_state(city_state)
    #identify if all valid, all invalid, city only valid, state only valid.
    #return result of what is identified
    @result = { type: nil, value: nil }
    city = city_state[:city]
    state = city_state[:state]
    existing = self.get_existing({city: city, state: state})
    if existing
      @result[:type] = "success"
      @result[:value] = existing
    else
      if verify_state(state)
        if verify_city({city: city, state: state})
          location = Location.create(city: city, state: state)
          @result = { type: "success", value: location }
        else
          @result = { type: "error", value: "Invalid City" }
        end
      else
        @result = { type: "error", value: "Invalid State" }
      end
    end
    @result
  end
end
