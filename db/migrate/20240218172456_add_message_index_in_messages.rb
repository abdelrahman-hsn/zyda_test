class AddMessageIndexInMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :message_index, :integer, default: 1
    add_column :chats, :chat_index, :integer, default: 1
  end
end
