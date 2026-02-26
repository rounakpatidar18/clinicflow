class Payment < ApplicationRecord
  belongs_to :appointment

  enum :status, {
    pending: 0,
    paid: 1,
    failed: 2,
    refunded: 3
  }

  validates :amount, presence: true,
                     numericality: { greater_than: 0 }

  validates :payment_method, presence: true
  validates :status, presence: true
  validates :appointment, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :paid, -> { where(status: :paid) }
end
