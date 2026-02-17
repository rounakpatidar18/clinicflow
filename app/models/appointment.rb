class Appointment < ApplicationRecord
  enum :status, {
    scheduled: 0,
    completed: 1,
    cancelled: 2,
    no_show: 3
  }

  # Validations
  validates :patient_name, presence: true
  validates :patient_phone, presence: true
  validates :scheduled_at, presence: true
  validates :status, presence: true

  validate :scheduled_at_cannot_be_in_the_past

  # Scopes
  scope :upcoming, -> { where("scheduled_at >= ?", Time.current).order(:scheduled_at) }
  scope :past, -> { where("scheduled_at < ?", Time.current).order(scheduled_at: :desc) }
  scope :by_status, ->(status) { where(status: statuses[status]) if status.present? }

  private

  def scheduled_at_cannot_be_in_the_past
    return if scheduled_at.blank?

    if scheduled_at < Time.current
      errors.add(:scheduled_at, "cannot be in the past")
    end
  end
end
