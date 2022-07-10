require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  # Sign up
  describe 'GET /register' do
    it 'returns http success' do
      get '/register'
      expect(response).to have_http_status(:success)
    end
  end

  # Sign in
  describe 'GET /login' do
    it 'returns http success' do
      get '/login'
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'POST /register' do
  #   let!(:attr_user) { attributes_for(:user) }
  #   it 'registers valid user' do
  #     post '/register', params: attr_user
  #     expect(response).to have_http_status(:success)
  #     expect(User.last.email).to eq(attr_user[:first_name])
  #   end
  # end
end
