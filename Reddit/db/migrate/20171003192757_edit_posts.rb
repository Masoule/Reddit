class EditPosts < ActiveRecord::Migration[5.1]
  def change
    drop_table :posts
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, null: false
    end
    add_index :posts, :user_id
  end
end
