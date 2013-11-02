class Writer < ActiveRecord::Base
  has_many :documents
  has_one :event
end
