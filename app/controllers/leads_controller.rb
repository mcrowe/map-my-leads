class LeadsController < ApplicationController

  # params:
  #   from: RFC3339 date to load leads from.
  #
  def index
    head :unauthorized and return unless signed_in?

    account = unbounce.accounts.first

    date = params[:from].blank? ? nil : DateTime.parse(params[:from])

    leads = Lead.load(account.leads(from: date))

    render json: leads
  end

end
