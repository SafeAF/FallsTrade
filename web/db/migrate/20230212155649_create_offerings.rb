class CreateOfferings < ActiveRecord::Migration[7.0]
  def change
    create_table :offerings do |t|
      t.string :title
      t.references :service_provider, null: false, foreign_key: true
      t.text :description
      t.string :category
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
