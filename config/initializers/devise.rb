Rails.application.configure do
  config.omniauth :twitter, ENV['TWITTER_KEY'],ENV['TWITTER_SECRET']
