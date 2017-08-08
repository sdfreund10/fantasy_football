class PfrReceivingAndRushing < ApplicationRecord
	validates :year, uniqueness: { scope: :player_id }
	validates :year, :player_id, presence: true
end
