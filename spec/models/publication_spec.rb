require 'rails_helper'
require 'faker'

RSpec.describe Publication, type: :model do
  owner = User.create(first_name: 'John', last_name: 'Doe', email: 'john_doe123@uc.cl',
                      bio: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                      password: '12345678', password_confirmation: '12345678')

  it 'is valid with valid attributes' do
    publication = Publication.new(title: 'Titulo generico',
                                  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit....',
                                  day: '2020-01-01',
                                  departure_time: '2020-01-01T12:00:00-03:00',
                                  person_limit: 5,
                                  origin: 'San Joaquín',
                                  destination: 'Ñuñoa')
    publication.user = owner
    expect(publication).to be_valid
  end

  it 'is not valid with no title' do
    pub = Publication.new(title: nil,
                          content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.')
    pub.user = owner
    expect(pub).to_not be_valid
  end

  it 'is not valid with short content' do
    pub = Publication.new(title: 'Titulo generico',
                          content: 'Lorem.')
    pub.user = owner
    expect(pub).to_not be_valid
  end

  it 'is not valid with short title' do
    pub = Publication.new(title: 'A',
                          content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.')
    pub.user = owner
    expect(pub).to_not be_valid
  end
end
