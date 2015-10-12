class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end
  
  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path
    else
      render :new
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to @player
    else
      render :edit
    end
  end

  private
    def player_params
      params.require(:player).permit(:name)
    end
end
