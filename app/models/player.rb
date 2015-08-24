class Player < ActiveRecord::Base
  belongs_to :league
  belongs_to :team
  belongs_to :position

  def name
    "#{first_name} #{last_name}"
  end
end
