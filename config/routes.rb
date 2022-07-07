Rails.application.routes.draw do
  resources :shops
  resources :users do
    resources :shops
    collection do
      get 'count'
    end
    member do
      get 'name'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
