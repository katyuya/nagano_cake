Rails.application.routes.draw do
  devise_for :customers


  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :customers
  resources :items, only:[:index, :show]


  namespace :admin do
    resources :customers
    resources :items
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
