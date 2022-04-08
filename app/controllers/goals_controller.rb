class GoalsController < ApplicationController
#  before_action :logged_in_user, only: [:index,:edit, :update, :show, :destroy]


  def new
    @goal = Goal.new



  end

  def index
    goal = Goal.where(user_id: current_user.id)
    @goal=Kaminari.paginate_array(goal).page(params[:page]).per(10)
  end



  def edit
#要修正
    @goal = Goal.find(params[:id])
    # @goal=Goal.last

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
    @goals = Goal.where(user_id: current_user.id)
    #end
      end


  def fix_and_dalete
  end


def create

  @goal = Goal.new(goal_params)
    #データを新規登録するためのインスタンス生成
  if @goal.save #データをデータベースに保存するためのsaveメソッド実行
    flash[:notice] = "投稿が保存されました"
    # redirect_to "index"
    redirect_to action: :index

  else
    flash.now[:alert] = "投稿に失敗しました"
    render "new"
    # render 'layouts/error_messages', model: f.object
  end

end



def update
  @goal = Goal.find_by(id: params[:id])
  if @goal.update(goal_params)
    # redirect_to "index"
    redirect_to action: :index
    flash[:success] = "更新しました"
  else
    flash.now[:alert] = "更新に失敗しました"
    render "edit"
  end
end

def destroy
  @goal = Goal.find_by(id: params[:id])
  if @goal.destroy
    flash.now[:success] = "削除しました"
    # redirect_to "index"
    redirect_to action: :index
  else
    flash.now[:alert] = "削除に失敗しました"
    render "edit"
  end
end


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