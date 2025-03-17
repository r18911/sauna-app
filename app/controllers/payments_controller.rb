class PaymentsController < ApplicationController
  before_action :set_reservation, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.valid?
      pay_item
      @payment.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def payment_params
    params.require(:payment).permit(:amount).merge(reservation_id: params[:reservation_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @payment.amount,
        card: payment_params[:token],
        currency: 'jpy'
      )
  end
end
