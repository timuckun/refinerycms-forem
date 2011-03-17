Refinery::Application.routes.draw do

  scope(:path => 'forem', :module => 'forem') do
    root :to => "forums#index"
    resources :forums do
      resources :topics do
        resources :posts
      end
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    scope(:path => 'forem', :as => 'forem', :module => 'forem') do
      root :to => "forums#index"
      resources :forums do
        resources :topics do
          resources :posts
        end
      end
    end
  end

end
