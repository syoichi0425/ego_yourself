class DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      flash[:success] = "Object successfully created"
      redirect_to diaries_new_path
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
    params.require(:diary).permit(:diary_content0).merge(user_id: current_user.id)
  end
end