Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/libraries", to: "libraries#index"
  get "/libraries/:id", to: "libraries#show"
end
