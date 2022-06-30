Rails.application.routes.draw do
  devise_for :users
  root to: 'properties#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :properties do
    collection do
      get :my_properties
    end
  end
  get 'about', to: 'pages#about'
end
