class CreatePfrReturns < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_return_stats do |t|
      t.integer :year
      t.integer :age
      t.string :team
      t.string :pos
      t.integer :uniform_number
      t.integer :g
      t.integer :gs
      t.integer :punt_ret
      t.integer :punt_ret_yds
      t.integer :punt_ret_td
      t.integer :punt_ret_long
      t.float :punt_ret_yds_per_ret
      t.integer :kick_ret
      t.integer :kick_ret_yds
      t.integer :kick_ret_td
      t.integer :kick_ret_long
      t.float :kick_ret_yds_per_ret
      t.integer :all_purpose_yds
      t.integer :av
      t.references :player
    end
  end
end
