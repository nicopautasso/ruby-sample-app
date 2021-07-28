Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
#se usa para redirigir a los recursos necesarios
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  resources :users #genera todos las rutas RESTful (get,post,delete,create)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
