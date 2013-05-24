class Lead

  attr_reader :unbounce_lead

  def self.load(unbounce_leads)
    unbounce_leads.map { |ul| new(ul) }
  end

  def initialize(unbounce_lead)
    @unbounce_lead = unbounce_lead
  end

  delegate :id, :created_at, :submitter_ip, to: :unbounce_lead

  delegate :latitude, :longitude, :country_code, :country, to: :location

  def as_json(options = {})
    {
      id: id,
      createdAt: created_at,
      submitterIp: submitter_ip,
      latitude: latitude,
      longitude: longitude,
      countryCode: country_code,
      country: country
    }
  end

  private

    def location
      @location ||= compute_location
    end

    def compute_location
      Geocoder.search(submitter_ip).first || null_location
    end

    def null_location
      OpenStruct.new(latitude: nil, longitude: nil, country_code: nil, country: nil)
    end

end