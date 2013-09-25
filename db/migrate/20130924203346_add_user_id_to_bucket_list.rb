class AddUserIdToBucketList < ActiveRecord::Migration
  def up
    add_column :bucket_lists, :user_id, :integer, null: false
  end
  def down
    remove_column :bucket_lists, :user_id
  end
end
