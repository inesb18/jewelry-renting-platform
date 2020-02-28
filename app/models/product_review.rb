class ProductReview < ApplicationRecord
  belongs_to :rental
  belongs_to :product
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }, presence: true,
                     inclusion: { in: [0, 1, 2, 3, 4, 5] }
  validates :rental, presence: true

  validate :rental_match_product

  def rental_match_product
    if rental.product != product
      errors.add(:base, "The rental attached should be for the product attached.")
    end
  end
end
