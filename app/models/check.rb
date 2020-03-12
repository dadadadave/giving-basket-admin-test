class Check < ApplicationRecord
  validates :amount, numericality: {greater_than: 0}

  belongs_to :nonprofit
  has_many :donations

  scope :unsent, -> { where(sent_at: nil).order(created_at: :asc) }
end
