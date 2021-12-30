Rails.application.routes.draw do

  devise_for :customers


  root to: 'homes#top'
  get '/about' => 'homes#about'
  delete '/cart_items' => 'cart_items#destroy'
  resource :customers
  resources :items, only:[:index, :show]
  resources :cart_items


devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  namespace :admin do
    resources :customers
    resources :items
    resources :genres
    resources :orders
    resources :order_details
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
