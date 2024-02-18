class Chat < ApplicationRecord
  belongs_to :application, counter_cache: true
  has_many :messages
  validate_presence_of :name
end
