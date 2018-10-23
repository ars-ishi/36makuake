class PromoterApplyMailer < ApplicationMailer
  def send_when_create(user)
    @user = user
    mail to:      user.email,
         subject: '【makuake運営事務局】ご相談を受け付ました'
  end
end
