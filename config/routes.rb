Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:new, :create, :index, :show, :destroy] do
    resources :doses, only: [:new, :create, :show]
  end

  resources :doses, only: [:destroy]
end
