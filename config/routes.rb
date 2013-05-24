MapMyLeads::Application.routes.draw do

  root to: 'home#index'
 %w(login logout callback refresh).each do |action|
    get "oauth/#{action}" => "oauth##{action}", as: "oauth_#{action}"
  end

  resources :leads, only: [:index]

end
