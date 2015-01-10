Rails.application.routes.draw do
  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events, only: [:show, :create, :update]
      namespace :events do
        resources :nearests, only: [:indesx]
      end
    end
  end
end
