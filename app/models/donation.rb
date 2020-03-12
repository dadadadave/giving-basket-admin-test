class Donation < ApplicationRecord
  validates :amount, numericality: {greater_than: 0}

  belongs_to :nonprofit
  belongs_to :check, optional: true

  scope :with_no_check, -> { where(check: nil) }
end
