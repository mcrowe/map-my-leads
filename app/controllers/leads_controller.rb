class LeadsController < ApplicationController

  # params:
  #   from: RFC3339 date to load leads from.
  #
  def index
    head :unauthorized and return unless signed_in?

    account = unbounce.accounts.first

    date = params[:from].blank? ? nil : parse_date

    leads = Lead.load(account.leads(from: date))

    render json: leads
  end

  private

    def parse_date
      # NOTE: Due to bug in api, must use local time zone.
      Time.zone.parse(params[:from]).to_datetime
    end

end
