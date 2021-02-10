require 'location_helper'

class RegistrationsController < Devise::RegistrationsController
  before_action :add_location, only: :create

  private

  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation,
    :city, :state, :location_id)
  end

  def account_update_params
    params.require(:user).permit(:email,:password, :password_confirmation, :current_password,
    :city, :state, :location_id)
  end

  def add_location
    city_state = { city: params['user']['city'], state: params['user']['state'] }
    location = LocationHelper.find_by_city_state(city_state)[0]

    if location
      params['user']['location_id'] = location.id
    elsif LocationHelper.validate_city_state(city_state)
      new_location = Location.create(city: city_state[:city], state: city_state[:state])
      params['user']['location_id'] = new_location.id
    end
  end
end
