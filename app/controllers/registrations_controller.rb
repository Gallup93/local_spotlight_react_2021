class RegistrationsController < Devise::RegistrationsController
  before_action :add_location, only: :create

  private

  def sign_up_params
    params.require(:user).permit( :email, :password, :password_confirmation,
    :city, :state, :location_id)
  end
  
  def account_update_params
    # For updates we make sure to let the Company ID pass through or the form will
    # generate a new company every time we edit our details
    params.require(:user).permit(:email,:password, :password_confirmation, :current_password,
    :city, :state, :location_id)
  end

  def add_location
    location = Location.where('city = ? and state = ?', "#{params['user']['city']}", "#{params['user']['state']}" )
    if location.count > 0
      params['user']['location_id'] = location[0].id
    else
      # refactor this to validate the location is valid first
      new_location = Location.create(city: params['user']['city'],state: params['user']['state'])
      params['user']['location_id'] = new_location.id
    end
  end
end
