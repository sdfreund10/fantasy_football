class CreatePfrReceivingAndRushings < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_receiving_and_rushing_stats do |t|
			t.integer :year, null: false
			t.integer :age
			t.string :team, null: false
			t.string :pos
			t.integer :uniform_number
			t.integer :g
			t.integer :gs
			t.integer :rush_att
			t.integer :rush_yds
			t.integer :rush_td
			t.integer :rush_long
			t.float :rush_yds_per_att
			t.float :rush_yds_per_g
			t.float :rush_att_per_g
			t.integer :targets
			t.integer :rec
			t.integer :rec_yds
			t.integer :rec_yds_per_rec
			t.integer :rec_td
			t.integer :rec_long
			t.float :rec_per_g
			t.float :rec_yds_per_g
			t.float :catch_pct
			t.integer :yds_from_scrimmage
			t.integer :rush_receive_td
			t.integer :fumbles
			t.float :av
			t.boolean :pro_bowl
			t.boolean :all_pro
			t.references :player
			t.references :team
    end
  end
end
