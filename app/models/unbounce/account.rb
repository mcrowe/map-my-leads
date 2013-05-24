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

    def leads
      l = []
      sub_accounts.each do |sub_account|
        l += sub_account.leads
      end
      l
    end

  end
end