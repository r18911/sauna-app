require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe '部屋登録' do
    context '登録できる場合' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@room).to be_valid
      end
    end

    context '登録できない場合' do
      it 'nameが空では登録できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end

      it 'sizeが空では登録できない' do
        @room.size = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Size can't be blank")
      end

      it 'bed_typeが空では登録できない' do
        @room.bed_type = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Bed type can't be blank")
      end

      it 'facilitiesが空では登録できない' do
        @room.facilities = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Facilities can't be blank")
      end

      it 'priceが空では登録できない' do
        @room.price = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Price can't be blank")
      end

      it 'capacityが空では登録できない' do
        @room.capacity = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Capacity can't be blank")
      end
    end
  end
end
