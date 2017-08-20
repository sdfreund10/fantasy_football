# == Schema Information
#
# Table name: pfr_approximate_value_stats
#
#  id        :integer          not null, primary key
#  player_id :integer
#  year      :integer
#  av        :integer
#

class PfrApproximateValueStat < ApplicationRecord
  belongs_to :player
  validates :year, uniqueness: { scope: :player_id }
  validates :year, :player_id, presence: true
end
