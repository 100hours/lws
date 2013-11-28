class Writer < ActiveRecord::Base
  has_many :documents, -> { order "created_at" }
  has_one :event

  def first_name
    name.split(" ").first
  end

  def has_selection?
    self.selection.present?
  end


end
