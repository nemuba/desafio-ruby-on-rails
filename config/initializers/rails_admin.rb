require Rails.root.join('lib', 'rails_admin', 'list_products.rb')
require Rails.root.join('lib', 'rails_admin', 'dashboard.rb')

RailsAdmin.config do |config|
# include helpers in RailsAdmin
include RailsAdmin::Services
# register action in RailsAdmin
RailsAdmin::Config::Actions.register(Marketplace::Admin::Actions::ListProducts)

config.main_app_name = ["Marketplace", ""]

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory

    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    list_products
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

end
