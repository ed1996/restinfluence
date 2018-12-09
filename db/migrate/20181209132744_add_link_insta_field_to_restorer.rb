class AddLinkInstaFieldToRestorer < ActiveRecord::Migration[5.1]
  def change
    add_column :restorers, :linkinsta, :string
  end
end
