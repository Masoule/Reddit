class CreatePostSub < ActiveRecord::Migration[5.1]
  def change
    create_table :post_subs do |t|
      t.integer :sub_id, null: false
      t.integer :post_id, null: false
    end
  end
end
