# == Schema Information
#
# Table name: nfl_teams
#
#  id                       :integer          not null, primary key
#  team_name                :string           not null
#  year_min                 :integer
#  year_max                 :integer
#  wins                     :integer
#  losses                   :integer
#  ties                     :integer
#  win_loss_perc            :integer
#  av                       :integer
#  years_playoffs           :integer
#  championships            :integer
#  championships_super_bowl :integer
#  championships_conference :integer
#  championships_division   :integer
#

class NflTeam < ApplicationRecord
  def players
    Player.where(current_team: team_name)
  end
end
