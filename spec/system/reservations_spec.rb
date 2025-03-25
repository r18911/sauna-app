require 'rails_helper'

RSpec.describe 'Reservations', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
  end

  context '予約ができるとき' do
    it 'ログインしたユーザーが予約に成功すると一覧に遷移する' do
      # ログイン
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
      expect(page).to have_current_path(root_path).or have_current_path(rooms_path)

      # 予約ページに遷移
      visit new_reservation_path(room_id: @room.id)

      # フォーム入力
      checkin = (Date.today + 1).to_s
      checkout = (Date.today + 2).to_s
      page.execute_script("document.getElementById('checkin-time').value = '#{checkin}'")
      page.execute_script("document.getElementById('checkout-time').value = '#{checkout}'")
      fill_in '宿泊人数', with: 2

      # 予約送信 & モデルカウントの検証
      expect {
        click_button '予約する'
        sleep 1
      }.to change { Reservation.count }.by(1)

      # 遷移先
      reservation = Reservation.last
      expect(current_path).to eq(reservations_path(reservation))
    end
  end

  context 'ログインしていないとき' do
    it '予約ページにアクセスできずログインページにリダイレクトされる' do
      visit new_reservation_path(room_id: @room.id)
      expect(current_path).to eq(new_user_session_path)
    end
  end
end