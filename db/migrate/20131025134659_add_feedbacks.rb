class AddFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email, :subject
      t.text :body
      t.timestamps
    end
  end
end
