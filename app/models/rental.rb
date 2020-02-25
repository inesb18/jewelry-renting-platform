class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :rentee_reviews
  has_many :product_reviews
  validates :start_date, presence: :true
  validates :end_date, presence: :true
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
  validates :product, presence: true
  validates :user, presence: true
end
