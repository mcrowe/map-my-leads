module Unbounce
  class Resource

    def initialize(token, data)
      @token, @data = token, data
    end

    def id
      @data['id']
    end

    def name
      @data['name']
    end

  end
end