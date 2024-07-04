Rails.application.routes.draw do
  root 'home#index'
  resources :compromissos

  get "up" => "rails/health#show", as: :rails_health_check

end
