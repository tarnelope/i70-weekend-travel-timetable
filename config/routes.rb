Rails.application.routes.draw do
  get 'home', to: 'home#index'

  scope module: 'api' do
    namespace :v1 do
      resources :segment_snapshots, only: [:index]
    end
  end
  
  # constraints subdomain: 'api' do
  #   scope module: 'api' do
  #     namespace :v1 do
  #       resources :segment_snapshots, only: [:index]
  #     end
  #   end
  # end
end
