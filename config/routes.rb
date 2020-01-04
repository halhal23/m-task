Rails.application.routes.draw do
  get 'passwords/edit'
  get 'accounts/show'
  get 'accounts/edit'
  root "users#index"
  get "home", to: "top#home"

  get "login", to: "users#login"
  1.upto(10) do |i|
    get "samples/lesson#{i}(/:name)" => "samples#lesson#{i}"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
    get "search", on: :collection
  end

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
end
