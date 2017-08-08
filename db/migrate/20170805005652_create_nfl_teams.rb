class CreateNflTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :nfl_teams do |t|
      t.string :team_name, null: false
			t.integer :year_min
			t.integer :year_max
			t.integer :wins
			t.integer :losses
			t.integer :ties
			t.integer :win_loss_perc
			t.integer :av
			t.integer :years_playoffs
			t.integer :championships
			t.integer :championships_super_bowl
			t.integer :championships_conference
			t.integer :championships_division
    end
  end
end
