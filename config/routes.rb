Refinery::Application.routes.draw do


  scope(:path => 'forem', :as => 'forem' , :module => 'forem') do
    root :to => "forums#index"
    resources :forums do
      resources :topics
    end

    resources :topics do
      resources :posts
    end

  end

#  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
#    scope(:path => 'forem', :as => 'forem', :module => 'forem') do
#      scope(:path => 'admin', :as => 'admin', :module => 'admin') do
#        root :to => "forums#index"  #{:controller => Forem::Admin::ForumsController , :action => 'index'  }
#         resources :forums do
#          resources :topics
#        end
#        resources :topics do
#          resources :posts
#        end
#      end
#
#    end
#  end

end
