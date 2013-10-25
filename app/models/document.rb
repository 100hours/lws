class Document < ActiveRecord::Base
  belongs_to :writer

  after_create :notify_requester

  def word_count
    body.blank? ? 0 : body.split.size
  end

  def notify_requester
    DocumentNotifier.writing_started_on(self).deliver unless self.requester.blank?
  end
  def to_pusher
    {
      id:         self.id.to_s,
      title:      self.title,
      body:       self.body,
      updated_at: self.updated_at
    }
  end

end
