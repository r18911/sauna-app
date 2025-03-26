class ApplicationController < ActionController::Base
  before_action :basic_auth, unless: -> { Rails.env.test? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Deviseのログイン・新規登録後のリダイレクト先を変更
  def after_sign_in_path_for(resource)
    rooms_path # ログイン後は部屋一覧ページへ
  end

  def after_sign_up_path_for(resource)
    rooms_path # 新規登録後も部屋一覧ページへ
  end

  def after_sign_out_path_for(resource_or_scope)
    rooms_path # ログアウト後も部屋一覧ページへ
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
