Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      post 'authenticate', to: 'authenticate_user#authenticate'
      get 'validate_otp', to: 'users#validate_otp'
      resources :users do
        collection do
          get :profile, action: :show
          put :update
          get :check_email
          put :upload_pic
        end
      end
    end
  end
end
