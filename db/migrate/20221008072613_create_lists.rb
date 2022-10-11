class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :schedule_id, null: false
      t.string :title, null: false
      t.string :item, null: false
      t.boolean :is_completed, null: false, default: false

      t.timestamps
    end
  end
end
