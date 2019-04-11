class RenamePurchasedColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :expenses, :purchased?, :purchased
  end
end
