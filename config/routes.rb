Rails.application.routes.draw do
  resources :pro_football_references
  resources :workers

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
