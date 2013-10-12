class AddStateToAdventures < ActiveRecord::Migration
  def change
    add_column :adventures, :state, :string, default: "incomplete"
  end
end
