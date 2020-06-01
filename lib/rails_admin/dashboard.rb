module RailsAdmin
  module Config
    module Actions
      class Dashboard < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end


        register_instance_option :visible? do
          true
        end

        register_instance_option :breadcrumb_parent do
          true
        end

        register_instance_option :controller do
          proc do
            @object = Store.all.includes(:products)
            #You can access submitted params (just submit your form to the dashboard).
            if params[:store]
              @breadcamp = Store.find_by(_id: params[:store])

              if params[:search]
                @object = Product.search "#{params[:search]}", where: {store_id: params[:store]}, page: params[:page], per_page: 4
                # @object = Product.where(store_id: params[:store], name: /.*#{params[:search]}.*/i).page(params[:page]).per(4)
              else
                @object = Product.search "*", where: {store_id: params[:store]}, page: params[:page], per_page: 4
              end
            end


            #You can specify flash messages
            # flash.now[:danger] = "Some type of danger message here."

            #After you're done processing everything, render the new dashboard
            render @action.template_name, status: 200
          end
        end

        register_instance_option :route_fragment do
          ''
        end

        register_instance_option :link_icon do
          'icon-home'
        end

        register_instance_option :statistics? do
          true
        end

        register_instance_option :pjax? do
          true
        end
      end
    end
  end
end