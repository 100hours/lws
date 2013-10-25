class Feedback < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, with: /.+@.+\..+/i
  validates_presence_of :body

  after_create :send_feedback

  def send_feedback
    Lws::Application.config.notify_list.each do |address|
      Notifier.feedback(address, self).deliver
    end
  end
end
