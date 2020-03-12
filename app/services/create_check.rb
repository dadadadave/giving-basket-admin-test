class CreateCheck < ApplicationService
  attr_reader :donations, :nonprofit

  def initialize(nonprofit, donations)
    @nonprofit = nonprofit
    @donations = donations
  end

  def call
    Check.transaction do
      check = Check.create nonprofit: nonprofit, amount: donations.pluck(:amount).sum
      donations.update_all check_id: check.id
      check
    end
  end
end
