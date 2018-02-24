Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :branches, only: %i[index show] do
    resources :meetings, only: %i[index show] do
      resources :issues, only: %i[create] do
        resources :votes, only: %i[create destroy]
      end
    end
  end
end
