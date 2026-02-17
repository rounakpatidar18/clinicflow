class Doctor < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error

  validates :name, presence: true
  validates :specialization, presence: true

  scope :alphabetical, -> { order(:name) }
end
