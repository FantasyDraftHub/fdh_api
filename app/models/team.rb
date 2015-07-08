class Team < ActiveRecord::Base
  belongs_to :league
  has_many :players

  def full_name
    "#{city} #{name}"
  end
end