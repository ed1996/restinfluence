class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_type
      t.text :summary
      t.string :address
      t.integer :reduction
      t.integer :price
      t.boolean :active
      t.references :restorer, foreign_key: true

      t.timestamps
    end
  end
end
