module OAuthCredentials
  CLIENT_ID           = Settings.oauth2_client_id     || ENV['OAUTH2_CLIENT_ID']
  CLIENT_SECRET       = Settings.oauth2_client_secret || ENV['OAUTH2_CLIENT_SECRET']
  CLIENT_REDIRECT_URI = Settings.oauth2_client_redirect_uri
  SITE                = Settings.oauth2_site
end