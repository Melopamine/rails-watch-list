Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  resources :lists do
    resources :reviews, only: [:create, :destroy]
    member do
      get 'edit_image', as: 'edit_image_list'
    end
  end
end
