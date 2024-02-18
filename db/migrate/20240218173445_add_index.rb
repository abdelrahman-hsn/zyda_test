class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :messages, :message_index, unique: true
    add_index :chats, :chat_index, unique: true
  end
end
