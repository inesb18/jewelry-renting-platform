class MyValidator < ActiveModel::Validator
  def validate(record)
    valid = true
    record.product.unavailabilities.each do |un|
      if record.start_date <= un.end_date && record.start_date >= un.start_date
        valid = false
      end
    end
    record.errors.add(:base, "Sorry, it is unavailable. Try other dates.") unless valid
  end
end

class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :rentee_reviews
  has_many :product_reviews
  validates :start_date, presence: :true
  validates :end_date, presence: :true
  validates :product, presence: true
  validates :user, presence: true
  validate :end_after_start
  validate :future_dates

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
end

