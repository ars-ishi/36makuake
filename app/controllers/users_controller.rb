class UsersController < ApplicationController
  before_action :move_to_email_registration, only: [:show]
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def edit_password
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to user_path(@user), notice: '更新しました'
    else
      redirect_to edit_user_path(@user), alert: '更新に失敗しました。情報の再入力をお願いします'
    end
  end

  def invest
  end

  def message
  end

  def popup
  end

  def consumed
  end

  def destroy
  end

  def update_omniauth
    @test = omniauth_params
    @email = omniauth_params[:email]
    @name = omniauth_params[:name]
    user = current_user
    unless user.update( name: omniauth_params[:name], email: omniauth_params[:email] )
      redirect_to user_edit_omniauth_path(current_user), alert: 'メールアドレスがすでに使用されています。'
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

  def user_params
    params.require(:user).permit(:name, :image, :email, :password, :url, :location, :birth_year, :birth_month, :birth_day, :gender, :introduction)
  end
end
