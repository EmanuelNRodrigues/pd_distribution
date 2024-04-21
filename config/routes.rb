Rails.application.routes.draw do
  devise_for :users, path: 'users',
                     defaults: { format: :json },
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       registration: 'signup'
                     },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  resources :order do
    resources :sender, only: [:show, :create, :update, :destroy]    
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
