class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :unavailabilities
  has_many :rentals
end
