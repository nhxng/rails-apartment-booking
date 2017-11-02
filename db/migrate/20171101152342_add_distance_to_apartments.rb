class AddDistanceToApartments < ActiveRecord::Migration[5.0]
  def change
    add_column :apartments, :distance, :float
  end
end
