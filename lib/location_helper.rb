class LocationHelper
  def self.find_by_city_state(location)
    Location.where("city = ? and state = ?", "#{location[:city]}", "#{location[:state]}" )
  end
  def self.validate_city_state(location)
    state_abrv = location[:state].to_sym.upcase
    all_states = CS.get(:us)
    state_name = all_states[state_abrv]

    if state_name
      cities = CS.get(:us, state_abrv)
      if cities.find {|city| city.downcase == location[:city].downcase}
        true
      else
        false
      end
    else
      return false
    end
  end

  private

end
