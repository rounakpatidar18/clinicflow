class DashboardController < ApplicationController
  def index
    metrics = DashboardMetrics.new

    @total_appointments     = metrics.total_appointments
    @upcoming_appointments  = metrics.upcoming_appointments
    @completed_appointments = metrics.completed_appointments
    @total_revenue          = metrics.total_revenue
    @pending_payments       = metrics.pending_payments
    @pending_reminders      = metrics.pending_reminders
  end
end
