class GoalsController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update, :show, :destroy]


  def new
    @goal = Goal.new



  end

  def index
    @goal = Goal.all
  end

  def show
        #@goal=Goal.all
    @goal=Goal.find_by(id: params[:id])
    @user=User.find_by(id: @goal.user_id)

  end


  def fix_and_dalete
  end


def create

  @goal = Goal.new


    #データを新規登録するためのインスタンス生成
  if @goal.save #データをデータベースに保存するためのsaveメソッド実行

    redirect_to root_path #トップ画面へリダイレクト
    flash[:notice] = "投稿が保存されました"
  else
    redirect_to action: :new
    flash[:alert] = "投稿に失敗しました"
  end
   #  redirect_to goal_path
end

def edit
  @goal =  Goal.select("goal_content_0")

end

def update
  @goal = Goal.find_by(id: params[:id])
  if @goal.update_attributes(goal_params)
    redirect_to "/"
  else
    render action: "goal/edit"
  end
end

def destroy
  @goal = Goal.find_by(id: params[:id])
  @goal.destroy
  redirect_to :root
end


# for security from here
#クラス外から呼び出すことのできないメソッド
private



def goal_params #ストロングパラメータ
#指定したキーのパラメータのみを受け取れるように制限をかける物です。
#制限をかけないと必要ないパラメーターまで受け取ってしまい、
#意図しない変更が行われる可能性があります。

#送信されたパラメーターからどの情報を取得するか選択するメソッドで
#ストロングパラメーターとして使用する場合は、主にモデル名を指定します
  params.require(:goal).permit(:goal_content_0,:goal_content_1,:goal_content_2,:goal_content_3,:goal_content_4,:user_id) #パラメーターのキー
end
end