class ChangeEquipmentInApartments < ActiveRecord::Migration[5.0]
  def change
    change_column :apartments, :equipment, :text
  end
end
