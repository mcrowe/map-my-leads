class Lead

  attr_reader :unbounce_lead

  def self.load(unbounce_leads)
    unbounce_leads.map { |ul| new(ul) }
  end

  def initialize(unbounce_lead)
    @unbounce_lead = unbounce_lead
  end

  delegate :id, :created_at, :submitter_ip, to: :unbounce_lead

  def as_json(options = {})
    {
      id: id,
      createdAt: created_at,
      submitterIp: submitter_ip
    }
  end

end