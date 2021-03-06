class Event < ApplicationRecord
  belongs_to :user
  has_many :expenses
  has_many :guests

  validates :name, presence: true
  validates :budget, presence: true


  def budget_difference
    expenses_array = self.expenses.collect { |event| event.total }
    expenses_total = expenses_array.inject(0){|sum,x| sum + x }
    return self.budget - expenses_total
  end
end
