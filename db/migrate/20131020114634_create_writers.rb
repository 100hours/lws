class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :name
      t.text :bio
      t.timestamps
    end
  end
end
