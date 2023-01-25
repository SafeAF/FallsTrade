class AddDefaultValueToViewsInListings < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :views, :integer, :default => 0
  end
end
