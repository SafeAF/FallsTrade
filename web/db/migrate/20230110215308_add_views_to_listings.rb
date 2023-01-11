class AddViewsToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :views, :integer
  end
end
