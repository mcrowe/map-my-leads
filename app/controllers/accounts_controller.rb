class AccountsController < ApplicationController

  def index
    if signed_in?
      @accounts = unbounce.accounts
    else
      render 'welcome'
    end
  end

  def show
    @account_id = params[:id]
  end

end
