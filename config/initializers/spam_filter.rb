Rails.application.config.middleware.use Spamster::Rack::Middleware

Spamster.use_akismet(ENV['akismet_api_key'], ENV['akismet_site_url'])