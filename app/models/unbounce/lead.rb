module Unbounce
  class Lead < Resource

    def created_at
      @data['createdAt']
    end

    def submitter_ip
      @data['submitterIp']
    end

  end
end