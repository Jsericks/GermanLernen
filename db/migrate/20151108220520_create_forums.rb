class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string          :name
      t.text            :description
      t.text            :icon_class
      t.boolean         :is_active,   default: true
      t.integer         :topic_count, default: 0
      t.timestamps      null: false
    end
    add_index :forums, :is_active
    add_index :forums, :name, unique: true
  end
end
