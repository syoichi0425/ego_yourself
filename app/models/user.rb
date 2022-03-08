class User < ApplicationRecord
#  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: {maximum: 255}
  has_many :goals
  has_many :diaries

  #deviseで定義されているモジュール
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
        #データベースに保存されたパスワードが合っているか検証をします。同時にパスワードの暗号化も行う。
         :registerable,
        #登録処理を通してユーザーをサインアップします。また、ユーザーに自身のアカウントを編集したり削除することを許可します。
         :recoverable,
        #パスワードリセットを行います。
         :rememberable,
        #クッキーにログイン情報を保持します。
         :validatable
        #Emailやパスワードのバリデーションを追加する。独自に定義したバリデーションを追加することもできます。
end
