Rails.application.routes.draw do
  scope '/applications/:token' do
    resources :chats do
      resources :messages
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
