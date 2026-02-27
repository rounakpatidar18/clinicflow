class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    @appointments = Appointment.includes(:doctor, :patient).order(scheduled_at: :asc)
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to @appointment, notice: "Appointment created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Appointment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment deleted successfully."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(
      :patient_id,
      :doctor_id,
      :clinic_id,
      :scheduled_at,
      :status,
      :notes
    )
  end
end
