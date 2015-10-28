if(Rails.env == 'development' || Rails.env == 'staging')
  Rails.configuration.stripe = {
    :publishable_key => ENV['DEVELOPMENT_STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['DEVELOPMENT_STRIPE_SECRET_KEY']
  }
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
elsif(Rails.env == 'production')
  Rails.configuration.stripe = {
    :publishable_key => ENV['PRODUCTION_STRIPE_PUBLISHABLE_KEY'],
    :secret_key      => ENV['PRODUCTION_STRIPE_SECRET_KEY']
  }
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
end

