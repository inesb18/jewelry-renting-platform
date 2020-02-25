class Unavailability < ApplicationRecord
  belongs_to :product
  validates :start_date, presence: :true
  validates :end_date, presence: :true
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
  validates :product, presence: true
end
