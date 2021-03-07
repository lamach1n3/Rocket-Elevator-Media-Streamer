require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
    module Config
      module Actions
        class Gmap < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
  
          register_instance_option :root? do
            true
          end
          
          register_instance_option :breadcrumb_parent do
            nil
          end
          
          register_instance_option :auditing_versions_limit do
            100
          end
  
          # register_instance_option :route_fragment do
          #   '/gmap/index'
          # end

          register_instance_option :visible? do
           bindings[:controller].main_app
          end
  
          register_instance_option :controller do
            proc do
              render :gmap
            end
          end
  
          register_instance_option :link_icon do
            'icon-map-marker'
          end
  
          register_instance_option :statistics? do
            false
          end
  
  
          # register_instance_option :controller do
          #   proc do
          #     # This will be your controller
          #   end
          # end
  
        end
      end
    end
  end