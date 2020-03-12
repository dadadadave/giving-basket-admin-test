class Nonprofit < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  has_many :checks
end
