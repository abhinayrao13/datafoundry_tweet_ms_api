Rails.application.routes.draw do
  resources :tweets, only: %i[create update destroy]
  mount_devise_token_auth_for 'User', at: 'auth'
end
