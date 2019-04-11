class AddPurchasedExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :purchased?, :boolean, default: false
  end
end
