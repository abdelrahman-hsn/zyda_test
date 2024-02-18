class Message < ApplicationRecord
  belongs_to :chat, counter_cache: true
  validate_presence_of :content
end
