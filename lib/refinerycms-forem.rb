#require 'filters_spam'



#finery::Plugin.register do |plugin|
#          plugin.name = "refinerycms_news"
#          plugin.menu_match = /(admin|refinery)\/news(_items)?$/
#          plugin.url = {:controller => '/admin/news_items', :action => 'index'}
#          plugin.activity = {
#            :class => NewsItem,
#            :title => 'title',
#            :url_prefix => 'edit'
#          }
#

module Refinery
  module Forem

    class Engine < Rails::Engine
      initializer 'forum serves assets' do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_forem"
          #plugin.url = {:controller => '/admin/forem/admin/forums', :action => 'index'}
          plugin.url = {:controller => '/forem/forums', :action => 'index'}

          #plugin.url = {:controller => '/admin/blog/posts', :action => 'index'}
          plugin.menu_match = /^\/?(admin|refinery)\/forum\/?(forums|posts|topics)?/
          plugin.activity = {
            :class => ::Forem::Post
          }
        end


      end
    end if defined?(Rails::Engine)

    class << self
      def version
        %q{0.0.0}
      end
    end
  end
end
require 'simple_form'