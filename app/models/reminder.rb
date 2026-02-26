class Reminder < ApplicationRecord
  belongs_to :appointment

  enum :reminder_type, {
    sms: 0,
    email: 1,
    call: 2
  }

  enum :status, {
    pending: 0,
    sent: 1,
    failed: 2
  }

  validates :appointment, presence: true
  validates :reminder_type, presence: true
  validates :status, presence: true

  scope :pending, -> { where(status: :pending) }
  scope :recent, -> { order(created_at: :desc) }
end
