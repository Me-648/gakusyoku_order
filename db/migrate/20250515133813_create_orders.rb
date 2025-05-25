class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :student_id, null: false
      t.integer :menu_id, null: false
      t.string :menu_name, null: false
      t.integer :menu_price, null: false
      t.boolean :is_completed, default: false, null: false
      t.datetime :ordered_at, default: -> { 'CURRENT_TIMESTAMP' }
      
      t.timestamps
    end
    add_foreign_key :orders, :menus, column: :menu_id
    add_index :orders, :student_id
  end
end
