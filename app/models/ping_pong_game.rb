class PingPongGame < ActiveRecord::Base
  validates :date, presence: true
  validates :player_one_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a non-negative integer" }
  validates :player_two_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "must be a non-negative integer" }
  validate :players_are_different

  belongs_to :player_one, class_name: 'Player', foreign_key: 'player_one_id'
  belongs_to :player_two, class_name: 'Player', foreign_key: 'player_two_id'

  def players_are_different
    self.errors.add(:base, 'The two players must be different') if self.player_one_id == self.player_two_id
  end

end
