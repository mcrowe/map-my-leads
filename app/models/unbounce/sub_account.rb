module Unbounce
  class SubAccount < Resource

    def name
      @data['name']
    end

    def leads(options = {})
      url = leads_url(options)

      @token.get(url).parsed['leads'].map do |lead_hash|
        Unbounce::Lead.new(@token, lead_hash)
      end
    end

    private

      def leads_url(options = {})
        url = "/sub_accounts/#{id}/leads"

        url << "?limit=#{options[:limit] || 5 }"

        if options[:from]
          url << "&from=#{options[:from].rfc3339}"
        end

        URI.encode(url)
      end

  end
end