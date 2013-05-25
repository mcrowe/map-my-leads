module Unbounce
  class Api

    def initialize(token)
      @token = token
    end

    def accounts
      @token.get('/accounts').parsed["accounts"].map do |account_hash|
        Unbounce::Account.new(@token, account_hash)
      end
    end

    def find_account_by_id(id)
      accounts.find { |a| a.id == id.to_i }
    end

  end
end