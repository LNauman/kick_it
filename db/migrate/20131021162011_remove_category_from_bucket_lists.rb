class RemoveCategoryFromBucketLists < ActiveRecord::Migration
  def up
    remove_column :bucket_lists, :category
  end
  def down
    add_column :bucket_lists, :category, :string
  end
end
