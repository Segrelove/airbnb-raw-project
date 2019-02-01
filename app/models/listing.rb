class Listing < ApplicationRecord
  validates :available_beds, 
    numericality: { greater_than: 0, less_than: 25 },
    presence: true
  validates :price, 
    numericality: { greater_than: 0},
    presence: true
  belongs_to :city
  has_many :reservations
  has_many :users, through: :reservations
end
