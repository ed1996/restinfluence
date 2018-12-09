class AddVerifAccountToRestorer < ActiveRecord::Migration[5.1]
  def change
    add_column :restorers, :verifyaccount, :boolean
  end
end
