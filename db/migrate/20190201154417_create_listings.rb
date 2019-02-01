class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :available_beds
      t.integer :price
      t.string :description
      t.boolean :has_wifi
      t.string :welcome_message
      t.timestamps
    end
  end
end
