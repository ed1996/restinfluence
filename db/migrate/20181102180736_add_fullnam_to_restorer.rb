class AddFullnamToRestorer < ActiveRecord::Migration[5.1]
  def change
    add_column :restorers, :fullname, :string
  end
end
