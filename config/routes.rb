Rails.application.routes.draw do

  devise_for :users
  root 'notes#top'
  # get 'notes' => 'notes#index'
  # get 'notes/new' => 'notes#new'
  # post 'notes' => 'notes#create'
  # get 'users/:id'=> 'users#show'
  # delete 'notes/:id' => 'notes#destroy'
  # get 'notes/:id/edit' => 'notes#edit'
  # patch 'notes/:id' => 'notes#update'
  # get 'notes/:id' => 'notes#show'
  resources :notes do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
end
