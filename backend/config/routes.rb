Rails.application.routes.draw do
  resources :survivors do
    resources :locations
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
