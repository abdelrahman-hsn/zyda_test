class AddMessagesCountInChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :messages_count, :integer, default: 0
  end
end
