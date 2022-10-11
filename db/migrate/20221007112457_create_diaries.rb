class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :event_id, nill: false
      t.string :simple_diary
      t.text :detail
      t.string :image_id

      t.timestamps
    end
  end
end
