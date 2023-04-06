Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/static/landing_page')
  get 'static/landing_page'
  get 'static/dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
