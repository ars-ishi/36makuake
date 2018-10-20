class UsersController < ApplicationController
  before_action :move_to_email_registration, only: [:show]

  def show
    @user = current_user
  end

  def edit
  end

  def update
  end

  def invest
  end

  def message
  end

  def popup
  end

  def destroy
  end

  def update_omniauth
    if current_user.update( name: omniauth_params[:name], email: omniauth_params[:email] )
      redirect_to root_path, notice: 'ログインしました'
    else
      redirect_to user_edit_omniauth_path(current_user), alert: '使用できないメールアドレスです'
    end
  end

  def edit_omniauth
  end

  private
  def omniauth_params
    params.require(:user).permit(:name, :email)
  end

  # 正しいメールアドレスが登録されていない場合に入力フォームにリダイレクト
  def move_to_email_registration
    if user_signed_in?
      if current_user.email.include?("-facebook@example.com") ||  current_user.email.include?("-twitter@example.com")
        redirect_to user_edit_omniauth_path(current_user), alert: '情報の登録をお願いします'
      end
    end
  end

end
