class UsersController < ApplicationController
  before_action :move_to_email_registration, only: [:show]
  before_action :authenticate_user!, except: :index
  before_action :set_user, only: [:show, :edit, :edit_password, :update, ]
  before_action :move_to_project_index, only: [:show, :edit, :edit_password, :update]

  def index
    respond_to do |format|
        format.html
        format.json { render json: User.pluck(:email) }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to user_path(@user), notice: '更新しました'
    else
      flash.now[:error] = '失敗しました。情報の再入力をお願いします'
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

  def move_to_project_index
    unless current_user.id == @user.id
      redirect_to project_index_path(current_user)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :remove_image, :image_cashe, :image, :email, :password, :password_confirm, :current_password, :url, :location, :birth_year, :birth_month, :birth_day, :gender, :introduction)
  end
end
