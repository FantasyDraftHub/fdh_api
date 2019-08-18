# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  token           :string
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_users_on_email            (email)
#  index_users_on_password_digest  (password_digest)
#  index_users_on_token            (token)
#

class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :fantasy_drafts

  def generate_token
    self.token = SecureRandom.uuid
    self.save
  end
end
