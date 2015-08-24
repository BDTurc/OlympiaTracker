class CreateRoundResults < ActiveRecord::Migration
  def change
    create_table :round_results do |t|
      t.string :event_id
      t.string :tournament_id
      t.integer :fencer_id
      t.string :round_type
      t.integer :opponent_id
      t.string :opponent_first
      t.string :opponent_last
      t.integer :opponent_score
      t.integer :opponent_seed
      t.integer :score
      t.integer :seed
      t.string :victory
      t.integer :opponent_club_id
      t.integer :club_id

      t.timestamps
    end
  end
end
