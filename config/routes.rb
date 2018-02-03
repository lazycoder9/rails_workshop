Rails.application.routes.draw do
  scope module: 'web' do
    get 'welcome/index'
    resources :articles do
      member do
        patch :send_to_moderation
      end
      scope module: :articles do
        resources :comments
      end
    end
  end

  root 'web/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
