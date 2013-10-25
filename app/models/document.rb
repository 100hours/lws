class Document < ActiveRecord::Base
  belongs_to :writer

  after_commit :notify_requester

  def word_count
    body.blank? ? 0 : body.split.size
  end

  def notify_requester
    DocumentNotifier.writing_started_on(self).deliver unless self.requester.blank?
  end
end
