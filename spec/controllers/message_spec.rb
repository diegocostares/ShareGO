require 'rails_helper'

RSpec.describe ChatsController, type: :controller do
  describe 'GET #index' do
    # Create a new message in the chat of a publication
    context 'when user is logged in' do
      before do
        user = create(:user)
        login_as(user)
        get :index, params: { publication_id: 1 }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template 'chats/index' }
    end
  end

  describe 'GET #show' do
    # Create a new message in the chat of a publication
    context 'when user is logged in' do
      before do
        user = create(:user)
        chat = create(:chat)
        login_as(user)
        get :show, params: { id: chat.id }
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template 'chats/show' }
    end
  end
end

RSpec.describe MessagesController, type: :controller do
  describe 'POST #create' do
    # Create a new message in the chat of a publication
    context 'when user is logged in' do
      before do
        user = create(:user)
        publication = create(:publication)

        as_user(user)
        post :create, params: {
          current_user: user.id,
          message: {
            publication_id: publication.id,
            text: 'Hello, world!'
          }
        }
      end
      # Redirect
      it { is_expected.to respond_with :redirect }
    end
  end
end
