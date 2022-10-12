class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :user_id,        null: false
      t.string :plan,            null: false
      t.datetime :plan_datetime, null: false
      t.datetime :start
      t.datetime :end
      t.boolean :allday_flg,     null: false, default: false
      t.text :memo
      t.string :place
      t.integer :color_id,       null: false, default: 0
      t.boolean :is_active,      null: false, default: false
      t.timestamps
    end
  end
end
