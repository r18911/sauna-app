class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: [:new]
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def index
    if current_user.admin?
      @reservations = Reservation.all.order(start_time: :desc)
    else
      @reservations = current_user.reservations.order(start_time: :desc)
    end
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @room = Room.find(reservation_params[:room_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.room = @room
    @reservation.status ||= 0

    if @reservation.save
      redirect_to reservations_path(@reservation), notice: "予約が完了しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path, notice: "予約が更新されました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.admin? || @reservation.user == current_user
      @reservation.destroy
      redirect_to reservations_path, notice: "予約をキャンセルしました。"
    else
      redirect_to reservations_path, alert: "キャンセル権限がありません。"
    end
  end

  private

  def set_reservation
    if current_user.admin?
      @reservation = Reservation.find_by(id: params[:id])
    else
      @reservation = current_user.reservations.find_by(id: params[:id])
    end
    redirect_to reservations_path, alert: "予約が見つかりません。" unless @reservation
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:room_id, :start_time, :end_time, :number_of_people)
  end
end
