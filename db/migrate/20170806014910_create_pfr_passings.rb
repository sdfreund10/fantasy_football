class CreatePfrPassings < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_passing_stats do |t|
    	t.integer :year, null: false
    	t.integer :age
    	t.string :team
    	t.string :pos
    	t.integer :uniform_number
    	t.integer :g
    	t.integer :gs
    	t.integer :qb_rec
    	t.float :pass_cmp
    	t.integer :pass_att
    	t.integer :pass_cmp_perc
    	t.integer :pass_yds
    	t.integer :pass_td
    	t.float :pass_td_perc
    	t.integer :pass_int
    	t.float :pass_int_perc
    	t.integer :pass_long
    	t.float :pass_yds_per_att
    	t.float :pass_adj_yds_per_att
    	t.float :pass_yds_per_cmp
    	t.float :pass_yds_per_g
    	t.float :pass_rating
    	t.float :qbr
    	t.integer :pass_sacked
    	t.integer :pass_sacked_yds
    	t.float :pass_net_yds_per_att
    	t.float :pass_adj_net_yds_per_att
    	t.float :pass_sacked_perc
    	t.integer :comebacks
    	t.integer :gwd
    	t.integer :av
    	t.references :player
    end
  end
end
