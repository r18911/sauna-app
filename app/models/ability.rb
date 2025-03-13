# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # ユーザーが未ログインでもエラーにならないように

    if user.admin?  # 管理者の場合
      can :manage, :all  # すべての操作が可能
    else  # 一般ユーザーの場合
      can :read, Room  # 部屋の閲覧のみ許可
      can :create, Reservation  # 予約の作成は可能
      cannot :manage, User  # 他のユーザー情報を管理できない
    end
  end
end
