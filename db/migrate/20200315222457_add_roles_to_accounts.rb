class AddRolesToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :superadmin_role, :boolean
    add_column :accounts, :supervisor_role, :boolean
    add_column :accounts, :account_role, :boolean
  end
end
