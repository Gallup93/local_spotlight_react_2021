class LocationHelper
  def self.find_by_city_state(location)
    Location.where("city = ? and state = ?", "#{location[:city]}", "#{location[:state]}" )
  end
end
