class Clinic < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :doctors, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true

  scope :alphabetical, -> { order(:name) }
end
