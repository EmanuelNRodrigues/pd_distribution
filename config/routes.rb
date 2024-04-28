Rails.application.routes.draw do
  devise_for :users, path: '',
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

  resources :user do
    resources :user_address, path: 'address', only: %i[index create destroy update]
    resources :order, only: %i[index create destroy update] do
      resources :recipient, only: %i[index create update]
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
