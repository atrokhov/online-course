class AddFirstNameLastNameAndBlockedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name,   :string
    add_column :users, :last_name,    :string
    add_column :users, :blocked,      :boolean, default: false
    add_column :users, :role,         :integer, default: 1
    add_column :users, :subscription, :boolean, default: false
  end
end
