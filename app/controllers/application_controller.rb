class ApplicationController < ActionController::Base
  # Deviseのログイン・新規登録後のリダイレクト先を変更
  def after_sign_in_path_for(resource)
    rooms_path # ログイン後は部屋一覧ページへ
  end

  def after_sign_up_path_for(resource)
    rooms_path # 新規登録後も部屋一覧ページへ
  end
end
