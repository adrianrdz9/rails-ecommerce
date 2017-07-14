Rails.application.routes.draw do
  get 'my_orders/:id', as: 'my_order', to: 'my_orders#show'

  post 'carrito/add', to: 'in_shopping_carts#add', as: 'add_to_shopping_cart'
  delete 'carrito/product', to: 'in_shopping_carts#delete', as:"remove_in_shopping_carts_product"
  put 'carrito', to: 'in_shopping_carts#update', as: 'update_in_shopping_cart'

  get 'categories', to: 'categories#index'
  get 'categories/:name', to: 'categories#show', as: "category"

  get 'search', to: "search#index"
  post 'search', to:"search#search"

  get 'carrito', to: "shopping_carts#show"

  post 'payments/check_out', to: 'payments#check_out', as:"check_out"
  get 'payments/execute', to: 'payments#execute', as:"execute_payment"

  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
