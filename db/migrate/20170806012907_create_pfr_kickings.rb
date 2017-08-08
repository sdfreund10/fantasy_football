class CreatePfrKickings < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_kickings do |t|
			t.integer :year, null: false
			t.integer :age
			t.string :team
			t.string :pos
			t.integer :uniform_number
			t.integer :g
			t.integer :gs
			t.integer :fga1
			t.integer :fgm1
			t.integer :fga2
			t.integer :fgm2
			t.integer :fga3
			t.integer :fgm3
			t.integer :fga4
			t.integer :fgm4
			t.integer :fga5
			t.integer :fgm5
			t.integer :fga
			t.integer :fgm
			t.integer :fg_long
			t.float :fg_perc
			t.integer :xpa
			t.integer :xpm
			t.float :xp_perc
			t.integer :punt
			t.integer :punt_yds
			t.integer :punt_long
			t.integer :punt_blocked
			t.integer :punt_yds_per_punt
			t.integer :av
			t.references :player
    end
  end
end
