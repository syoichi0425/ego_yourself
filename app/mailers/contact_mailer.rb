class ContactMailer < ApplicationMailer
# メールの生成と送信を行うcontact_mailメソッド
  def send_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      # to: で送信先のアドレスを指定。
      to:   'sample19890425@gmail.com',
      # subjectでメールのタイトルを指定。
      subject: 'お問い合わせ通知'
    )


    mail to:   ENV['TOMAIL'], subject: '【お問い合わせ】' + @contact.subject_i18n
  end
end