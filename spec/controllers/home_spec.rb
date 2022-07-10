require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'when user is logged in' do
      before do
        user = create(:user)
        login_as user
        get :index
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template 'home/index' }
    end

    context 'when user is not logged in' do
      before do
        get :index
      end

      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template 'home/index' }
    end
  end
end
