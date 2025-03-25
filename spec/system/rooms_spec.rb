require 'rails_helper'

RSpec.describe 'Rooms', type: :system do
  before do
    @admin = FactoryBot.create(:user, admin: true)
    @user = FactoryBot.create(:user, admin: false)
    @room  = FactoryBot.build(:room)
    @image_path = Rails.root.join('spec/fixtures/pexels-jvdm-1457842.jpg')
  end

  context '部屋投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @admin.email
      fill_in 'パスワード', with: @admin.password
      click_button 'ログイン'
      expect(page).to have_current_path(root_path).or have_current_path(rooms_path)

      click_link '部屋を追加する'

      fill_in '部屋名', with: @room.name
      fill_in '広さ (㎡)', with: @room.size.to_s.gsub(/[^\d]/, '') # 数値だけ抽出
      fill_in 'ベッドタイプ', with: @room.bed_type
      fill_in '設備', with: @room.facilities
      fill_in '定員 (名)', with: @room.capacity
      fill_in '料金 (円)', with: @room.price
      attach_file '部屋の画像', @image_path

      expect {
        click_button '登録'
        sleep 1
      }.to change { Room.count }.by(1)

      expect(page).to have_content(@room.name)
      expect(page).to have_content(@room.price)
    end
  end

  context '一般ユーザーは投稿できないとき' do
    it '一般ユーザーは新規投稿ページにアクセスできない' do
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'

      visit new_room_path
      expect(current_path).not_to eq(new_room_path)
    end
  end

  context 'ログインしていないとき' do
    it 'ログインしていないユーザーは投稿ページにアクセスできない' do
      visit new_room_path
      expect(current_path).to eq(new_user_session_path)
    end
  end
end