class ChangeRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, null: true, default: ""
  end
end
