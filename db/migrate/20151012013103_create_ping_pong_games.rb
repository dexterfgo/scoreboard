class CreatePingPongGames < ActiveRecord::Migration
  def change
    create_table :ping_pong_games do |t|
      t.date :date
      t.integer :player_one_score
      t.integer :player_two_score
      t.integer :player_one_id
      t.integer :player_two_id
    end
  end
end
