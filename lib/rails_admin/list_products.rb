module Marketplace
  module Admin
    module Actions
      class ListProducts < RailsAdmin::Config::Actions::Base
       RailsAdmin::Config::Actions.register(self)
        # # This ensures the action only shows up for Users
        # register_instance_option :visible? do
        #   bindings[:object].class == User
        # end
        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end

        register_instance_option :visible? do
          bindings[:object].class == Store
        end

        register_instance_option :link_icon do
          'icon-eye-open'
        end

         register_instance_option :controller do
          proc do
            @title = "TO aqui #{params[:id]}"
            @object = Product.where(:store_id => params[:id]).page(params[:page]).per(4)
          end
        end
        # # You may or may not want pjax for your action
        # register_instance_option :pjax? do
        #   false
        # end
      end
    end
  end
end