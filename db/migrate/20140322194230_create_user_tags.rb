class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.integer :user_id
      t.integer :tag_id
      t.timestamps
    end
    add_index :user_tags, :user_id
    add_index :user_tags, :tag_id
  end
end
