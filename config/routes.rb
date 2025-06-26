# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :competicao 
      resources :usuario
      resources :equipe
      resources :jogo

    end
  end
end
