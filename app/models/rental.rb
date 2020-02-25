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

  def end_after_start
  return if end_date.blank? || start_date.blank?

  if end_date < start_date
    errors.add(:end_date, "must be after the start date")
  end
 end
end
