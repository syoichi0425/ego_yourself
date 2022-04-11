require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user=FactoryBot.build(:user)
  end

  it "is valid with an email and password" do
    # name: "hoge1",
    user=User.new(
    email: "hoge1@example.com",
    password: "password")
    # user = FactoryBot.build(:user, email: "")
    # @user.email = "",
    # @user.password = ""
    # @user.valid?
    # expect(@user.errors[:email]).to include "can't be blank"
    expect(user).to be_valid
  end
  it "全ての項目の入力が存在すれば登録できること" do
    user = build(:user)
    expect(user).to be_valid
  end
  it "is invalid with a duplicate email address 重複したメールアドレスなら無効な状態であること" do
    @user.email eq(@user.email)
    # @user.valid?
    expect(@user.errors[:email]).to include "can't be duplicate"
    expect(user).to be_valid
  end


    it "name、email、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

  it "重複したemailが存在する場合登録できないこと" do
    user = create(:user)
    another_user = build(:user)
    another_user.valid?
    expect(another_user.errors[:email]).to include("has already been taken")
  end

  it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "passwordが6文字以上であれば登録できること" do
    user = build(:user, password: "123456", encrypted_password: "123456") # buildメソッドを使用して7文字のパスワードを設定
    expect(user).to be_valid
  end

  it "passwordが5文字以下である場合は登録できないこと" do
    user = build(:user, password: "12345", password_confirmation: "12345")
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with an email, and password"
  # it "is invalid without a name"
  it "is invalid without an email address"
  it "is invalid without a duplicate email address"
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address"
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address"

end
