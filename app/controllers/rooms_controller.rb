class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "部屋が登録されました"
    else
      render :new
    end
  end
  
  private
  
  def room_params
    params.require(:room).permit(:name, :size, :bed_type, :facilities, :capacity, :price, images: [])
  end

end
