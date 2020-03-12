class Nonprofit < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :checks
  has_many :donations

  def self.find_and_update(id, params)
    nonprofit = find(id)
    nonprofit.update(params)
    nonprofit
  end
end
