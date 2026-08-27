Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      get "test", to: "test#index"

      resources :members
      resources :pastors
      resources :news
      resources :activities
      resources :appointments

      resources :baptisms do
        member do
          patch :confirm
        end
      end

      resources :weddings
      resources :departments
      resources :choirs
      resources :celulas
      resources :schedules
      resources :users
      resources :workers
      resources :settings

      get "dashboard",
          to: "dashboard#index"
    end
  end
end
