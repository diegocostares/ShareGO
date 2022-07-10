Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    get '/home', to: 'home#index'
    root to: 'home#index'

    resources :users

    # Chats and messages depend for each publication
    resources :publications do
      resources :reviews, only: %i[index new create destroy]
    end

    resources :chats, only: %i[index show] do
      resources :messages, only: %i[new create destroy]
    end

    resources :messages

    resources :requests, only: %i[index create destroy] do
      member do
        patch :approve
        patch :reject
      end
    end

    # Errors
    match '/400', to: 'errors#bad_request', via: :all
    match '/401', to: 'errors#unauthorized', via: :all
    match '/403', to: 'errors#forbidden', via: :all
    match '/404', to: 'errors#not_found', via: :all
    match '/406', to: 'errors#unacceptable', via: :all
    match '/422', to: 'errors#unprocessable', via: :all
    match '/500', to: 'errors#internal_server_error', via: :all
  end
end
