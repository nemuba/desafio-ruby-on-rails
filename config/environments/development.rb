Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  # config.action_mailer.smtp_settings = { address: "localhost", port: 1025 }

  config.action_mailer.smtp_settings = {
    :port      => 587,
    :address   => "smtp.mailgun.org",
    :user_name => "postmaster@sandbox2216b7c3367441728e6352c91bb71c50.mailgun.org",
    :password  => "bbba6876d5dbf3412df689fb7f1b3c7a-a2b91229-0046a020",
  }

  config.i18n.enforce_available_locales = false
  config.i18n.available_locales = ["pt-BR"]
  config.i18n.default_locale = :'pt-BR'
  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
