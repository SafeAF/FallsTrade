class AddModToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_moderator, :boolean, default: false
    add_column :users, :is_administrator, :boolean, default: false
  end
end
