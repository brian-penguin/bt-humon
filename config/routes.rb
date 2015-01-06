Rails.application.routes.draw do
  scope module :api, defaults { format: 'json'} do
    namespace :v1 do # V1 resources will go here
    end
  end
end
