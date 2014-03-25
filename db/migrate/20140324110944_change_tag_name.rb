class ChangeTagName < ActiveRecord::Migration
  def change
  	rename_column :tags, :label, :name
  end
end
