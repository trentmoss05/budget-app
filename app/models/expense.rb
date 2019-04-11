class Expense < ApplicationRecord
  belongs_to :event

  def total
    return self.cost * self.quantity if self.cost && self.quantity
  end

  def bought
    self.purchased = true
  end
end
