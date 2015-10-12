class PingPongController < ApplicationController

  def home
    @ping_pong_games = PingPongGame.all
  end

  def new_game
    @ping_pong_game = PingPongGame.new
    @players = Player.all
  end


end
