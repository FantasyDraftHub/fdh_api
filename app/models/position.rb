# == Schema Information
#
# Table name: positions
#
#  id        :bigint           not null, primary key
#  key       :string
#  name      :string
#  league_id :integer
#
# Indexes
#
#  index_positions_on_key        (key)
#  index_positions_on_league_id  (league_id)
#
# Foreign Keys
#
#  fk_rails_...  (league_id => leagues.id)
#

class Position < ActiveRecord::Base
  belongs_to :league
end
