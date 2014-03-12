class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|

      t.string :label
      t.timestamps
    end

    create_table :post_tags do |t|

      t.integer :tag_id
      t.integer :post_id
      t.timestamps
    end


  end
end
