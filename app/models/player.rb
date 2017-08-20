# == Schema Information
#
# Table name: players
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  position     :string
#  hand         :string
#  height       :integer
#  weight       :integer
#  current_team :string
#  dob          :date             not null
#  birth_city   :string
#  birth_state  :string
#  college      :string
#  wgt_av       :integer
#  wgt_av_rank  :integer
#

class Player < ApplicationRecord
	validates :dob, presence: true,
									uniqueness: { scope: [:first_name, :last_name] }
	validates :first_name, :last_name, presence: true

  def team
    Team.where(team_name: current_team)
  end

	def self.create_or_update(params)
		player = find_or_initialize_by(params.slice(:first_name, :last_name, :dob))
		player.update(params)
		player
	end
end
