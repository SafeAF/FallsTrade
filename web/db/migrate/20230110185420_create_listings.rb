class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :category
      t.string :description
      t.string :location
      t.float :price

      t.timestamps
    end
  end
end
