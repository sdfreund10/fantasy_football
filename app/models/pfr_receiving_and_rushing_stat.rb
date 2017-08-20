# == Schema Information
#
# Table name: pfr_receiving_and_rushing_stats
#
#  id                 :integer          not null, primary key
#  year               :integer          not null
#  age                :integer
#  team               :string           not null
#  pos                :string
#  uniform_number     :integer
#  g                  :integer
#  gs                 :integer
#  rush_att           :integer
#  rush_yds           :integer
#  rush_td            :integer
#  rush_long          :integer
#  rush_yds_per_att   :float
#  rush_yds_per_g     :float
#  rush_att_per_g     :float
#  targets            :integer
#  rec                :integer
#  rec_yds            :integer
#  rec_yds_per_rec    :integer
#  rec_td             :integer
#  rec_long           :integer
#  rec_per_g          :float
#  rec_yds_per_g      :float
#  catch_pct          :float
#  yds_from_scrimmage :integer
#  rush_receive_td    :integer
#  fumbles            :integer
#  pro_bowl           :boolean
#  all_pro            :boolean
#  player_id          :integer
#  team_id            :integer
#

class PfrReceivingAndRushingStat < ApplicationRecord
  belongs_to :player
  validates :year, uniqueness: { scope: :player_id }
  validates :year, :player_id, presence: true
end
