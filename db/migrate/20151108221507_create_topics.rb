class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string          :title
      t.text            :body
      t.integer         :user_id
      t.integer         :forum_id
      t.integer         :comment_count, default: 0
      t.boolean         :is_active,     default: true
      t.boolean         :is_locked,     default: false
      t.timestamps null: false
    end
    add_index :topics, :user_id
    add_index :topics, :forum_id
    add_index :topics, :is_active
    add_index :topics, :is_locked
  end
end
