class AddNumberfollowersToRestorer < ActiveRecord::Migration[5.1]
  def change
    add_column :restorers, :numberfollower, :integer
  end
end
