# Email delivery defaults.
if Rails.env.development?
  ActionMailer::Base.smtp_settings = { :address => "localhost", :port => 1025 }
else
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end
ActionMailer::Base.delivery_method = :smtp
