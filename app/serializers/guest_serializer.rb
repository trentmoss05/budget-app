class GuestSerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :event
end
