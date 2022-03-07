class GoalsController < ApplicationController
 # before_action :logged_in_user, only: [:index,:edit, :update, :show, :destroy]


  def new
    @goal = Goal.new



  end

  def index
    @goal = Goal.all
  end

  def edit
    #@goal = Goal.find(params[:id])
  @goal =  Goal.find_by(user_id: current_user.id)

  end

  def show

    #    @goal=Goal.all これだとuser_id関係なく全てのGoalモデルの情報を取得してしまう
    #    @goal=Goal.find(current_user.id) これだけだとうまくいかない
    #@goals=Goal.all
    #goal=@goal
    #@goal=current_user.goal
    #    @user=User.find_by(id: @goal.user_id)
    #@user = User.find(params[:id])
    #if params[:user_id]
     # @goal=Goal.find(params[:id])
    @goal = Goal.where(user_id: current_user.id)
    #end
      end


  def fix_and_dalete
  end


def create

  @goal = Goal.new(goal_params)
    #データを新規登録するためのインスタンス生成
  if @goal.save #データをデータベースに保存するためのsaveメソッド実行

    redirect_to root_path #トップ画面へリダイレクト
    flash[:notice] = "投稿が保存されました"
  else
    redirect_to action: :new
    flash[:alert] = "投稿に失敗しました"
  end
    render "new"
end



def update
  @goal = Goal.find_by(id: params[:id])
  if @goal.update(goal_params)
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

def create

  @goal = Goal.new(goal_params)
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
# for security from here
#クラス外から呼び出すことのできないメソッド
private
def goal_params #ストロングパラメータ

  params.require(:goal).permit(
    :goal_content_0,
    :goal_content_1,
    :goal_content_2,
    :goal_content_3,
    :goal_content_4).merge(
      user_id: current_user.id) #パラメーターのキー
end
end