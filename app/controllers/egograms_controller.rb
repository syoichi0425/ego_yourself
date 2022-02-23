class EgogramsController < ApplicationController
  def new
    @test = EgogramCpQuetion.new
  end

  def test
    @toatl_cp=params[:q_cp1].to_i+params[:q_cp2].to_i
    @toatl_np=params[:q_np1].to_i+params[:q_np2].to_i

    #params[:オブジェクト名(テーブルのカラム名など)]


  end


  def create
    @cp_toatl=params[:q_cp1].to_i+params[:q_cp2].to_i
    @np_toatl=params[:q_np1].to_i+params[:q_np2].to_i
    #各params合計値
#    createメソッドに渡す引数のデータ -->
#   モデル名.create({ カラム名: 値 })

    @cp = EgogramCpQuetion.create(title: @cp_toatl)
    @np = EgogramNpQuetion.create(title: @np_toatl)
    #↓次作るイメージ2022/02/23
    #@total_sum = EgogramToatlResult.create(cp_toatl: @cp_toatl,np_toatl: @np_toatl)
    #  if @cp.save
   #     flash[:success] = "Object successfully created"

    #   if
    #     @cp_>10 && @np>10 && @a >10 && @ac>10 && @fc>10
    #       redirect_to 結果1のページ
    #   elsif
    #     @cp_>10 && @np>10 && @a >10 && @ac>10 && @fc>10
    #       redirect_to 結果2のページ
    #   end

    #else
     # flash[:error] = "Something went wrong"
     # render 'new'
    #end
  end


    #@test=EgogramCpQuetion.new
    #@test_cp=EgogramCpQuetion.select("title")
    #@test_np=EgogramNpQuetion.select("title")

  def result
  end

  def confirmation
  end
end

private

def test_params
  params.require(:egogram_cp_quetion).permit(:title)
#params.require(:使用するモデル名).permit(:使用するカラム名)
end
