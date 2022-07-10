require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john_doe321@uc.cl',
                    bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                    password: '12345678', password_confirmation: '12345678')

    expect(user).to be_valid
  end

  it 'is no valid with no first name' do
    user = User.new(first_name: nil, last_name: 'Doe', email: 'doe@uc.cl', password: '12345678',
                    password_confirmation: '12345678')
    expect(user).not_to be_valid
  end

  it 'is no valid with no last name' do
    user = User.new(first_name: 'John', last_name: nil, email: 'john@uc.cl', password: '12345678',
                    password_confirmation: '12345678')
    expect(user).not_to be_valid
  end

  it 'is no valid with no email' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: nil, password: '12345678',
                    password_confirmation: '12345678')
    expect(user).not_to be_valid
  end

  it 'is valid with no bio' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john_doe_345@uc.cl', password: '12345678',
                    password_confirmation: '12345678')
    expect(user).to be_valid
  end

  it 'user gives full name' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john_doe_432@uc.cl', password: '12345678',
                    password_confirmation: '12345678')
    expect(user.full_name).to eq('John Doe')
  end

  it 'user without picture gives gravatar' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john_doe_394@uc.cl',
                    password: '12345678', password_confirmation: '12345678')
    expect(user_avatar(user)).to include('https://www.gravatar.com/avatar/')
  end

  it 'user with picture gives resized picture' do
    user = User.new(first_name: 'John', last_name: 'Doe', email: 'john_doe_983@uc.cl', password: '12345678',
                    password_confirmation: '12345678')

    user.profile_picture = fixture_file_upload('/files/agile_fan.png', 'image/png')

    expect(user_avatar(user)).to be_a ActiveStorage::Variant
  end
end
