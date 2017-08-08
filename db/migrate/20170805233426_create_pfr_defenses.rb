class CreatePfrDefenses < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_defenses do |t|
		t.integer :year, null: false
		t.integer :age
		t.string :team, null: false
		t.string :pos
		t.integer :uniform_number
		t.integer :g, default: 0
		t.integer :gs, default: 0
		t.integer :def_int, default: 0
		t.integer :def_int_yds, default: 0
		t.integer :def_int_td, default: 0
		t.integer :def_int_long, default: 0
		t.integer :pass_defended, default: 0
		t.integer :fumbles_forced, default: 0
		t.integer :fumbles, default: 0
		t.integer :fumbles_rec, default: 0
		t.integer :fumbles_rec_yds, default: 0
		t.integer :fumbles_rec_td, default: 0
		t.float :sacks, default: 0
		t.integer :tackles_solo, default: 0
		t.integer :tackles_assists, default: 0
		t.integer :safety_md, default: 0
		t.integer :av
		t.integer :type
		t.references :player
    end
  end
end
