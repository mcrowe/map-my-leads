MapMyLeads::Application.routes.draw do

  root to: 'accounts#index'

  %w(login logout callback refresh).each do |action|
    get "oauth/#{action}" => "oauth##{action}", as: "oauth_#{action}"
  end

  resources :accounts, only: [:show] do
      resources :leads, only: [:index]
  end

end
