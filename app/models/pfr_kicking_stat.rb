# == Schema Information
#
# Table name: pfr_kicking_stats
#
#  id                :integer          not null, primary key
#  year              :integer          not null
#  age               :integer
#  team              :string
#  pos               :string
#  uniform_number    :integer
#  g                 :integer
#  gs                :integer
#  fga1              :integer
#  fgm1              :integer
#  fga2              :integer
#  fgm2              :integer
#  fga3              :integer
#  fgm3              :integer
#  fga4              :integer
#  fgm4              :integer
#  fga5              :integer
#  fgm5              :integer
#  fga               :integer
#  fgm               :integer
#  fg_long           :integer
#  fg_perc           :float
#  xpa               :integer
#  xpm               :integer
#  xp_perc           :float
#  punt              :integer
#  punt_yds          :integer
#  punt_long         :integer
#  punt_blocked      :integer
#  punt_yds_per_punt :integer
#  player_id         :integer
#

class PfrKickingStat < ApplicationRecord
  belongs_to :player
  validates :year, uniqueness: { scope: :player_id }
  validates :year, :player_id, presence: true
end
