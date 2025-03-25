require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @reservation = FactoryBot.build(:reservation)
  end

  describe '予約登録' do
    context '登録できる場合' do
      it 'start_time, end_time, number_of_peopleがあれば登録できる' do
        expect(@reservation).to be_valid
      end
    end

    context '登録できない場合' do
      it 'start_timeが空では登録できない' do
        @reservation.start_time = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Start time can't be blank")
      end

      it 'end_timeが空では登録できない' do
        @reservation.end_time = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("End time can't be blank")
      end

      it 'number_of_peopleが空では登録できない' do
        @reservation.number_of_people = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Number of people can't be blank")
      end
    end
  end
end
