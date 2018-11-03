class AddOtherFieldToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :listing_name, :string
  end
end
