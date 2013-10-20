Lws::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :documents, only: :index
    end
  end
end
