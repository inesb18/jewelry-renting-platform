class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :rentee_reviews
  has_many :product_reviews
end
