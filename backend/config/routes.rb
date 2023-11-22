Rails.application.routes.draw do
  resources :survivors do
    get '/full_survivors', to: 'survivors#full_survivor', as: 'survivors_complete'
    get '/locations/full_survivor', to: 'locations#full_survivor', as: 'full_info'
    resources :locations
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
