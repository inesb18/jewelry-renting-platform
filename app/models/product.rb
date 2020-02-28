class Product < ApplicationRecord
  include PgSearch::Model
   pg_search_scope :search_by_product_name_and_description_and_category,
    against: [ :name, :description, :category ],
    using: {
      tsearch: { prefix: true }
    }

  has_one_attached :photo
  belongs_to :user
  has_many :unavailabilities, dependent: :destroy
  has_many :rentals
  validates :user, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :photo, attached: true
  validates :category, inclusion: { in: %w(necklaces earrings bracelets rings sets other) }
  validates :category, presence: true
  validates_numericality_of :price, :greater_than => 0.0
end
