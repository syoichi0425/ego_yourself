class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Diary"
      @diaries = Diary.looks(params[:search], params[:word])
    else
      @goals = Goal.looks(params[:search], params[:word])
    end
  end
end