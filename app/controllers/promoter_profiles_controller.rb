class PromoterProfilesController < ApplicationController
  def new
    @promoter_profile = PromoterProfile.new
    @categories = Category.all
    @promoter_profile.email = current_user.email
    consult_sample
  end

  def create
      @promoter_profile = PromoterProfile.new(promoter_profile_params)
      if @promoter_profile.save
        PromoterApplyMailer.send_when_create(current_user).deliver
        flash.now[:notice] = 'お申し込みを受け付けました。'
        render 'create'
      else
        flash.now[:alert] = '送信できませんでした。入力内容をご確認ください。'
        @categories = Category.all
        render 'new'
      end
  end

  def edit
    @promoter_profile = PromoterProfile.find(params[:id])
    if @promoter_profile.user_id == current_user.id
      @categories = Category.all
      render 'new'
    else
      redirect_to root_path
    end
  end

  def update
    @promoter_profile = PromoterProfile.find(params[:id])
    if @promoter_profile.user_id == current_user.id && @promoter_profile.update(promoter_profile_params)
      PromoterApplyMailer.send_when_create(current_user).deliver
      flash.now[:notice] = 'お申し込みを受け付けました。'
      render 'create'
    else
      flash.now[:alert] = '送信できませんでした。入力内容をご確認ください。'
      @categories = Category.all
      render 'new'
    end
  end

  private
    def promoter_profile_params
    params.require(:promoter_profile).permit(
      :business_entity,
      :corporate_name,
      :staff_name,
      :position,
      :email,
      :phone_number,
      :postal_code,
      :location,
      :representative,
      :website,
      :category,
      :questionnaire,
      :progress,
      :content
    ).merge(user_id: current_user.id)
  end

  def consult_sample
    @promoter_profile.content = "▼相談内容\n以下の例文を編集して、送信してください。\n\n◆プロジェクト対象商品【必須】\n
\s商品名や施設名などを具体的に記載してください。\n\s名称:\n\sURL:\n\n\n◆プロジェクトの目的【必須】\n\s例）この度、新商品を作ろうと思っており、販売するにあたり、資金調達を希望しています。\n\n\n◆ご希望目標金額\n\s例）150万円\n\n\n◆リターン\n\sリターンとは、支援者の方々にお礼としてお送りする商品になります。\n\s例）15,000円：完成した時計1個。\n\s\s\s27,000円：完成した時計2個。\n\s\s\s製品が15000円なので、100個ご支援頂けると生産することができます。\n\n\n◆スケジュール【必須】\n\sプロジェクト開始ご希望日:\n\s例）なるべく早めに\n
\n\sリターン発送ご予定日:\n\s例）6ヶ月後"
  end
end
