class Patient < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error

  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true

  scope :alphabetical, -> { order(:name) }
end
