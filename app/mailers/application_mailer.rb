class ApplicationMailer < ActionMailer::Base
  default from:     Rails.application.secrets.mail,
          bcc:      Rails.application.secrets.mail
  layout 'mailer'
end
