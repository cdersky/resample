Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'
  get '/home', to:'static_pages#home'
  root 'static_pages#home'
end
