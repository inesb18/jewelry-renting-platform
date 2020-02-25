class Unavailability < ApplicationRecord
  belongs_to :product
  validates :start_date, presence: :true
  validates :end_date, presence: :true
  validates :product, presence: true
  validate :end_after_start
  validate :future_dates

  private
  def end_after_start
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
   end

   def future_dates
    if start_date <= Date.today
      errors.add(:start_date, "must be after today")
    end
   end
end
