Rails.application.routes.draw do
  devise_for :users

  resources :home, only: 'index' do
    get 'admin', on: :collection
  end

  resources :bookings do
    get 'reserve_seats', on: :collection
    get 'make_booking', on: :collection
    get 'reports', on: :collection
  end

  root to: 'home#index'
end
