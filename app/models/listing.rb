class Listing < ApplicationRecord
  validates :available_beds, 
    numericality: { greater_than: 0, less_than: 25 },
    presence: true
  validates :price, 
    numericality: { greater_than: 0 },
    presence: true
  validates :description,
    presence: true,
    length: { in: 1..140 }
  validates :welcome_message,
    presence: true
  validates :city_id,
    presence: true
  validates :user_id,
    presence: true
  belongs_to :user
  belongs_to :city
  has_many :reservations
  has_many :users, through: :reservations
end
