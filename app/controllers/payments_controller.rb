class PaymentsController < ApplicationController
  before_action :set_appointment
  before_action :set_payment, only: %i[edit update destroy]

  def new
    @payment = @appointment.payments.new
  end

  def create
    @payment = @appointment.payments.new(payment_params)

    if @payment.save
      redirect_to @appointment, notice: "Payment recorded successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @payment.update(payment_params)
      redirect_to @appointment, notice: "Payment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @payment.destroy
      redirect_to @appointment, notice: "Payment deleted successfully."
    else
      redirect_to @appointment, alert: @payment.errors.full_messages.to_sentence
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_payment
    @payment = @appointment.payments.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(
      :amount,
      :payment_method,
      :status,
      :paid_at
    )
  end
end
