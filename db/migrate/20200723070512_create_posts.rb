class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :user_id,           null: false, foreign_key: true
      t.string  :title,             null: false
      t.text    :body,              null: false
      t.text    :url               
      t.timestamps
    end
  end
end
