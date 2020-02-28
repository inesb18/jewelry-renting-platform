class Availability < ActiveModel::Validator
  def validate(record)
    un_start_date = nil
    un_end_date = nil
    valid = (record.product.unavailabilities + record.product.rentals.where(confirmed: true)).all? do |un|
      if un != record
        if record.start_date <= un.end_date && record.start_date >= un.start_date
          un_start_date = un.start_date
          un_end_date = un.end_date
          false
        elsif record.end_date <= un.end_date && record.end_date >= un.start_date
          un_start_date = un.start_date
          un_end_date = un.end_date
          false
        elsif record.start_date < un.start_date && record.end_date > un.end_date
          un_start_date = un.start_date
          un_end_date = un.end_date
          false
        else
          true
        end
      else
        true
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

  # validate :future_dates
  validate :end_after_start
  validate :different_dates
  validate :not_owner_booking
  validate :not_confirmed_and_declined

  include ActiveModel::Validations
  validates_with Availability

  def not_confirmed_and_declined
    if confirmed && declined
      errors.add(:base, "Rental can't be both confirmed and declined.")
    end
  end

  def not_owner_booking
    if product.user == user
      errors.add(:base, "You can't rent your own jewelry.")
    end
  end

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

