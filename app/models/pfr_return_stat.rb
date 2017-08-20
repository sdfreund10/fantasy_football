# == Schema Information
#
# Table name: pfr_return_stats
#
#  id                   :integer          not null, primary key
#  year                 :integer
#  age                  :integer
#  team                 :string
#  pos                  :string
#  uniform_number       :integer
#  g                    :integer
#  gs                   :integer
#  punt_ret             :integer
#  punt_ret_yds         :integer
#  punt_ret_td          :integer
#  punt_ret_long        :integer
#  punt_ret_yds_per_ret :float
#  kick_ret             :integer
#  kick_ret_yds         :integer
#  kick_ret_td          :integer
#  kick_ret_long        :integer
#  kick_ret_yds_per_ret :float
#  all_purpose_yds      :integer
#  player_id            :integer
#

class PfrReturnStat < ApplicationRecord
  belongs_to :player
  validates :year, uniqueness: { scope: :player_id }
  validates :year, :player_id, presence: true
end
