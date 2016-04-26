if Rails.env.development? || Rails.env.production? || Rails.env.staging?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
          address:        'smtp.mailgun.org',
          port:           '587',
          user_name:      ENV['MAILGUN_USERNAME'],
          password:       ENV['MAILGUN_PASSWORD'],
    }
end