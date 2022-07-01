Rails.application.routes.draw do
  concern :base_api do
    resources :adoptable_animals
  end

  namespace :v1 do
    concerns :base_api
  end
end
