class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :events
  has_many :expenses, through: :events
  has_many :guests, through: :events
end
