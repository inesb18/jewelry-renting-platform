class MyValidator < ActiveModel::Validator
  def validate(record)
    valid = true
    un_start_date = nil
    un_end_date = nil
    (record.product.unavailabilities + record.product.rentals).each do |un|
      if record.start_date <= un.end_date && record.start_date >= un.start_date
        valid = false
        un_start_date = un.start_date
        un_end_date = un.end_date
      elsif record.end_date <= un.end_date && record.end_date >= un.start_date
        valid = false
        un_start_date = un.start_date
        un_end_date = un.end_date
      elsif record.start_date < un.start_date && record.end_date > un.end_date
        valid = false
        un_start_date = un.start_date
        un_end_date = un.end_date
      end
    end
    unless valid
      record.errors.add(:base, "Sorry, it is unavailable from #{un_start_date.strftime('%b %d, %Y')} to #{un_end_date.strftime('%b %d, %Y')}. Try other dates.")
    end
  end
end

class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :renter_reviews
  has_many :product_reviews
  validates :start_date, presence: :true
  validates :end_date, presence: :true
  validates :product, presence: true
  validates :user, presence: true

  validate :future_dates
  validate :end_after_start
  validate :different_dates

  include ActiveModel::Validations
  validates_with MyValidator

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

  def different_dates
    if start_date == end_date
      errors.add(:base, "The rental has to be for 24 hours minimum")
    end
  end

end

