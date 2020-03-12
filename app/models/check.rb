class Check < ApplicationRecord
  validates :amount, numericality: {greater_than: 0}

  belongs_to :nonprofit
  has_many :donations

  scope :unsent, -> { where(sent_at: nil).order(created_at: :asc) }

  def mark_as_sent!
    self.sent_at = Time.now
    save!
  end
end
