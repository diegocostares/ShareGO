# frozen_string_literal: true

module ApplicationHelper
end

def user_avatar(user, size = 100)
  if user.profile_picture.attached?
    user.profile_picture.variant(resize: "#{size}x#{size}!")
  elsif (gravatar_id = Digest::MD5.hexdigest(user.email.downcase))
    # Gravatar API Integration
    "https://www.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=identicon"
  else
    'default_user.jpg'
  end
end
