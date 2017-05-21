Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # => 랑 , to:   똑같아요
  get 'post/:post_id/comment/new', to: 'comment#new'
  get 'post/:post_id/comment/create', to: 'comment#create'
  get 'post/:post_id/comment/:id/edit', to: 'comment#edit'
  get 'post/:post_id/comment/:id/update', to: 'comment#update'
  get 'post/:post_id/comment/:id/destroy', to: 'comment#destroy'

  get 'post/index', to: 'post#index'
  get 'post/:id/show', to: 'post#show'
  get 'post/new', to: 'post#new'
  post 'post/create', to: 'post#create'
  get 'post/:id/edit', to: 'post#edit'
  get 'post/:id/update', to: 'post#update'
  get 'post/:id/destroy', to: 'post#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
