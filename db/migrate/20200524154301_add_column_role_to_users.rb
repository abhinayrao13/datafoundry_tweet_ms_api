class AddColumnRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :enum, default: 0
  end
end
