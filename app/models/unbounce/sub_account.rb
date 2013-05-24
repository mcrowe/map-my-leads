module Unbounce
  class SubAccount < Resource

    def name
      @data['name']
    end

    def leads
      @token.get("/sub_accounts/#{id}/leads").parsed["leads"].map do |lead_hash|
        Unbounce::Lead.new(@token, lead_hash)
      end
    end

  end
end