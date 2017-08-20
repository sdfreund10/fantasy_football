# == Schema Information
#
# Table name: pfr_fantasy_stats
#
#  id                   :integer          not null, primary key
#  year                 :integer          not null
#  team                 :string
#  fantasy_pos          :string
#  age                  :integer
#  g                    :integer
#  gs                   :integer
#  pass_cmp             :integer
#  pass_att             :integer
#  pass_yds             :integer
#  pass_td              :integer
#  pass_int             :integer
#  rush_att             :integer
#  rush_yds             :integer
#  rush_yds_per_att     :float
#  rush_td              :integer
#  targets              :integer
#  rec                  :integer
#  rec_yds              :integer
#  rec_yds_per_rec      :float
#  rec_td               :integer
#  fantasy_points       :integer
#  draftkings_points    :float
#  fanduel_points       :float
#  vbd                  :integer
#  fantasy_rank_pos     :integer
#  fantasy_rank_overall :integer
#  player_id            :integer
#

class PfrFantasyStat < ApplicationRecord
  belongs_to :player
  validates :year, uniqueness: { scope: :player_id }
  validates :year, :player_id, presence: true
end
