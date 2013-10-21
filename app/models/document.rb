class Document < ActiveRecord::Base
  belongs_to :writer

  def word_count
    body.blank? ? 0 : body.split.size
  end
end
