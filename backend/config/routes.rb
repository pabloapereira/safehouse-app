Rails.application.routes.draw do
  resources :survivors do
    get '/locations/full_survivor', to: 'locations#full_survivor', as: 'full_info'
    resources :locations
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
