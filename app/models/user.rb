class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :phone_number,
    presence: true,
    uniqueness: true,
    format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
  validates :description, 
    presence: true
  has_many :listings
  has_many :reservations
  has_many :listings, through: :reservations

  def full_info
    "Email=> #{email}, Phone Number => #{phone_number}, Description => #{description}."
  end
end
