Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signin', to: 'users#signin'
  post '/signup', to: 'users#signup'
  get '/panic_current', to: 'panic#panic_current'
  post '/panic_update', to: 'panic#panic_update'
end
