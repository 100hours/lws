Lws::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :documents, only: [:index, :show]
    end
  end

  root to: "high_voltage/pages#show", id: "home"
end
