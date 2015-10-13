class PingPongController < ApplicationController

  def home
    @ping_pong_games = PingPongGame.last(10).reverse
    @power_ranks = Player.all.map { |player| [player.name, power_rank(player.id)] }
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

    def pvp_rank(player_a_id, player_b_id)
      @player_a = Player.find(player_a_id)
      @player_b = Player.find(player_b_id)

      games = (@player_a.ping_pong_games & @player_b.ping_pong_games).uniq
    
      if games.count < 5
        return 0
      else
        wins = 0.0

        games.each do |g|
          if g.player_one_id == @player_a.id and g.player_one_score > g.player_two_score
            wins += 1
          elsif g.player_two_id == @player_a.id and g.player_one_score < g.player_two_score
            wins += 1
          end
        end

        win_percentage = wins / games.count

        return win_percentage
      end
    end

    def power_rank_chain(players)
      factor = 1
      if players.length > 2
        for i in 0..(players.length - 2)
          factor = factor * pvp_rank(players[i].id,players[i+1].id)
        end
      end
      puts factor
      return factor
    end

    def power_rank(player_id)
      @player = Player.find(player_id)

      opponents = Player.where.not(id: player_id)

      rank = 0.0

      opponents.permutation.each do |perm|
        rank = rank + pvp_rank(@player.id, perm[0].id)*power_rank_chain(perm)
      end


      return rank*100
    end
end
