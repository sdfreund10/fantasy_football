# == Schema Information
#
# Table name: pfr_defense_stats
#
#  id              :integer          not null, primary key
#  year            :integer          not null
#  age             :integer
#  team            :string           not null
#  pos             :string
#  uniform_number  :integer
#  g               :integer          default(0)
#  gs              :integer          default(0)
#  def_int         :integer          default(0)
#  def_int_yds     :integer          default(0)
#  def_int_td      :integer          default(0)
#  def_int_long    :integer          default(0)
#  pass_defended   :integer          default(0)
#  fumbles_forced  :integer          default(0)
#  fumbles         :integer          default(0)
#  fumbles_rec     :integer          default(0)
#  fumbles_rec_yds :integer          default(0)
#  fumbles_rec_td  :integer          default(0)
#  sacks           :float            default(0.0)
#  tackles_solo    :integer          default(0)
#  tackles_assists :integer          default(0)
#  safety_md       :integer          default(0)
#  type            :integer
#  player_id       :integer
#

class PfrDefenseStat < ApplicationRecord
  belongs_to :player
	validates :year, uniqueness: { scope: :player_id }
	validates :year, :player_id, presence: true
end
