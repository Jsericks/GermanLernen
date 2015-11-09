class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text            :body
      t.integer         :user_id
      t.integer         :topic_id
      t.boolean         :is_locked, default: false
      t.timestamps null: false
    end
    add_index :comments, :topic_id
    add_index :comments, :user_id
  end
end
