class Chat < ApplicationRecord
  belongs_to :publication
  has_many :messages, dependent: :destroy
end
