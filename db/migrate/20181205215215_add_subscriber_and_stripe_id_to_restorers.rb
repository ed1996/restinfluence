class AddSubscriberAndStripeIdToRestorers < ActiveRecord::Migration[5.1]
  def change
    add_column :restorers, :subscribed, :boolean
    add_column :restorers, :stripeid, :string
  end
end
