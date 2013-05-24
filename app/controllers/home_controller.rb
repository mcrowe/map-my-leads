class HomeController < ApplicationController

  def index
    render 'welcome' unless signed_in?
  end

end
