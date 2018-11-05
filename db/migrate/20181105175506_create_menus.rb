class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :category
      t.string :title
      t.text :content
      t.references :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
