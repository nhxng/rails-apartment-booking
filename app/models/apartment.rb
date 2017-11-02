class Apartment < ApplicationRecord
  ACCOMODATION_TYPES = ["entire apartment", "private room", "shared room"]
  NUMERAL_FILTER = (0..10)
  belongs_to :user
  validates :title, presence: true
  # validates :accomodation_type, inclusion: { in: ACCOMODATION_TYPES,
  #   message: "%{value} is not a valid accomodation type"}
  # validates :beds, :bedrooms, :guests, :bathrooms, numericality: { only_integer: true, greater_than_or_equal_to: NUMERAL_FILTER.first, less_than_or_equal_to: NUMERAL_FILTER.last}
  # validates :price_per_night, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  serialize :equipment
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
