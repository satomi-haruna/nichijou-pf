class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :schedule_id
      t.string :title
      t.string :item
      t.boolean :is_completed

      t.timestamps
    end
  end
end
