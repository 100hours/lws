class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :date
      t.text :description
      t.timestamps
    end
  end
end
