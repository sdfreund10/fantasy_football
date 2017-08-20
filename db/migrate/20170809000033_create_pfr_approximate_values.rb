class CreatePfrApproximateValues < ActiveRecord::Migration[5.1]
  def change
    create_table :pfr_approximate_value_stats do |t|
      t.references :player
      t.integer :year
      t.integer :av
    end

    remove_column(:pfr_passing_stats, :av, :integer)
    remove_column(:pfr_kicking_stats, :av, :integer)
    remove_column(:pfr_return_stats, :av, :integer)
    remove_column(:pfr_games_played_stats, :av, :integer)
    remove_column(:pfr_receiving_and_rushing_stats, :av, :integer)
    remove_column(:pfr_defense_stats, :av, :integer)
  end
end
