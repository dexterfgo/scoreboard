class Player < ActiveRecord::Base
  validates :name, presence: true

  has_many :ping_pong_games_as_player_one, class_name: 'PingPongGame', foreign_key: :player_one_id
  has_many :ping_pong_games_as_player_two, class_name: 'PingPongGame', foreign_key: :player_two_id

  def ping_pong_games
    (ping_pong_games_as_player_one.all + ping_pong_games_as_player_two.all).uniq
  end

end

