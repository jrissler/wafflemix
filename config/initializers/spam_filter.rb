Rails.application.config.middleware.use Spamster::Rack::Middleware

Spamster.use_akismet(ENV['AKISMET_API_KEY'], ENV['AKISMET_SITE_URL'])

