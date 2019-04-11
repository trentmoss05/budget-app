class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :event_id
      t.timestamps
    end
  end
end
