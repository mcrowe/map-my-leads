require 'ipaddr'

def fake_submissions(user)
  account = user.primary_account
  page = account.pages.last

  0.upto(90) do |ihour|
    count = rand(10)

    count.times do
      create_submission(page, ihour.hours.ago)
    end
  end
end

def random_ip
  IPAddr.new(rand(2**32), Socket::AF_INET).to_s
end

def random_email
  "mitch+#{rand(2**32)}@gmail.com"
end

def create_submission(page, created_at = Date.today)
  fs = FormSubmission.create!(
    page_uuid: page.uuid,
    variant_id: 'a',
    submitter_ip: random_ip,
    form_data: { 'email' => random_email }.to_json
  )

  fs.created_at = created_at
  fs.save!
end