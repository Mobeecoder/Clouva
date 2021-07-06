Rails.application.routes.draw do
  # get 'admin/index'
  # get 'admin/new'
  # get 'admin/create'
  # get 'admin/show'
  # get 'admin/edit'
  # get 'admin/update'
  # get 'admin/destroy'
  devise_for :users
  root 'home#index'

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
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
