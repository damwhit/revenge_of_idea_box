Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ideas, only: [:index]
    end
  end

  get '/', to: 'home#show'
end
