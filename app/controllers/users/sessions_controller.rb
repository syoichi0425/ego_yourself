class Users::SessionsController < Devise::SessionsController
#   def guest_sign_in
#     user = User.guest
#     sign_in user
#     redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
#   end
# end

def guest_sign_in
  user = User.find_or_create_by!(email: "guest@gmail.com") do |user|
    # ブロックで必要カラムを追加(自分の場合はnicknameを追加)
    user.password = SecureRandom.urlsafe_base64
    # user.confirmed_at = Time.now # Confirmable を使用している場合は必要
  end
  # ログイン(deviseのメソッド)
  sign_in user
  # トップページへリダイレクト
  redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
end
end