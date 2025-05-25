class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :image_url
      t.boolean :is_available_today, default: true

      t.timestamps
    end
  end
end
