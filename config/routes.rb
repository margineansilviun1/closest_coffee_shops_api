Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # API JSON
  namespace :api do
    namespace :v1 do
      get "coffee_shops/closest", to: "coffee_shops#closest"
    end
  end
end
