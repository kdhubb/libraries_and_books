Rails.application.routes.draw do
  get "/libraries", to: "libraries#index"
  post "/libraries", to: "libraries#create"
  get "/libraries/new", to: "libraries#new"
  get "/libraries/:id", to: "libraries#show"
  get "/libraries/:id/edit", to: "libraries#edit"
  patch "/libraries/:id", to: "libraries#update"
  delete "/libraries/:id", to: "libraries#destroy" 

  get "/books", to: "books#index"
  get "/books/:id", to: "books#show"
  get "/books/:id/edit", to: "books#edit"
  patch "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy" 

  get "/libraries/:id/books", to: "library_books#index"
  get "/libraries/:id/books/new", to: "library_books#new"
  post "/libraries/:id/books", to: "library_books#create"
end
