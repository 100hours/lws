class AddSelectionToWriters < ActiveRecord::Migration
  def change
    add_column :writers, :selection, :string
  end
end
