Lws::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :documents, only: [:index, :show]
    end
  end

  root to: "high_voltage/pages#show", id: "home"
  resources :subscriptions, only: [:create]
  namespace :writeroom do
    match "/", to: "dashboard#show", as: "writeroom", via: :get
    resources :documents
  end

end
