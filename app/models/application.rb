class Application < ApplicationRecord
  has_secure_token :token, length: 36
  has_many :chats

end
