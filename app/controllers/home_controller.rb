class HomeController < ApplicationController

  def index
    @sub_account = unbounce.accounts.first.sub_accounts.first
    @leads = @sub_account.leads
  end

end
