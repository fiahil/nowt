class AddIndexesToTags < ActiveRecord::Migration
  def change
    change_column :tags, :label, :string, null: false
    add_index :tags, :label
    add_index :tags, :description
  end
end
