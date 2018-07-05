Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.google[:reCAPTCHA_public_key]
  config.secret_key = Rails.application.credentials.google[:reCAPTCHA_secret_key]
end