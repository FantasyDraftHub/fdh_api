class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :fantasy_leagues

  def generate_token
    self.token = SecureRandom.uuid
    self.save
  end
end