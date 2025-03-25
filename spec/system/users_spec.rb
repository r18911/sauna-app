require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインに成功し、部屋一覧ページに遷移する' do
    # サインインページへ移動
    visit new_user_session_path

    # ログインフォームに正しい情報を入力
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password

    # ログインボタンをクリック
    click_button 'ログイン'

    # 部屋一覧ページに遷移していることを確認
    expect(page).to have_current_path(rooms_path)
  end

  it 'ログインに失敗し、サインインページに戻ってくる' do
    # サインインページへ移動
    visit new_user_session_path

    # ログインフォームに誤った情報を入力
    fill_in 'メールアドレス', with: 'wrong@example.com'
    fill_in 'パスワード', with: 'wrongpassword'

    # ログインボタンをクリック
    click_button 'ログイン'

    # サインインページに戻ってくることを確認
    expect(current_path).to eq(new_user_session_path)
  end
end
