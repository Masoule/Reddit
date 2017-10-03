class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :user_id, null: false
    end
    add_index :subs, :user_id
  end
end
