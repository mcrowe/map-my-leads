class LeadsController < ApplicationController

  def index
    head :unauthorized and return unless signed_in?

    account = unbounce.accounts.first

    leads = Lead.load(account.leads)

    render json: leads
  end

end
