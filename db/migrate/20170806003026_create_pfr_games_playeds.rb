class CreatePfrGamesPlayeds < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_games_playeds do |t|
    	t.integer :year
    	t.integer :age
    	t.string :team
    	t.integer :pos
    	t.integer :uniform_number
    	t.integer :g
    	t.integer :gs
    	t.integer :av
    	t.references :player
    end
  end
end
