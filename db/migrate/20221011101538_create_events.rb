class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :user_id, nill: false
      t.string :plan, nill: false
      t.datetime :plan_datetime, nill: false
      t.boolean :allday_flg, nill: false, default: false
      t.text :memo
      t.string :place
      t.integer :color_id, nill: false, default: 0
      t.boolean :is_active, nill: false, default: false

      t.timestamps
    end
  end
end
