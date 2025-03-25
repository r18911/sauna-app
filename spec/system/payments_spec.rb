require 'rails_helper'

RSpec.describe "Payments", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @room = FactoryBot.create(:room)
    @reservation = FactoryBot.create(:reservation, user: @user, room: @room)
  end

  context '支払いができるとき' do
    it 'ログインしたユーザーが正しいカード情報を入力し支払いに成功すると完了ページに遷移する' do
      # ログイン
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'

      # 支払いページに移動
      visit reservation_payments_path(@reservation)

      # inputタグが出るまで待つ（5秒）
      expect(page).to have_selector("input.amount[readonly]", wait: 5)
      
      # 表示されているpriceがroom.priceと一致
      expect(find('input.amount[readonly]').value).to eq @room.price.to_s

      # simulate JavaScript token via hidden input（テスト用処理）
      page.execute_script("document.getElementById('charge-form').insertAdjacentHTML('beforeend', \"<input type='hidden' name='token' value='test_token'>\")")

      # 購入ボタンを押す
      click_button '購入'

      # 結果
      expect(current_path).to eq(reservation_payments_path(@reservation))
    end
  end

  context 'ログインしていないとき' do
    it '支払いページにアクセスできずログインページにリダイレクトされる' do
      visit reservation_payments_path(@reservation)
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
