class User < ApplicationRecord
  has_many :events
  has_many :expenses, through: :events
  has_many :guests, through: :events

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
end
