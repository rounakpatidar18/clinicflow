class DashboardMetrics
  def initialize(scope = Appointment.all)
    @scope = scope
  end

  def total_appointments
    @scope.count
  end

  def upcoming_appointments
    @scope.upcoming.count
  end

  def completed_appointments
    @scope.completed.count
  end

  def total_revenue
    Payment.paid.sum(:amount)
  end

  def pending_payments
    Payment.where(status: :pending).count
  end

  def pending_reminders
    Reminder.pending.count
  end
end
