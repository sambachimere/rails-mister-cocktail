Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
     resources :doses, only: [:new, :create, :destroy]
  end

end


  # get "cocktails", to: "cocktails#index", as: "cocktails"
  # get "cocktails/:id", to: "cocktails#show", as: "cocktail"
  # get "cocktails/new", to: "cocktails#new", as: "new_cocktail"
  # post "cocktails", to: "cocktails#create"
  # get "cocktails/:id/edit", to: "cocktails#edit"
  # patch "cocktails", to: "cocktails#update"
  # delete "cocktails/:id", to: "cocktails#destroy"
