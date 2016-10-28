class User < ApplicationRecord
  has_secure_password
  has_many :rentals, :foreign_key => 'borrower_id'
  has_many :listings, :foreign_key => 'lender_id'
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :location, presence: true

  # validates :password, presence: true
  # validates :password_confirmation, presence: true
end