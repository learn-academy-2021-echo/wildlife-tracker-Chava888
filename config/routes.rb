Rails.application.routes.draw do
  resources :sightings
  resources :animals
  #The lines below create a nested routes from animals to sightings
  resources :animals do
    resources :sightings
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
