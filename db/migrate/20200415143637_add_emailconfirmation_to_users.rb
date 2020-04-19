class AddEmailconfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :emailconfirmation, :boolean, default: false
  end
end
