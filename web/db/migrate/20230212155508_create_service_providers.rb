class CreateServiceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_providers do |t|
      t.string :name
      t.string :company
      t.string :bio
      t.string :phone
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
