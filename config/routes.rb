Rails.application.routes.draw do
  resources :locations
  devise_for :users, :controllers => { registrations: 'registrations'}
  root 'pages#home'
  resources :artists


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
