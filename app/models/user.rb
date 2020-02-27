class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo, dependent: :destroy
  has_many :rentals
  has_many :products, dependent: :destroy
  validates :first_name, presence: true, format: { with: /\A[a-z|A-Z|\s|-|,]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[a-z|A-Z|\s|-|,]+\z/ }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
