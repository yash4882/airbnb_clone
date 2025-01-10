Rails.application.routes.draw do
  
  root "home#index"

  devise_for :users

  devise_scope :user do
    delete 'users/delete_account', to: 'devise/registrations#destroy', as: :delete_account
  end

  namespace :api do
    resources :wishlists, only: [:create, :destroy]
  end

  resources :properties, only: [:show] do
    resources :bookings, only: [:new]
  end

  get '/search', to: "search#index"

  resources :booking_payments, only: [:create]

  get "booking_payments/success", to: "booking_payments#success"

  resources :wishlists, only: [:index]

  resource :profile, only: [:edit, :update]

  resource :email, only: [:edit, :update]
  
  resource :password, only: [:edit, :update]

  resources :securities, only: [:index]

  resources :reservations, only: [:index] do
    resources :reviews, only: [:new, :create]
  end

  namespace :owner do
    resources :properties do
      member do
        patch 'update_location'
        patch 'update_amenities'
        patch 'add_images'
        delete 'remove_image'
      end
    end
    resources :reservations, only: [:index]
  end

end
