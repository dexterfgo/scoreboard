Rails.application.routes.draw do
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :players, except: :destroy

  # ping pong routes
  get 'ping_pong', to: 'ping_pong#home'
  get 'ping_pong/games', to: 'ping_pong#index_games'
  get 'ping_pong/games/new', to: 'ping_pong#new_game', as: 'new_ping_pong_game'

end
