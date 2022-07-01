class WeeksController < ApplicationController
  def new
    @week = Week.new
  end

  def index
    week = Week.where(user_id: current_user.id)
    @week = Kaminari.paginate_array(week).page(params[:page]).per(10)

  end


  def edit
    # 要修正
    @week = Week.find(params[:id])
    # @week=week.last
  end

  def show
    #    @week=week.all これだとuser_id関係なく全てのweekモデルの情報を取得してしまう
    #    @week=week.find(current_user.id) これだけだとうまくいかない

    @weeks = Week.where(user_id: current_user.id)
    # end
  end

  def create
    @week = Week.new(week_params)
    # データを新規登録するためのインスタンス生成
    if @week.save # データをデータベースに保存するためのsaveメソッド実行
      flash[:notice] = '投稿が保存されました'
      # redirect_to "index"
      redirect_to action: :index

    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'new'
      # render 'layouts/error_messages', model: f.object
    end
  end

  def update
    @week = Week.find_by(id: params[:id])
    if @week.update(week_params)
      # redirect_to "index"
      redirect_to action: :index
      flash[:success] = '更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render 'edit'
    end
  end

  def destroy
    @week = Week.find_by(id: params[:id])
    if @week.destroy
      flash.now[:success] = '削除しました'
      # redirect_to "index"
      redirect_to action: :index
    else
      flash.now[:alert] = '削除に失敗しました'
      render 'edit'
    end
  end

  # クラス外から呼び出すことのできないメソッド
  private

  def week_params # ストロングパラメータ
    params.require(:week).permit(
      :week_0,
      :week_1,
      :week_2,
      :week_3,
      :week_4,
      :created_at,
      :updated_at
    ).merge(
      user_id: current_user.id
    ) # パラメーターのキー
  end
end