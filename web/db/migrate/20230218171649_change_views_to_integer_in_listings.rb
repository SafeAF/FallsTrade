class ChangeViewsToIntegerInListings < ActiveRecord::Migration[7.0]
  def change
    change_column :listings, :views, :integer
  end
end
