# == Schema Information
#
# Table name: pfr_passing_stats
#
#  id                       :integer          not null, primary key
#  year                     :integer          not null
#  age                      :integer
#  team                     :string
#  pos                      :string
#  uniform_number           :integer
#  g                        :integer
#  gs                       :integer
#  qb_rec                   :integer
#  pass_cmp                 :float
#  pass_att                 :integer
#  pass_cmp_perc            :integer
#  pass_yds                 :integer
#  pass_td                  :integer
#  pass_td_perc             :float
#  pass_int                 :integer
#  pass_int_perc            :float
#  pass_long                :integer
#  pass_yds_per_att         :float
#  pass_adj_yds_per_att     :float
#  pass_yds_per_cmp         :float
#  pass_yds_per_g           :float
#  pass_rating              :float
#  qbr                      :float
#  pass_sacked              :integer
#  pass_sacked_yds          :integer
#  pass_net_yds_per_att     :float
#  pass_adj_net_yds_per_att :float
#  pass_sacked_perc         :float
#  comebacks                :integer
#  gwd                      :integer
#  player_id                :integer
#

class PfrPassingStat < ApplicationRecord
  belongs_to :player
  validates :year, uniqueness: { scope: :player_id }
  validates :year, :player_id, presence: true
end
