class Nonprofit < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :checks
  has_many :donations

  scope :no_stripe, -> { where(stripe_acct: nil) }
  scope :with_unprocessed_donations, -> do
    no_stripe.joins(:donations).merge(Donation.with_no_check).distinct
  end

  def self.find_and_update(id, params)
    nonprofit = find(id)
    nonprofit.update(params)
    nonprofit
  end
end
