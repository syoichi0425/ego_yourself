class ContactMailer < ApplicationMailer

#https://blog.ezic.info/43868.html
    #default from: "aaaaa@example.com"
    # メール送信アクション
#     def confirm_user(forms)
#       #@greeting = "Hello"
#       @forms = forms
#       mail(
#           from: 'aaaaa@example.com',
#           to:   @forms.form_email,
#          #bcc:  'bbbbb@example.com',
#           subject: '＜テストメール＞お問い合わせ内容が送信されました'
#         ) do |format|
#           format.text #テキストメールを指定
#           #format.html #HTMLメールを指定
#       end
#   end
# end

#https://labo.kon-ruri.co.jp/rails-send-mail-via-gmail-smtp/
# def thanks_mail
#   @user = User.find(params[:user])
#   mail(to: @user.email, subject: '新規会員登録ありがとうございました')
# end

  def contact_mail(contact)
    @contact=contact
    mail to:   'syoichi0425@gmail.com'
      # from: 'system@example.com',
      # to:   'syoichi0425@gmail.com'
      # subject: 'お問い合わせ通知'

    # mail to: "web-site@example.com", subject: "お問合せ内容"
  end



  # # メールの生成と送信を行うcontact_mailメソッド
  def send_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      # to: で送信先のアドレスを指定。
      to: 'dietitian.1989425@gmail.com',
      # subjectでメールのタイトルを指定。
      subject: 'お問い合わせ通知'
    )

    # mail to: ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
  end
end
