class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.integer :user_id
      t.integer :tag_id
      t.timestamps
    end
    add_index :user_tags, ["user_id", "tag_id"], :unique => true
  end
end
