class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :position, null: false
    	t.string :hand
    	t.integer :height
    	t.integer :weight
    	t.string :current_team
    	t.date :dob, null: false
    	t.string :birth_city
    	t.string :birth_state
    	t.string :college
    	t.integer :wgt_av
    	t.integer :wgt_av_rank
    end
  end
end
