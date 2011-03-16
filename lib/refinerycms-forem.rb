#require 'filters_spam'

module Refinery
  module Forem

    class Engine < Rails::Engine
      initializer 'forum serves assets' do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_forum"
          plugin.url = {:controller => '/forem/forums', :action => 'index'}

          #plugin.url = {:controller => '/admin/blog/posts', :action => 'index'}
          plugin.menu_match = /^\/?(admin|refinery)\/forem\/?(forums|posts|topics)?/
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