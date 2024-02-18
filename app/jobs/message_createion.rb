class MessageCreation < ApplicationJob

  queue_as :default
  def perform(message, chat)
    message = chat.messages.new(message)
    message.message_index = @chat.messages_count + 1
    message.save
  rescue StandardError => e
    Rails.logger.error(message: e)
  end
end
