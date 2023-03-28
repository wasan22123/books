Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # https://guides.rubyonrails.org/routing.html
get 'hello/index' => 'hello#index'
get 'hello/link' => 'hello#link'

resources :books do
  resources :likes, only: [:create, :destroy]
end
root'books#index'


end

# Rails.application.routes.draw do
#   devise_for :users
#   resources :users, only: [:show]
#   get    'books'          => 'books#index'
#   post   'books'          => 'books#create'
#   get    'books/new'      => 'books#new'
#   get    'books/:id/edit' => 'books#edit', as:'edit_book'
#   get    'books/:id'      => 'books#show'
#   patch  'books/:id'      => 'books#update'
#   put    'books/:id'      => 'books#update'
#   delete 'books/:id'      => 'books#destroy'
#   get 'hello/index' => 'hello#index'
#   get 'hello/link' => 'hello#link'
#   resources :books do
#       resources :likes, only: [:create, :destroy]
#       end
#   root'books#index'
# end
