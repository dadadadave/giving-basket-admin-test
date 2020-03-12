class Check < ApplicationRecord
  validates :amount, numericality: {greater_than: 0}
  belongs_to :nonprofit
end
