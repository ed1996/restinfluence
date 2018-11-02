class AddAttachmentAvatarToRestorers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :restorers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :restorers, :avatar
  end
end
