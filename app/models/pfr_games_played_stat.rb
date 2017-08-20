# == Schema Information
#
# Table name: pfr_games_played_stats
#
#  id             :integer          not null, primary key
#  year           :integer
#  age            :integer
#  team           :string
#  pos            :integer
#  uniform_number :integer
#  g              :integer
#  gs             :integer
#  player_id      :integer
#

class PfrGamesPlayedStat < ApplicationRecord
	validates :year, uniqueness: { scope: :player_id }
	validates :year, :player_id, presence: true
end
