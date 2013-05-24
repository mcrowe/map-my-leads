MapMyLeads::Application.routes.draw do

  root to: 'home#index'

  get 'submitter_ips' => 'home#submitter_ips'

  %w(login logout callback refresh).each do |action|
    get "oauth/#{action}" => "oauth##{action}", as: "oauth_#{action}"
  end

end
