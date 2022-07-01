Rails.application.routes.draw do
  namespace :v1 do
    resources :adoptable_animals
  end
end
