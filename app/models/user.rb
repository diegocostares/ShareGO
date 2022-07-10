class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relations
  belongs_to :role, optional: true
  has_many :publications, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one_attached :profile_picture, dependent: :destroy

  # Attributes
  validates :bio, length: { maximum: 100 }
  validates :first_name, :last_name, presence: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Helpers
  def full_name
    "#{first_name} #{last_name}"
  end
end
