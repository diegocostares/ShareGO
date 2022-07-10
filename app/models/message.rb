class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  # Text message
  validates :text, presence: true
  validates :text, length: { maximum: 280 }
  # Index is the order of the message in the chat.
  validates :index, presence: true
  validates :index, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
