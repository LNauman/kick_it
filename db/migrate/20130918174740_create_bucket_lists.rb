class CreateBucketLists < ActiveRecord::Migration
  def change
    create_table :bucket_lists do |t|
      t.string :title, null: false
      t.string :category

      t.timestamps
    end
  end
end
