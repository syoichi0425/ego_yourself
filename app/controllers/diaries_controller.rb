class DiariesController < ApplicationController

  def new
    @diary = Diary.new
    @diaries = Diary.where(user_id: current_user.id)
  end

  def index
    @diaries = Diary.where(user_id: current_user.id).all
    

    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)

    @weeks = ["(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)"]
  end



  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      flash[:notice] = "保存に成功しました"
      redirect_to action: :index
    else
      flash[:alert] = "保存に失敗しました"
      render 'new'
    end
  end


def edit
  #@diaries = Diary.where(user_id: current_user.id)
  @diary = Diary.find(params[:id])
    #  unless @diaries == current_user
    #    redirect_to  new_diary_path
    #  end
  end


  def update
    @diary=Diary.find(params[:id])
    if   @diary.update(diary_params)
      flash[:success] = "保存に成功しました"
      redirect_to request.referer
    else
      flash.now[:alert] = "保存に失敗しました"
      render 'new'
    end
  end

  def destroy
    @diary=Diary.find(params[:id])
    if   @diary.destroy
      flash[:notice]="削除しました"
      redirect_to action: :index
    else
      flash[:alert] = "保存に失敗しました"
      render 'edit'
    end

  end



private
  def diary_params
    params.require(:diary).permit(:diary_content_0,:diary_content_1,:diary_content_2,:created_at,:updated_at).merge(user_id: current_user.id)
    #目標のところを作成するときは
    #:objective_0,:objective_1,:objective_2,:objective_3,:objective_4,を追加
  end
end