class Publication < ApplicationRecord
  belongs_to :user

  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one :chat, dependent: :destroy

  # Atributos
  validates :title, length: { minimum: 5 }
  validates :content, length: { minimum: 10 }
  validates :day, presence: true
  validates :departure_time, presence: true
  validates :person_limit, presence: true
  validates :person_limit, numericality: { only_integer: true, greater_than: 0, less_than: 10 }
  validates :origin, presence: true
  validates :destination, presence: true

  after_create :create_chat

  def seats_left
    # Count approved requests
    approved_requests = requests.where(status: 'approved')
    person_limit - approved_requests.count
  end

  def create_chat
    chat = Chat.new
    chat.publication = self
    chat.save
  end

  def approved_users
    @approved_requests = requests.where(status: 'approved')
    @approved_users = []
    @approved_requests.each do |request|
      @approved_users << request.user
    end
    # Author is also approved
    @approved_users << user
    @approved_users
  end

  def campus?(place)
    campuses = ['San Joaquín', 'Casa Central', 'Lo Contador', 'Oriente', 'Villarica']
    campuses.includes(place)
  end
end
