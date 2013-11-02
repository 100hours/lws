class AddWriterToEvent < ActiveRecord::Migration
  def change
    add_column :events, :writer_id, :integer
  end
end
