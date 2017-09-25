class Apartment < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  serialize :equipment
end
