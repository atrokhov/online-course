class AddFirstNameLastNameAndBlockedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name,   :string
    add_column :users, :last_name,    :string
    add_column :users, :blocked,      :boolean, default: false
    add_column :users, :admin,        :boolean, default: false
    add_column :users, :client,       :boolean, default: true
    add_column :users, :teacher,      :boolean, default: false
    add_column :users, :superuser,    :boolean, default: false
    add_column :users, :manager,      :boolean, default: false
    add_column :users, :subscription, :boolean, default: false
  end
end
