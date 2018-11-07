class AddAttachmentAvatarToInfluencers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :influencers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :influencers, :avatar
  end
end
