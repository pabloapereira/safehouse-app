Rails.application.routes.draw do
  resources :survivors do
    get '/locations/last', to: 'locations#last_location', as: 'last'
    resources :locations
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
