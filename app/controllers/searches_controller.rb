class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Diary"
      #全ユーザーを検索したい場合は下記=> @diaries = Diary.looks(params[:search], params[:word]).order(created_at: :desc)
      @diaries = Diary.where(user_id: current_user.id).looks(params[:search], params[:word]).order(created_at: :desc)

    else
      @goals = Goal.where(user_id: current_user.id).looks(params[:search], params[:word]).order(created_at: :desc)
    end
  end
end