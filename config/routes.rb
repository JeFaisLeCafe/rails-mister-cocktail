Rails.application.routes.draw do
  root 'cocktails#index'

  resources :cocktails do
    resources :doses, only: [ :create, :new, :destroy]
    collection do                       # collection => no restaurant id in URL
      get 'latest', to: "cocktails#latest"  # RestaurantsController#top
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
