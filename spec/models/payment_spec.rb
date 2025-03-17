require 'rails_helper'

RSpec.describe Payment, type: :model do
  before do
    @user = FactoryBot.create(:user)  
    @room = FactoryBot.create(:room)  
    @reservation = FactoryBot.create(:reservation, user: @user, room: @room)  
    @payment = FactoryBot.build(:payment, reservation: @reservation)  
  end

  context '支払い情報が正しく入力されている場合' do
    it "金額とトークンがあれば支払いができる" do
      expect(@payment).to be_valid
    end
  end

  context '支払い情報に不備がある場合' do
    it "金額が空では支払いができない" do
      @payment.amount = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Amount can't be blank")
    end

    it "トークンが空では支払いができない" do
      @payment.token = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Token can't be blank")
    end

    it "reservationが紐付いていないと支払いができない" do
      @payment.reservation = nil
      @payment.valid?
      expect(@payment.errors.full_messages).to include("Reservation must exist")
    end
  end
end