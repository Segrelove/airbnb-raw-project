require 'rails_helper'

RSpec.describe Reservation, type: :model do

  before(:each) do 
    @user = User.create(
      id: 1,
      email: "mlesegret@gmail.com", 
      phone_number: "0689716569", 
      description: "j'aime les fruits en sirops"
      ),
    @city = City.create(
      id: 1,
      name: "Fourqueux", 
      zip_code: "78112"),
    @listing = Listing.create(
      id: 1,
      available_beds: 1, 
      price: 80, 
      description: "some description", 
      has_wifi: true, 
      welcome_message: "Welcome to my crib, MTV", 
      city_id: 1, 
      user_id: 1
    ),
    @reservation = Reservation.create(
    start_date: "2019-02-03 00:00:00", 
    end_date: "2019-02-06 00:00:00", 
    listing_id: 1, 
    user_id: 1 
    )
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@reservation).to be_a(Reservation)
      expect(@reservation).to be_valid
    end

    describe "#some_attribute" do
      it "should not be valid without user_id" do
        bad_reservation = Reservation.create(start_date: "2019-02-03 00:00:00", end_date: "2019-02-06 00:00:00", listing_id: 1)
        expect(bad_reservation).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_reservation.errors.include?(:user_id)).to eq(true)
      end
      it "should not be valid without listing_id" do
        bad_reservation = Reservation.create(start_date: "2019-02-03 00:00:00", end_date: "2019-02-06 00:00:00", user_id: 1)
        expect(bad_reservation).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_reservation.errors.include?(:listing_id)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "some association" do
      # teste cette association
    end

  end

  context "callbacks" do

    describe "some callbacks" do
      # teste ce callback
    end

  end

  context "public instance methods" do

    describe "#some_method" do
      # teste cette méthode
    end

  end

  context "public class methods" do

    describe "self.some_method" do
      # teste cette méthode
    end

  end

end