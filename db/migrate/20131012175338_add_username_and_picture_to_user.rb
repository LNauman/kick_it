class AddUsernameAndPictureToUser < ActiveRecord::Migration
  def up
    add_column :users, :username, :string, null: false, default: "incomplete"
    add_column :users, :picture, :string, null: false
  end

  def down 
    remove_column :users, :username
    remove_column :users, :picture
  end
end
