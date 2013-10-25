class Notifier < ActionMailer::Base
  def feedback(address, message)
    @message = message
    mail(to: address, from: message.email, subject: "[LWS Feedback] #{message.subject}")
  end
end
