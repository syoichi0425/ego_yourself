class DiariesController < ApplicationController
  def new
    @diary = Diary.new
    @diaries = Diary.where(user_id: current_user.id)
    @diary_day = params[:diary_day]
  end

  def index
    @diaries = Diary.where(user_id: current_user.id)
    @weeks = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']

    @goal=Goal.where(user_id: current_user.id).last.goal_content_0

      diary_page = Diary.where(user_id: current_user.id)

      @pagination = Kaminari.paginate_array(diary_page).page(params[:page]).per(3)
      # @pagination1 = @diaries.paginate(page: params[:page])
      @pagination2 = Diary.page(params[:page]).per(3)
      # @posts = @diaries.paginate(page: params[:page])



  end



  def edit
    # @diaries = Diary.where(user_id: current_user.id)
    @diary = Diary.find(params[:id])
    #  unless @diaries == current_user
    #    redirect_to  new_diary_path
    #  end
  end


  def create
    @diary = Diary.new(diary_params)
    if@diary.save
      flash[:notice] = '保存に成功しました'
      redirect_to action: :index
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'new'
    # render 'layouts/error_messages', model: f.object
  end
  #   a=Diary.find_or_initialize_by(created_at: params[:created_at])
  # a.update(
  #   diary_content_0:  params[:diary_content_0],
  #   diary_content_1:  params[:diary_content_1],
  #   diary_content_2:  params[:diary_content_2],
  # )

    # @diary.find_or_initialize_by(created_at: params[:created_at])
    # @diary.update_attributes(diary_content_0: params[:diary_content_0])
    # if persisted.persisted?
    #   @diary.save
    #   flash[:notice] = '保存に成功しました'
    #   redirect_to action: :index

    # else
    #   @diary.update(diary_params)
    #   flash[:success] = '更新しました'
    #   redirect_to action: :index
    # end
    # 空欄の場合保存失敗と表示するが、new.htmlのvalue: @diary_day の値が保持されず、後回し

    # else
    #   @diary = Diary.new(diary_params)
    #   @diary_day=params[:created_at]
    #   flash[:alert] = "保存に失敗しました!"

    # redirect_to  new_diary_path
    # render 'new'

    # end
  end

  def update
    @diary = Diary.find_by(id: params[:id])
    if @diary.update(diary_params)
      flash[:success] = '保存に成功しました'
      redirect_to action: :index
    else
      @diary = Diary.new(diary_params)
      flash.now[:alert] = '保存に失敗しました'
      render 'new'
    end
  end

  def destroy
    @diary = Diary.find(params[:id])
    if @diary.destroy
      flash[:notice] = '削除しました'
      redirect_to action: :index
    else
      @diary = Diary.new(diary_params)
      flash[:alert] = '保存に失敗しました'
      render 'edit'
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:diary_content_0, :diary_content_1, :diary_content_2, :created_at,
                                  :updated_at).merge(user_id: current_user.id)
    # 目標のところを作成するときは
    # :objective_0,:objective_1,:objective_2,:objective_3,:objective_4,を追加
  end
end
