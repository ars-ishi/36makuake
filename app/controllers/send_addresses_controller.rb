class SendAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_send_address, only: [:edit, :update]

  def index
    @user = current_user
    @send_addresses = @user.send_addresses.order("created_at DESC")
  end

  def new
    @user = User.find(params[:user_id])
    @send_address = SendAddress.new
  end

  def create
    @send_address = SendAddress.create(send_address_params)
    if @send_address.save
      redirect_to user_send_addresses_path(current_user), notice: '登録しました'
    else
      flash.now[:alert] = '登録できませんでした。入力内容をご確認ください。'
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @send_address.update(send_address_params)
      redirect_to user_send_addresses_path(current_user), notice: '更新しました'
    else
      flash.now[:error] = '失敗しました。情報の再入力をお願いします'
    end
  end

  private
  def set_send_address
    @send_address = SendAddress.find(params[:id])
  end

  def send_address_params
    params.require(:send_address).permit(:main, :last_name, :first_name, :last_name_ruby, :first_name_ruby, :gender, :industry, :birth_year, :phone_number, :postal_code, :prefecture, :municipality, :house_number, :building).merge(user_id: params[:user_id])
  end
end

