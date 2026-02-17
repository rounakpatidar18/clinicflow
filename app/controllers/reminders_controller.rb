class RemindersController < ApplicationController
  before_action :set_appointment
  before_action :set_reminder, only: %i[edit update destroy]

  def new
    @reminder = @appointment.reminders.new
  end

  def create
    @reminder = @appointment.reminders.new(reminder_params)

    if @reminder.save
      redirect_to @appointment, notice: "Reminder created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reminder.update(reminder_params)
      redirect_to @appointment, notice: "Reminder updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @reminder.destroy
      redirect_to @appointment, notice: "Reminder deleted successfully."
    else
      redirect_to @appointment, alert: @reminder.errors.full_messages.to_sentence
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_reminder
    @reminder = @appointment.reminders.find(params[:id])
  end

  def reminder_params
    params.require(:reminder).permit(
      :reminder_type,
      :status,
      :sent_at
    )
  end
end
