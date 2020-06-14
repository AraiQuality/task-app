class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
    # beforeフィルター
  
    # ログイン済みのユーザーか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = 'ログインしてください'
        redirect_to login_url
      end
    end
    
    # アクセスしたユーザーが現在ログインしているユーザーか確認
    def correct_user
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # システム管理権限所有者かどうか判定
    def admin_user
      redirect_to root_url unless current_user.admin?
    end
    
    # 管理者、またはログインユーザー本人か確認
    def admin_or_correct_user
      redirect_to root_url unless current_user.admin? || current_user?(@user)
    end
end
