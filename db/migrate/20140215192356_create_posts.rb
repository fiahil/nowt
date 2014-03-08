class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :update_count
      t.belongs_to :user

      t.timestamps
    end
  end
end
