class CreatePfrFantasyStats < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_fantasy_stats do |t|
      t.integer :year, null: false
      t.string :team
      t.string :fantasy_pos
      t.integer :age
      t.integer :g
      t.integer :gs
      t.integer :pass_cmp
      t.integer :pass_att
      t.integer :pass_yds
      t.integer :pass_td
      t.integer :pass_int
      t.integer :rush_att
      t.integer :rush_yds
      t.float :rush_yds_per_att
      t.integer :rush_td
      t.integer :targets
      t.integer :rec
      t.integer :rec_yds
      t.float :rec_yds_per_rec
      t.integer :rec_td
      t.integer :fantasy_points
      t.float :draftkings_points
      t.float :fanduel_points
      t.integer :vbd
      t.integer :fantasy_rank_pos
      t.integer :fantasy_rank_overall
      t.references :player
    end
  end
end
