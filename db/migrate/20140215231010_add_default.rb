class AddDefault < ActiveRecord::Migration
  def change
    remove_column :posts, :update_count
    add_column :posts, :update_count, :integer, null: false, default: 0
  end
end
