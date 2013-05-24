class OauthController < ApplicationController

  def login
    redirect_to client.auth_code.authorize_url(redirect_uri: redirect_uri)
  end

  def logout
    session[:access_token] = nil
    redirect_to '/'
  end

  def callback
    new_token = client.auth_code.get_token(params[:code], redirect_uri: redirect_uri)
    session[:access_token]  = new_token.token
    session[:refresh_token] = new_token.refresh_token
    redirect_to '/'
  end

  def refresh
    new_token = access_token.refresh!
    session[:access_token]  = new_token.token
    session[:refresh_token] = new_token.refresh_token
    redirect_to '/'
  end

end
