Rails.application.routes.draw do
  devise_for :users
  resources :charges

  resources :charities
  resources :users do
    resources :donations
  end

  resources :users do
    resources :charities do
      resources :donations
    end
  end
  root to: 'charities#index'
end
