Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '9ed4b080eb7796c6995f', '24e5753513334be35ab6d6f3409f6b43f7624dbb'
end
