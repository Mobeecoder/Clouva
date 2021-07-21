Rails.application.routes.draw do
  root 'products#index'
  resources :products, only: %i[show new create edit update]
  post '/products/add_cart', to: 'products#add_to_cart'
  get '/:id/cart', to: 'products#cart'


  devise_for :users

  # This is the mapping for the "quickstart" routes
  devise_for :admin,
    class_name: 'User',
    only: [],
    controllers: { registrations: 'admin' }

  # These are the actual routes for quickstarts
  devise_scope :admin do
    get   "/admin/sign_up", to: "admin#new", as: :admin_sign_up
    get   "/admin/sign_in", to: "admin_session#new", as: :admin_sign_in
    post  "/admin/sign_up",    to: "admin#create", as: :admin_create
    post   "/admin/sign_in", to: "admin_session#create", as: :admin_session_create
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
