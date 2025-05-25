class AddDescriptionToMenus < ActiveRecord::Migration[8.0]
  def change
    add_column :menus, :description, :text
  end
end
