class PingPongController < ApplicationController

  def home
    @ping_pong_games = PingPongGame.all
  end

  def new_game
    @ping_pong_game = PingPongGame.new
    @players = Player.all
  end

  def create_game
    @ping_pong_game = PingPongGame.new(game_params)

    if @ping_pong_game.save
      redirect_to ping_pong_path
    else
      @players = Player.all
      render :new_game
    end
  end

  private
    def game_params
      params.require(:ping_pong_game).permit(:date, :player_one_score, :player_two_score, :player_one_id, :player_two_id)
    end
end
