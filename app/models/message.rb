class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :restorer

  validates_presence_of :content, :conversation_id, :restorer_id
end
