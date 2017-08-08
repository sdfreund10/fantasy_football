class Player < ApplicationRecord
	validates :dob, presence: true,
									uniqueness: { scope: [:first_name, :last_name] }
	validates :first_name, :last_name, presence: true

	def self.create_or_update(params)
		player = find_or_initialize_by(params.slice(:first_name, :last_name, :dob))
		player.update(params)
		player
	end
end
