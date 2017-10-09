class ChangeDateClassesToBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :start_date, :date
    change_column :bookings, :end_date, :date
    remove_column :bookings, :date
  end
end
