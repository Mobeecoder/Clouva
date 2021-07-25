Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/new'
  get 'orders/create'
  get 'orders/show'
  get 'orders/edit'
  get 'orders/update'
  get 'orders/destroy'
  root 'products#index'

  resources :products, only: %i[show create edit update]
  resources :orders, except: %i[new show]

  post '/products/add_cart', to: 'products#add_to_cart'
  get '/cart', to: 'products#cart'
  post '/update_quantity', to: 'products#update_quantity'
  get '/checkout', to: 'orders#new'
  get 'confirmation/:ref', to: 'orders#show'


  devise_for :users

  resources :users, only: [:show]
  post 'users/:id', to: 'products#create'
  delete '/products/:id', to: 'products#destroy'

  # This is the mapping for the "quickstart" routes
  # devise_for :admin,
  #   class_name: 'User',
  #   only: [],
  #   controllers: { registrations: 'admin' }

  # # These are the actual routes for quickstarts
  # devise_scope :admin do
  #   get   "/admin/sign_up", to: "admin#new", as: :admin_sign_up
  #   get   "/admin/sign_in", to: "admin_session#new", as: :admin_sign_in
  #   post  "/admin/sign_up",    to: "admin#create", as: :admin_create
  #   post   "/admin/sign_in", to: "admin_session#create", as: :admin_session_create
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
