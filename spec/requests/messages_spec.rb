require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'POST /new'

  it 'creates a new message' do
    # Create a new chat
    chat = create(:chat)
    # Create a new message
    message = create(:message, chat: chat)
    # Check that the message is created
    expect(Message.find_by(id: message.id)).to_not be_nil
  end
end
