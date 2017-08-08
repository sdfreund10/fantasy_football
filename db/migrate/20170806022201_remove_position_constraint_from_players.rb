class RemovePositionConstraintFromPlayers < ActiveRecord::Migration[5.1]
  def up
  	change_column :players, :position, :string, null: true
  end

  def down
		change_column :players, :position, :string, null: false
  end
end
