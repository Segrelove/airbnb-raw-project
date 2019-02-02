class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :user
  validates :start_date, :presence => { :message => "must be a valid date/time" }
  validates :end_date, :presence => { :message => "must be a valid date/time" }
  validates :user_id,
    presence: true
  validates :listing_id,
    presence: true
  validate :start_must_be_before_end_time

  def is_started
    self.start_date < Time.now
  end

  def is_finished
    self.end_date < Time.now
  end

  def length
  	self.end_date.to_i - self.start_date.to_i
  end

  private
  def start_must_be_before_end_time
      errors.add(:start_date, "must be before end time") unless
          start_date < end_date
  end 
  
end
