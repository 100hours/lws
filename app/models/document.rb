class Document < ActiveRecord::Base
  belongs_to :writer

  def word_count
    body.split.size
  end
end
