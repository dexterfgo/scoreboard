class Player < ActiveRecord::Base
  validates :name, presence: true

  has_many :ping_pong_games

end

