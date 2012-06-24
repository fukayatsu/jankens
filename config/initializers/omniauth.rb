Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    Settings.twitter.consumer.key,
    Settings.twitter.consumer.secret
  #provider :facebook,"App ID","App Secret"
end
