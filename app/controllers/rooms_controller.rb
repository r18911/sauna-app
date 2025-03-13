class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # ログインなしでも一覧・詳細は閲覧可
  before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource # CanCanCan で権限管理

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    authorize! :create, Room # 管理者だけが新規作成できる
    @room = Room.new
  end

  def create
    authorize! :create, Room # 管理者だけが作成できる
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: "部屋が登録されました"
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
    authorize! :update, @room # 管理者だけが編集できる
  end

  def update
    @room = Room.find(params[:id])
    authorize! :update, @room # 管理者だけが更新できる
  
    # 画像が選択されている場合のみ更新
    if room_params[:images].present?
      @room.images.attach(room_params[:images]) # 追加された画像をアタッチ
    end
  
    if @room.update(room_params.except(:images)) # 画像以外のデータを更新
      redirect_to rooms_path, notice: "部屋情報が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    authorize! :destroy, @room # 管理者だけが削除できる
    @room.destroy
    redirect_to rooms_path, notice: "部屋情報が削除されました"
  end

  private

  def room_params
    params.require(:room).permit(:name, :size, :bed_type, :facilities, :capacity, :price, images: [])
  end

  def check_admin
    unless current_user.admin?
      flash[:alert] = "アクセス権限がありません。"
      redirect_to root_path
    end
  end

end