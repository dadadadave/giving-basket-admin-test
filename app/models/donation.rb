class Donation < ApplicationRecord
  validates :amount, numericality: {greater_than: 0}
  belongs_to :nonprofit
  belongs_to :check, optional: true
end
