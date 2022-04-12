class ApplicationMailer < ActionMailer::Base
#ここでのdefaultは引数にハッシュを取り、全てのメーラーに共通の設定を記載できるそう
  # default from: 'from@example.com'
  # default from: Rails.application.credentials.gmail[:user_name]
  # layout 'mailer'
end
