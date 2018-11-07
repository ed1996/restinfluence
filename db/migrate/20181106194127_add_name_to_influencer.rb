class AddNameToInfluencer < ActiveRecord::Migration[5.1]
  def change
    add_column :influencers, :fullname, :string
  end
end
