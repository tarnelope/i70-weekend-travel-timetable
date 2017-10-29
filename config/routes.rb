Rails.application.routes.draw do
  get 'home', to: 'home#index'

  resources :segment_snapshots
end
