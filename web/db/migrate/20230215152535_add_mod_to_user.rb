class AddModToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :moderator?, :boolean
    add_column :users, :administrator?, :boolean
  end
end
