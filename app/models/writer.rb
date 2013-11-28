class Writer < ActiveRecord::Base
  has_many :documents
  has_one :event

  def first_name
    name.split(" ").first
  end

  def has_selection?
    selection_week
  end


end
