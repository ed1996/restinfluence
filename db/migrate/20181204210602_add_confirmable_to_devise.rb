class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def up
    add_column :restorers, :confirmation_token, :string
    add_column :restorers, :confirmed_at, :datetime
    add_column :restorers, :confirmation_sent_at, :datetime
    add_index :restorers, :confirmation_token, unique: true
  end

  def down
    remove_columns :restorers, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
