Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signin', to: 'users#signin'
  post '/signup', to: 'users#signup'
  # post '/signup', to: 'Api::V1::UsersController#signup'

end
