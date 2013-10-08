class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.integer :bucket_list_id, null: false
      t.text :adventure_description, null: false
      t.string :picture

      t.timestamps
    end
  end
end
