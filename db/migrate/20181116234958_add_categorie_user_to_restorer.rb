class AddCategorieUserToRestorer < ActiveRecord::Migration[5.1]
  def change
    add_column :restorers, :influencer, :boolean
  end
end
