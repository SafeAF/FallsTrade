class RemoveUserReferenceFromListings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :listings, :user, null: false, foreign_key: true
  end
end
