Rails.application.routes.draw do
  resources :users do
    resources :products
  end
  resources :brands do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
