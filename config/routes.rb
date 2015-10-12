Rails.application.routes.draw do
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :players, except: :destroy

  # ping pong routes
  get 'ping_pong', to: 'ping_pong#home', as: 'ping_pong'
  get 'ping_pong/games', to: redirect('ping_pong'), as: 'ping_pong_alt'
  get 'ping_pong/games/new', to: 'ping_pong#new_game', as: 'new_ping_pong_game'
  post 'ping_pong/games', to: 'ping_pong#create_game', as: 'ping_pong_games'

end
