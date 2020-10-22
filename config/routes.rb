Rails.application.routes.draw do
  root to: redirect('/rushings')
  resources :rushings do
    collection do
      get :import_page
      post :import
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
