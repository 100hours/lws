class AddWriterToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :writer
  end
end
