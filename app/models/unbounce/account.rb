module Unbounce
  class Account < Resource

    def name
      @data['name']
    end

    def sub_accounts
      @token.get("/accounts/#{id}/sub_accounts").parsed["subAccounts"].map do |sub_account_hash|
        Unbounce::SubAccount.new(@token, sub_account_hash)
      end
    end

  end
end