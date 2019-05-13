class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget
  has_many :expenses
  has_many :guests
  belongs_to :user, serializer: EventUserSerializer
end
