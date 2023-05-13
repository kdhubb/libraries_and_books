Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/libraries", to: "libraries#index"
  get "/libraries/new", to: "libraries#new"
  get "/libraries/:id", to: "libraries#show"
  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"
  get "/libraries/:id/books", to: "library_books#index"
  post "/libraries", to: "libraries#create"
  get "/libraries/:id/edit", to: "libraries#edit"
  patch "/libraries/:id", to: "libraries#update"
  get "/libraries/:id/books/new", to: "library_books#new"
  post "libraries/:id/books", to: "library_books#create"
  # delete "/libraries/:id", to: "libraries#destroy" 
end
