Rails.application.routes.draw do
  scope module: 'web' do
    get 'welcome/index'
    resources :articles do
      member do
        patch :send_to_moderation
        patch :publish
      end
      scope module: :articles do
        resources :comments do
          scope module: :comments do
            resources :likes, only: [:create]
          end
        end
      end
    end

    namespace :moderation do
      resources :articles, only: [:index, :show, :edit, :update]
    end
  end

  root 'web/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
