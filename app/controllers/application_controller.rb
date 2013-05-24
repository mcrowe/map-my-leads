class ApplicationController < ActionController::Base
  protect_from_forgery

  def client(token_method = :post)
    OAuth2::Client.new(
      OAuthCredentials::CLIENT_ID,
      OAuthCredentials::CLIENT_SECRET,
      site: OAuthCredentials::SITE,
      token_method: token_method
    )
  end

  def access_token
    OAuth2::AccessToken.new(client, session[:access_token], refresh_token: session[:refresh_token])
  end

  def redirect_uri
    OAuthCredentials::CLIENT_REDIRECT_URI
  end

  def signed_in?
    !!session[:access_token]
  end
  helper_method :signed_in?

  def unbounce
    @unbounce ||= Unbounce::Api.new(access_token)
  end

end
