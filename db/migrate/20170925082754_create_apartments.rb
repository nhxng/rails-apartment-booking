class CreateApartments < ActiveRecord::Migration[5.0]
  def change
    create_table :apartments do |t|
      t.string :title
      t.string :accomodation_type
      t.integer :beds
      t.integer :bedrooms
      t.integer :bathrooms
      t.integer :guests
      t.string :equipment
      t.string :city
      t.string :address
      t.integer :price_per_night
      t.references  :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
