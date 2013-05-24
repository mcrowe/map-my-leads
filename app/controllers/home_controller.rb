class HomeController < ApplicationController

  def index
    render 'welcome' unless signed_in?
  end

  def submitter_ips
    head :unauthorized and return unless signed_in?

    account = unbounce.accounts.first
    leads = account.leads

    ips = [{ip_address: '192.0.3.6', created_at: 5.days.ago}, {ip_address: '192.153.2.2', created_at: 3.days.ago }]

    render json: ips
  end

end
