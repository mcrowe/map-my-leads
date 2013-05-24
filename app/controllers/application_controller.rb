class ApplicationController < ActionController::Base
  protect_from_forgery

  # TODO: Make us env variables.
  OAUTH2_CLIENT_ID = '1b2c16764ab6d657c292dc4044ef13e82ade18a24b30b091689f7139135c73ff'
  OAUTH2_CLIENT_SECRET = '5bff6920374f6f8b93198e992e37e80fb9a4791651aad399399d7b6a1c402a1a'
  OAUTH2_CLIENT_REDIRECT_URI = 'http://localhost:3001/oauth/callback'

  def client(token_method = :post)
    OAuth2::Client.new(
      OAUTH2_CLIENT_ID,
      OAUTH2_CLIENT_SECRET,
      site: 'http://api.unbouncedev.com:3000',
      token_method: token_method
    )
  end

  def access_token
    OAuth2::AccessToken.new(client, session[:access_token], refresh_token: session[:refresh_token])
  end

  def redirect_uri
    OAUTH2_CLIENT_REDIRECT_URI
  end

  def signed_in?
    !!session[:access_token]
  end
  helper_method :signed_in?

  def unbounce
    @unbounce ||= Unbounce::Api.new(access_token)
  end

end
