class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :apartment

  validates :user, presence: true
  validates :apartment, presence: true
  validates_uniqueness_of :user_id, scope: [:start_date, :end_date], message: "Already booked!"

end
