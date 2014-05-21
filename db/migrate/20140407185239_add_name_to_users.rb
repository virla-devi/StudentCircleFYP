class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstName, :string
    add_column :users, :LastName, :string
  end
end
