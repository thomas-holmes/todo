Todo::Application.routes.draw do
  devise_for :users

  root :to => 'application#index'

  resources :lists, only: [:index, :create, :show, :destroy] do
    resources :tasks, only: [:index, :create, :destroy]  do
      collection { post :sort } 
    end
  end

  match '/about', to: 'application#about'
  match '/contact', to: 'application#contact'
end
