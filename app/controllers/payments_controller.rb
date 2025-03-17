class PaymentsController < ApplicationController

  def index
    @payment = Payment.new
    @reservation = Reservation.find(params[:reservation_id])
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @payment = @reservation.build_payment(payment_params)
    if @payment.save
     redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:amount).merge(reservation_id: params[:reservation_id])
  end

end
