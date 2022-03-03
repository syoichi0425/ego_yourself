class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def index
    @diaries = Diary.where(user_id: current_user.id)

    #@diaries[:start_time] = Date.today.strftime('%Y-%m-%d')
  end



  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      flash[:success] = "Object successfully created"
      redirect_to diaries_index_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

# def create
#   Diary.create(diary_params)
# end


private
  def diary_params
    params.require(:diary).permit(:diary_content_0,:diary_content_1,:diary_content_2,:created_at,:updated_at).merge(user_id: current_user.id)
  end
end