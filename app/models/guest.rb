class Guest < ApplicationRecord
  belongs_to :event
  
  default_scope { order(name: :asc) }
end
