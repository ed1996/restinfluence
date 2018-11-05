class AddFieldsToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :price_menu, :float
  end
end
