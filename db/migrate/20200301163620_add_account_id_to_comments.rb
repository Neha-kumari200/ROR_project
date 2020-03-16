class AddAccountIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :account_id, :string
    add_column :comments, :integer, :string
  end
end
