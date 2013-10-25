class AddRequesterToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :requester, :string
  end
end
