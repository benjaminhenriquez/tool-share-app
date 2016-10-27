class Rental < ApplicationRecord
  belongs_to :listing
  belongs_to :borrower
  belongs_to :transaction
end
