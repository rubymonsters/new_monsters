class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :already_notified, :boolean, default: false
  end
end
